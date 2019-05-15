Return-Path: <SRS0=SvU/=TP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3B2C04E87
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 May 2019 11:21:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 434722084F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 May 2019 11:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 434722084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99a2fcce;
	Wed, 15 May 2019 11:21:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2b95eef
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 11:20:58 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 6b1dc363
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 11:20:58 +0000 (UTC)
Received: (qmail 12872 invoked by uid 500); 15 May 2019 11:18:30 -0000
Date: Wed, 15 May 2019 06:18:30 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Working on change for: genetlink: make policy common to family
Message-ID: <20190515111830.GB12769@wolff.to>
References: <20190513195213.GA30315@wolff.to> <20190513202453.GA30656@wolff.to>
 <20190513212110.GA31106@wolff.to> <20190514205016.GA920@wolff.to>
 <20190515105014.GA12390@wolff.to> <20190515110636.GA12769@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515110636.GA12769@wolff.to>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Now I'm looking at: f6ad55a6a184ebdf3d98a90eab0895f73ce9797e Merge branch 
'nla_nest_start', which looks like it might also cause a problem.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
