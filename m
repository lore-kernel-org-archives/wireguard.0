Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4194BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Jun 2022 07:08:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0de30eec;
	Tue, 7 Jun 2022 07:08:28 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 33e000cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jun 2022 07:08:26 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id v22so29624680ybd.5
 for <wireguard@lists.zx2c4.com>; Tue, 07 Jun 2022 00:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0zjyyZy5cEumZ6OAhi8aCItl7gYS19XHlK0Hd6vZEo=;
 b=D9PDOF2OEOKsf7DX+GhiV9Fw7FSvBJEFG+/KBowdIDTkWXs/lMnHuKfo0lFIfWQrn2
 VHuzzymkjovRuC39FA0wXAm7fOae+AMDLMWh5AIseDO4ZuD2o0l5PER7g0ZhOarVEVsw
 k3q69QjZeBSETwckD300OGQKkvO1IMg0Ub9NsLH2nc5DV7FZ7LV9px7Xc9/AKE3KBoJl
 X690RJmX4FA/KaH+B9GEWABXcTsTIVrWk+DTNaGRKhs2gNkX48uOlcNW4IvHTYShnwHn
 y5VTDip7r1C4+cGr6FIjjTJH+rR6EqkJXqnewjAfs0UXfepdmYGLp+OI10XNjTOAlTew
 eDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0zjyyZy5cEumZ6OAhi8aCItl7gYS19XHlK0Hd6vZEo=;
 b=wn+dlfvGYCHbb/+2OhV11oYfvIPgdsvIErQ1GPsukC26UOHyry0M3b+cLEoe10NS9/
 EIvKSAhyEfnOVk4+v354jnNGj6B4JcXHkjcdzFxVIjZQ7PnkEVVrE+ZHx2Ou9e4D+M3Q
 cmHKjzeTwirVMWvpJf+VRa72pc970D5FjWzCbMSNzxqy5IynEbZeOdjRRan1jneL3eKK
 JyCPaIz+NK1P+kSWIXcM9h4LMPgEzGGcd548jHGswWnA/Tcf4zI92BwIf2L8m+ENnASx
 9Wq6Ebg7GKmsDmVtC3HuGUiYd0uJ/tPTEgbYy7zE9tK53ql3u8ecLWccu4r5/PVIpYU3
 mv7Q==
X-Gm-Message-State: AOAM530pPS5TFLL+ggez5tL8sRpRuAcsSnDy45P3k/YxnqNb62teJLhj
 YCDJxAdwYo44Z9VjW340XsRNNwxqrGNL13MfiPc=
X-Google-Smtp-Source: ABdhPJx1bcPuK7U5TX+qUkSwi91JpCEf3GU929haqteiqw2bNi9w+17ZbkXbZOiEIw6OYIdaZgCncoh2gZQLqH0VXxs=
X-Received: by 2002:a05:6902:84:b0:63d:4a3d:eb5 with SMTP id
 h4-20020a056902008400b0063d4a3d0eb5mr28254093ybs.145.1654585704776; Tue, 07
 Jun 2022 00:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <4bb8fade-487e-2301-65d0-dea41624682f@online.de>
In-Reply-To: <4bb8fade-487e-2301-65d0-dea41624682f@online.de>
From: Szymon Nowak <szymonn841@gmail.com>
Date: Tue, 7 Jun 2022 09:08:13 +0200
Message-ID: <CA+hy6duTcA38PMWRj6L2U_jwBDnNkFjojGBL-ot-9oJ-BwiHtw@mail.gmail.com>
Subject: Re: wireguard-windows: possibly wrong selection of outgoing IP
 Address?
To: Max Schulze <max.schulze@online.de>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hi To do this on the windows server, you need to run NAT on the WG interface
https://openvpn.net/cloud-docs/enabling-routing-nat-on-windows-server-2016/

