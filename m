Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c89a5e5
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:12:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1383927d
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:12:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f4a70e3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:12:01 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w33so102296144qtc.3
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 06:14:51 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 15:14:50 +0100
Message-ID: <CAHmME9pWgcg3L9p1m8SPvy1NurLrPeG2E4km-9oEZAgPktZSRg@mail.gmail.com>
To: Egbert Verhage <egbert@eggiecode.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] Hosting Companies with Dishonest CPUID [Was: Re:
 Seeking Ubuntu PPA Maintainer]
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Egbert,

I'm glad that my avx2disabler module worked for you. I believe it
would be in your interest to pressure the hosting provider into either
reenabling AVX, or fixing their CPUID to report correct information.
CPUID is the kernel's only means of judging capabilities, and if the
[virtual] hardware lies, it is impossible to make a reliable operating
system.

Jason

On Wed, Nov 16, 2016 at 11:03 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
> Hey Jason,
>
> The kernel module worked for my. ([1020751.674357] AVX2 disabler loaded:
> 1 -> 0)
> Going to update the PPA to remove my disable of AVX2.
>
> The problem is that the hosting company hides the cpuuid, but from the
> call with the sysadmin it is a XEON E5-2??? v3.
>
> Greetz,
> Egbert
>
>
> On 2016-11-16 02:31, Jason A. Donenfeld wrote:
>> Hey Egbert,
>>
>> On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
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
>
