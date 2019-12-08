Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2B0C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 10:59:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412D920726
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 10:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 412D920726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=thalheim.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df129269;
	Mon, 9 Dec 2019 10:59:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1040c5d0
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 13:20:20 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [IPv6:2a01:4f9:2b:1605::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7162b37
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 13:20:20 +0000 (UTC)
Received: from turingmachine (unknown
 [IPv6:2a02:c7f:8c8c:9300:2db1:2744:fd1c:7880])
 by mail.thalheim.io (Postfix) with ESMTPSA id 98F10566294
 for <wireguard@lists.zx2c4.com>; Sun,  8 Dec 2019 13:20:17 +0000 (UTC)
References: <20191203165130.52f438ba@schienar>
User-agent: mu4e 1.2.0; emacs 26.3
From: =?utf-8?Q?J=C3=B6rg?= Thalheim <joerg@thalheim.io>
To: wireguard@lists.zx2c4.com
Subject: Re: wg-quick nft instead of iptables
In-reply-to: <20191203165130.52f438ba@schienar>
Date: Sun, 08 Dec 2019 13:20:13 +0000
Message-ID: <87zhg3ymwi.fsf@thalheim.io>
MIME-Version: 1.0
Authentication-Results: mail.thalheim.io;
 auth=pass smtp.auth=joerg@higgsboson.tk smtp.mailfrom=joerg@thalheim.io
X-Mailman-Approved-At: Mon, 09 Dec 2019 11:59:26 +0100
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


Have you tried if iptables-nftables-compat (might have different names,
depending distribution) works for the rules used in wg-quick?
Its a wrapper that translate iptables rules to nft transparently
by providing a iptables executable.


Julian Wollrath <jwollrath@web.de> writes:

> Hi,
>
> with the newest snapshot wg-quick unfortunately requires iptables while
> I only have nftables installed. The attached diff handles the rules
> with nftables instead, maybe somebody finds it useful. The small caveat
> is, that the rule deletion might not work for everyone.
>
>
> Cheers,
> Julian

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
