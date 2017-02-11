Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a75491d
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:00:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8e5b9ca
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:00:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1c64b44
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:00:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c60a5db
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:00:50 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id j15so32577723oih.2
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 01:14:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <505f3f87-16a9-3020-ad9f-10d1c71749e3@mib-infotech.co.nz>
References: <20161122130805.GG20343@tuxmachine.polynome.dn42>
 <CAHmME9pMMpmS5BNEeAeRNDLF6ZdDOVkbLVTaUTBM3Yk=u1mGAw@mail.gmail.com>
 <505f3f87-16a9-3020-ad9f-10d1c71749e3@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Feb 2017 10:14:37 +0100
Message-ID: <CAHmME9qXG4tGfkm5+WKhuPx+gFiO+GEZM_fAbrG+gHsqGm87XQ@mail.gmail.com>
Subject: Re: mint (ubuntu) kernel Signing
To: john huttley <john@mib-infotech.co.nz>
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

Hey John,

Indeed if you have a secure-boot enabled kernel, you need to sign your
kernel modules before they can be inserted. One option is just to
disable secureboot and then restart:

sudo apt install mokutil
sudo mokutil --disable-validation

But if you'd like to retain the security of secureboot, then you can
add your own signing key to UEFI and sign the kernel module with it.
You can follow basically the same process as described in this
article: http://www.pellegrino.link/2015/11/29/signing-nvidia-proprietary-driver-on-fedora.html
Except you sign wireguard.ko in the end.

Let me know if you have trouble or require more explanation. If this
becomes a real sore point, I'll write some WireGuard-specific
documentation or even write some automated scripts. But I'd be
interested in your feedback first on the above.

Thanks,
Jason
