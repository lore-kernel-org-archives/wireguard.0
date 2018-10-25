Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C5EC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E14420685
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (768-bit key) header.d=univirtua.com header.i=@univirtua.com header.b="W8zW6av9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E14420685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=univirtua.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1352810a;
	Sun, 4 Nov 2018 17:07:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e54b3aba
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Oct 2018 18:51:26 +0000 (UTC)
Received: from iris.dataflame.com (iris.dataflame.com [91.103.216.201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67b5d535
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Oct 2018 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=univirtua.com; s=default; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dWQeGNh+ifz8sQphE54JZGY52iU9SVP11yuy2GjDyAQ=; b=W8zW6av90YZ5mBYzGbZas6I4WK
 FRB+Y0ILyuYUCeGePVLew2AA7MA9wgKGNafn8DQK0ox8ZB9Osa57nv2HS3oPldCdOiaD0oIwCU8UB
 aiPvs/vx8MIhgkB6v4LiKBEkL;
Received: from [80.229.229.177] (port=28866 helo=majic.localnet)
 by iris.dataflame.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.91) (envelope-from <developer@univirtua.com>)
 id 1gFklv-0004Ix-ES
 for wireguard@lists.zx2c4.com; Thu, 25 Oct 2018 19:54:19 +0100
From: developer@univirtua.com
To: wireguard@lists.zx2c4.com
Subject: How Many Interfaces/IPs Does WireGuard Listen On?
Date: Thu, 25 Oct 2018 19:54:18 +0100
Message-ID: <2824548.C4YtEDbAiO@majic>
User-Agent: KMail/5.2.3 (Linux/4.8.0-53-generic; KDE/5.36.0; x86_64; ; )
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - iris.dataflame.com
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - univirtua.com
X-Get-Message-Sender-Via: iris.dataflame.com: authenticated_id:
 rohan.beckles@univirtua.com
X-Authenticated-Sender: iris.dataflame.com: rohan.beckles@univirtua.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:07:23 +0100
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

Hello --

I've just signed up to this mailing list and I have been perusing the previous 
messages, all the the way back to 2015. I'm currently testing WireGuard in a 
single server/multiple client configuration where each client maintains two or 
more load-balanced tunnels to a WireGuard server.

From reading older messages, I am aware that WireGuard cannot be given a 
specific IP to listen on. Does this then mean that (for example) for a given 
instance listening on port 51820, each IP on the server can accept requests on 
this port?  Or is it that only the first IP WireGuard finds is the one it will 
listen on?  

Many thanks.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
