Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 May 2022 06:45:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fc0a3456;
	Sun, 8 May 2022 06:45:03 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.112.16])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7a36ed59
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 May 2022 06:45:01 +0000 (UTC)
Received: from nb2.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 4F76B1FF22
 for <wireguard@lists.zx2c4.com>; Sun,  8 May 2022 08:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1651992296;
 bh=Cwp7LrSKiw2GZgMPjEa5gnF21eyDT2rDv7+1Smzjv10=;
 h=From:To:Subject:Date:From;
 b=CFDvMQo6zk3gf1vAzWcNr4rRGvIkzlIFdS1ySCCUHEdZ8/Btdl5VGjf36RK82H1EO
 7eRFx0ZCDRgDUFNXLEnFCzp91xjtFXMc/nG9KIrS7guDacAXqDsKD4bg3oljkrd2QM
 dmzOHhyFS66GuEIAJ8svf7JDzcxisMLoIRlR/bRjPpGP7uitQ19MjfzbJuqkpV8D+7
 Ydcb2v/GyZUrI2GX/GhiZBuO0e7i/xl0BTJ1fEjBgjmCcFmwRZ7c9H+/WS5/lD3lHU
 KhXN6WlZABN20sX5vlZ/Bv61RLtG4xTzKenQBVht9VOKfmMgvq4KBSZ50KNCY7XlOH
 rstpaOxZC+ZeQ==
Received: by nb2.localdomain (Postfix, from userid 1000)
 id DFECC14C0443; Sun,  8 May 2022 08:45:00 +0200 (CEST)
User-agent: mu4e 1.6.10; emacs 28.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Outgoing ping required in container environment (even with
 PersistentKeepalive)
Date: Sun, 08 May 2022 08:34:46 +0200
Message-ID: <878rrcfrpv.fsf@ungleich.ch>
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


Good morning,

another day news from the container land. When running wireguard in
kubernetes, deleting the existing pod and replacing it with a new one, I
see the following behaviour:

- The assigned IPv4 address stops being reachable (good so far)
- The assigned IPv4 address is then shortly reachable for about 5 seconds
- The assigned IPv4 address stops being reachable (not good)
- The assigned IPv4 address is again reachable, if I trigger a ping
  through the tunnel inside the container (ok, but why?)

I am using the following configuration:

--------------------------------------------------------------------------------
[Interface]
PrivateKey = ...
ListenPort = 51828
Address = 185.155.29.81/32
PostUp = iptables -t nat -I POSTROUTING -o ipv4 -j MASQUERADE

# upstream
[Peer]
Endpoint = vpn-...:51820
PublicKey = 6BRnQ+dmeFzVCH9RbM1pbJ7u3y3qrl+zUzzYCmC88kE=
AllowedIPs = 0.0.0.0/1, 128.0.0.0/1
PersistentKeepalive = 25
--------------------------------------------------------------------------------

And the following container specification:

--------------------------------------------------------------------------------
  spec:
      containers:
        - name: wireguard
          image: ungleich/ungleich-wireguard:{{ $.Chart.AppVersion }}
          # We only support 1 listener at the moment
          # Outgoing connections are not affected
          ports:
            - containerPort: 51820
          securityContext:
            capabilities:
              # NET_ADMIN for wg
              # NET_RAW for iptables
              add: ["NET_ADMIN", "NET_RAW" ]
          volumeMounts:
            - name: wireguard-config
              mountPath: "/etc/wireguard"
          resources:
            requests:
              memory: {{ $v.memory | default "1Gi" }}
              cpu: {{ $v.cpu | default "1000m" }}
            limits:
              memory: {{ $v.memory | default "1Gi" }}
              cpu: {{ $v.cpu | default "1000m" }}
--------------------------------------------------------------------------------

The strange thing is that after issuing the ping once inside the
container:

--------------------------------------------------------------------------------
[8:41] nb2:~% kubectl -n wireguard exec -ti wireguard-vpn-server-7db664db6f-zl4fz -- ping -c2 -4 google.com
PING google.com (172.217.168.78): 56 data bytes
64 bytes from 172.217.168.78: seq=0 ttl=116 time=9.110 ms
64 bytes from 172.217.168.78: seq=1 ttl=116 time=6.664 ms

--- google.com ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 6.664/7.887/9.110 ms
--------------------------------------------------------------------------------

The connection stays correctly established.

If anyone has a pointer on what might be going on, any help is
appreciated.

Best regards,

Nico


--
Sustainable and modern Infrastructures by ungleich.ch
