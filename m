Return-Path: <SRS0=j5R+=IC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F306C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 13:07:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CB664F2B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 13:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8CB664F2B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57c98750;
	Thu, 4 Mar 2021 13:07:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99097195
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Mar 2021 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614863249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N1UAzdDips8PY3okImPxGUdxFVDanspmjyXE9TIO8ng=;
 b=DHUcugXNiiW0mUKRv0Uu6gWXhRVarw6JKWkwg5SKzJfXSEJy2lb1Iiiwld/LjlClAOYWZB
 e2dR8oinbLOtHmRDnyj8OoCCPTdiiCBTwTLZ1Ut89tfKzOUWMRis/bVv7fkZD03ah90dEC
 Kw01VqMvtu4MY9mO659o9m7XCipnI6o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c877edbf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Mar 2021 13:07:29 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id x19so28437744ybe.0
 for <wireguard@lists.zx2c4.com>; Thu, 04 Mar 2021 05:07:28 -0800 (PST)
X-Gm-Message-State: AOAM531olWqaDLgWWHVyat+XqgbUKec3FdBAmyji5DEoiQA4EcFc7q7/
 YHMPefSPQ1uKN+whofLymej7Puvx3f3T7UZWcrE=
X-Google-Smtp-Source: ABdhPJwz8YVA3V+f/+ri2Cv92mEoJRhd90TBVLEAkmj8osTaZyYkHVluA0Tn+5Qnh5esu1mxlcb2R4sos/J3XacuAQo=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr5706359ybb.49.1614863248404;
 Thu, 04 Mar 2021 05:07:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:9041:b029:35:5678:14a0 with HTTP; Thu, 4 Mar 2021
 05:07:27 -0800 (PST)
In-Reply-To: <8a1d3115-0726-9dc1-ab84-f98142a908ce@gmail.com>
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <8a1d3115-0726-9dc1-ab84-f98142a908ce@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Mar 2021 06:07:27 -0700
X-Gmail-Original-Message-ID: <CAHmME9qQPZTZ1F0H1txfC+5AODfySMq6HeEqOUoqinMyJES_Yw@mail.gmail.com>
Message-ID: <CAHmME9qQPZTZ1F0H1txfC+5AODfySMq6HeEqOUoqinMyJES_Yw@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 3/4/21, Peter Whisker <peter.whisker@gmail.com> wrote:
> Hi Jason
>
> Yes, that PostUp line does solve the problem. Thanks! Four tunnels up
> and working with two of them via the PulseSecure VPN. :)
>
> Can I ask why you have the section bind code in there when it seems to
> work fine without it?

https://lore.kernel.org/wireguard/CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com/
