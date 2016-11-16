Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59ea7c98
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 11:16:15 +0000 (UTC)
To: Dan Luedtke <mail@danrl.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
 <2A245CBB-F1B9-40DA-81C5-D376F2641528@danrl.com>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <f94758be-6d38-cc74-c0e0-83a59ff72fb2@eggiecode.org>
Date: Wed, 16 Nov 2016 12:18:57 +0100
MIME-Version: 1.0
In-Reply-To: <2A245CBB-F1B9-40DA-81C5-D376F2641528@danrl.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

Hey Dan,

Thank you for the support, and I will try to keep it up to date. I just 
launched a patch to remove the AVX2 hard disable.
But I never received / send a email to you.

Greetz,

Egbert


On 2016-11-16 07:20, Dan Luedtke wrote:
> Hi Egbert,
>
> thank you for maintaining the PPA. I am using it and it works great on my servers. I wish the version bumps would happen more often as long as the code is experimental. Testing "old" code does not make too much sense (I think we mailed a couple of days ago about that). Other from that I strongly support Egbert's PPA becoming the official one. Had no problems so far and I like the test setup.
>
> Cheers,
>
> Dan
>
>> On 16 Nov 2016, at 02:31, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hey Egbert,
>>
>>> On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
>>> I mailed/called with one of the sys admins and discussed with him about the
>>> problem in the AVX2 extention.
>>> I think I'm going to mail/call the hosting company again.
>> It seems like the crux of the issue is that if they disable AVX2
>> instructions, they need to make this known in the CPUID. Otherwise the
>> operating system will assume it's there when it isn't.
>>
>>> Can give you a vps if you want to. Just 3 euro the month.
>> See the attached tarball. Compile the kernel module in there and load
>> it BEFORE WireGuard. You might have to manually unload wireguard for
>> this to work: "rmmod wireguard && insmod ./avx2disabler.ko && modprobe
>> wireguard", for example. It should disable avx2 inside the kernel,
>> solving the issue.
>>
>> Jason
>> <avx2disabler.tar.xz>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> http://lists.zx2c4.com/mailman/listinfo/wireguard
