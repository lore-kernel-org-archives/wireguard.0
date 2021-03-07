Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C84C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:53:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163D0650E5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163D0650E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46663bee;
	Sun, 7 Mar 2021 15:49:20 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id def8e05c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615132154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPGTVcUVjm7Z6tNdK7RlsKjbkBccLfYqTg3F4CpgBcA=;
 b=LfYY4SUUONkRG7tATw1X8JBDfcyujq+tkupyFgwng0nNWJGN57b3BYxSH9jYISZFcDSbt1
 7M96TPX7vGMzJRjOT4K26OAvN1FNEUMh11m7HJhQZnNjfDs3e0t1I/SzYdx2gzM/uYyjRl
 pHagKryjo2BAlEV84dBL372JAjma5gE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 712a6486
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 15:49:13 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id c131so7512108ybf.7
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 07:49:13 -0800 (PST)
X-Gm-Message-State: AOAM531xzfVHZMn6808NlusLQs3YE5c8OZFfm7LAK5M+rVPyWPIMBg1s
 v8/6fpEVJ0PVY2QdlyIRaXGqyM7N1/DAZJtylHY=
X-Google-Smtp-Source: ABdhPJyYoi9OSeSj5Edqob7jWMtgg2uFun7etUyMPiN/ySVlmpZ7owvSwC6wwlfNut+eGa1VNN2R66jW8E+/n9ro/Wg=
X-Received: by 2002:a25:5289:: with SMTP id
 g131mr28058885ybb.178.1615132153375; 
 Sun, 07 Mar 2021 07:49:13 -0800 (PST)
MIME-Version: 1.0
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
In-Reply-To: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Mar 2021 08:49:02 -0700
X-Gmail-Original-Message-ID: <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
Message-ID: <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
To: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Bradley,

Thanks for the report.

> I'm not expecting my configuration to be supported or stressed over in the slightest.

You are in fact very mistaken here. Having everything be broken and
requiring you to resort to out of date versions is very much something
that I'll stress over. Let's fix this.

The first thing I'm wondering is:
- Did v0.3.8 work in builds prior to 21327, or did you never get a
chance to test v0.3.8 on other builds?

Jason
