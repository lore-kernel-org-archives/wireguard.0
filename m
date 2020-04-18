Return-Path: <SRS0=xPCC=6C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8372C352BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2020 20:08:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED3D2051A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2020 20:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xF82TB3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED3D2051A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d1b8a98;
	Sat, 18 Apr 2020 19:58:07 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f3d08728
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2020 19:58:04 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7745c3dd
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2020 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lDt5uddBRXmSKYqXLeojevmYMMs=; b=xF82TB
 3RrbU9JzhZPHlJtAfsDYPu8zmkG5PP2xxNw4rMoD0BOWP5p6AkoZSWymyDJ+/zqi
 69pjlGFnEGBcgE5RzigeqOYGecBpT8KOsiyx3s1mzoByPsg4Tcz8G97KTbW+y17j
 vRjnqGklIx8SJvlvgRjevrp+mTY4RzG1IYAz8BvFunngTK0m6lNptYFOxuc9wBbQ
 trIlusk92nXlEDAvmmPqZqpNSzm36XZwDiClWaOz7UNwfa6a3wPTN5042NJAR0V0
 hqy4AYCe3pPN8SwgjH86A/G1b1sX8GTqhKchE3Nd2AU/heuO5j2Af3IFN6DS+3fd
 tMwjEKGSZo8UwNyA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b08cd99
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2020 19:58:04 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id f3so6415602ioj.1
 for <wireguard@lists.zx2c4.com>; Sat, 18 Apr 2020 13:08:27 -0700 (PDT)
X-Gm-Message-State: AGi0PubtfzDNAXQfbEUK4OErohvPjpsafwXMfSBVV2w43fmaInPekm7w
 sG3Yv7ZsXMLzGU4b0podWv/MEF58uLo5LlKO0kE=
X-Google-Smtp-Source: APiQypKGJDuDCtnBlMdFdfP/mtZCmMpvIwnuezcS57DJXyz1kF55Ge15ISxbr2ett8bdRp1hzmGCitsh/KXYYzkc4L8=
X-Received: by 2002:a5e:9401:: with SMTP id q1mr7492631ioj.80.1587240506965;
 Sat, 18 Apr 2020 13:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAA2ss9E8hAQqwKwA6aytcXCZPr905NX53LRdfY6-WG24m66AAA@mail.gmail.com>
In-Reply-To: <CAA2ss9E8hAQqwKwA6aytcXCZPr905NX53LRdfY6-WG24m66AAA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 18 Apr 2020 14:08:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9rDA8ssOFodvgLp1WQ9usBj=Bc3xVBNdrvwkwyM+2kr5Q@mail.gmail.com>
Message-ID: <CAHmME9rDA8ssOFodvgLp1WQ9usBj=Bc3xVBNdrvwkwyM+2kr5Q@mail.gmail.com>
Subject: Re: Question about Crowdin operation
To: Eiji Tanioka <tanioka404@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Harsh Shandilya <msfjarvis@gmail.com>, 
 Simon Rozman <simon@rozman.si>, Roopesh Chander S <roop@roopc.net>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Apr 18, 2020 at 9:56 AM Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Hi,
>
> I'm translating WireGuard apps into Japanese.
> I have a question about operation in Crowdin.
>
> When translate, we translators need to clarify about original string's
> context or meaning. In that situation, which option is preferred?
>
> - send ML about question.
> - in Crowdin, use comment.
> - in Crowdin, use comment and flag "Issue".
> - in Crowdin, use Discussion.
>
> # I had used second option, but never mention to anyone.
> # Should I had to mention to ?
>
> Kind regards,
> Eiji Tanioka

Hey Eiji,

CC'ing Harsh, Simon, and Roopesh, as they might have different
opinions on what they prefer.

From my end, any form of communication is fine, whether its on Crowdin
or on the mailing list, because lowering the barrier for people to
volunteer their hours translating strings for us seems like a good
thing.

I suppose one advantage of Crowdin is that the discussions are placed
beside the translations, which makes it easy for future people to
correlate the two, and most discussions tend to be clarifications on
particular strings, rather than interesting technical conversation
that would benefit from the archiving afforded by mailing lists.

AFAICT, the "issue" flag sends us an email notification, which is a
good thing if you need an answer.

Jason
