Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 935c4ec0
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:08:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af32f6ea
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:08:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3543fe71
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:28:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4588933f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:28:01 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 76so11506018ith.0
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 16:30:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
References: <20170808231612.GA24254@zx2c4.com>
 <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 9 Aug 2017 01:30:50 +0200
Message-ID: <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>
Subject: Re: Advising in packages to load new module or reboot
To: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
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

On Wed, Aug 9, 2017 at 1:27 AM, Jonathon Fernyhough
<jonathon.fernyhough@york.ac.uk> wrote:
> On 09/08/17 00:16, Jason A. Donenfeld wrote:
>> 3) not having any headers installed
>>
> ...
>>
>> Any thoughts on this pattern?
>>
>
> I suspect this would be a packaging issue - packages that build modules
> should depend on whatever headers (etc.) that are necessary for building
> the module. I can't think of any distro where that isn't the norm, and
> it's not normally up to the upstream developers to check those things
> (they provide the software source, packagers provide something that
> works specifically with the distro).

Right. So this is all item (3) stuff. I agree with you there --
packages need to express the dependencies in whatever way they can.
That might mean printing nice messages if the correct dependency isn't
obvious.

For (1) and (2), though, what do you think of the warning I've added
to Gentoo? That's what I meant by asking for thoughts on "this
pattern" -- the whole thing with comparing running kernel and
compiled-for-kernel and comparing loaded-module-version and
compiled-module-version.
