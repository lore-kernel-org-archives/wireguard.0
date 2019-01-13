Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834E4C43444
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9D920657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samcater.com header.i=@samcater.com header.b="nVntn2l7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9D920657
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=samcater.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04e02025;
	Wed, 16 Jan 2019 16:32:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0559a678
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Jan 2019 22:22:48 +0000 (UTC)
Received: from dazzle.samcater.com (dazzle.samcater.com [188.166.8.167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4c7b128
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Jan 2019 22:22:47 +0000 (UTC)
Received: from dazzle.samcater.com (dazzle.samcater.com [127.0.0.1])
 by dazzle.samcater.com (Postfix) with ESMTP id 731A8202AD
 for <wireguard@lists.zx2c4.com>; Sun, 13 Jan 2019 22:26:37 +0000 (UTC)
Authentication-Results: dazzle.samcater.com (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=samcater.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=samcater.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:to; s=dkim; t=1547418396; x=
 1548282397; bh=S6O1egO5IWYAxtne/6hwqTcLMIv1skJxC5qyTDu/QYA=; b=n
 Vntn2l7HxjjUXbz5L4dLAfObX4UcMyFSinLNtOgdHJVFszG+0bO8kTTlD5O+R1Pm
 RkXmCfHVXwIIgj4KGnVC1G+SIwdrWsq6eheemFy9SEKFODbbL6Zd84J++X+ycob5
 VbSYnwx1eJqqUgACQ+b4ScJ6r6v3Wf8laJfuNnxIeY=
X-Virus-Scanned: Debian amavisd-new at dazzle.samcater.com
Received: from dazzle.samcater.com ([127.0.0.1])
 by dazzle.samcater.com (dazzle.samcater.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id RhHzCrFT3JIA for <wireguard@lists.zx2c4.com>;
 Sun, 13 Jan 2019 22:26:36 +0000 (UTC)
Received: from [192.168.0.101]
 (host81-154-47-208.range81-154.btcentralplus.com [81.154.47.208])
 by dazzle.samcater.com (Postfix) with ESMTPSA id 906252029F
 for <wireguard@lists.zx2c4.com>; Sun, 13 Jan 2019 22:26:36 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Sam Cater <sam@samcater.com>
Subject: Cannot compile Noise.c on Kernel 5.0?
Openpgp: preference=signencrypt
Autocrypt: addr=sam@samcater.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e52ae637-f85b-139d-84c6-29de2db5383e@samcater.com>
Date: Sun, 13 Jan 2019 22:26:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 16 Jan 2019 17:32:07 +0100
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

Hi Wireguard Mailing List,

Probably going to be showing a lot of ignorance here!

Wireguard has run fine on this system in the past, but today I tried to
build 20181218 on self-built 5.0 kernel (which in and of itself seems
stable and working fine). The compile fails on src/noise.o with the
issue linked below on line 453.

If I switch back to the stock 4.19 kernel provided by Fedora then
everything compiles fine. It's also worth mentioning that the same issue
appears to happen when I install the COPR packages for Fedora.

Appreciate I'm a non-standard kernel but just in case it is a Linux 5
incompatibility rather than "I can't build software", I thought I'd post
here in case it was helpful.

Mini paste at: https://pastebin.com/raw/W4LRT5bx


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
