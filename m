Return-Path: <SRS0=dlhK=HU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A317C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 19:36:59 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCF064EAF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 19:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCF064EAF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a115f48;
	Thu, 18 Feb 2021 19:30:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e2e974f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613676623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vVl4nRrKYLvDHMI3hxt8IgNMtzE2YZuFD9+o0/nLHJU=;
 b=X8OG17st6zwQ8mTNQWCX8WrsTmSkzFqqX6ky6CGTiDy582ThchjTplR1PPQV8Zqc+CS633
 ZzRYHUPfEC5YiZNy2t8zXWfGvi28xZXqYlfpbVgDRNonx8vzXWASq1U8efWJUo3CCiRpjs
 GMAKYP+UkzRJtmHVB7HJlrSKY5Q1UMw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 960582f8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 18 Feb 2021 19:30:22 +0000 (UTC)
Date: Thu, 18 Feb 2021 20:30:20 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] compat: skb_mark_not_on_list will be backported to
 Ubuntu 18.04
Message-ID: <YC7ATI5bnRO0XHpA@zx2c4.com>
References: <20210218170132.22917-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210218170132.22917-1-cascardo@canonical.com>
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

On Thu, Feb 18, 2021 at 02:01:32PM -0300, Thadeu Lima de Souza Cascardo wrote:
> linux commit 22f6bbb7bcfcef0b373b0502a7ff390275c575dd ("net: use
> skb_list_del_init() to remove from RX sublists") will be backported to Ubuntu
> 18.04 default kernel, which is based on linux 4.15.

Applied. Thanks for the patch.

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=cad80597c7947f0def83caf8cb56aff0149c83a8

Jason
