Return-Path: zx2c4@gentoo.org
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69c18314
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 15:26:59 +0000 (UTC)
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
 [209.85.215.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zx2c4)
 by smtp.gentoo.org (Postfix) with ESMTPSA id 95506340F66
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 15:27:47 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id q132so16966883lfe.3
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 08:27:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871t2zt93w.fsf@alice.fifthhorseman.net>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Date: Tue, 12 Jul 2016 17:27:42 +0200
Message-ID: <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jul 12, 2016 at 12:59 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> On Mon 2016-07-11 19:51:12 +0200, Jason A. Donenfeld wrote:
>> How often is too often for you guys for publishing snapshots? Once a
>> week okay? Twice a week okay? Twice a month okay? It doesn't matter
>> because package bumping is all automated anyway?
>
> I also prefer to at least build and test manually before i upload.
> weekly is probably fine.
>
> If there's something critical, of course, please don't delay the release
> of a fix due to my scheduling.  It's possible that i won't get a new
> revision packaged the day of the release (or maybe even longer), but
> that's no reason for you to not to publish an important fix as upstream.

Okay, noted.

>
> i'll be more comfortable with a more automated package/release workflow
> when i sort out better automated testing and continuous integration for
> the package as a whole.

That's a good point. Alright, that seems sufficient motivation for me
to construct a good automated test harness.

Last week Jonathan and I got the Go external test pinging. Maybe I'll
expand this and make a general framework for automated testing.
