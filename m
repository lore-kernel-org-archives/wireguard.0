Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDBAC282C6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 21:50:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF72920856
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 21:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="md5U1rtN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF72920856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 698271dc;
	Thu, 24 Jan 2019 21:44:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ff99d58
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 19:47:44 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec5c5307
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 19:47:44 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id w13so5858577oiw.9
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jan 2019 11:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=aGfm8DVN5OZ3dCJIfRM4QdTHC++jvC2ccgHgtJjFQjk=;
 b=md5U1rtNUA2HeKz6mFge6mkBlbnVK23s+lhDo8HCinFCRMym2BDYFpWb9vDbJlOf7z
 2tGgnQ8p+n+/UuWo5LmmtF4T6Nll2s6CmO07nMjsMv5NuXKvlbRxpIa1CFWzyQzoboUk
 GUMYPMKACTApKmYL9iZEezOm+aQuh0x+h36p/0vndMO7XKba+QpDLHX74QpfCsndlg76
 iz9MEUb9r/8he2eyyoEp0vWd3gJHsvdM7byN3YWQRety0JfO7XPCFYbtCs0E+BBl3grE
 N9PnRkWRZMNisbekMnn6t3KoNvxuo4KDK1kBU10uag53zaUtkGe9eLiYvZa1/nGLlO8X
 3yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aGfm8DVN5OZ3dCJIfRM4QdTHC++jvC2ccgHgtJjFQjk=;
 b=pSSH8XSjuVdoOGmuU+zYsP9fB4gOl/PzBFWjIicWmjk30ds1EKY5ZLOUVo9hfcZxG3
 /q7bLTbVdjhS07XcPEck7Exml8OXVd7eWUQM+RjKolgD2OzdyMMu4ZuR0jQFMneiT35n
 HkDYQZQa4aK740PvcpW6Vig0Czudlt5wmk3bsNw03qCzKjzv76vyUpL8NRj1FBW6E2NF
 SD4B+sosZgvUXR9+jTzST+IO1pCQmhJO6CCkm6Qp8BnnfAZAUBWPxp935oqiFl2cYbMC
 VsT0QKLp5aXc0K4r4Gzh6019xktJtm3wSDNLBX29lqAQtjHh1+a4ecIIPIrgkL+DvnPe
 N+jg==
X-Gm-Message-State: AHQUAuZLSw5jRoqm+UZpLk4RvD90lCDWMbwC4UHA8qMVik9Za+aUNXev
 sdWpsGBxSuJ4KxMYPB1fyibsH2HXljkfxE7vmUvwhGtF2qk=
X-Google-Smtp-Source: ALg8bN7sDg+X8pAIlJ8MgyDNwMemuIsdRwAJEVE2Gotz8GEvvbw8BJDAIo1u922ubZiK6v5BgdxpWFKuXc24G/vXpKk=
X-Received: by 2002:aca:4ed8:: with SMTP id c207mr2172334oib.276.1548359577756; 
 Thu, 24 Jan 2019 11:52:57 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Thu, 24 Jan 2019 14:52:47 -0500
Message-ID: <CAO_nJAa1hNsDHGxJwyVstuUXVkaxZ30Zx_KOnVZvQKF7==a_5g@mail.gmail.com>
Subject: [BUG] iOS client (0.0.20190107) sometimes kills WiFi
 connections/switches to LTE
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Thu, 24 Jan 2019 22:44:49 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I reported this a few releases ago[1] and it unfortunately it still
seems to be affecting the latest iOS app.

I found a new wrinkle: if I intentionally add a duplicate profile in
the app to my home VPN, the bug is only present when I connect to the
first profile.  When the bug is triggered (ie the iPhone's icon for
WiFi disappears and the LTE icon appears), I can disconnect from the
first profile in the app, and then connect to the 2nd profile in the
app, and I appear to be back on WiFi using the VPN.

1. https://lists.zx2c4.com/pipermail/wireguard/2018-November/003588.html
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
