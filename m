Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13BDC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B3F206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="kbTbJDxz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B3F206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kapsi.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a571fd46;
	Mon, 9 Nov 2020 22:40:16 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [2001:67c:1be8::25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2747795a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 1 Nov 2020 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ES6uDs8xKb+g+CRgBN8B6Ud8N8VD2QH88rAh57Z+dZ8=; b=kbTbJDxz4KH4N70xF8hTUpC8If
 RKmXVQNzV4jzCKjk6OIwocgJUvnbZKl1iaqcP6shL1dMqcTkcPZqThdS4I7E4+kanNYhHbZ7+uNY3
 heRBp+uDaKtDWUiYVgzTeYwY5k6fhD1xXeSpWvKXmFa9ANO/Wesq10ZS+TViPOfli32sB6rKrpque
 RJYKzEQE+msa6okVIajpXoreEyS938Ro4Kh4CB045ueAzwLQVU+nfu9wmwzeN7Gp8r1erNKBze41B
 Raemhn81SqqlA4rBor4A7Ywe9ffaw/1x2e1eNp7ql/ix6BjG2KtMltZnIxfPanVFcNV5KEip/A4qA
 ztSRe5Jg==;
Received: from [2001:67c:1104:fa0:bcc2:a108:9d06:791d] (helo=[IPv6:::1])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <samip537@kapsi.fi>) id 1kZIGa-0002us-DE
 for wireguard@lists.zx2c4.com; Sun, 01 Nov 2020 20:39:48 +0200
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Skyler_M=c3=a4ntysaari?= <samip537@kapsi.fi>
Subject: [EdgeRouter] PtP links using /32 subnet mask
Message-ID: <dfeff1eb-47a9-32ad-ac6b-6d6cc231df5f@kapsi.fi>
Date: Sun, 1 Nov 2020 20:39:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Antivirus: Avast (VPS 201101-4, 01/11/2020), Outbound message
X-Antivirus-Status: Clean
X-SA-Exim-Connect-IP: 2001:67c:1104:fa0:bcc2:a108:9d06:791d
X-SA-Exim-Mail-From: samip537@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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

Hi there list,

Does anyone know how can I achieve this configuration in EdgeRouter?
Like how do I tell it what the peer address actually is?

wg0.conf:
-------------------------------------------------------------------------------------------------------------------------------
[Interface]
PrivateKey = <snip>
#Address = 172.22.114.96/32,fe80::22b:42ff:42bb:3db0/64
PostUp = /usr/sbin/ip addr add 172.22.114.97/32 dev hel1_zotan_dn42 peer
172.20.177.35
PostUp = /usr/sbin/ip addr add fe80::22b:42ff:42bb:5db0/64 dev
hel1_zotan_dn42 peer fe80::4
ListenPort = 52341
Table = off

[Peer]
PublicKey = B+3QYRU5UqaWYAsKMfyk7wqDzsFZ31RluCakeXEVm2E=
Endpoint =  <snip>
PersistentKeepalive = 25
AllowedIPs = 0.0.0.0/0,fd00::/8,fe80::/64
---------------------------------------------------------------------------------------------------------------------------------

P.S I did tweak the interface script on EdgeOS so it allows duplicate
addresses.

