Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1472cc7a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 06:18:13 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: Dan Luedtke <mail@danrl.com>
In-Reply-To: <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
Date: Wed, 16 Nov 2016 07:20:55 +0100
Message-Id: <2A245CBB-F1B9-40DA-81C5-D376F2641528@danrl.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Egbert Verhage <egbert@eggiecode.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Egbert,

thank you for maintaining the PPA. I am using it and it works great on my se=
rvers. I wish the version bumps would happen more often as long as the code i=
s experimental. Testing "old" code does not make too much sense (I think we m=
ailed a couple of days ago about that). Other from that I strongly support E=
gbert's PPA becoming the official one. Had no problems so far and I like the=
 test setup.

Cheers,

Dan

> On 16 Nov 2016, at 02:31, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hey Egbert,
>=20
>> On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <egbert@eggiecode.org> wr=
ote:
>> I mailed/called with one of the sys admins and discussed with him about t=
he
>> problem in the AVX2 extention.
>> I think I'm going to mail/call the hosting company again.
>=20
> It seems like the crux of the issue is that if they disable AVX2
> instructions, they need to make this known in the CPUID. Otherwise the
> operating system will assume it's there when it isn't.
>=20
>> Can give you a vps if you want to. Just 3 euro the month.
>=20
> See the attached tarball. Compile the kernel module in there and load
> it BEFORE WireGuard. You might have to manually unload wireguard for
> this to work: "rmmod wireguard && insmod ./avx2disabler.ko && modprobe
> wireguard", for example. It should disable avx2 inside the kernel,
> solving the issue.
>=20
> Jason
> <avx2disabler.tar.xz>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
