Return-Path: <SRS0=xPCC=6C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A57C352BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2020 20:24:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99FA21D93
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2020 20:24:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="k5uY4ZvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99FA21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc13dbb5;
	Sat, 18 Apr 2020 20:14:06 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 97f18e47
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2020 20:14:04 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=k5uY4ZvVy0pCIJu3vOHFFoj3hchegopResC0i376kEfnGRWaQUgQLi43ySxtHk1R/Tqc1ZT1tjIi6VA+EtCl5NoJWHbAbSQ21z0LMXvMkVISILjGbFZGZSQ7raV92xLjTTVHOF/JyJvE2s8LHm19nessqfNi36jaE87zVtPFFBOlwURgTvOZ4SFaWMGM9AcSRR/OPAGJ9/p0Cv5jBiS0Q/lph1UCdQvZLZEzw7k+ueeDzHC4JSsp2cduLq665R72EaPi3mTUmJ0nsTBreSu/I63zVpzcuIdSUPCT9Woh5X4bzfzCqmzEacW9g+hL96DoLG/ap0ZokCtEBxIr34Wl+w==;
 s=purelymail1; d=msfjarvis.dev; v=1;
 bh=aj01kgNRBTj7YaycnajCkXesschxA3rBhBPq2B6tyxI=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 147.75.32.83 (EHLO mail.msfjarvis.dev) ([147.75.32.83])
 by ip-172-30-0-208.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -1292354001; Sat, 18 Apr 2020 20:24:19 +0000 (UTC)
Date: Sat, 18 Apr 2020 20:24:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From: "Harsh Shandilya" <me@msfjarvis.dev>
Message-ID: <59f5a401d768dfad8b60a0ed3f59a5b6@msfjarvis.dev>
Subject: Re: Question about Crowdin operation
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Eiji Tanioka"
 <tanioka404@gmail.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>, "Simon Rozman"
 <simon@rozman.si>, "Roopesh Chander S" <roop@roopc.net>
In-Reply-To: <CAHmME9rDA8ssOFodvgLp1WQ9usBj=Bc3xVBNdrvwkwyM+2kr5Q@mail.gmail.com>
References: <CAHmME9rDA8ssOFodvgLp1WQ9usBj=Bc3xVBNdrvwkwyM+2kr5Q@mail.gmail.com>
 <CAA2ss9E8hAQqwKwA6aytcXCZPr905NX53LRdfY6-WG24m66AAA@mail.gmail.com>
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
Reply-To: me@msfjarvis.dev
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

April 19, 2020 1:38 AM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:=0A=
=0A> On Sat, Apr 18, 2020 at 9:56 AM Eiji Tanioka <tanioka404@gmail.com> =
wrote:=0A> =0A>> Hi,=0A>> =0A>> I'm translating WireGuard apps into Japan=
ese.=0A>> I have a question about operation in Crowdin.=0A>> =0A>> When t=
ranslate, we translators need to clarify about original string's=0A>> con=
text or meaning. In that situation, which option is preferred?=0A>> =0A>>=
 - send ML about question.=0A>> - in Crowdin, use comment.=0A>> - in Crow=
din, use comment and flag "Issue".=0A>> - in Crowdin, use Discussion.=0A>=
> =0A>> # I had used second option, but never mention to anyone.=0A>> # S=
hould I had to mention to ?=0A>> =0A>> Kind regards,=0A>> Eiji Tanioka=0A=
> =0A> Hey Eiji,=0A> =0A> CC'ing Harsh, Simon, and Roopesh, as they might=
 have different=0A> opinions on what they prefer.=0A> =0A> From my end, a=
ny form of communication is fine, whether its on Crowdin=0A> or on the ma=
iling list, because lowering the barrier for people to=0A> volunteer thei=
r hours translating strings for us seems like a good=0A> thing.=0A=0ASame=
 goes for me, I'll take whatever's the easiest route for translators=0Aan=
d work with it.=0A=0A> I suppose one advantage of Crowdin is that the dis=
cussions are placed=0A> beside the translations, which makes it easy for =
future people to=0A> correlate the two, and most discussions tend to be c=
larifications on=0A> particular strings, rather than interesting technica=
l conversation=0A> that would benefit from the archiving afforded by mail=
ing lists.=0A> =0A> AFAICT, the "issue" flag sends us an email notificati=
on, which is a=0A> good thing if you need an answer.=0A> =0A> Jason=0A=0A=
=0AHarsh Shandilya
