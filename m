Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df39e11b
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 12:50:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 792f530a
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 12:50:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1ea45cd
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 12:50:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a06007f3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 12:50:37 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g23so25689390wme.1
 for <wireguard@lists.zx2c4.com>; Fri, 09 Dec 2016 04:56:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161209121144.GA31448@grsecurity.net>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
 <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>
 <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
 <58475B7C.14182.19D586@pageexec.freemail.hu>
 <CAHmME9rHB20Ywi_ZkFGq5WioqeDApUvaTwaOP1HB1WBpYRVCag@mail.gmail.com>
 <CAHmME9pVCDu88c6n+LV9Mtd5Ohu8o-7RSQB4kRjsHGRQ3jF8zw@mail.gmail.com>
 <20161208231626.GA5230@grsecurity.net>
 <CAHmME9oY+Q7mWkpNejKnPg=DpbtGaXkthCCkPLusMv1uBANLTQ@mail.gmail.com>
 <20161209121144.GA31448@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Dec 2016 13:56:14 +0100
Message-ID: <CAHmME9oQ5HJb937HOwJJbAhaORuFpz5cRp=fhLV=u8rEUST5PA@mail.gmail.com>
Subject: Re: Kernel Panic
To: Brad Spengler <spender@grsecurity.net>
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

On Fri, Dec 9, 2016 at 1:11 PM, Brad Spengler <spender@grsecurity.net> wrote:
> It's not potentially, it is trouble.  That code didn't use to be there
> btw, that optimization was introduced sometime between 3.14 and 4.4.
> So you could take your pick I guess, either that code is wrong or yours
> is wrong ;)  As a third-party module generally that makes your code
> "wrong" (because it being fixed in 4.9 won't help all the other versions
> out there that exist) but I do indeed pass through the original buffer
> through the rest of the function, as it's only the virt_to_page that's
> the problem.

It was added with v4.0-6954-g74412fd5d71b, so I guess this means it
arrived at 4.1.

Quite clearly the kernel code is "wrong", since the vast majority of
other callers in the kernel also use it with the quite reasonable
assumption that simple memcpy is stack-safe. When all of the consumers
assume a function will work in a particular way, and then upstream
tries to "optimize" the function and breaks things, that usually means
it's a problem with the optimization, not with the consumers.

Anyway, what I suspect the upstream response will be is that since
this is just a check of equality of addresses, with no dereferencing,
it will always (?) just be false for stack addresses, and so there's
no functional detriment, despite it being not correct. Or some boring
reasoning along these lines.

But anyway, splitting hairs... I'll monitor the grsec changelog and
ping the guy on the wireguard mailing list who ran into the issue when
it's fixed.
