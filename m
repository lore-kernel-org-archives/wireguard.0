Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F40C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:52:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D71020760
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:52:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="imNw8KW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D71020760
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f551ebe0;
	Wed, 17 Jun 2020 07:26:49 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a0809f38
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jun 2020 09:51:33 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 52D02FA09D5
 for <wireguard@lists.zx2c4.com>; Mon, 15 Jun 2020 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1592215761; 
 s=s1; d=tutanota.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=FolDshODdKEW+e4OaAnWUXweOja/A25OrdlUcHYieR8=;
 b=imNw8KW3Ao2iuj4llQP6ws3X/E/+x82MTIkBCjzRERdODnMJBqIFGmP+An0u4skg
 OEmLI04pe9QefGncu0YUy9th9CncancowcKdbyLxdAOS2el37cxt29m9osprCj73wrW
 LSxj4Di53U0LMjqFe1zTfC2MKwXClmj1Q2vdNgphdInc6hF7VkpRMap5raNN+4VVX0T
 YBmL0wTn+57SKNXIKB/9AgpT9SDTgYmf+RHf/JMxt8um41smn6Bro9I7XrM9KuEZCuw
 uGLli0/BDPYrfYoiZ2agufbl1OCY58T3cLrWbBz01bkG4xbOdqTvL2TSDYz7dik2J2F
 kSvKVhC2QQ==
Date: Mon, 15 Jun 2020 12:09:21 +0200 (CEST)
From: kolokd <kolokd@tutanota.com>
To: wireguard@lists.zx2c4.com
Message-ID: <M9rS5MC--3-2@tutanota.com>
Subject: why multiple call to fmt.Fprintln for printing warning
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:34 +0200
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

https://git.zx2c4.com/wireguard-go/tree/main.go#n39

why multiple call?
