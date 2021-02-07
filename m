Return-Path: <SRS0=DQwu=HJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58789C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Feb 2021 15:45:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C0964E40
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Feb 2021 15:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C0964E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d607e1d8;
	Sun, 7 Feb 2021 15:45:30 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b4cd2bcd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Feb 2021 14:21:02 +0000 (UTC)
Date: Sun, 07 Feb 2021 14:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1612707661;
 bh=cUsYWIQqRyBCKn0RLAhtZj6ek+loFmXMKsN2MEUvdBU=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=gRu93WsAnf88uAvbPsJGW8+FVGUZBxzJiJNLMpU81j3dYDRmUtxoopGo5lMWFwz2E
 QyFbiB7hzC2Dg2puGb9YPgk30tY/tw0mftDDVM3/LXi7H4+qjV7/dT9US3xCsfZdIx
 a0ch76lHwwDs34asQQXT3zpBxMLdwojfV9RfGDJI=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: pg131072 <pg131072@protonmail.com>
Subject: Fw: Suggestion: Extended AllowedIPs syntax
Message-ID: <GTiw2RsJf2QRZPV5fdL0Ae5UH4u5SlycvoZJKMDbH4f7D7H7MFeNaIdNiMAcJRFZISYndJSaj-rQQIH0XhV7r1kJk3GkVH-7yiCkZeJQSCU=@protonmail.com>
In-Reply-To: <IVCtdT6g25RGmvC0J8IaIfgXll8aFl8QRaSYYN-fsGA40QXw2xuMVS39Ujnaq1bqqg6LoKRxyo80ZrV-yxoYIUSNXAZV_sWZhfdRj3QWPFo=@protonmail.com>
References: <IVCtdT6g25RGmvC0J8IaIfgXll8aFl8QRaSYYN-fsGA40QXw2xuMVS39Ujnaq1bqqg6LoKRxyo80ZrV-yxoYIUSNXAZV_sWZhfdRj3QWPFo=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 07 Feb 2021 15:45:29 +0000
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
Reply-To: pg131072 <pg131072@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I find the AllowedIPs CIDR format difficult to grok. What if Wireguard allo=
wed...

 +IP/mask - add a range
 +IP-IP - add a range
 -IP/mask - remove a range
 -IP-IP - remove a range

Multiple terms would be interpreted left to right

i.e.

AllowedIPs: +1.2.3.0/24 -1.2.3.1-1.2.3.10 -1.2.3.255

Example C++ code:https://pastebin.com/mCLCg5vr

Thanks

PG

Note: I originally posted to Reddit:=C2=A0
https://www.reddit.com/r/WireGuard/comments/lemdmv/suggestion_extended_allo=
wedips_syntax/


