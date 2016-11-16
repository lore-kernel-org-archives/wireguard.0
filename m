Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c21c3b05
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 10:00:29 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <67b97701-8286-039e-31bb-b7275ab338e8@eggiecode.org>
Date: Wed, 16 Nov 2016 11:03:06 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

The kernel module worked for my. ([1020751.674357] AVX2 disabler loaded:
1 -> 0)
Going to update the PPA to remove my disable of AVX2.

The problem is that the hosting company hides the cpuuid, but from the
call with the sysadmin it is a XEON E5-2??? v3.

Greetz,
Egbert


On 2016-11-16 02:31, Jason A. Donenfeld wrote:
> Hey Egbert,
>
> On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
>> I mailed/called with one of the sys admins and discussed with him about the
>> problem in the AVX2 extention.
>> I think I'm going to mail/call the hosting company again.
> It seems like the crux of the issue is that if they disable AVX2
> instructions, they need to make this known in the CPUID. Otherwise the
> operating system will assume it's there when it isn't.
>
>> Can give you a vps if you want to. Just 3 euro the month.
> See the attached tarball. Compile the kernel module in there and load
> it BEFORE WireGuard. You might have to manually unload wireguard for
> this to work: "rmmod wireguard && insmod ./avx2disabler.ko && modprobe
> wireguard", for example. It should disable avx2 inside the kernel,
> solving the issue.
>
> Jason
