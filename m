Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee924827
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 12:44:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 803e2b85
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 12:44:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b6d9d541
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 12:44:35 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id g62so32116171lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 19 Aug 2016 05:50:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <acb454d0c202fc330d0a349aeee29256@mail.inwebse.com>
References: <acb454d0c202fc330d0a349aeee29256@mail.inwebse.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Aug 2016 14:50:04 +0200
Message-ID: <CAHmME9ozzYBLJ-0xMocFbWuHWCDsONuVqS_hQpVtWJtMKspd5g@mail.gmail.com>
To: sorcus@inwebse.com
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard doesn't work with network namespace on
	ArchLinux
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Next time ask on the mailing list and not on stack overflow. Also
please use better subject lines in future emails. I'm going to paste
your stack overflow entry here, and then respond to that:

> Subject: Required key not available
> Content:
> i try to configure network with VPN (using WireGuard) and Network Namespace. Original instruction - www.wireguard.io/netns/
> I have a client (notebook) on ArchLinux and server (VPS) on ArchLinux. Client has IPv6-only network, server has dual-stack (IPv4 + IPv6) network.
> Client configs and output of some commands: http://pastebin.com/3Qy3PMrp
> Server: http://pastebin.com/CUizE4LS
> When netns.service started, i can ping fc00::10 (VPS, wg0 interface). But if i try ping any other resource (for example ping -6 -c 1 2a00:1450:4010:c01::8a (ipv6.google.com) ) i get an error:
> 'ping: sendmsg: Required key not available'
> Other commands (drill, tracepath6, traceroute, etc.) get the same error.
> I don't know how to fix it. Help please to solve this problem.
> $ cat /etc/wireguard/client.conf
> [Interface]
> PrivateKey = OAT5r6E1hid***iVBnY=
> ListenPort = 52345
> [Peer]
> PublicKey = aMC3f6kw***UDQVwo=
> EndPoint = [2a01:4f8:***:***::5]:40111
> AllowedIPs = fc00::10/7
