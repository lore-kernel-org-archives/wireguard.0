Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F57C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 Dec 2021 16:35:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f0f965ac;
	Sat, 11 Dec 2021 16:35:07 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0b2fb014
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Dec 2021 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:message-id:in-reply-to:references:
 subject:mime-version:content-transfer-encoding;
 bh=uNnkGtctzX7wicwwqfMBRNQHqI2MFvPuJqC+en7j9ZM=;
 b=tOmrRb9cVznGX/OFGE9gNRIg3ICbyW2WM1n9longoPwW3qBUhAvTVOFf
 qjb5VQYbB4j2zl+BhVcCmbjsVPfz5Q9BMtAF3PgBKnhUdAHaUKFse1Jh6
 P2pjWLq2PAtwV0y79CXdINAj3yCC67qrpGI/C0+zXJqF/4RMeDJ1xqOKa A=;
IronPort-Data: =?us-ascii?q?A9a23=3APp5Q96PLCDa1MRDvrR1GlcFynXyQoLVcMsFnjC/?=
 =?us-ascii?q?WdQO70mtw3mdRnWJLX2qCOvqIYzT3f4ogOorlpxhXv5TQm99gGjLY11k9FiMQ8?=
 =?us-ascii?q?ZKt6fexdxqrYXvKdqUvdK/WhiknQoGowPscEzmM9n9BDpC79SMljPvRH+KlYAL?=
 =?us-ascii?q?5EnsZqTFMGH9JZS1LwLZRbr5A2bBVMivV0T/Ai5W31GyNh1aYBlkpB5er83uDi?=
 =?us-ascii?q?hhdVAQw5TTSbdgT1LPXeuJ84Jg3fcldJFOgKmVY83LTegrN8F251juxExYFGNi?=
 =?us-ascii?q?+163ndVcHE/jTOxKPgzxYQcBOgDAb/Hx0g/19baZGLxwJ49mKt4gZJNFlvI21R?=
 =?us-ascii?q?B0oNevCguMYUxRCAQl/O7dH8fnJOxBTtOTKlxeWKSqxn52CC2lzZ+X04N1fI2h?=
 =?us-ascii?q?V8vowOiBXZUzFjOWzqJq+S+9tnsAiBMbxJ44Up2th0SCfC/s6KbjcQr/H6sJRx?=
 =?us-ascii?q?jsYgsFVAe2YddpDYmYpZxPFCyCjkH9/5IkWjuyzw2LjdCdV+RSUo7A26i7d1mR?=
 =?us-ascii?q?MPHHWGIK9UrS3qQ99xC50bV4qM4g07t/2+TBfJfe4HqqQu9Ly?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ARvSgkK9XtOyM9yihme1uk+CtI+orL9Y04lQ7?=
 =?us-ascii?q?vn2ZJiY4TiX1ra2TdYoguyMc4Qx5MBodcLu7V5VoL0m3yaJI?=
X-IronPort-AV: E=Sophos;i="5.88,198,1635199200"; d="scan'208";a="10282954"
X-MGA-submission: =?us-ascii?q?MDFrmUs3BGyXb3tDj4IkoDwUUHbsEq+XjOOYLb?=
 =?us-ascii?q?ReNH4c770ooAwAfuFvOCvuMUBOYhm5i6IXY3KJ8K5xm9JybqIpimTB1s?=
 =?us-ascii?q?V0bfubAHwcV4VrVEEAswBxO7Fc9cs3rLDhKbakHTPIv77zbi8P9/oiYn?=
 =?us-ascii?q?6Wgmi/1o+keBnUtlgzrUF+Kw=3D=3D?=
Received: from zcs-store9.inria.fr ([128.93.142.36])
 by mail2-relais-roc.national.inria.fr with ESMTP; 11 Dec 2021 17:35:05 +0100
Date: Sat, 11 Dec 2021 17:35:04 +0100 (CET)
From: Aymeric Fromherz <aymeric.fromherz@inria.fr>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Mathias Krause <minipli@grsecurity.net>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
In-Reply-To: <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [78.192.92.230]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - FF94 (Mac)/8.8.15_GA_4177)
Thread-Topic: wireguard-linux-compat: grsecurity compat patches
Thread-Index: EadCfMEOBX6lHDESqKfB8naHUMfJ4g==
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks for the heads-up. We were being overly conservative during verificat=
ion of inline assembly code in Vale, and marked several registers as possib=
ly modified while they were only read.

This is now fixed for fmul, fmul2, fsqr and fsqr2, and will be merged into =
the master branch of EverCrypt shortly.
In the meantime, the diff for the resulting inline assembly after Vale code=
gen is available here: https://github.com/project-everest/hacl-star/pull/50=
1/commits/1a71adb40c3f78da16e16975dbb1d4de5adeab8c#diff-5aabe9f6aa87508c9d8=
1d4c9e89eff0b06b1e2aeaf5b04eba51da71c5bea6940

Cheers,
Aymeric

----- Mail original -----
> De: "Jason A. Donenfeld" <Jason@zx2c4.com>
> =C0: "Mathias Krause" <minipli@grsecurity.net>, "aymeric fromherz" <aymer=
ic.fromherz@inria.fr>
> Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
> Envoy=E9: Vendredi 10 D=E9cembre 2021 23:58:01
> Objet: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches

> CC'ing in Aymeric, who's working on Vale's codegen.
>=20
> On Thu, Dec 9, 2021 at 8:59 AM Mathias Krause <minipli@grsecurity.net> wr=
ote:
>>
>> Am 08.12.21 um 15:56 schrieb Jason A. Donenfeld:
>> > On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.net=
> wrote:
>> >> Yes, probably, but you're mixing up the two.
>> >
>> > Oh, thanks, right.
>> >
>> > I'll talk to EverCrypt upstream and see.
>>
>> FWIW, 'out' is also wrongly flagged as output operand in fmul() and
>> fmul2(). But making it an input operand needs more surgery, as the
>> operand order changes and this requires some code churn.
>>
> > Mathias
