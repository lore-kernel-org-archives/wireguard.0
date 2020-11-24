Return-Path: <SRS0=bcN2=E6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD614C63777
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 16:49:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D94206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 16:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=reaktor42.de header.i=@reaktor42.de header.b="ZErZgLf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D94206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=reaktor42.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caa421f0;
	Tue, 24 Nov 2020 16:43:31 +0000 (UTC)
Received: from mail.mader.cloud (mail.mader.cloud [91.132.147.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e00d85a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Nov 2020 11:07:54 +0000 (UTC)
Received: from [192.168.2.125]
 (dynamic-077-006-062-170.77.6.pool.telefonica.de [77.6.62.170])
 by mail.mader.cloud (Postfix) with ESMTPSA id 0CD35A49F3
 for <wireguard@lists.zx2c4.com>; Tue, 24 Nov 2020 12:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=reaktor42.de;
 s=dkim; t=1606216404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5/LbP8hB1QtfO6T/HJHlY494HyFvto88+Gygr+od9eI=;
 b=ZErZgLf/vg4/oDrYJWEWr14RVWqG31YLGnlAVfAe1dzGcqHavcKXGJaOZ5rrxMkR+LOlWc
 Due1+gCwMnMg6HHXJq3M7dXt6iMBSLJ0urqrNmtADWME5erOaSl0FVA2MaBrxDxPe8zrC+
 7UxuNnCor6ZlvMk78lrNoUcotJlORfAZkIcdOXFfx6ODzdLZxgTn1lj322KYUHoLGVakoi
 jGxciifQ47KjXZ8oGrBCQUUGb5ztnHd1tjh3RZXQZWCeDWssQsVrHBsF6Eu7uU1A8L0MY4
 ZqRrcbmJCv1LdP5f8KfH0PcZkuLMbfpRkvOq3DI89yIUGTZv7wy+b3jVKcLONg==
From: Alexander Oliver Mader <b52@reaktor42.de>
To: <wireguard@lists.zx2c4.com>
Date: Tue, 24 Nov 2020 12:13:22 +0100
Message-ID: <175f9f54450.2783.9fcf5f5c3f289b330baff283b85f7705@reaktor42.de>
User-Agent: AquaMail/1.27.1-1714 (build: 102700006)
Subject: Android app: Opt-in feature to refresh server DNS names before
 reconnecting
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.mader.cloud;
 auth=pass smtp.auth=b52@reaktor42.de smtp.mailfrom=b52@reaktor42.de
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:43:31 +0100
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

Hej,

I'm not sure whether my problem (which I guess many people have) can be 
solved without adjusting the Android app. Hence, the following question.

My current setup involves a Raspberry Pi running wireguard in my LAN with a 
daily changing WAN IP. Thus, I connect to my RPi via a Dynamic DNS address, 
which is automatically updated after each forced disconnect of my ISP.

I use the Android app with the "always on" option, but wireguard fails to 
properly reconnect to my RPi after the DDNS changes.

Is there already a solution in place to maintain a continues connection in 
this kind of scenario?

If not, would you be willing to accept patches to resolve this? If so, what 
would be an acceptable adjustment?

Sincerely, Oli


