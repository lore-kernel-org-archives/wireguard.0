Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18AFC33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DAA3206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DAA3206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frhoelzlwimmer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e19fea69;
	Thu, 30 Jan 2020 01:53:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed7f4153
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 01:36:26 +0000 (UTC)
Received: from mail.frhoelzlwimmer.de (mail.frhoelzlwimmer.de [79.143.178.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25f6abf4
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 01:36:26 +0000 (UTC)
Received: from [192.168.2.82] (p4FFEB7A1.dip0.t-ipconnect.de [79.254.183.161])
 (Authenticated sender: ich@frhoelzlwimmer.de)
 by mail.frhoelzlwimmer.de (Postfix) with ESMTPSA id 69A9F3BDE20C
 for <wireguard@lists.zx2c4.com>; Thu, 26 Dec 2019 02:36:25 +0100 (CET)
To: wireguard@lists.zx2c4.com
References: <fce676c6-2710-5def-15ed-e71919b39489@viisauksena.de>
Subject: Re: [WireGuard] Pull-based peer configuration
From: =?UTF-8?B?Ri4gSMO2bHpsd2ltbWVy?= <git.ich@frhoelzlwimmer.de>
Message-ID: <0074cc92-905f-af15-4e47-91a5b46c2e9a@frhoelzlwimmer.de>
Date: Thu, 26 Dec 2019 02:36:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fce676c6-2710-5def-15ed-e71919b39489@viisauksena.de>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,


are there any updates on this?

I searched for a possibility to connect WireGuard to a per-user 
authorized_key store.
Optimally, it would work like SSH, i.e. the client executes `wg connect 
user@server.org -i ~/.ssh/id_rsa`.
The server then runs some user-space daemon to check whether the 
client's `~/.ssh/id_rsa.pub` is listed in the server's 
`~user/.ssh/authorized_keys` file.

Another use case would be to have a database of public keys (e.g. 
FreeIPA) which the user-space daemon checks for the client's public key.


Best,
Florian

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
