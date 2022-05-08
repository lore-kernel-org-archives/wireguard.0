Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21122C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 May 2022 19:56:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4ab93fda;
	Sun, 8 May 2022 19:56:33 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 62d37c33
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 May 2022 19:56:31 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id A9EA71FF22;
 Sun,  8 May 2022 21:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1652039786;
 bh=gdtqfZ0HHUoMrbCjb7XyUJzE/X3fU2BqoQqbpZoc2NQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=PBZ7tpaxTucGdPltWUmFuKoxvB12oRB/6HJeclcfy8OeSNZeNs0RS11njfJIefmti
 R4oYLSNCYyP6NHURYEBYaWqZUHiB7TqQkK7j5T4kEC8K5/5doVhW2z7hYy+1Y/5sOt
 oZf/0UF7jJ9niDKy3qn3Wlh+UmUIrR4jRX5aet+AvJDgJPOnaA6JgLZ7WNMt1sUj+a
 3iHQOm3eacPZyt5SXPNwWH9nzaLxpJMwAlShKIH4zh7Bq1Q2UE92S72E7tIEYiT3TA
 5Aot/n2LMQi9OgT4vqJobb8iG+6m0wb66bNm+T+fGwWKYwqVBFwNt31K2TJIDdSnhP
 8Mj6amP/hpmhQ==
Received: by blind.localdomain (Postfix, from userid 1000)
 id 5181413A0CC8; Sun,  8 May 2022 21:56:31 +0200 (CEST)
References: <878rrcfrpv.fsf@ungleich.ch>
User-agent: mu4e 1.7.13; emacs 28.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Outgoing ping required in container environment (even with
 PersistentKeepalive)
Date: Sun, 08 May 2022 21:53:21 +0200
In-reply-to: <878rrcfrpv.fsf@ungleich.ch>
Message-ID: <87mtfrlrww.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


A follow up: we "upgraded" the wireguard container to use the following
entrypoint.sh instead:

--------------------------------------------------------------------------------
set -x

# Ensure everything is clean / show prior state
wg show

# Start all definitions
for conf in /etc/wireguard/*.conf; do
    # Remove leftovers??
    wg-quick down $conf

    # Try to up and if any tunnel fails -> exit
    wg-quick up "$conf" || (sleep 300; exit 1)
done

# Debug output
while true; do
    # Establish tunnels, keepalive alone is not enough for some reason
    ping -c2 185.203.112.1
    ping -c2 2a0a:e5c0::
    wg show
    sleep 300
done
--------------------------------------------------------------------------------

This establishes the connection reliably. I guess that should not be the
case, but effectively, it is.

I was for a moment suspecting that the old container is overlapping
running while the new one is created and whether there is a race
condition, however two points speak against that being the source of the
problem:

- Using the "Recreate strategy" in k8s, the container is first shut
  down. Using this, the behaviour does not change
- Even if my assumption was right, I'd expect a new handshake at some
  point to happen, but even minutes after restarting the container, the
  IPv4 address is not reachable.

Best regards,

Nico

Nico Schottelius <nico.schottelius@ungleich.ch> writes:

> Good morning,
>
> another day news from the container land. When running wireguard in
> kubernetes, deleting the existing pod and replacing it with a new one, I
> see the following behaviour:
>
> - The assigned IPv4 address stops being reachable (good so far)
> - The assigned IPv4 address is then shortly reachable for about 5 seconds
> - The assigned IPv4 address stops being reachable (not good)
> - The assigned IPv4 address is again reachable, if I trigger a ping
>   through the tunnel inside the container (ok, but why?)
>
> I am using the following configuration:
>
> --------------------------------------------------------------------------------
> [Interface]
> PrivateKey = ...
> ListenPort = 51828
> Address = 185.155.29.81/32
> PostUp = iptables -t nat -I POSTROUTING -o ipv4 -j MASQUERADE
>
> # upstream
> [Peer]
> Endpoint = vpn-...:51820
> PublicKey = 6BRnQ+dmeFzVCH9RbM1pbJ7u3y3qrl+zUzzYCmC88kE=
> AllowedIPs = 0.0.0.0/1, 128.0.0.0/1
> PersistentKeepalive = 25
> --------------------------------------------------------------------------------
>
> And the following container specification:
>
> --------------------------------------------------------------------------------
>   spec:
>       containers:
>         - name: wireguard
>           image: ungleich/ungleich-wireguard:{{ $.Chart.AppVersion }}
>           # We only support 1 listener at the moment
>           # Outgoing connections are not affected
>           ports:
>             - containerPort: 51820
>           securityContext:
>             capabilities:
>               # NET_ADMIN for wg
>               # NET_RAW for iptables
>               add: ["NET_ADMIN", "NET_RAW" ]
>           volumeMounts:
>             - name: wireguard-config
>               mountPath: "/etc/wireguard"
>           resources:
>             requests:
>               memory: {{ $v.memory | default "1Gi" }}
>               cpu: {{ $v.cpu | default "1000m" }}
>             limits:
>               memory: {{ $v.memory | default "1Gi" }}
>               cpu: {{ $v.cpu | default "1000m" }}
> --------------------------------------------------------------------------------
>
> The strange thing is that after issuing the ping once inside the
> container:
>
> --------------------------------------------------------------------------------
> [8:41] nb2:~% kubectl -n wireguard exec -ti wireguard-vpn-server-7db664db6f-zl4fz -- ping -c2 -4 google.com
> PING google.com (172.217.168.78): 56 data bytes
> 64 bytes from 172.217.168.78: seq=0 ttl=116 time=9.110 ms
> 64 bytes from 172.217.168.78: seq=1 ttl=116 time=6.664 ms
>
> --- google.com ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 6.664/7.887/9.110 ms
> --------------------------------------------------------------------------------
>
> The connection stays correctly established.
>
> If anyone has a pointer on what might be going on, any help is
> appreciated.
>
> Best regards,
>
> Nico


--
Sustainable and modern Infrastructures by ungleich.ch
