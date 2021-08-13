Return-Path: <SRS0=erT1=NE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7570FC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 11:53:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD1C60EB5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 11:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CD1C60EB5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdf01f23;
	Fri, 13 Aug 2021 11:52:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id db4b0117
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628855571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDQMuXun/2fel84MdSWPvPslp8yb8JFv4xxzyNb8c/4=;
 b=hxXdYK+Cy7kej/Sj1gG3Cui5Do/gLdMT2fx6o6Gj7jULYAwe971gjzKvRKKsnpwnaVR0rg
 FdZ2vDj+bf1pIw+haB0bo/80pXg4xpdeVG/+oysbFYnWuKrM/Bg3QFyTeDjMFejmSc38mw
 dAvv2cr1rBtZPqmEni2/nLFGzbOj2zU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e277491d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 11:52:51 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id a93so18335411ybi.1
 for <wireguard@lists.zx2c4.com>; Fri, 13 Aug 2021 04:52:51 -0700 (PDT)
X-Gm-Message-State: AOAM533xtT9Mg0nbdnDsPc9Vx4nc50eji6VhUbdrlemDenXbeVuW1kAK
 X4y+4u40niP902xECInDTsWF55alRcKlLyaaDs4=
X-Google-Smtp-Source: ABdhPJwwCVJG5Rl+Uspi2skfk/tJdvoujuO9dKn6UkJCUD0nwJg6NfiGTFAQsVxTP5phKQSV8k0rPxQj2CNfF25biaQ=
X-Received: by 2002:a25:8445:: with SMTP id r5mr2628171ybm.20.1628855570646;
 Fri, 13 Aug 2021 04:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
In-Reply-To: <YQgrCfqIL2SWfF6G@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Aug 2021 13:52:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
Message-ID: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi everyone,

On Mon, Aug 2, 2021 at 7:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Nonetheless, experimental or not, we still need people to test this and help
> shake out issues. To that end, WireGuardNT is now available in the ordinary
> WireGuard for Windows client -- https://www.wireguard.com/install/ -- with the
> 0.4.z series, in addition to having full support of the venerable wg(8)
> utility, but currently (August 2021; if you're reading this in the future this
> might not apply) it is behind a manually set registry knob. There will be
> three phases of the 0.4.z series:
>
>   Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
>            registry knob. If you don't manually tinker around to enable it,
>            the client will continue to use wireguard-go/Wintun like before.

After the first few days, bug reports for WireGuardNT have died down
considerably. It's hard to tell whether that's a sign that the
software is stable or that nobody is using it. So, we're still in
phase 1. However, with version 0.4.5 of the client, I've added a
checkbox below the "activate" button in order to make the experimental
testing more discoverable. I dislike such knobs, but I'd rather have
more testing than less, before turning it on by default. Hopefully
this will make it easier for alpha testers to give it a spin and
report findings. If you have been testing the driver, and it's been
working well for you, please write in to say so, simply as a signal
that it is being tested. If things stay as quiet as they are now on
the bug reporting front, we'll likely move into phase 2 -- enabling
WireGuardNT by default, with a registry key to revert to the legacy
implementation -- in 2 to 3 weeks.

Jason
