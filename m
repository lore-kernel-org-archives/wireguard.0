Return-Path: joerg@thalheim.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28e9439b
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 18:23:39 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6779e4d
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 18:23:39 +0000 (UTC)
Received: from [10.99.0.12] (unknown [193.138.219.62])
 by mail.thalheim.io (Postfix) with ESMTPSA id 2CAE43299D
 for <wireguard@lists.zx2c4.com>; Sun, 26 Feb 2017 18:25:05 +0000 (UTC)
Subject: Re: Announcement: Public Wireguard server for testing
To: wireguard@lists.zx2c4.com
References: <CANTUoecoSxQD33M1YbQBqMGPCiLdKwzDkB6p6of=Zo_edgu40Q@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@thalheim.io>
Message-ID: <404f1b9a-9321-edbe-6981-f98c3649e712@thalheim.io>
Date: Sun, 26 Feb 2017 19:25:02 +0100
MIME-Version: 1.0
In-Reply-To: <CANTUoecoSxQD33M1YbQBqMGPCiLdKwzDkB6p6of=Zo_edgu40Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

In this context, I found the following rules useful to bypass the vpn for=
 some routes:

#!/usr/bin/env bash
# /etc/wireguard/<profile>.sh

if [ "${1:-down}" =3D "up" ]; then
  action=3D"add"
else
  action=3D"del"
fi

ip rule $action priority 32763 to 192.168.0.0/16 lookup main
ip rule $action priority 32763 to 172.16.0.0/12 lookup main
ip rule $action priority 32763 to 10.0.0.0/8 lookup main
ip -6 rule $action priority 32763 to fd::/8 lookup main
ip -6 rule $action priority 32763 to 2000::/3 unreachable

#/etc/wireguard/<profile>.conf

[Interface]

#....

PostUp=3D/etc/wireguard/<profile>.sh up
PostDown=3D/etc/wireguard/<profile>.sh down


On 2017-02-25 14:28, Fredrik Str=C3=B6mberg wrote:
> Hi all,
>
> I'm one of the co-founders of Mullvad, as well as a long time lurker
> of this list. I guess I haven't engaged in public discussion until now
> though.
>
> Mullvad is trying out Wireguard, and in that spirit we've set up a
> server for public use. Just follow the instructions at the link below
> and email your pubkey to support@mullvad.net.
>
> https://mullvad.net/guides/wireguard-and-mullvad-vpn/
>
> We're doing this so that people might try Wireguard more easily, as
> well as for us so that we can learn. We're supporting it on a purely
> experimental basis, so no guarantees on uptime or anything. Sometime
> soon we'll install a 10 Gbit card to see where things break first.
> Enjoy :)
>
> Cheers,
> Fredrik Str=C3=B6mberg
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
