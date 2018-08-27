Return-Path: riccardo.kyogre@live.it
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e53c26df
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 14:33:00 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069076.outbound.protection.outlook.com [40.92.69.76])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e58ada6
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 14:33:00 +0000 (UTC)
From: Riccardo Paolo Bestetti <riccardo.kyogre@live.it>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: Getting IPv6 route advertisements to work over WG
Date: Mon, 27 Aug 2018 14:46:31 +0000
Message-ID: <AM5PR0802MB2450F5F2541FA58DF48E5D28FF0B0@AM5PR0802MB2450.eurprd08.prod.outlook.com>
References: <20180827171426.7c4ec614@natsu>
 <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
 <20180827185329.1a7bb24a@natsu>
In-Reply-To: <20180827185329.1a7bb24a@natsu>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I laughed in my head. :)

For what my two cents are worth, L2 WireGuard would have its (limited) use =
cases, but nothing beats having a simple and effective mono-purpose protoco=
l like we do now. Everything else can be solved with OpenVPN or appropriate=
 SDN techniques running on top of WG.

<ot>
And about that, I think that out-of-band comms support would be a very nice=
 addition to the protocol. The tunnel could be initially established with n=
o tunnel addresses, but it could provide the ability for setup scripts on e=
ach side to talk to each other to set up routing, addresses, firewalls, etc=
. This would allow more complex setups, but would avoid adding all the comp=
lexity/edge cases/etc. to WireGuard.
</ot>

Regards,
Riccardo

-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Roman Mame=
dov
Sent: luned=EC 27 agosto 2018 15:53
To: netravnen@gmail.com
Cc: wireguard@lists.zx2c4.com
Subject: Re: Getting IPv6 route advertisements to work over WG

On Mon, 27 Aug 2018 15:32:49 +0200
netravnen@gmail.com wrote:

> When using multicast over WireGuard, would it not be more viable to=20
> use an extra encapsulation layer to run multicast inside of?
>=20
> I am specifically thinking of running either GRE or L2TPv3 over wgX.

I know people run VXLAN or other L2 tunneling protocols over WG. I suppose =
you can call that "viable" as in "it can work", but it's a horrible workaro=
und for the lack of better solution, nothing more. For instance the overhea=
d reaches comical levels:

  TCP
    over IP
      over Ethernet
        over VXLAN
          over UDP
            over IP
              over Wireguard
                over UDP
                  over IP=20
                    over Ethernet

Add more fun if you use something else such as PPPoE for Internet connectio=
n, or a 6in4 tunnel for IPv6. At some point the whole thing will break down=
 because you can no longer fit 1280-byte packets into innermost MTU, and IP=
v6 won't work.

Not to mention the additional management overhead of an inner L2 tunneling =
layer.

Now, if WG would support L2 mode natively (say, with AllowedMACs instead of
AllowedIPs) it would be awesome and that would solve a great number of othe=
r issues as well. But since that appears to be unlikely, and since RAs alre=
ady mostly work, with just one piece missing, I hope at least that piece ge=
ts dropped in at some point, and that we aren't stuck at least for this use=
 case with "more viable" tunneling workarounds forever.

--
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
