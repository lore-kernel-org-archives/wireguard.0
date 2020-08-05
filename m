Return-Path: <SRS0=7Lbv=BP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F8CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Aug 2020 06:23:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72C1207FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Aug 2020 06:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noddingdog.org header.i=@noddingdog.org header.b="IXvxBkYA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72C1207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noddingdog.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9aa8ffe;
	Wed, 5 Aug 2020 05:58:46 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8c276b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Aug 2020 05:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596608590;
 s=strato-dkim-0002; d=noddingdog.org;
 h=References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:Message-ID:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=F8GfXHSmQWrq3wyeQtWkOnAmqtJkGje7nB5Ha9nnEX8=;
 b=IXvxBkYA3FL9mIuXbNnmEHpkw6AwM24bfnd3OEAhMQZR2Y8QceLkkGjDW30nRirq/u
 KiK13AdzBi94EMjtVgREGLOVJklLem8/QKuFPlqmvm9fdbmyWwv7YschLAojUCbvd76L
 LZJZC+z8bmu0QWQhwBNH3dvLV/1vzEiVsB1r+AOOXwC4CqYd3BoI4y4lUD2jF3fXPSkt
 RKeYSs5Yhah8DreEuY9xWqniBx9RkgGaDp2oPwgpzkpJ1euRfpPowRC66sjxUMVJMSPW
 6BayhTO1Fr1QCsPc/08rRTvyqIetjeVeMzE1vgg7U/c7vhc+DLLgVGdutIKJlOsZhy5A
 LCbA==
X-RZG-AUTH: ":IGUXYVOIdfBKufcaBaD1VnaVHDFPyTRa+MRijjlybNMf0fcWFTusC9FRG/J1NqIAqhmZ"
X-RZG-CLASS-ID: mo00
Received: from WN-XPS13 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id q00567w756N8hYi
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 5 Aug 2020 08:23:08 +0200 (CEST)
Message-ID: <fcca32ed88b1c2533123edef505127e5e8b53b94.camel@noddingdog.org>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
From: NoddingDog <lists@noddingdog.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, unit193@ubuntu.com, apw@canonical.com
Date: Wed, 05 Aug 2020 08:23:08 +0200
In-Reply-To: <CAHmME9qeZ5bSFToFoQZqiNQpwNyHp+25T9Nzhu+cR=7s+oGR1w@mail.gmail.com>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9qeZ5bSFToFoQZqiNQpwNyHp+25T9Nzhu+cR=7s+oGR1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Reply-To: lists@noddingdog.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, 2020-08-04 at 23:58 +0200, Jason A. Donenfeld wrote:
> Hey NoddingDog,
> 
> I think that the fix has now been released to -updates, as of about
> 20
> minutes ago. It may still take some time to hit the mirrors, but can
> you see if "apt update && apt upgrade && apt install wireguard"
> produces a saner result than last time?
> 
> Thanks to Andy for getting this fixed so quickly!
> 
> Jason

OK, I tried again and this time the following packages were offered:
linux-headers-oem
linux-image-oem
linux-oem
wireguard tools

Installed, rebooted and all seems fine. Thanks all for the fix!


