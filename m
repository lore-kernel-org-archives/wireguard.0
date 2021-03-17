Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B25C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 13:11:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E481E64F50
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 13:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E481E64F50
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58866ee6;
	Wed, 17 Mar 2021 13:10:56 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26810125
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615986652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtzOxPAQvuMYSlGayJowjLNQDV0vW31Od94QcWfCuGE=;
 b=l371rMyOUjWgRNIzoKhQ9lr3Zb69pZMgCOxO15OAVR8lyM29pSDLXnhUMYWYADs+rzG5mu
 KitIUakIwkVehp2SrmR6DkTcKVN3lj1nKIS8wfLWbT/bIMe6dFIAh0kHpz3alXswEPvNIQ
 hTbWrxOw/JQ+igFSMayjj9oi2wFffjk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 31d0adb3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 13:10:52 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id p193so40450474yba.4
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 06:10:52 -0700 (PDT)
X-Gm-Message-State: AOAM530CVRInuTMOifykgq8HkeXMV23tAFPnE4ZUmSCpkfRJqtbEKBrP
 Q1CA0Go56tGrg1uLVKRww1d30OZ1atd8HtooSdI=
X-Google-Smtp-Source: ABdhPJwoZtv2Izt9QI/MSk7lmcTNztN7FSYU2CPW0cUda32R1LW6eAKjqW13VYwn00iX5oLcjBRqwJlTxW2n5jBY94A=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr3661734ybb.49.1615986651367;
 Wed, 17 Mar 2021 06:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:5424:b029:39:213a:1a2e with HTTP; Wed, 17 Mar 2021
 06:10:50 -0700 (PDT)
In-Reply-To: <2240E688-898B-4F74-B954-0754464F6352@wandera.com>
References: <9C811F88-FD21-47D0-B3FE-A14FD5BC1816@wandera.com>
 <f5126d40-4ea7-193a-93dd-ab816af3bb7e@aaronmdjones.net>
 <2240E688-898B-4F74-B954-0754464F6352@wandera.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Mar 2021 07:10:50 -0600
X-Gmail-Original-Message-ID: <CAHmME9rkLGQb9nGpoLwDt4V-D+rv43JU_mmT96ww1wQfTnSpmw@mail.gmail.com>
Message-ID: <CAHmME9rkLGQb9nGpoLwDt4V-D+rv43JU_mmT96ww1wQfTnSpmw@mail.gmail.com>
Subject: Re: [PATCH] Respect WG protocol reserved bytes
To: Laura Zelenku <laura.zelenku@wandera.com>
Cc: Aaron Jones <me@aaronmdjones.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 3/17/21, Laura Zelenku <laura.zelenku@wandera.com> wrote:
> If the client send some data in reserved bytes you will have logs full of
> errors because the message gets type from 4 bytes instead of 1 byte (like it
> is in protocol description).
> I would like implementation respects protocol -
> https://www.wireguard.com/papers/wireguard.pdf . Yes, in our project we use
> reserved bytes.
>
> I know that when there are zeros in reserved bytes, everything is correct.
> But if you receive some non-zero value in reserved bytes?
>

Aaron is right.

Those bytes MUST be set to zero. Otherwise you're now implementing a
different protocol. Do not use reserved bytes. They are not reserved
for you.
