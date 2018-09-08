Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d03538f9
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:02:51 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0a1bf7b
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:02:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w11-v6so17531489wrc.5
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:03:20 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: [PATCH 5/7] netlink: allow setting of transit net
To: Julian Orth <ju.orth@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-6-ju.orth@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <a6d8b0be-1d69-c803-17f4-e23d49073c28@gmail.com>
Date: Sat, 8 Sep 2018 14:03:17 +0000
MIME-Version: 1.0
In-Reply-To: <20180908121841.8372-6-ju.orth@gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Does this handle file descriptor 0 (unlikely, but perfectly valid) ?

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAluT1qQACgkQivBzdIir
MBKv2g/+Nvz3NmcakxPMzGAC07dXQiu4TVVjwFeGofUwgQmB5+wY6fy9Sqg+S+z6
Fkz2Mnkste0o38JGz2320wAPmH6IYsKrtA5TGzaoNP8I+Gp2Uy9GqjDtUe2+tNnj
hLdK2mucbE1Sp6MbBeTKyZi2ZD1VHaYcsFJupjPnL1wT7pVnVSnRjGwoEJjRT4VQ
htgEh4YGtAGOWHYzFMxlZF/oKM6QHAZXTcAm6k1xMLk7TvXNpaTamuNYCl2DLwIf
TpjxANzzd5itBcos95F0VKJtVlRJkbW0lIedaw3qyrjhIjM8rmxAF/pTGosMigcr
KIXVcPKaZhB0y/kMh/fe7LFMIcBb9N62skJEHtpFX4AUjT+XQYGtzp2Z9iiVDooX
kLn19X3EDgS5ln7LaNlprZnQaxjkHWhQa+X8xxDKyFVBRBJO4lQA72eT4ZjSDzbv
JGRkLSHsvGmHg5qOji5mamZB+HgLZcImbKAp2MJaEkgU9G9M9U8OPICp5dVcv9dp
1cY7E0qhhrBDyhda30VbuM+inOjEfqYHQ5ZaGGE530EN8oVE1eci421OcxdY/MTc
mmJ8FOYxxYsxNwzPZsMHjIX1xGD6W87zG0kOKLDBBrJ64FBWe77kGMZ9R55Is5pc
kfeTfDSR311OC4qHy4scudqNUyyh8WnySFziohCoOU9giypLNGQ=
=2J95
-----END PGP SIGNATURE-----
