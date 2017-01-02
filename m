Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4be3828
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 04:49:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11368c57
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 04:49:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 428343fe
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 04:49:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b9d6c744
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 04:49:05 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id b126so473049081oia.2
 for <wireguard@lists.zx2c4.com>; Sun, 01 Jan 2017 20:57:44 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Jan 2017 05:57:43 +0100
Message-ID: <CAHmME9qQ495gt_zByeJDA3_x+eKMoVWOjzJypiUQnHVJvq6BWQ@mail.gmail.com>
Subject: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi guys,

The re-written `wg-auto-config` script is now a part of src/tools and
adds a few configuration variables to the configuration file format,
to make it really easy to define VPNs with a single file. This has
been requested by many of you, and here is, at long last, a basic
solution.

It's a simple bash script. It gets installed by `make install` in the
src/tools directory, but I realize that not all distributions want
this. For example, both NixOS and OpenWRT already have WireGuard built
into their network management utilities, and OpenWRT doesn't even ship
bash. So for these distributions, where it is useless, I expect for
them to install with `WITH_WGAUTOCONFIG=3Dno make -C src/tools install`,
in order to not install it. As WireGuard gets integrated into other
network management utilities, such as systemd-networkd, I expect for
this script to fade in usefulness and eventually be removed all
together. But for now, it's quite helpful and will be useful to some
users.

So what is this tool? Here's the man page:
https://git.zx2c4.com/WireGuard/about/src/tools/wg-auto-config.8

And here's an example:

[Interface]
Address =3D 10.200.100.8/24
PostUp =3D echo =E2=80=99nameserver 10.200.100.1=E2=80=99 | cmd resolvconf =
-a $INTERFACE -m 0
PostDown =3D cmd resolvconf -d $INTERFACE
PrivateKey =3D oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=3D
PresharedKey =3D /UwcSPg38hW/D9Y3tcS1FOV0K1wuURMbS0sesJEP5ak=3D

[Peer]
PublicKey =3D GtL7fZc/bLnqZldpVofMCD6hDjrK28SsdLxevJ+qtKU=3D
AllowedIPs =3D 0.0.0.0/0
Endpoint =3D demo.wireguard.io:51820

This is a normal wg(8) format, except with the addition of the
"Address" line and the "PostUp" and "PostDown" lines. You give this to
wg-auto-config, and everything, including routing, is taken care of
for you. For example, save this in /etc/wireguard/wgdemo0.conf and
then run:

$ wg-auto-config up wgdemo0

And voila, your VPN is running.

Check out the man page, read the script --
https://git.zx2c4.com/WireGuard/tree/src/tools/wg-auto-config -- and
please let me know what you think before I cut the next snapshot.

Regards,
Jason
