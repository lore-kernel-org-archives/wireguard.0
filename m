Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b49a026f
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 13:28:58 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id i145so38939964ywg.2
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 05:30:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9p_mKFupsSLSTW-Tt7embNUTBYtRWudVrj9zFzvgbAzDg@mail.gmail.com>
References: <CAKXLc7eZ3pPZ2WKtCGQGt2KtpBhZsJdD6jY0D_TBycUxN392Hw@mail.gmail.com>
 <CAHmME9p_mKFupsSLSTW-Tt7embNUTBYtRWudVrj9zFzvgbAzDg@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 7 Nov 2016 22:30:20 +0900
Message-ID: <CAKXLc7cZpjSjUG5X78c6qSGtyrL4g4nRojFug5KNutZD+nBPzA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Mon, Nov 7, 2016 at 9:19 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> That's some messed up eclass. Check this out:
>
> From your log:
>> make --jobs=8 --load-average=12 HOSTCC=x86_64-pc-linux-gnu-gcc CROSS_COMPILE=x86_64-pc-linux-gnu- 'LDFLAGS=-m elf_x86_64' KERNELDIR=/usr/src/linux V=1 clean module
>> make -C /usr/src/linux M=/tmp/portage/net-misc/wireguard-0.0.20161105/work/WireGuard-experimental-0.0.20161105/src clean
>> make -C /usr/src/linux M=/tmp/portage/net-misc/wireguard-0.0.20161105/work/WireGuard-experimental-0.0.20161105/src modules
>
> By default linux-mod.eclass calls make clean and make module, at the
> same time, which results in files randomly getting deleted as it
> goes... That seems like a pretty bad default:
>
>>   BUILD_TARGETS=${BUILD_TARGETS:-clean module}
>
Great find, I couldn't spot it.

> I could override this in the ebuild, which I guess I'll do. But I
> think I'd prefer for the eclass to be fixed. I'm CCing the Gentoo team
> who manages this, for their input.
>
Perfect!

I looked around other ebuilds that use this eclass, may be they get
away with setting `BUILD_TARGETS="all"` (not set at all in wireguard),
but I also think a sane default is better.
Clean should always be finished before other targets.

Kalin.
