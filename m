Return-Path: <SRS0=KwQm=PJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70666C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Jan 2019 12:45:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFDA218B0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Jan 2019 12:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="M+8LrbVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AFDA218B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb73e479;
	Tue, 1 Jan 2019 12:42:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7fe7e5e
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 12:42:38 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9a1d1ba
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 12:42:38 +0000 (UTC)
Date: Tue, 01 Jan 2019 12:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1546346692;
 bh=FGI0/+yBCdFPQ1uz1EYHAps8C5m6iHgMxnAo0SvPJQg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=M+8LrbVP0EEudBhPm0dsa5R+V1U9ngStsR5E1Qe+CfqREMeif+zsb7MC8dNNHYxgi
 rQQJdebuaIu14nGc2DcWrmGbtohSh6B1hJg7MrqRkcWcZoA1siiK4hIK+X7+5GzKrv
 WoPFRoz5pe4/oyi1ftT9/UkfFOwlYU/wICDeBQb0=
To: John <graysky@archlinux.us>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: binary module for arch?
Message-ID: <lPQ5GurSKCXMO-VZWTLlzPNWWOS6oi7Q35asuQZSP6MQzEHDY_XGp0p9_XGkeA3tfX_DQiZyfJqvDel5ncCbKD5doM83U6yUHbh2sv-4ibA=@protonmail.ch>
In-Reply-To: <CAO_nJAYw_zbNBsxtaKbR=kxp-+E4d2VkzUfrWtnSn26ZVkuEMw@mail.gmail.com>
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
 <CAMp63jVKAeieefottP=EwYMeo0daD5GDxwpT1PiPPOZQkQ6gSA@mail.gmail.com>
 <CAO_nJAYw_zbNBsxtaKbR=kxp-+E4d2VkzUfrWtnSn26ZVkuEMw@mail.gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian Hesse <mail@eworm.de>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Monday, December 31, 2018 5:11 PM, John <graysky@archlinux.us> wrote:

> My recommendation is to change the wording under the command on your
> install page to something like: "Users of the distro provided kernels
> (linux and linux-lts) may download the requisite corresponding
> precompiled wireguard module. Users of custom kernels will require the
> wireguard-dkms package and corresponding kernel headers to compile the
> module."
>

This isn't strictly true as there are distro provided kernels
(linux-hardened and linux-zen) which don't have wireguard binary modules
available. Below would be more appropriate:

"Users of linux and linux-lts kernels may download the requisite
corresponding precompiled wireguard module. Users of other kernels will
require the wireguard-dkms package and corresponding kernel headers to
compile the module."

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
