Return-Path: <SRS0=L39c=CA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB25C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:05:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CCE12075E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NUdkuSls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CCE12075E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6e2565e;
	Sat, 22 Aug 2020 18:38:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f87b6ca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 18:38:44 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1574574c
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iGeLicd4xnkTlqz38bwH5jnASsk=; b=NUdkuS
 lsUu6NJQHUo7q+X4kX++t+sJCVgiNMZxIGTjtArZmABBm++KX1iDoLh5OFCbPvV+
 i3ezCxMnBH8/3aLCQVxQ01ITzG37H3bRVeTpiq1x3QGf1nEKflzZFG3QojgdO228
 28NWXLrKDckk59v1zEUy2YQMouF0wulpt8/C2eSO5dnJuTHWq64Vvx+Mmk/Rv2Rm
 CR4+maD9fMFsqskIfXI7l1NcHsgyF+EXFnXxvednuyDWlmJeek8GY5YJEBk5yQlm
 0uzNkPPtvaZp+jfwGjAZDvLtwqe+8LUaMCLxKPUpNvoAlUZANlsoeOwDfBxfwz9D
 V3SqJ7Uz2W2uCAtg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0dea5cd7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 18:38:44 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id r13so4122776iln.0
 for <wireguard@lists.zx2c4.com>; Sat, 22 Aug 2020 12:05:27 -0700 (PDT)
X-Gm-Message-State: AOAM531x+lE9RBPMXRNDyLBxB4yc5i9gDiorCyXEfpVie4PoPO8FIaqy
 p1J0btMV8yrMGflzVk3jayiB2NG98w4PTjq7lAY=
X-Google-Smtp-Source: ABdhPJx407oCRlLBNlNob3OIyV2FjC2bNIeSgxlenmNf9doBrjUQRsjPHrEZEcx8ncIiZMWc9m6SwAAUAvXSnCNR5H8=
X-Received: by 2002:a92:cf09:: with SMTP id c9mr7624983ilo.38.1598123126755;
 Sat, 22 Aug 2020 12:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
In-Reply-To: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Aug 2020 21:05:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9qoWSURAqdQJuOdo9xCBgrtENNOGgf_o1uRep66xRWzJw@mail.gmail.com>
Message-ID: <CAHmME9qoWSURAqdQJuOdo9xCBgrtENNOGgf_o1uRep66xRWzJw@mail.gmail.com>
Subject: Re: Python Wrapper for wireguard-tools
To: Andrew Roth <andrew@andrewjroth.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Matt Layher <mdlayher@gmail.com>
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

Hey Andrew,

The most complete "library" is actually the wgctrl-go one from Matt
(CC'd). It's complete because it supports all the same interfaces as
wg(8) -- Linux Netlink, OpenBSD IOCTL, and x-platform UAPI. The
embeddable-wg-library is just for Linux Netlink, but I should maybe
refactor that to be more modular. And as you pointed out, the wgnlpy
stuff is Netlink also.

If you wanted to start a new cross-platform library, and essentially
"clone" Matt's Go library into a pure Python one, I'd certainly
welcome that effort and would be happy to help.

Jason
