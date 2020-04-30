Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FROM_DOMAIN_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804A5C47258
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB6020658
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rcrdbrt.com header.i=@rcrdbrt.com header.b="nF0YjbPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB6020658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rcrdbrt.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48da7fd9;
	Mon, 4 May 2020 10:51:16 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8143f1c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 13:49:38 +0000 (UTC)
Subject: Re: [PATCH] systemd: add file wireguard.target
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rcrdbrt.com; s=mail;
 t=1588255291; bh=3Lqc2x1o11QpgjAqc2sYaNzYUuhK+AA4Bole4X+vj8c=;
 h=Subject:To:References:From:In-Reply-To;
 b=nF0YjbPtTUJCxYbFCo3cZ5UylCGwmTy1PvTbY3HNV60vZs3zCoGVuY+y7q1nnfRKO
 69gCH8jzYRXgWJmGpm2u92s58pl4J2Ls04AeEaZM3aXdNsskxC2JLsRTznT7hzHAGy
 mF5nSpZqD07YKlx2SHGHhI8+rYiAmWbJeP6cO+CU=
To: Martin Hauke <mardnh@gmx.de>, wireguard@lists.zx2c4.com
References: <20200430135551.9911-1-mardnh@gmx.de>
From: Riccardo Berto <riccardo@rcrdbrt.com>
Autocrypt: addr=riccardo@rcrdbrt.com; keydata=
 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 Dw==
Message-ID: <4c6e0e4e-9542-489e-7bb6-84b17ce44e15@rcrdbrt.com>
Date: Thu, 30 Apr 2020 16:01:29 +0200
Mime-Version: 1.0
In-Reply-To: <20200430135551.9911-1-mardnh@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 May 2020 12:51:11 +0200
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

Vouching for this, sounds quite useful.

On 4/30/20 3:55 PM, Martin Hauke wrote:
> Add file wireguard.target, which allows you to stop or restart all
> instances.
> ---
>  src/systemd/wg-quick@.service | 1 +
>  src/systemd/wireguard.target  | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 src/systemd/wireguard.target
>
> diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
> index 7c5f9d1..c22f7b3 100644
> --- a/src/systemd/wg-quick@.service
> +++ b/src/systemd/wg-quick@.service
> @@ -2,6 +2,7 @@
>  Description=WireGuard via wg-quick(8) for %I
>  After=network-online.target nss-lookup.target
>  Wants=network-online.target nss-lookup.target
> +PartOf=wireguard.target
>  Documentation=man:wg-quick(8)
>  Documentation=man:wg(8)
>  Documentation=https://www.wireguard.com/
> diff --git a/src/systemd/wireguard.target b/src/systemd/wireguard.target
> new file mode 100644
> index 0000000..8e59224
> --- /dev/null
> +++ b/src/systemd/wireguard.target
> @@ -0,0 +1,2 @@
> +[Unit]
> +Description=Target to restart all parts of WireGuard
> --
> 2.26.2
>
