Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5698EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 16:51:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B6220882
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 16:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="TcQPalnc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B6220882
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f62361a7;
	Thu, 27 Dec 2018 16:49:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0beb5abe
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 16:49:50 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 641a5fbb
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:To:Subject:From:content-disposition;
 bh=AplOQySAfyjV26atpqMDvDBPuzW2TybmEvwF4WXbcN4=; b=TcQPalnctknYt5HNNBDqCYqFbT
 KaZr9Nga/RFUaSZjS9712IIaP1cxEWB36IDRYqBVnlDAzzOu6/MDTojg38M7+WuBB2pZCgYZZC3mh
 0dOa0Ogwjg1ntC3KT6/wTIqPdqcmc2RBVObS4yFLYghQsVNONBJxqNgEsTb84KftSTWyHYilODjvB
 fFJCfau7K6UZGfbRmBEzlG1TVf+msXpj6diNwpMI7v2whcXE4YP7GwowmJaBbD0Wqklr6IgstMmTn
 H5bG2HXEIZv8NIlWgExZyz/lZKAWhc2WzvjfCRKhIqj8qdUcKLbRBtSuCGeTkY0Mn4LqzhuOx8lMA
 TNS86ofo32iKwsxKnfDv+EBRCbU9f7rMseusvsx8dwKpet6ss6bb2n1TGChETtacUCSy1uSOty04W
 WapO+BrnNgTdnmswF60uopE2KGIBUEgjVu0gF8qSkXRdYdYXGoy5UAVa2tcI58AaUlMeimEBs/ubn
 LKuw3Dv4pnG22C512YwmipboxqUVE3aV1GE4/2yE9u4jVoMqSKwaX7wRnc+QVbNA2k34pJtJo7CRI
 YqYtsyBiqcdK/DlGMvZhSV4BguiD3cacB5lGq64l02eYVfmfHUxRWmlAFPenLQa/48olKKrPBojyR
 +xM4b9hqFmNvQQdJBIBSb5ylbSANXVpx8rm2qP7vY=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gcYsY-0004r5-FN
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Thu, 27 Dec 2018 17:51:27 +0100
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: wg-quick: Read private key from file?
To: wireguard@lists.zx2c4.com
Message-ID: <c522bb63-f64a-6622-0966-7a4c3b936cf9@bartschnet.de>
Date: Thu, 27 Dec 2018 17:51:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: de-DE
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

does wg-quick allow to read the private key from a file instead of a .conf-file?

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
