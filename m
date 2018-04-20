Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 602ca82f
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 14:47:49 +0000 (UTC)
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
 [209.85.128.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3857139
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 14:47:49 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id v60-v6so23693084wrc.7
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 07:48:03 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Problems with IP
To: wireguard@lists.zx2c4.com
References: <86d4ddc168ce2c5ac69bede349a44b50d68d6555.camel@e-queo.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <c2634cf8-28bf-816f-fe91-6e988cc6bbdc@gmail.com>
Date: Fri, 20 Apr 2018 14:48:01 +0000
MIME-Version: 1.0
In-Reply-To: <86d4ddc168ce2c5ac69bede349a44b50d68d6555.camel@e-queo.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 20/04/18 14:32, bessonov.victor@e-queo.com wrote:
> I've tried to run this instruction manually, result is still the
> same. The system runs CentOS 7 and properly updated.

Updated, yes; but not up to date. The version of iproute2 is too old.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJa2f2dAAoJEIrwc3SIqzASCVMP/A9tBO8Sbl1z9rGK0q9vjdyK
kMeFxKGVWqR4Xz8Sy9wfS+iKeXlBQxKukaZCTuSDr9WzsbpzvohYcE0FvGuDPZgf
G9TgrGK9NAPow6pIdCfgeIIUnBQQ5geLtnxXKdrr7yaXn2rB8KWi1nwM+NbenNnC
iJcPe7U9I+RzlDwESTHJMJJGR4hI8zbRSU4H3Nb2PEoYpizHUQuG56RGmOSDO08a
1+uol4iBsR0EEBqyt3PUDjuSTjXSAm6G328pErC+aU6I9wP+FHsFUvfMnVd7GDG1
mJfVx2R8mLInlWX0gpL9YgelOC+/jIRDOeNKvdQAoqF3+7Tz+mT7J++/FLdQa3Sq
mgHaX+Tvjw6Rnl9KEYC9DqclmHuaoeAHtp7FGnxOXrSOE6fwVh/4BsfKKb7ntU0C
Wn0tRNrd/QagFm9Nyytm1g1IjoD/B+dXo9cT9p+bls/wBis4+jZZqJte40Kg1MaT
TlUeyLqVqXMWoUyqqn7Rit4E5ejgPbQpPywdKlJKCQrW4OoU+ualW+t+LUrluPAQ
ANQkenewaPmoEY4wLGJx02LeD8heYRGzVDkBMmohMiaSVgwibOfxcea7WiggcMNy
HICqRz1rCHIhDa0togIb2YPSiVsz+7rqW6shUgFabpDV3c7edfaZNcu5KwW5laCk
nY6A1S5hrgEOr3E8iPeK
=mFFE
-----END PGP SIGNATURE-----
