Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EAF483E5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 19:01:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5666eddd;
	Mon, 23 Mar 2026 19:01:23 +0000 (UTC)
MIME-Version: 1.0
References: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
In-Reply-To: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 23 Mar 2026 14:34:18 -0400
X-Gm-Features: AaiRm536LI2EWtqO2TqetOLtoTi6X8est5AE8PRmukG6LfLoAQQfQcH8WXlF5BQ
Message-ID: <CAH8yC8k1R2L2Wp-oQDyn3L14k0xQwg_jW6oYY+-cOPv9rT0EYg@mail.gmail.com>
Subject: Re: Sunsetting support for old Windows versions
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Mar 23, 2026 at 1:09=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:

> Hey everyone,
>
> The time has finally come. Future releases of WireGuard for Windows
> will support Windows =E2=89=A510 and Windows Server =E2=89=A52016.
>
> With Windows 10 first released to manufacturing on July 15, 2015,
> that's supporting an operating system that's 3,904 days old, as
> opposed to supporting an operating system that's 6,088 days old.
> Nonetheless, supporting an OS that's over 10 years old is still a long
> time, even if it's not an OS that's over 16 years old.
>
> I must admit, however, that I am a bit sad about this. After coding up
> [1] this dialog box for the installer, I felt a few pangs of sadness
> when testing it for the first time on Windows 7 and seeing the tragic
> result: https://data.zx2c4.com/bye-bye-wg-win7.png . But it was a
> familiar feeling. For, long ago, I'd already watched the beauty of
> Windows fall to pieces. To me, Windows 2000 is the most beautiful of
> Windows operating systems. Yes, we can all ogle at the engineering
> marvel that was NT 3.51. But Windows 2000 really elevated that whole
> vision to perfection, and was also the pinnacle of the classic UI
> design. I can't think of a classier OS released since. Though, I must
> say, it was Windows XP that captured my heart and formed the basis of
> my childhood, the new style and all; I would switch between classic
> theme and the XP theme frequently, and later flirted a bit with the
> MCE themes. It was just a very nice OS, had everything one could want,
> a great suite of software, really good stability, ever widening
> hardware support, sane and consistent interfaces. It came
> pre-installed on my Dell Inspiron 8100 and I loved it. At some point I
> switched to running Linux on my laptop, but would still sneak down to
> the family computer to fiddle around with Windows development on our
> XP machine. I could go on and on. Then Vista was released, and it was
> annoying and introduced inconsistencies, which Windows 7 tried to
> smooth out and succeeded to some degree, but it was just never the
> same to me. And we all remember what happened next with 8, 8.1, 10,
> and 11.
>
> So, it's sad to make this change, but it's far less sad than what
> already happened in the Windows world post 2000 and post XP.
>
> On the plus side, this has enabled a lot of significant cleanups
> throughout the code, and will be yielding more and more as this
> process continues. Windows programming is as fun as ever -- arguably
> more fun, as the archaeological dumpster heap of historic Microsoft
> APIs, each one filled with a unique history and competing corporate
> and technical vision of operating system futurism, only ever gets
> deeper to dive in. So I'm relatively happy to make this change, even
> if somewhat wistful about it.
>
> I had first asked the mailing list whether this was acceptable in 2020
> and then again in 2021. Fast forward 5 years and the ecosystem has
> changed a lot, and our upstream dependencies have similarly dropped
> support. I realize this leaves the still-technically-supported Server
> 2012 and 2012R2 out in the cold, but 8 and 8.1 haven't been supported
> in two years, and I think most realistic users have similarly dropped
> the corresponding server editions. In other words, I don't anticipate
> any real fallout. However, I know that Windows 7 and Server 2008 and
> 2008R2 users are usually pretty committed to their ways and can be
> vocal. So, by all means pipe up to sing an elegy if you'd like. But
> we're moving forward with the sunsetting.
>
> I hope this all seems reasonable enough. Let's pour one out for
> Blackcomb/Vienna, and while we're at it, for Whistler long before
> that.
>
> Jason
>
> [1]
> https://git.zx2c4.com/wireguard-windows/tree/installer/customactions.c#n1=
01


WIndows 7 market share dropped to around 1% in January 2026.  I think it is
a good decision.  Confer, <
https://gs.statcounter.com/os-version-market-share/windows/desktop/worldwid=
e
>.

It's a damn shame, though.  I think Windows 7 is one of the best Windows
releases from Redmond.  If Windows 7 had a 3% market share, I would argue
to keep the support.  But going below 3% was a death knell.

Jeff
