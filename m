Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a892c6d4
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 12:18:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c473144
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 12:18:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9efae9b5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 12:18:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id o141so39690832lff.1
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 04:19:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7eZ3pPZ2WKtCGQGt2KtpBhZsJdD6jY0D_TBycUxN392Hw@mail.gmail.com>
References: <CAKXLc7eZ3pPZ2WKtCGQGt2KtpBhZsJdD6jY0D_TBycUxN392Hw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 13:19:52 +0100
Message-ID: <CAHmME9p_mKFupsSLSTW-Tt7embNUTBYtRWudVrj9zFzvgbAzDg@mail.gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: kernel@gentoo.org, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] emerge failed once :-|
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Kalin,

That's some messed up eclass. Check this out:

>From your log:
> make --jobs=8 --load-average=12 HOSTCC=x86_64-pc-linux-gnu-gcc CROSS_COMPILE=x86_64-pc-linux-gnu- 'LDFLAGS=-m elf_x86_64' KERNELDIR=/usr/src/linux V=1 clean module
> make -C /usr/src/linux M=/tmp/portage/net-misc/wireguard-0.0.20161105/work/WireGuard-experimental-0.0.20161105/src clean
> make -C /usr/src/linux M=/tmp/portage/net-misc/wireguard-0.0.20161105/work/WireGuard-experimental-0.0.20161105/src modules

By default linux-mod.eclass calls make clean and make module, at the
same time, which results in files randomly getting deleted as it
goes... That seems like a pretty bad default:

>   BUILD_TARGETS=${BUILD_TARGETS:-clean module}

I could override this in the ebuild, which I guess I'll do. But I
think I'd prefer for the eclass to be fixed. I'm CCing the Gentoo team
who manages this, for their input.

Thanks for the report.

Jason
