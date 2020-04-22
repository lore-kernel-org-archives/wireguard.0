Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB7AC55186
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D82E21556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="1viC/OQB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D82E21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2666af91;
	Fri, 24 Apr 2020 20:37:49 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1eea804c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Apr 2020 12:54:21 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id ECD69FA0319
 for <wireguard@lists.zx2c4.com>; Wed, 22 Apr 2020 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587560711; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=ozHX+rlcnBSbA0KT06jxFStPXF+e6xEcUpQPIA1uJ0U=;
 b=1viC/OQB7M9uta44YpZ8ybe9a35Fx8s+htJnZcMnMm7LCYyjH667VC7yotv8C0qJ
 NcLVi2evDfsiA1a4XLJCiD4g8IlcTVhyOO0tMNDDktkTLJAMZOm3ZOMP0aEJmSth6im
 JlCBJ54KYkKDoLWgfX4u07/Z4om2xPA2e3xzEawU9337aYmzBsw0vk9JJd1LsfYmK2V
 SuoeAnSFUYln2X8f2XZkYKDgol7IjGRLo7cG6vA5PdRP6B1Z3NX5gTYzoy0bFNdAqAI
 IBqASid6ddZ+vdLWnokLojTfaCw9/vT/mjEBXYr0H2ZKr/YL3DmS2xWULowZl9tqeN9
 8kX7FJANmA==
Date: Wed, 22 Apr 2020 15:05:11 +0200 (CEST)
From: Adhipati Blambangan <adhipati@tuta.io>
To: wireguard@lists.zx2c4.com
Message-ID: <M5WzVK5--3-2@tuta.io>
Subject: Attaching XDP program into wireguard interface
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:37:47 +0200
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

Hello everyone,

I have tried to search for the same question in this mailing-list archive, but got no result.

I have wireguard connection in all of my machines running in production, and it works pretty well. Currently, we are thinking of doing some packet-classification using XDP as an early hook in the RX path.

A simple XDP program has been successfully attached to our "standard" interface. But, when I tried to attach the same XDP program to my wg0 interface, the logic in the XDP program did not kicked in. Is this something expected? if yes, is there any plan to support this use-case? I would like to help. But if not, could you guys shed me some light on what went wrong?

Thanks!

Adhipati B.
