Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a7cc40b
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 00:04:02 +0000 (UTC)
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com
 [IPv6:2a00:1450:400c:c09::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f8501d5
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 00:04:02 +0000 (UTC)
Received: by mail-wm0-x22b.google.com with SMTP id y9-v6so5330189wma.5
 for <wireguard@lists.zx2c4.com>; Sat, 11 Aug 2018 17:15:35 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <CAHmME9pQJ4-1AGGUd63Nsys2_5tVxecH2rWqVScWdMgNyG_zOA@mail.gmail.com>
 <CAJq09z5GX4QxqhN7j4UC+2cM=fp4FKpZm1gsyREy1f_vhXGzyg@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <fb5cc651-e249-c5f1-f42c-d46198a8e36b@gmail.com>
Date: Sun, 12 Aug 2018 00:15:31 +0000
MIME-Version: 1.0
In-Reply-To: <CAJq09z5GX4QxqhN7j4UC+2cM=fp4FKpZm1gsyREy1f_vhXGzyg@mail.gmail.com>
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

On 11/08/18 22:52, Luiz Angelo Daros de Luca wrote:
> I see these wireguard extra features just like dhcp is. Nobody
> thinks about implementing dhcp inside kernel or even iproute
> tools.

The Linux kernel has a (minimal, non-configurable) DHCP client already
(used for rootfs on NFS without an initramfs, among other things).

CONFIG_IP_PNP_BOOTP=y

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAltvfB4ACgkQivBzdIir
MBLldA//aCK1DHoew8joweZkI2coLZjolMqPActFDTtDkIXAka3guJjh2zVDCxVF
45AdF1Xv7jhmuDB4emCgH6ANk0vPDAHvs6SBYYZgHvvHdNbBzmM9FqJFk01KHUkl
LhPVCjR9T9EMNifoP5EI1R3YTpoAQbUpaJJ9K12rumdGMelpVU7qg7hW7VkscwAq
WtmN/wuD3w3mZKH+TvtlT409JefvocvE9kA7NUXWOZ9Bxxj3pEJIVTmquE6MS4rm
zHcQ7hY3JR7cPg4Imc0FHuyvbU55R2AnU9+00+dTUISlBT9k2pneIw4EhW0WSHLK
uXXplZfpwV9WSiI/n1dXX1RdRc/42U6LsD4ZLPr6uxoULyeM0ahW7P2+Zq7+yt34
gEDjwTdLSLQYpLEWhAZ4q6fBLGamZHqXgLXTtioWrIqr5eaScYJcINNjsnAEa8Kz
3Oo5HOxvJvEMyDz35M+04ugAbjW5LHiqWsOoWfX0A2XfDPt9mnTuiPXrGSLEPWdh
5OvOsPAmda4/CbJo83cRHqwhsOvoxIJX5+Ewx8giyLZ4lWIGum57wD6n6ZaUVsHZ
9OXA8f7LZdkxKZ/QSFi7HN9S7SRdkCbJB9E0L96AAVhPGbZuXkGavN5sIOA3fd7Y
CWMCI3Y+x675gtYTpVooR+P1fTWgBAHOHuVFeU8e+LSHwhMallc=
=OY67
-----END PGP SIGNATURE-----
