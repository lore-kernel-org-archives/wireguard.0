Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F39AC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 11:42:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24432611F2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 11:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24432611F2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33783a4c;
	Thu, 9 Sep 2021 11:41:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c13af676
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 11:41:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C31B611C7
 for <wireguard@lists.zx2c4.com>; Thu,  9 Sep 2021 11:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="E0ItOz6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631187711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FiTqrO/idjc5KCFLhDI8mjk4v41UgK37HrG1oFhbkAE=;
 b=E0ItOz6nMT+4U/ptqMx3oR3vRu4LqgwtH8lxMLRdhqVxJVF4QnrE1UjYTUZ6jfa06Qf57r
 RyMGleMTr1561Ngt8W80m1g5NWYqZyB1qjjt5lAg467v6T514/wP7D9k2bSBYk5sn2+kJ8
 tgmw8GDuHkOFwb5eZRZzwq05B07Xmf4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61f9f9ac
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 11:41:51 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id y13so3220613ybi.6
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 04:41:50 -0700 (PDT)
X-Gm-Message-State: AOAM530+ziqUfEp4GMSFO94YdG2pZ7hOPb76q0WYGNx4sJlgKBLEpXsx
 d7pbW0TehGKrFt7g6Y/rnh/ZhWcYILnbFSG4u2g=
X-Google-Smtp-Source: ABdhPJz/tnmCif70rxwT/cGxp+/HpLbAAGjxwaQNQ2u6TM8/oHzZMuN/uPIqVvVn4Ns9whOe3HgG+dFhUNcAJqaXV3I=
X-Received: by 2002:a5b:d48:: with SMTP id f8mr3245466ybr.449.1631187710373;
 Thu, 09 Sep 2021 04:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
In-Reply-To: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Sep 2021 13:41:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9qTWf_34Jd5rh+foOPXN6bTepweC6cK=SS=Ls3C2PkYAA@mail.gmail.com>
Message-ID: <CAHmME9qTWf_34Jd5rh+foOPXN6bTepweC6cK=SS=Ls3C2PkYAA@mail.gmail.com>
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

Hi again,

On Fri, Aug 13, 2021 at 1:52 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi everyone,
>
> On Mon, Aug 2, 2021 at 7:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > Nonetheless, experimental or not, we still need people to test this and help
> > shake out issues. To that end, WireGuardNT is now available in the ordinary
> > WireGuard for Windows client -- https://www.wireguard.com/install/ -- with the
> > 0.4.z series, in addition to having full support of the venerable wg(8)
> > utility, but currently (August 2021; if you're reading this in the future this
> > might not apply) it is behind a manually set registry knob. There will be
> > three phases of the 0.4.z series:
> >
> >   Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
> >            registry knob. If you don't manually tinker around to enable it,
> >            the client will continue to use wireguard-go/Wintun like before.
>
> After the first few days, bug reports for WireGuardNT have died down
> considerably. It's hard to tell whether that's a sign that the
> software is stable or that nobody is using it. So, we're still in
> phase 1. However, with version 0.4.5 of the client, I've added a
> checkbox below the "activate" button in order to make the experimental
> testing more discoverable. I dislike such knobs, but I'd rather have
> more testing than less, before turning it on by default. Hopefully
> this will make it easier for alpha testers to give it a spin and
> report findings. If you have been testing the driver, and it's been
> working well for you, please write in to say so, simply as a signal
> that it is being tested. If things stay as quiet as they are now on
> the bug reporting front, we'll likely move into phase 2 -- enabling
> WireGuardNT by default, with a registry key to revert to the legacy
> implementation -- in 2 to 3 weeks.

We're still technically in phase 1, but with the version that should
be coming out later today, users who have enrolled in the Windows
Insider Program have "ExperimentalKernelDriver" set to always on,
unless the "IgnoreInsiderProgram" admin knob is set. In other words,
we're gradually ramping up testing coverage. I still hope to move into
phase 2 soon, but this seemed like a cautious intermediate step.

Regards,
Jason
