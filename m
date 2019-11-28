Return-Path: <SRS0=wroZ=ZU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8159BC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 17:14:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 979B321739
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 17:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hq7cYbs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 979B321739
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7ae7751;
	Thu, 28 Nov 2019 17:14:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee0c5b55
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 17:14:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06d58f76
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 17:14:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 805be7bf
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OZ9EJTNn/MdhiPUgz2ApdCDfEJw=; b=hq7cYb
 s+iUeOuHcZtgqP0YwHrm1UIHotwygUARQojYNMhh4NTnYym3pBLQguTbvuQmi8dK
 emHBJv7/Rd8niwsGAyxtHB76E7eXqN6i/rEYkuaO/Tu0tAp/S2KMsL5sGLpYb0Ao
 zt9g0MuD3z+O7kkxeXRpee2W5HDXKFhnlz63hip8TnYPens6EZYcT7wIgIaa3lzV
 zmu4NBMc/3ELWnZJS1ZQbBoNvJafxODGxV8HVEIkgvp6xGxA0/nYR+ETmb2Z+UW/
 NJpFDQQkfhbYTbhZmwDO4Lv3sawIjEU+ZimUysYmSsO5TCpKdjFROQ2V8+K8dIF0
 mW1VXYi8NTuRHaNg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e3815082
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 16:20:32 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id s71so23814061oih.11
 for <wireguard@lists.zx2c4.com>; Thu, 28 Nov 2019 09:14:32 -0800 (PST)
X-Gm-Message-State: APjAAAXL4tNMFbV4znaIrUcQvWUYHgI4G8Ke5ah9O+/9A1Df6OSzDauC
 yKoZLqvlyk095f/ZwpQZ5tyYSCWsW262/bEtcp4=
X-Google-Smtp-Source: APXvYqxjTL98pgrVV8JAY+/W47ai+xA7YPcIOlIH/svT74fgMt0LiH23ieVPlm4Ujjrl0GNDXJ53Y9d6/WgSu+Snxo8=
X-Received: by 2002:aca:815:: with SMTP id 21mr2262185oii.52.1574961271536;
 Thu, 28 Nov 2019 09:14:31 -0800 (PST)
MIME-Version: 1.0
References: <9cefaab6-d3f8-25f0-34da-754e59c7c4d4@med.uni-frankfurt.de>
 <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
 <cc88dffc-8940-64c9-f339-0a158fb87967@med.uni-frankfurt.de>
In-Reply-To: <cc88dffc-8940-64c9-f339-0a158fb87967@med.uni-frankfurt.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Nov 2019 18:14:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9pjM9AzZ2JEsKFtdv3CxJmOVf55vWDweWWudjpjvHseGw@mail.gmail.com>
Message-ID: <CAHmME9pjM9AzZ2JEsKFtdv3CxJmOVf55vWDweWWudjpjvHseGw@mail.gmail.com>
Subject: Re: PostDown 0.0.20191127
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Ahhh, that's what's up. Thanks! Will address.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
