Return-Path: <SRS0=gx67=WO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A7CC3A589
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Aug 2019 17:09:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41B3206BB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Aug 2019 17:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=labrat.space header.i=@labrat.space header.b="HbLRCs+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41B3206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=labrat.space
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc6ac978;
	Sun, 18 Aug 2019 17:09:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49eb35ad
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Aug 2019 17:09:31 +0000 (UTC)
Received: from mariecurie.labrat.space (mariecurie.labrat.space
 [116.203.185.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 783ced43
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Aug 2019 17:09:31 +0000 (UTC)
Received: from labrat.space (xdsl-188-155-234-211.adslplus.ch
 [188.155.234.211])
 by mariecurie.labrat.space (Postfix) with ESMTPSA id C76D42BEEEB
 for <wireguard@lists.zx2c4.com>; Sun, 18 Aug 2019 19:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=labrat.space;
 s=201904; t=1566148144;
 bh=UiunBVhCrGzo4XhkLYBp2GsTHZBSFoIzvfVsNB1+pFU=; l=954;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:From:To:CC:Date:
 Subject:Content-Type:Content-Disposition:Reply-To:In-Reply-To:
 MIME-Version:Message-ID:References;
 b=HbLRCs+MpzgIkYrWcm8FDLyZ0MJs43gFjO5UxcZhy79LLQff14vE2sWNVfYEfvOlp
 UCJ+W2ItKgkBpUPWZReZ6qKsdwRhDfDqb6R0XJdnLmGJy9eHBUVACeLYO6HSnV/SI1
 JfTQiogfKvZBKhb5W9m5WEorSrjGCqC0Ivn2NefY5T2R+362A91Upl/28RnVmIiAHH
 Byd1hX00KGeh7uoai2+a708Tc9N/0ZHqsExfJuda8+7jFCFSiYIDDeEDNiYvfpk+CU
 YwI49XIfS5SibPYZ1p0wP/BPVuvTvUkk7cywbq7vQxMz5G+o8r/o9Ixg7aLLJEJu7G
 t8JoGYlGnCFsQ==
Date: Sun, 18 Aug 2019 19:09:28 +0200
From: Reto <reto@labrat.space>
To: wireguard@lists.zx2c4.com
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
Message-ID: <20190818170928.ps2fymkisd4giefv@feather.localdomain>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
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

On Sun, Aug 18, 2019 at 04:22:49PM +0200, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> currently the private key ist stored on HDD which is quite insecure.

What are you referring to?
Why do you consider a HDD insecure?

For starters, storing stuff on a hard disc is certainly not "quite insecure".
Are you aware that you can encrypt discs / partions / files?

Wireguard also allows you to set the private key on the fly, so you can feed it
for example secrets stored in pass (gpg encrypted), which you *can* decrypt with
a yubikey already.

Are you speaking specifically about wg-quick?
In that case the manpage already shows you how to feed wg encrypted secrets

> Or, perhaps it is desirable to store private keys in encrypted form, such as  through
> use of pass(1):
>	PostUp = wg set %i private-key <(pass WireGuard/private-keys/%i)

Of course pass is only an exapmple, use any way of decrypting the secret as you
see fit.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
