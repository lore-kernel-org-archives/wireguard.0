Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DC5C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C26820659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C26820659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frhoelzlwimmer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bf57e77;
	Sun, 5 Apr 2020 21:38:15 +0000 (UTC)
Received: from mail.frhoelzlwimmer.de (mail.frhoelzlwimmer.de [79.143.178.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc6aa6f3
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 17:52:12 +0000 (UTC)
Received: from [192.168.2.23] (p4FFEBC10.dip0.t-ipconnect.de [79.254.188.16])
 (Authenticated sender: ich@frhoelzlwimmer.de)
 by mail.frhoelzlwimmer.de (Postfix) with ESMTPSA id DD4194195587
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 18:58:17 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: =?UTF-8?B?Ri4gSMO2bHpsd2ltbWVy?= <git.ich@frhoelzlwimmer.de>
Subject: More advanced user configuration like SSH?
Message-ID: <adeb013d-5881-e113-b865-599a3c572fa5@frhoelzlwimmer.de>
Date: Mon, 16 Mar 2020 18:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:13 +0200
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

Dear all,


I would like to allow all of my colleagues to set up a wireguard VPN to
our servers.
We are managing our users (+ their SSH keys) via FreeIPA.
Is there a possibility to integrate Wireguard and FreeIPA authentication?

--------
In my dreams, wireguard could be used just like SSH:
"wg-quick user@wgserver.com"
with SSH-keys read from e.g. "~/authorized_peers" or some authentication
service.


Best regards,
Florian Hölzlwimmer

