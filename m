Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81F2C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 14:21:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6211cb70;
	Mon, 13 Dec 2021 14:20:22 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4fee87e7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:message-id:in-reply-to:references:
 subject:mime-version:content-transfer-encoding;
 bh=ixHtRF1+PVLDPtFBwtedaO14sZsDm9kZZz4IlPvR2Bg=;
 b=Yhwyc7dUuN5GoZ0YQr+G8Yby5nyz0/fJ2l3wGvvDtHtKPOz9h89qC4iJ
 PPx1OD4QjnAR6FNDpmiUSsDBx2YxXV+FAR06Ll5ivimb3gSLYqYgJb0cb
 XZfqsLMnU86QI4gwot1hnRYFapah65qEoohzPLgC0ures/dX5D8zbwyXP 4=;
IronPort-Data: =?us-ascii?q?A9a23=3A0XpvDKqia5mev7sjQXWDMSqgKOReBmL7ZxIvgKr?=
 =?us-ascii?q?LsJaIsI5as4F+vmQfXD3VPqrcZGenfdAlaNvl9BgA65+BzdAxGQtsqCFgQiMRo?=
 =?us-ascii?q?6IpJ/zJdxaqZ3v6wu7rFR88sZ1GMrEsFC2FJ5Pljk/F3oPJ8D8shclkepKmULS?=
 =?us-ascii?q?dY3ooHlc+IMscoUkLd9AR0tYAbeeRWFvlVePa+6UzCXf9s9JGGjp8B5Gr9HuDi?=
 =?us-ascii?q?M/PVAYw5TTSUxzkUGj2zBH5BLpHTU24wuCRroN8RoZWTM6bpF21E/+wwvsjNj+?=
 =?us-ascii?q?luu6TnkwiULXJeBOSjWBbCu6jhAJDr2o8yM7XNtJFMxcR2m7Pxowrjo4T3XCzY?=
 =?us-ascii?q?V9B0qnkkfUYXgNZGGdwJ6pD+LLdM1C+t9aSxgvIaRMAxt03VB9oZdZEoI6bBkk?=
 =?us-ascii?q?Lr5T0MgslaxGFhvqywZq0UPJhjdk5LdX6eoUSphlI7zjCCvAOU4CZSPmM7thdt?=
 =?us-ascii?q?B8vh9pDEuvXfcYxbTt0cA+GcQ0VMQtRA5U79NpELFGXnyZwulmO4LEr5HLenUp?=
 =?us-ascii?q?w1qLsOZzbYLS3qQxuth7wjgr7E67RWHn2/+BzBdZIHrxASwMPce7GtFouKYCF?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A93HvIqOdSoqERMBcT4j155DYdb4zR+YMi2TD?=
 =?us-ascii?q?gXoBNSC9Ffbo9fxG/c5rtiMc5wx7ZJhNo7q90YO7MBXhHOdOkPAs1NWZMzUOyV?=
 =?us-ascii?q?HJEGgK1+KL/9SjIUPDH4hmuJuIGJIeNDSfNzRHZO/BkXaFOudl7tmb1aiiwcfF?=
 =?us-ascii?q?1WtgCSFGApsQlztRO0K0ElBSTAIDJYAiCJbZxuprzgDQAkg/X4CUBmQhV+OGgN?=
 =?us-ascii?q?vXlJ3naxYaBxgh0wWHlzWugYSKaSSw71MxUy5rybxnyHPCkADy+8yYwpSG4y6Z?=
 =?us-ascii?q?+W/Pypxc3OL7zNhODtHJqsV9EESJti+YIKpgRpiLt3QNu+et5Fw21ODFvhZIBb?=
 =?us-ascii?q?UV11rhOk+0vD7k0E3a3C8q+zvBxU/wuwqfnfDE?=
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="10660342"
X-MGA-submission: =?us-ascii?q?MDGxGaNeCBDfj6I2OBc/VGuChH5J+tPW78JFgr?=
 =?us-ascii?q?NGefgsHM7pIFdwT8vjNkFT9UyZH4wQeEU+HIrSey2+uMo8+AduoV/G7l?=
 =?us-ascii?q?A937uw257e3dOYDck2y1jipUglpytfwpnSGIRYI3LBmxWDzxEcgeLDOa?=
 =?us-ascii?q?y6mq+RDLy6u3tFx9FdSaVopw=3D=3D?=
