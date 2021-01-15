Return-Path: <SRS0=/ntC=GS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACB6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 23:41:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDBB23A5E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 23:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CDBB23A5E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5ada9dd;
	Fri, 15 Jan 2021 23:41:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7c752d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 23:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610754068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YslQDcxo7d5X05E+3A1iy2Jx83a4hIAOz++l6yPwS0w=;
 b=UxnwuoCC1SwNi0h3w6jM2MWIXzO6zK22jfWb4/7xyUT+FaWntVmDpJGvAwZnaqB7XUNmHV
 pHOIOHmvGNPQ76fbE/OjBg+sz1cP57xfm/J/9OUVhDlXGZqMpMrI2ERzcxUBMZGwv3rr0q
 QA15ArYxxNCx8aB6McQY3Ux+k3Etnmo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 36ba13c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 23:41:08 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id z1so6614024ybr.4
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jan 2021 15:41:07 -0800 (PST)
X-Gm-Message-State: AOAM532nk4VLP3oLjX5ESZzoQfTGCYueHwGBqdF4RUmNcx8uPI48QfD1
 oka9IrMxtdZ3j7msAWVlKtPyYCYGkExLtMp9D6I=
X-Google-Smtp-Source: ABdhPJxmrDGWGWQRDXblexM2Wy32VQ2QL/9q7VmT4ORFOmz5uIS4Wn0l+QTTteQLZgUPnc6GRixFNRu14JJEWd8kTY4=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr22267493ybe.306.1610754067207; 
 Fri, 15 Jan 2021 15:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20210109210056.160597-1-linus@lotz.li>
 <20210115195353.11483-1-linus@lotz.li>
In-Reply-To: <20210115195353.11483-1-linus@lotz.li>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 16 Jan 2021 00:40:56 +0100
X-Gmail-Original-Message-ID: <CAHmME9rny0bc2JA1_9_A=_3OuPnEvqJyK7UMwsL+x=yTHRoBTQ@mail.gmail.com>
Message-ID: <CAHmME9rny0bc2JA1_9_A=_3OuPnEvqJyK7UMwsL+x=yTHRoBTQ@mail.gmail.com>
Subject: Re: [PATCH v2] wireguard: netlink: add multicast notification for
 peer changes
To: Linus Lotz <linus@lotz.li>
Cc: kernel test robot <lkp@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

Hey Linus,

My email server has been firewalled from vger.kernel.org until today,
so I didn't see the original until this v2 was sent today. My
apologies. I'll review this first thing on Monday.

Jason
