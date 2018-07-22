Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 173f6b9b
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jul 2018 12:53:11 +0000 (UTC)
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c55fbdfb
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jul 2018 12:53:11 +0000 (UTC)
Received: by mail-wm0-x22d.google.com with SMTP id s9-v6so13404554wmh.3
 for <wireguard@lists.zx2c4.com>; Sun, 22 Jul 2018 06:02:05 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Wireguard fails on recent updates for OpenWRT on Turris Omnia,
 but same versions work on other (Linksys) routers with same CPU
References: <131640bf823f0fba0adf5985e2e8aa17@mail.gmail.com>
 <CAHmME9r0rTCydGrf9cB474j1GOavzsdf8rDwLUhmMiK9FsTYbQ@mail.gmail.com>
 <3980181ad4f2980831b273db734f7772@mail.gmail.com>
To: mike@pmfarmwald.com
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <ac459db2-43e2-975e-decd-86a5066dde0d@gmail.com>
Date: Sun, 22 Jul 2018 13:02:02 +0000
MIME-Version: 1.0
In-Reply-To: <3980181ad4f2980831b273db734f7772@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 10/07/18 21:50, mike@farmwald.com wrote:
> Wireguard is 201806xx (25?) release - how I tell? Wg show doesn't 
> list the version.

# cat /sys/module/wireguard/version

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAltUgEAACgkQivBzdIir
MBLfTg//fyFfmAgdQhIQdlWIWM+DQOokfmvnfL8ZsEnz/Ly+511rm/GKZH6WHTNK
ehF+4YcXvE6bhvOMf5RpyD2d9ylJ3ai2S2gEiqDYyUZY4FB7Ds3JJTvvFABfPJln
brwqFpgMfiX6T5lpzhFSRWSPZsgP9Ts6I4me9cxSfgKxKAh4+whTDmznjL3oYmiN
VvMqOqdWOuRr54UKv9OgBkIZ2K8S8Pkv/73RXWhVPJdRViq9sXmO736p8nTU2yDb
fB64O4DozM/RMwdNlpzHz5zcAeb7+DeFa5SV0Iumo79QWelCZXxqti1NQxMqnkZq
yYAGUZIH9byUzzlrABtz0mHnVJ+vrj+71Fgoh+FJAfX4zrsF8KjxYtHWJWUIK5+G
HEvhVQoVP5KOSXbM8uupRo1LNnT0wRIYVhb4GIQHzYwXLmCwscFQQ1iA72bTifWH
XG4a4R+BVi3Nkr7LmcDQYP89sMNpv6xo+99VssQDcVO4lvscWj33eLl45t2qGJJ5
YwkKNiw/U4wzOHQjB4sI42uC01M0IaAjJR9eAlG1TYuskYfbGVmLYcNyqNk4GHmJ
bmWd+fUp8d2z1AL15/Yji4bDf5sYcxPi3EhbjjX7E3jGLkK7FByaZqT9qiZDjEQk
AHljIQ3teZG8GBHp7IvVN7EvR0Dnj3XYShpcqkfqQicR6gu9Hco=
=z4g8
-----END PGP SIGNATURE-----
