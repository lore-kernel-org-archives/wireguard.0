Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6ECC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:44:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF18F2068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kaLkXGEL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF18F2068E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dc2b7ee;
	Wed, 27 Nov 2019 12:44:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c4b5f56
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:44:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4770ee9b
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:44:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0c141ae
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=6HPvOA6p6KBU31ffG32jADEZ6jc=; b=kaLkXG
 EL1Hq+sLvNGRSOoCKtCGKodz0Eq/jLHbiNi18qxNVltKZhf3H23SNepmtMFxJX+O
 i++064wI1yRa5H8jz812FwCjt5fZVLYVHhe6FE7cqzcLvUggcVkOjuWiD1Uy/CBk
 899uK1ZyLr3PdzDw/zdwJRXvUDjnu+pIkT3BNeMfz1H/BIqfU43CFtkCK7TRBk0J
 F66HjfVtXvnRAQriQ5oDHQHo11YHpbfjKSc6raOipu90kPFqr2ksVpkuypBpqPdi
 YfRBneti7oAefL6ADUteUL3QrazbyyXf4KmH/BNDbvEsBKrG5tG+oUT5UDgvGUK6
 1z0iP0hWvjekx7JA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1d283e2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:50:39 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 66so12867310otd.9
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:44:30 -0800 (PST)
X-Gm-Message-State: APjAAAUqOsSnyGSfZL+1iYQBQ2MZPs2QUOtjuIKMCHI74DgOXRtdQd/8
 Xm16pey8JTNlC89D8C+1JZyh3u8tii1Q+WXnre4=
X-Google-Smtp-Source: APXvYqz3tQSGnM9c6+ttiNFNuVgVRB6/4wiOnjwJVV6yMvgjlvbCXcV/iTyjBrcGTG/u25PkrWE3NOgEjk2ki5Ax8NQ=
X-Received: by 2002:a9d:12ae:: with SMTP id g43mr3454881otg.243.1574858670118; 
 Wed, 27 Nov 2019 04:44:30 -0800 (PST)
MIME-Version: 1.0
References: <1572565214.3.2@gmail.com>
In-Reply-To: <1572565214.3.2@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:44:18 +0100
X-Gmail-Original-Message-ID: <CAHmME9qPA3HyUE1rpnPhgD9NUDMbLjWMybAwskOHpjtVu+RUig@mail.gmail.com>
Message-ID: <CAHmME9qPA3HyUE1rpnPhgD9NUDMbLjWMybAwskOHpjtVu+RUig@mail.gmail.com>
Subject: Re: remove an unnecessary call to unset_dns
To: Arjen Runsink <arjenrr@gmail.com>
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

del_if only hits it if it was previously set by the same process.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
