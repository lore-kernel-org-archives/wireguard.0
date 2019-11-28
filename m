Return-Path: <SRS0=wroZ=ZU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5229FC432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 10:09:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B06221741
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 10:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PXtdrAKC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B06221741
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 241e85b5;
	Thu, 28 Nov 2019 10:09:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da3d5cc5
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 10:09:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8041bb79
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 10:09:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20d95349
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=c52w1V2Abn7Jkbunj6V0DOaTK1g=; b=PXtdrA
 KCe2q4u0Ne/PaHBsC8O0Wk/dxYIKhFmTChEgvcC7liE8xcIZ9R/y4WqCttPs5QER
 4Qhvc1Sq7OsfD6t2TNoJx9FNiWqn9Bzo2Af/mJYvgzcsUqaSdQaBfyFVIfNf/VRW
 bhr7PB0rYGDhR4auYzfUpsiUkU/xF6kBI1IUSvdHzuwGmKGqKYl8O8w/XvfiL2+E
 eDfitMtsykQG8MoJ0YOYZG5al0vCMkHvn6G+QGQtJtWKgCQPGOu9U1RMTS0/wSek
 rbEv1lh6n669TXtuQ65eAVcW233BiD9BJYj2OwZ9cofz8QKA7BQ8DVvFz60wLXAo
 KflYQOK7Fi5SCqCw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 97ea5993
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 09:15:23 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id l136so7238286oig.1
 for <wireguard@lists.zx2c4.com>; Thu, 28 Nov 2019 02:09:21 -0800 (PST)
X-Gm-Message-State: APjAAAVVFkhtAecjaRl7pwdxEP7eiDQjvHH3y9JCRLNSzYefL9YObWX3
 vXwFRfio0TvULBEstpsZRmuGVOVY2sjIH8+JLLg=
X-Google-Smtp-Source: APXvYqyLJDBQgrOaQ2hJcrolSv46WY9qw/ojrMZMsYC8idprheALfGb3vrPCtADv8V6zY0oEq2gk9o/EDm8Mod0CXR0=
X-Received: by 2002:aca:815:: with SMTP id 21mr867857oii.52.1574935760782;
 Thu, 28 Nov 2019 02:09:20 -0800 (PST)
MIME-Version: 1.0
References: <CAMi2xeQs3hCB9DEZZOZMUQyx6r_HT6Qh_MAnBgNvhOmfJvrChg@mail.gmail.com>
 <CAHmME9rhLSieSQ-Co7KKR6hfC-RGyaLA_TGpmYPObzJYMe5rDQ@mail.gmail.com>
 <CAMi2xeT1xO_1Co4SYRYpe48NAGTMO-wXFTUq1Eg+5+eJBBW1jQ@mail.gmail.com>
In-Reply-To: <CAMi2xeT1xO_1Co4SYRYpe48NAGTMO-wXFTUq1Eg+5+eJBBW1jQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Nov 2019 11:09:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9rbQM_UORUYJOsiGeONXtpgwnbUp87vrWrn8vnO99Ofzg@mail.gmail.com>
Message-ID: <CAHmME9rbQM_UORUYJOsiGeONXtpgwnbUp87vrWrn8vnO99Ofzg@mail.gmail.com>
Subject: Re: wireguard-go data race in Peer.SendBuffer()
To: Ben Burkert <ben@benburkert.com>
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

How on earth did that get committed... Sorry. Fixed.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
