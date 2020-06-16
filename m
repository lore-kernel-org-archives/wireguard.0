Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A82C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792032073E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="JM25+Xr2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792032073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e737dbe4;
	Wed, 17 Jun 2020 07:26:54 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7372e85d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jun 2020 09:58:26 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 38586FA03F4
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jun 2020 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1592302582; 
 s=s1; d=tutanota.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
 bh=218btthL0O18CMiltrZlCzvKv0ipLLzgZF+5pHqZ3W8=;
 b=JM25+Xr2Zc5OS6Ehlh22rknGr9GWTvCF2voOc8eksogeIPRAyA73fqvD4n23Rg66
 aYTL7GaLB77/92a/MMrqXIwmOaiMYPdpYsB10BMVcWv0uHPRccALO+P6jLjh6pLOPty
 qyW81dctAlcWlXlBuAkcEN7cTqNMSI+TWbP1BucTe5MpnHfrujy1au48fmHTfs46OCx
 S3859VtXbaKvhi1PiWsWWEhxAxafGXULayXOlM1qsu8qeh3lmyys/wkonJ1m85EUlKV
 xP1UVkcGV1LL8db07hLQA+5tlhUi/vO26h3jaaJOuwTseLCieVxPnc98/dUpYqtmTBv
 pjvnr1TmJg==
Date: Tue, 16 Jun 2020 12:16:22 +0200 (CEST)
From: kolokd <kolokd@tutanota.com>
To: Wireguard <wireguard@lists.zx2c4.com>
Message-ID: <M9wcIP0--3-2@tutanota.com>
In-Reply-To: <M9rS5MC--3-2@tutanota.com>
References: <M9rS5MC--3-2@tutanota.com>
Subject: Re: why multiple call to fmt.Fprintln for printing warning
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

reply

Jun 15, 2020, 4:09 PM by kolokd@tutanota.com:

> https://git.zx2c4.com/wireguard-go/tree/main.go#n39
>
> why multiple call?
>
