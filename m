Return-Path: <SRS0=jbYm=7F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC4EC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 12:32:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A34207F9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 12:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="dLicBgPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A34207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8a59180;
	Sat, 23 May 2020 12:17:13 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 92b2954a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 12:17:11 +0000 (UTC)
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 49TjR71L6JzFfd4
 for <wireguard@lists.zx2c4.com>; Sat, 23 May 2020 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1590237123; bh=SRQD1KkoIDvTHveVHVpbBvdj46C3mwUbPd2JXsQFV2Q=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=dLicBgPyHmQC1K1UucPEEd5WCG9oFUKgVvjQs+5fCkuV3owBxIf67hDXcVNmOT9Cy
 A6YeCqtsrLFwIWDXL42ly51/DLIpkfzHWbBEiVbTeE+KS8TFoIpjzO8vWqdE3YdAG2
 AAr+fJk8ZlH2HZrbEBqS/8tNID7aM77LkWRaKLX4=
X-Riseup-User-ID: 9259673D8EE7E4ACB8BD817B17F7B3CB48BE272F9BA501C0A7A4DB5F85A47E49
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by capuchin.riseup.net (Postfix) with ESMTPSA id 49TjR62cF9z8t2w
 for <wireguard@lists.zx2c4.com>; Sat, 23 May 2020 05:32:02 -0700 (PDT)
Date: Sat, 23 May 2020 12:31:58 +0000
From: Georg Faerber <georg@riseup.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
Message-ID: <20200523123158.GK32260@debian>
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
 <20200522124344.GH32260@debian>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200522124344.GH32260@debian>
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

Hi,

The example URL was referring to the orig source, which is probably not
of interest:

On 20-05-22 12:43:44, Georg Faerber wrote:
> [5] https://snapshot.debian.org/archive/debian/20200429T204608Z/pool/main/l/linux/linux_5.6.7.orig.tar.xz

The Debian stuff is included in:

https://snapshot.debian.org/archive/debian/20200429T204608Z/pool/main/l/linux/linux_5.6.7-1.debian.tar.xz

Cheers,
Georg
