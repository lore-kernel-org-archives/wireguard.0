Return-Path: <SRS0=nrw4=K4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D97C47083
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jun 2021 12:11:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB0661168
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jun 2021 12:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FB0661168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=clodo.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4282c7eb;
	Wed, 2 Jun 2021 12:11:14 +0000 (UTC)
Received: from clodo.it (ec2-52-29-208-32.eu-central-1.compute.amazonaws.com
 [52.29.208.32])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b318dfd9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jun 2021 12:11:12 +0000 (UTC)
Received: from [10.123.0.130] (ip-85-42.sn2.clouditalia.com [83.211.85.42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by clodo.it (Postfix) with ESMTPSA id 2AD9460444
 for <wireguard@lists.zx2c4.com>; Wed,  2 Jun 2021 12:11:12 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Fabrizio Carimati <wireguard@clodo.it>
Subject: Windows embeddable-dll-service, avoid default routes
Message-ID: <d9aba275-727e-9028-e42c-01cd0a059e20@clodo.it>
Date: Wed, 2 Jun 2021 14:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Language: it
Content-Transfer-Encoding: 7bit
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

I need to open a tunnel without route all traffic, only specific
multiple subnets.
Under Linux or macOS, i use 0.0.0.0/0 as AllowedIPs and after i create
my specific routes (i don't use wg-quick).
It's correct that routes are outside the scope of WireGuard, imho.

But embeddable-dll-service create a 0.0.0.0/0 metric 0 route, how i can
avoid it (apart remove it after...)?

Thanks
