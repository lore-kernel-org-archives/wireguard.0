Return-Path: <SRS0=dwaG=VA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6099C0650E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Jul 2019 16:55:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DCA21882
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Jul 2019 16:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kent-dobias.com header.i=@kent-dobias.com header.b="DQZF3B1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DCA21882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kent-dobias.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21168319;
	Wed, 3 Jul 2019 16:55:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f9a5db6
 for <wireguard@lists.zx2c4.com>; Wed, 3 Jul 2019 16:54:58 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com
 [IPv6:2a04:52c0:101:4a2::8de9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id debacf8f
 for <wireguard@lists.zx2c4.com>; Wed, 3 Jul 2019 16:54:58 +0000 (UTC)
Received: from [192.168.1.2] (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPSA id AC1D09D44
 for <wireguard@lists.zx2c4.com>; Wed,  3 Jul 2019 12:54:56 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kent-dobias.com;
 s=dkim; t=1562172896;
 bh=ziA0HAPPiMgfcah/UqiLdK55E1jGBdiuhOj5lRQGbgk=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=DQZF3B1rGVRjzJzriQC6XkRGLSXeOnfdWZmqG2snqzJPW1fsDA0utiAkud+hXz7mg
 e8vWZxn3fFJboGajXaX+TxLruHHvjZOPGT4HLzyn+eVoVFyI821b21ANNRs5WSahWM
 3QqMat0uqtk3J+FjJJW22Y0tHDqdPkv0sKU1qF2U=
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20190702` Available
To: wireguard@lists.zx2c4.com
References: <59eba07cc65097ac@frisell.zx2c4.com>
 <a54fa617-96a4-8b3b-2c34-3046c61c82a9@kent-dobias.com>
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
Openpgp: preference=signencrypt
Message-ID: <8d85242a-3162-7ddb-c1b5-14fb7884cf5f@kent-dobias.com>
Date: Wed, 3 Jul 2019 12:54:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a54fa617-96a4-8b3b-2c34-3046c61c82a9@kent-dobias.com>
Content-Language: en-US
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

On 7/3/19 12:42 PM, Jaron Kent-Dobias wrote:
> The kernel source is here [2].
> 
> [...]
>
> [2] https://github.com/boulzordev/android_kernel_motorola_msm8937

Sorry, wrong kernel, it's this one:
https://github.com/boulzordev/android_kernel_motorola_msm8953

Jaron
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