Received: from zcs-store9.inria.fr ([128.93.142.36])
 by mail2-relais-roc.national.inria.fr with ESMTP; 13 Dec 2021 15:20:21 +0100
Date: Mon, 13 Dec 2021 15:20:20 +0100 (CET)
From: Aymeric Fromherz <aymeric.fromherz@inria.fr>
To: Mathias Krause <minipli@grsecurity.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
In-Reply-To: <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [128.93.83.6]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - FF94 (Mac)/8.8.15_GA_4177)
Thread-Topic: wireguard-linux-compat: grsecurity compat patches
Thread-Index: J9z9wFAKg3LZIzeyV98ih2rdhIpMiA==
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

Hi Mathias,

Thanks for the comments. Unfortunately, changing "r" to "rm" for the out pa=
rameter in a systematic way is quite trick.
Allowing arguments to be passed independently in a register or in memory is=
 currently out of scope of the Vale model we use for verification.
We must decide early on in the verification pipeline if the argument is pas=
sed in a register, or if it stored in memory.
Doing this in a sound way would require a significant change to our (truste=
d) model.

Cheers,
Aymeric

----- Mail original -----
> De: "Mathias Krause" <minipli@grsecurity.net>
> =C0: "Aymeric Fromherz" <aymeric.fromherz@inria.fr>, "Jason A. Donenfeld"=
 <Jason@zx2c4.com>
> Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
> Envoy=E9: Lundi 13 D=E9cembre 2021 08:44:51
> Objet: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches

> Hi Aymeric,
>=20
> the changes look good to me -- quite what we already had in grsec. Just
> one more nit. The constraints for the 'out' parameter in fmul(),
> fmul2(), fsqr() and fsqr2() can be further lifted to "rm" as 'out' is
> only referenced once. This allows gcc to choose either a register or a
> memory operand, as it sees fit. In our experiments the latter lead to
> much better code gen.
>=20
> Thanks,
> Mathias
>=20
> Am 11.12.21 um 17:35 schrieb Aymeric Fromherz:
>> Thanks for the heads-up. We were being overly conservative during verifi=
cation
>> of inline assembly code in Vale, and marked several registers as possibl=
y
>> modified while they were only read.
>>=20
>> This is now fixed for fmul, fmul2, fsqr and fsqr2, and will be merged in=
to the
>> master branch of EverCrypt shortly.
>> In the meantime, the diff for the resulting inline assembly after Vale c=
odegen
>> is available here:
>> https://github.com/project-everest/hacl-star/pull/501/commits/1a71adb40c=
3f78da16e16975dbb1d4de5adeab8c#diff-5aabe9f6aa87508c9d81d4c9e89eff0b06b1e2a=
eaf5b04eba51da71c5bea6940
>>=20
>> Cheers,
>> Aymeric
>>=20
>> ----- Mail original -----
>>> De: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>> =C0: "Mathias Krause" <minipli@grsecurity.net>, "aymeric fromherz"
>>> <aymeric.fromherz@inria.fr>
>>> Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
>>> Envoy=E9: Vendredi 10 D=E9cembre 2021 23:58:01
>>> Objet: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patche=
s
>>=20
>>> CC'ing in Aymeric, who's working on Vale's codegen.
>>>
>>> On Thu, Dec 9, 2021 at 8:59 AM Mathias Krause <minipli@grsecurity.net> =
wrote:
>>>>
>>>> Am 08.12.21 um 15:56 schrieb Jason A. Donenfeld:
>>>>> On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.ne=
t> wrote:
>>>>>> Yes, probably, but you're mixing up the two.
>>>>>
>>>>> Oh, thanks, right.
>>>>>
>>>>> I'll talk to EverCrypt upstream and see.
>>>>
>>>> FWIW, 'out' is also wrongly flagged as output operand in fmul() and
>>>> fmul2(). But making it an input operand needs more surgery, as the
>>>> operand order changes and this requires some code churn.
>>>>
> >>> Mathias
