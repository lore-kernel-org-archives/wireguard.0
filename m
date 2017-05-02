Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22f676cc
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:45:26 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 665656bf
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:45:26 +0000 (UTC)
Date: Tue, 2 May 2017 18:54:55 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: wg-quick can't down my vpn I/F and DNS problem
Message-ID: <20170502185455.4e88561e@msi.defcon1>
In-Reply-To: <CAHmME9rrgXSW5pbg56JwBXwcfey0MS-fT7zF-+SmiBwCa5a7bg@mail.gmail.com>
References: <20170502172752.4e234cd8@msi.defcon1>
 <CAHmME9rrgXSW5pbg56JwBXwcfey0MS-fT7zF-+SmiBwCa5a7bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, 2 May 2017 18:31:14 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

Oops, sorry for the PM, I put my answer back in the loop.

> If your wg-quick config file is in /etc/wireguard and ends in ".conf"
> then you can use `wg-quick down vpnserver`. Otherwise, please specify
> the full path when calling wg-quick down.

Hi Jason, very nice work BTW,

this is _exactly_ what I do, on the server and the client, I've:
/etc/wireguard/vpnserver.conf
/etc/wireguard/vpnclient.conf

I created 4 scripts: SERVER||CLIENT_WG_UP||DOWN.sh that use this syntax,
(it either fails when typing it in command line).

So the command issued are:
wg-quick up vpnserver (works perfectly)
wg-quick down vpnserver (fails)
and d=C2=B0 for the client.

My setup is basic (but may be wrong) on both srv & cli, here's the srv
one:

[Interface]
Address         =3D 10.11.12.1/24
ListenPort      =3D 1194
PresharedKey    =3D =E2=80=A6
PrivateKey      =3D =E2=80=A6
[Peer]
PublicKey       =3D =E2=80=A6
AllowedIPs      =3D 0.0.0.0/0

The VPN is working, I made a try yesterday, passing by my cell phone
to reach my site and was amazed by the speed 'cos I keep my phone in gsm
mode, otherwise it eats my battery alive (so ~20kB max speed on an old
Xperia x10).

This isn't really a problem, as I use 2 lines that do the work
correctly; however, the DNS problem is a real concern.

Jean-Yves
