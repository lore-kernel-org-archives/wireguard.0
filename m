Return-Path: <SRS0=IBFn=JW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4797C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 13:52:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB0F6124B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 13:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB0F6124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jazmin.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2db7bd5;
	Sun, 25 Apr 2021 13:52:18 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0fbcb678
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Apr 2021 05:33:46 +0000 (UTC)
Received: from [203.33.246.99] (iThinkingUnit.pineview.net [203.33.246.99])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 7691D80040;
 Sun, 25 Apr 2021 15:03:42 +0930 (ACST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike O'Connor <mike@jazmin.com.au>
Mime-Version: 1.0 (1.0)
Subject: Re: wgX iface as slave to a bridge - Linux
Date: Sun, 25 Apr 2021 15:03:41 +0930
Message-Id: <C7EB35A6-11AD-4A0E-B4B4-6B439D7E52BB@jazmin.com.au>
References: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
To: lejeczek <peljasz@yahoo.co.uk>
X-Mailer: iPhone Mail (18C66)
X-Mailman-Approved-At: Sun, 25 Apr 2021 13:52:16 +0000
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

Hi L.

No wireguard is a layer 3 vpn, a bridge is layer2

Cheers
Mike

> On 25 Apr 2021, at 2:02 pm, lejeczek <peljasz@yahoo.co.uk> wrote:
>=20
> =EF=BB=BFHi guys.
>=20
> Apologies, I'll bother you guys as I failed to find some better places to a=
sk, I searched for forums etc. but failed.
>=20
> Can wiregurard ifaces be enslaved by LInux bridge? I tried but it did not w=
ork for me. Similarly "mavclan" - would/should wireguard work that way?
> What I've tried and failed was on CentOS stream with 4.18.0-294.el8.x86_64=
.
>=20
> many thanks, L.

