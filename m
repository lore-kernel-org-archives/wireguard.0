Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3321C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 13:24:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B1120DD4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 13:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="U95yfMme"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B1120DD4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fa77964;
	Wed, 18 Nov 2020 13:18:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6637ac12
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 13:18:48 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b6eca08
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iTGWXsRX6d/7MMsQdrUY+1Biwmc=; b=U95yfM
 meqdiq4c+Vfc29VnfrgTkcA7l78tJlBCIGfS+GUeLdNO1fzBOV4dxm2FH4LMP/Vn
 P55N44OQ6w7HzIXOQY0tx+IZLPBIxMPDMJcQNkHHU0x+Sz/7utjm03YaMHXFkuVM
 u6GDKVEYaTLToY8WgW4zeg6vwvUa9Zn4Zt7eSuVVer67hzXvBCMj8yQgwLwNx0c4
 UANLpwpY0HplXd4Set+BURLVj3+o042qfHa4eXLf6oz7c07DX3iSry+tAeMOcI7I
 9jE1cNVY+3voF8tpQcc5wYxxak/MdbeylhvryxhHP3d4jCwh7axFjnrYlovIIu2Z
 84/rJdNMdpy7R3DQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 83721464
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 13:19:34 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id l14so1666781ybq.3
 for <wireguard@lists.zx2c4.com>; Wed, 18 Nov 2020 05:23:32 -0800 (PST)
X-Gm-Message-State: AOAM533joSxH1D4f3P9zQA/vXBMXMDTFZieAmdSilIbrBL/xHHu74tP7
 3ljmangBgrB3ujtMhynQQeBn5MwA8BATixvCdeM=
X-Google-Smtp-Source: ABdhPJz0AsU4n9opXhPR+mz9dx8bIvVZqh20flO6HMAfx0CNyB4SGzpPrBwgknSBkmfSly7cTciEQhNPrdJ9j5cVf/k=
X-Received: by 2002:a25:4943:: with SMTP id w64mr5545081yba.178.1605705811973; 
 Wed, 18 Nov 2020 05:23:31 -0800 (PST)
MIME-Version: 1.0
References: <5fb519a8.1c69fb81.9867a.7fef@mx.google.com>
In-Reply-To: <5fb519a8.1c69fb81.9867a.7fef@mx.google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Nov 2020 14:23:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9p7p=+Z7PRVQvPd3tHA-mz70fx1m_LMdeHrT58etGzb5w@mail.gmail.com>
Message-ID: <CAHmME9p7p=+Z7PRVQvPd3tHA-mz70fx1m_LMdeHrT58etGzb5w@mail.gmail.com>
Subject: Re: [PATCH] device: add write queue mutex for peer
To: liuhaichao@bytedance.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks! Applied.

https://git.zx2c4.com/wireguard-go/commit/?id=913f68ce3820801e045632cb05c6f11e0df50b47
