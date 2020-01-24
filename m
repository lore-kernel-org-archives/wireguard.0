Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7C9C352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA58F20726
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="M/A+xv+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA58F20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44a50bda;
	Fri, 7 Feb 2020 11:20:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed1cadf0
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 14:50:36 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b20d7897
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 14:50:35 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id CC74D2400FB
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jan 2020 15:50:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1579877434; bh=kIYi9RHMdobjsL8qfUrT0NEkW53nadnsvaotzbgoNYc=;
 h=To:From:Subject:Autocrypt:Date:From;
 b=M/A+xv+rtGOk7Ejx14m6PSXElBW1/EK3QVCIHIh8eMZIJX5Y3Cr7C9qLhxJdx+xnz
 4MVNa/uL/PoS1g0r78HMJotwbtdU+4gzr0RBTDofS7Fd/eMaHgBJpFAJPn5jNyo+TP
 rPP/UstktxNOm8Q46MdLWgh2IHVV9qmcyySv0rgzt+OmkIVY0ngu3zNdtUdDnczSeX
 4ijo6+Q6jH3TN9rbTWT9lP+XWW+u1EsRxGpKd/yFl1Pl4NEuNn0dljFnj/etZvcuBr
 oz9EeaPm2eQQwd2oWklHHEMJUt2CXFyB0YxUG3dW3qiHeJyGSHay41omqAq3fGib5M
 zulWfwAI5hfZw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4842BL1KFPz9rxK
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jan 2020 15:50:34 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Nicholas Joll <najoll@posteo.net>
Subject: Building module on Mint on 5.4 kernels: fatal 'make' errors
Autocrypt: addr=najoll@posteo.net; keydata=
 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
 zFGtRdvejg==
Message-ID: <7bd93b7f-adef-e1b7-252b-1616914a6e4f@posteo.net>
Date: Fri, 24 Jan 2020 14:50:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 07 Feb 2020 12:20:37 +0100
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

Apologies if this has been covered somewhere before.

I have Mint 19.3 Cinnamon, which is based upon Ubuntu 18.04.3 LTS (Bionic Beaver). The last few weeks have seen multiple updates to Wireguard arrive for that system. However, a problem has persisted through those updates. To wit: the Wireguard module will not build on kernels >= 5.4. Rather, I get these errors (the following being a link to the make.log):

https://app.box.com/s/nnr5vpeookt4ea3b6mho0ktyptp5fa0p

With kernels < 5.4, everything works.

I have wireguard-dkms 0.0.20200121-wg2~18.04.

Yours

NJ

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
