Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d5f6e65
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Aug 2018 14:31:18 +0000 (UTC)
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48561757
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Aug 2018 14:31:18 +0000 (UTC)
Received: by mail-wm0-x22e.google.com with SMTP id s12-v6so14591687wmc.0
 for <wireguard@lists.zx2c4.com>; Mon, 20 Aug 2018 07:43:57 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Wireguard not building on pre-rc1 4.19 kernels (Fedora)
To: Bruno Wolff III <bruno@wolff.to>
References: <20180820044022.GA11783@wolff.to>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <87586e5d-0ca0-8b93-70b7-340e600f8f1e@gmail.com>
Date: Mon, 20 Aug 2018 14:43:53 +0000
MIME-Version: 1.0
In-Reply-To: <20180820044022.GA11783@wolff.to>
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

This will be because Jason's RNG patch landed in mainline, but the
kernel version number won't get bumped (so compat.h can use it
properly) until 4.19 is released.

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAlt606cACgkQivBzdIir
MBLYqA//Rs14E903b5RY3bj4DZdVjCPnweLpo53rzQxZ76MsnlsdjGoxKmXL/Eqj
rpRATduQfHQvRr0Y9ZfTKMH9XSO9spqy+HOEGm77Y8WWlgIkbO3PSc49SRLmtKT1
mSaqQotHyxOWD21xC9Cif1cr5LMg2+MXcb2badNDB5TLmz5XfK8ku20f1o7TBsFl
TWeuGnvM3BE8z6Q0iX+C3vGhxrRuoxaY3p/zeYpGXBCUmLGragui08T5N5FqSjFW
61hE1pvdsl3i4usj/5L3jRe3BjbnsXtCRSPUaCcB0r6Xo9QLvL40f+viGBlkUl75
IhfSIDS32kfWDWPN9Ugp3+PmdB8TMGL7En0nOobWiBLynKHTdXh4Jk+SPmubMyj+
gyRJ/1BjeV1a4sOqlVyFv+mfctwOqs3k9nG3MB0HVRQKLK9fbE/yrHrecTjauRSN
ld+VNpAk9reek2hifrwvI11zfQyvPikUKsxXezsB+nD6HbH/lzIj5f+iSs4AMMom
rDCwADdWGFFlb1LYzgkds9GFT/AjE5zSyVy3EszM8+H2gvHhCa79uDi+lsM5wTa2
hijEskUTyOgcmz3TnAcY1HbFU8TNTYK/grlJXrevYKAZODGq86cYJEhOIv7TKgm0
GHhGQD2KORmpeMyla1UQmXWyG6TyungfrKAjT4WDoYZzl8nrc+o=
=j5JX
-----END PGP SIGNATURE-----
