Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23b21a4a
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Dec 2016 17:25:21 +0000 (UTC)
Received: from mail.higgsboson.tk (mail.higgsboson.tk [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dca5a56
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Dec 2016 17:25:20 +0000 (UTC)
Received: from [IPv6:2001:470:1f0b:f8d:5e51:4fff:fe58:e70b] (unknown
 [IPv6:2001:470:1f0b:f8d:5e51:4fff:fe58:e70b])
 by mail.higgsboson.tk (Postfix) with ESMTPSA id DFEA94ECA9
 for <wireguard@lists.zx2c4.com>; Wed, 21 Dec 2016 17:32:30 +0000 (UTC)
Subject: Re: Multicast over a wireguard link?
To: wireguard@lists.zx2c4.com
References: <87fuli7itj.fsf@toke.dk>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <c86e8f14-da18-6cfe-c923-57e9d118b6a7@higgsboson.tk>
Date: Wed, 21 Dec 2016 18:32:30 +0100
MIME-Version: 1.0
In-Reply-To: <87fuli7itj.fsf@toke.dk>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I currently use OSPF with one interface per peering with link-local ipv4/=
ipv6 addresses (AllowedIPs=3D0.0.0.0/0,::/0, ipv4 =3D> 169.254.0.0/16 + l=
ifetime 0)

This works fine.

On 2016-12-20 15:53, Toke H=F8iland-J=F8rgensen wrote:
> Does Wireguard has a notion of multicast? I would like to eventually
> replace my current VPN setup with wireguard. I currently run Tinc in
> switch (layer 2) mode, and run the Babel routing protocol on top.
>
> Babel announces itself via link-local multicast to everyone on the link=
=2E
> Does this work with wireguard? I guess the equivalent semantics would b=
e
> "send this packet to all known peers"...
>
> -Toke
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
