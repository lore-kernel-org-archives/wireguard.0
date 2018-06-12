Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5d6c0dd
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:39:00 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc2caa01
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:39:00 +0000 (UTC)
Message-ID: <32c8cc0d0059f0ae680c7c892919c309f621e9fd.camel@mjr.org>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Jun 2018 22:42:47 +0100
In-Reply-To: <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, 2018-06-12 at 23:35 +0200, Jason A. Donenfeld wrote:
> Hi Paul,
> 
> Thanks for the useful bug report. I'll have a fix for it soon.

What a star :)

It's times like this I love being a invovled in OS and a linux
sysadmin. Forced to use a windows VD and o365 for work... and can't
imagine getting the frequent bugs I hit in both fixed so easily. Or
ever. Hit a windows explorer bug that's been a pain since at least
windows xp today!

> Thanks, also, for bringing Debian's rt kernel to my attention. Seems
> like this might be a good testing platform.

There are times the -rt- kernels are a bit behind, they are not always
built with every experimental/unstable/testing kernel, but for audio
work it is very nice to have them.
