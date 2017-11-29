Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9db9a0b5
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:40:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5254dbb1
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:40:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ef32081
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:40:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 42e2657a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:40:32 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id f69so2387637oig.10
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 05:46:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129134417.GH2523@debian>
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
 <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
 <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
 <20171129134417.GH2523@debian>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Nov 2017 14:46:31 +0100
Message-ID: <CAHmME9oa6iv_YGcow7Em40spjDAzH40XsTios6Lg1sKpO6H2jg@mail.gmail.com>
Subject: Re: Dynamic Adresses
To: Georg Faerber <georg@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Nov 29, 2017 at 2:44 PM, Georg Faerber <georg@riseup.net> wrote:
> On 17-11-29 14:40:25, Jason A. Donenfeld wrote:
>> On Wed, Nov 29, 2017 at 2:35 PM, Mytril <mytril42@posteo.de> wrote:
>> > Yes i have written a similar script for the german ubuntuusers.de wiki.
>>
>> Care to share?
>
> https://wiki.ubuntuusers.de/Baustelle/WireGuard/#Probleme-mit-der-dynamischen-IP

It looks like you're calling ifup/ifdown. This is not a very nice
solution at all. I'd suggest you instead link to the script I shared
earlier in this thread, which does things correctly.