On Sun, Jun 5, 2022 at 10:23 PM Max Schulze <max.schulze@online.de> wrote:
>
> I am running out of ideas to debug this specific issue.
>
> I am trying to circumvent a double-NAT scenario. I have
>
> wg_serv (10.253.2.9) <->  wg-relais (10.253.2.2) <-> wg_peer ( 10.253.2.3)
>
> wg_serv has an endpoint set for wg-relais, and creates the connection ok (handshake completes, ping works).
> wg_peer has an endpoint that points to wg-relais, which should tunnel the connection as-is to wg_serv on the established connection ( iptables SNAT/DNAT ).
>
> If wg_serv is a linux box, with the exact same config file, everything works. if wg_serv is a windows box, it seems that there are no outgoing packets, but incoming is ok.
>
> First, see that the handshake packet is received (via 10.253.2.2:60026):
>
> 2022-06-05 20:30:17.140946: [TUN] [wireguard] Keypair 536 created for peer 1
>
> 2022-06-05 20:30:22.085949: [TUN] [wireguard] Handshake for peer 1 (10.253.2.2:60026) did not complete after 5 seconds, retrying (try 2)
>
> 2022-06-05 20:30:22.265787: [TUN] [wireguard] Receiving handshake initiation from peer 1 (10.253.2.2:60026)
>
> 2022-06-05 20:30:22.265787: [TUN] [wireguard] Sending handshake response to peer 1 (10.253.2.2:60026)
>
> 2022-06-05 20:30:22.267019: [TUN] [wireguard] Keypair 536 destroyed for peer 1
>
> 2022-06-05 20:30:22.267019: [TUN] [wireguard] Keypair 537 created for peer 1
>
> 2022-06-05 20:30:27.147962: [TUN] [wireguard] Sending keepalive packet to peer 2 (185.230.xxx.yyy:51849)
>
> 2022-06-05 20:30:27.626543: [TUN] [wireguard] Receiving handshake initiation from peer 1 (10.253.2.2:60026)
>
> 2022-06-05 20:30:27.626543: [TUN] [wireguard] Sending handshake response to peer 1 (10.253.2.2:60026)
>
>
>
>
> However, it seems that wireguard sends the outgoing packet with the wrong ip (192.168.99.101) instead of 10.253.2.9 to 10.253.2.2:60026 ?
>
>
>
>     Protocol    Local Port      Local Address   Remote Port Remote Address      Received Bytes  Sent Bytes  Rec Pkt Sent Packets
>
> wireguard.exe   UDP IPv4    51850   192.168.99.101  51849       185.230.xxx.yyy     81.976          8.584   417     216
>
> wireguard.exe   UDP IPv4    51850   10.253.2.9      60026       10.253.2.2          55.648                  376
>
> wireguard.exe   UDP IPv4    51850   192.168.99.101  60026       10.253.2.2                          37.848          398
>
>
> What can I do?
> Can I make the wireguard log more verbose to show IP Paket src/Destination?
>
> Is it possible to also log the src IP of the "handshake response packet"?
>
> Best,
> Max
>
>
> wg_serv config:
>
> [Interface]
>
> PrivateKey = SFhFHVb__2c=
>
> ListenPort = 51850
>
> Address = 10.253.2.9/24
>
>
>
> [Peer]
>
> # wg-vpn-relais
>
> PublicKey = 3A5__wo=
>
> AllowedIPs = 10.253.2.2/30
>
> Endpoint = 185.230.xxx.yyy:51849
>
> PersistentKeepalive = 20
>
>
>
> [Peer]
>
> # peer via vpn relais
>
> PublicKey = FTBC__cqghg=
>
> AllowedIPs = 10.253.2.3/32
>
> PersistentKeepalive = 20
>
>
>
> wg output:
>
> peer: 3A5__o=
>
>   endpoint: 185.230.xxx.yyy:51849
>
>   allowed ips: 10.253.2.0/30
>
>   latest handshake: 1 minute, 55 seconds ago
>
>   transfer: 145.71 KiB received, 29.74 KiB sent
>
>   persistent keepalive: every 20 seconds
>
>
>
> peer: FTB__hg=
>
>   endpoint: 10.253.2.2:60026
>
>   allowed ips: 10.253.2.3/32
>
>   transfer: 89.46 KiB received, 60.67 KiB sent
>
>   persistent keepalive: every 20 seconds
>
>
>
>
>
> PS C:\Windows\system32> Get-NetIPInterface | select ifIndex,InterfaceAlias,AddressFamily,ConnectionState,Forwarding,weakhostreceive,weakhostsend | Sort-Object -Property IfIndex | Format-Table
>
> >>
>
>
>
> ifIndex InterfaceAlias              AddressFamily ConnectionState Forwarding WeakHostReceive WeakHostSend
>
> ------- --------------              ------------- --------------- ---------- --------------- ------------
>
>       1 Loopback Pseudo-Interface 1          IPv4       Connected   Disabled        Disabled     Disabled
>
>       1 Loopback Pseudo-Interface 1          IPv6       Connected   Disabled        Disabled     Disabled
>
>       4 LAN-Verbindung* 11                   IPv6       Connected   Disabled        Disabled     Disabled
>
>       4 LAN-Verbindung* 11                   IPv4       Connected   Disabled        Disabled     Disabled
>
>       8 WLAN                                 IPv4    Disconnected   Disabled        Disabled     Disabled
>
>       8 WLAN                                 IPv6    Disconnected   Disabled        Disabled     Disabled
>
>      12 Ethernet                             IPv6       Connected   Disabled        Disabled     Disabled
>
>      12 Ethernet                             IPv4       Connected   Disabled        Disabled     Disabled
>
>      16 LAN-Verbindung* 2                    IPv6    Disconnected   Disabled        Disabled     Disabled
>
>      16 LAN-Verbindung* 2                    IPv4    Disconnected   Disabled        Disabled     Disabled
>
>      17 LAN-Verbindung* 1                    IPv6    Disconnected   Disabled        Disabled     Disabled
>
>      17 LAN-Verbindung* 1                    IPv4    Disconnected   Disabled        Disabled     Disabled
>
>      53 wireguard                            IPv6       Connected   Disabled        Disabled     Disabled
>
>      53 wireguard                            IPv4       Connected   Disabled        Disabled     Disabled
>
> wg_relais debug state:
>
> wg-vpn-relais # conntrack -L | grep 10.253
>
> udp      17 28 src=178.101.114.260 dst=185.230.xxx.yyy sport=60026 dport=51850 [UNREPLIED] src=10.253.2.9 dst=10.253.2.2 sport=51850 dport=60026 mark=0 use=1
>
