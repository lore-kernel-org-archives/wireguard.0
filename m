Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6538C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 15:39:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F378320675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 15:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="edmF/PuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F378320675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id def5007f;
	Wed, 16 Jan 2019 15:35:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51eef248
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 15:35:06 +0000 (UTC)
Received: from mail-it1-x135.google.com (mail-it1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35f8f8af
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 15:35:06 +0000 (UTC)
Received: by mail-it1-x135.google.com with SMTP id g85so3611062ita.3
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 07:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:mime-version
 :content-disposition:user-agent;
 bh=Qyqy7BYpca0z3C7Bi22H1nsgPkkfmuh/bWe69DqoRJk=;
 b=edmF/PuDog+JpkAIyauzahCjngExGa9iTRdb/KLQIB5p4osk2O4ACgPea+Y0C5hPqG
 34zgLxB77KFtaJ6YW2jM8WkzNClH36xuJzMJ3GYQCf+gDmvuB7eT/SDTS89CfiGRskAb
 Y6g2ZvUM4iEN8zj427a1qARFpVrAK3Zumsdqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :mime-version:content-disposition:user-agent;
 bh=Qyqy7BYpca0z3C7Bi22H1nsgPkkfmuh/bWe69DqoRJk=;
 b=EroMDZJ5AdawSTnSiCoomEUuW7M8LfJYGhG+TZ3HBJVE58plJ+RbVXL6VwoF516rnA
 0xClRoKVO+opk8xg32qeadszzHwX6ftBczuNRZSKirPPuIy/dh6adg9PiMHYUkO4T7up
 7VbAkkUe0w7xlx99ff2zynh9Cs34cXWHVinM/9peazbkP1zH9oUV2Pw/I+y2oagW/8Za
 RGkyP4xRatFsgLOn7EbH1MZUFJ3yZYw81SjYghGbqdjyj53rmN76Ohm6Xn0uJz7rNtbK
 T261YIzSE/NeT4aESDgThkhdsP6jfePNYAiYQJoASuld2GeSjtiKjbaNzM2V/LuD6/9s
 8LgA==
X-Gm-Message-State: AJcUukeyv2UBrd5tHAyDUAJAESAtXedPJg02Qn4pMyjPtrtqncqFj1tz
 YFepIQo/XS/9Q6QoveiVa0wHZh+sSkfZSw==
X-Google-Smtp-Source: ALg8bN7FIL/QQGXyJr5T78d+WhyfsHoTGvIhdWK2BoZalMVmfAUmaG/VKRJ+JVtIERCRFyutBNuZCw==
X-Received: by 2002:a24:4fcb:: with SMTP id c194mr5728770itb.47.1547653155856; 
 Wed, 16 Jan 2019 07:39:15 -0800 (PST)
Received: from pure.paranoia.local ([198.144.156.49])
 by smtp.gmail.com with ESMTPSA id n4sm2793496iog.36.2019.01.16.07.39.14
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 07:39:15 -0800 (PST)
Date: Wed, 16 Jan 2019 10:39:13 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: wireguard@lists.zx2c4.com
Subject: Logging remote connecting IP
Message-ID: <20190116153913.GB19179@pure.paranoia.local>
Mail-Followup-To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello:

For auditing purposes, I would like to be able to log the remote
endpoint IP for each wg connection on the server side. What's the best
way to do this, preferably using syslog?

Best,
-K
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
