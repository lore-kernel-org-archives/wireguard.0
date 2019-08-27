Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1973DC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:57:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3517217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sx92pzfm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3517217F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c8dfefc;
	Tue, 27 Aug 2019 22:57:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fbd0eef
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:57:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39151efe
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:57:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c43810c6
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=rAMVWEXzyYAoFaiqSRwvPF0FHu8=; b=sx92pz
 fmipyvJ6IvFkw/qL1jmf+d8l4ILoDWwWxauatd25FeyiDZ8bepHJMB7+78+6BpEe
 ZBq+n11X0LDE7YZ+DWvtkoGaVLL4jOwodSnoqNvG9Cbaqs7l4UIt2wTzriGmBgZr
 shXsA59tbBH4lZlsvytBhI3Xe1Dn/bx+gwf/ckfIY3LbfhCqBiDxpZPDjBsBon/7
 gp54gH1F5pGkBXImO2iRsLNwqnvBbZTiyhyRXW2A442TLzSFY+B3pX9yuHkqZBzA
 X3pnB1upVGtGIdt+1iiL23AKzipE5Gq86gb676rJZswrrOpWrLWbL/rWv+fTsw3H
 8cQvf42ehFScys9A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32679915
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:15:10 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id b25so599557oib.4
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 15:57:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXGX8AG9yapMGG7cB1e3QFgWC1w/tVEAIfJkOaazwo71e2iiwAK
 +OmN7JSFlg6mCVHjEdgqW1ku+u+tKhE4C9FXT+g=
X-Google-Smtp-Source: APXvYqwrj6xTOHQ7wQv02eoRUR0B0QAX+xNf1pzdqo9FoxzfKysyQp+KfOYFFpj4lOzVvdMNkRZF1gbPGy9aluBDNK0=
X-Received: by 2002:a54:4895:: with SMTP id r21mr753731oic.66.1566946635680;
 Tue, 27 Aug 2019 15:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <5d41039d.1c69fb81.343ad.3704@mx.google.com>
In-Reply-To: <5d41039d.1c69fb81.343ad.3704@mx.google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Aug 2019 16:57:04 -0600
X-Gmail-Original-Message-ID: <CAHmME9q2aJCx3syoSDdpy8xTfDwgQv-_15BVTvXQ65npw0kS4Q@mail.gmail.com>
Message-ID: <CAHmME9q2aJCx3syoSDdpy8xTfDwgQv-_15BVTvXQ65npw0kS4Q@mail.gmail.com>
Subject: Re: [PATCH] device: make locks more efficient
To: liuhaichao@bytedance.com
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

Thanks. Looks good, but needs a Signed-off-by line using the -s option
to git-commit.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
