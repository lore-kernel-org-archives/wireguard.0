Return-Path: admin@hda.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 317a660a
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 06:39:43 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f5eca3a
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 06:39:43 +0000 (UTC)
Date: Mon, 02 Jan 2017 07:48:18 +0100
From: Anonymous Anonymous <admin@hda.me>
To: <wireguard@lists.zx2c4.com>, "Jason" <jason@zx2c4.com>
Message-ID: <1595def90e0.ed2b40b2254.2112025199632738072@hda.me>
In-Reply-To: 
Subject: Re: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Nicely done! Common sense won after all.
>Notice the two =E2=80=98Address=E2=80=99 lines at the top, and that =E2=80=
=98SaveConfig=E2=80=99 is set to =E2=80=98true=E2=80=99, indicating that th=
e configuration file should be saved on shutdown using the current status o=
f the interface.
On Sun, Jan 1, 2017, at 22:57, Jason A. Donenfeld wrote:
> Hi guys,
>=20
> The re-written `wg-auto-config` script is now a part of src/tools and
> adds a few configuration variables to the configuration file format,
> to make it really easy to define VPNs with a single file. This has
> been requested by many of you, and here is, at long last, a basic
> solution.
>=20
> It's a simple bash script. It gets installed by `make install` in the
> src/tools directory, but I realize that not all distributions want
> this. For example, both NixOS and OpenWRT already have WireGuard built
> into their network management utilities, and OpenWRT doesn't even ship
> bash. So for these distributions, where it is useless, I expect for
> them to install with `WITH_WGAUTOCONFIG=3Dno make -C src/tools install`,
> in order to not install it. As WireGuard gets integrated into other
> network management utilities, such as systemd-networkd, I expect for
> this script to fade in usefulness and eventually be removed all
> together. But for now, it's quite helpful and will be useful to some
> users.
>=20
> So what is this tool? Here's the man page:
> https://git.zx2c4.com/WireGuard/about/src/tools/wg-auto-config.8
>=20
> And here's an example:
>=20
> [Interface]
> Address =3D 10.200.100.8/24
> PostUp =3D echo =E2=80=99nameserver 10.200.100.1=E2=80=99 | cmd resolvcon=
f -a $INTERFACE -m
> 0
> PostDown =3D cmd resolvconf -d $INTERFACE
> PrivateKey =3D oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=3D
> PresharedKey =3D /UwcSPg38hW/D9Y3tcS1FOV0K1wuURMbS0sesJEP5ak=3D
>=20
> [Peer]
> PublicKey =3D GtL7fZc/bLnqZldpVofMCD6hDjrK28SsdLxevJ+qtKU=3D
> AllowedIPs =3D 0.0.0.0/0
> Endpoint =3D demo.wireguard.io:51820
>=20
> This is a normal wg(8) format, except with the addition of the
> "Address" line and the "PostUp" and "PostDown" lines. You give this to
> wg-auto-config, and everything, including routing, is taken care of
> for you. For example, save this in /etc/wireguard/wgdemo0.conf and
> then run:
>=20
> $ wg-auto-config up wgdemo0
>=20
> And voila, your VPN is running.
>=20
> Check out the man page, read the script --
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-auto-config -- and
> please let me know what you think before I cut the next snapshot.
>=20
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
