Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c842718
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:20:08 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
 <67b97701-8286-039e-31bb-b7275ab338e8@eggiecode.org>
 <CAHmME9rPPxnKWDXYv7r=GjrAoSaMqPRhdALmGxHbRV9v5uC48A@mail.gmail.com>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <4e177774-c6b1-b291-0139-0375c96175f2@eggiecode.org>
Date: Wed, 16 Nov 2016 15:22:45 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9rPPxnKWDXYv7r=GjrAoSaMqPRhdALmGxHbRV9v5uC48A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jason,

On 2016-11-16 15:04, Jason A. Donenfeld wrote:
> Can you loop these other PPA people in on this thread. Let's all
> consolidate around Egbert's one PPA. He can decide to allow
> co-maintainers if he wants.
>
Yes. If some one wants to co-maintain with me, send me an email.

On 2016-11-16 15:09, Jason A. Donenfeld wrote:
> On Wed, Nov 16, 2016 at 11:03 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
>> Going to update the PPA to remove my disable of AVX2.
> Good. Can you remove this garbage immediately:
> https://git.launchpad.net/wireguard/tree/debian/patches/update-hard-disable-patch-to-upstream
> https://git.launchpad.net/wireguard/tree/debian/patches/0001-disable-hard-avx2
Done: 
https://git.launchpad.net/wireguard/commit/?id=f69e7e6f6eb9c34d7fcd364c10f5a792fc63e3b2 

> There are two principles I would like to see adamantly applied before
> I'll endorse this PPA:
>
> 1. Stay as close to vanilla upstream snapshots as possible. Do not
> have patches that differ from Debian's too much. If you need changes,
> consult the very active and very willing upstream instead.
Ofc. Source (wireguard-src in git) is a submodule of the last taged 
experimental
> 2. Only package snapshots. Do not choose your own git commits.
>
> Are these two things you're willing to do?
Yes!

Greetz,
Egbert
