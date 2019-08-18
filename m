Return-Path: <SRS0=gx67=WO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD232C3A589
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Aug 2019 14:23:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C14A420851
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Aug 2019 14:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="hOFs/KwE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C14A420851
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73c5a634;
	Sun, 18 Aug 2019 14:22:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43ca73ad
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Aug 2019 14:22:57 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ce1c097
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Aug 2019 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=m+vbK9dQ4VeeEpfqLxV7STM5Ukm77I3A4/dRk6q87Vk=; b=hOFs/KwEzFKd7sb1TgAe2otFQ1
 HMO8YckUqu5+af6/SOuiaSclAc+grdttf5J5TkOjAw13sVTRRMOD9vdn1sc/b38879kYNMeA/RgEd
 8uxdvAQRoiwIT6adDssb/YSAI3cdpsUopSm4rzos8o/nsH+LmZPN4OCl+M+2aKsE1g9s27Q50Knsl
 SdI2g9n8XpTwjyV/+0QPaAhxoaL6OsHUEACr5ZkjPOBBqb25uoe9cZuS2i1IUizfAXAoHbcksh8rX
 No7kFrIE9LW/dPZ7rC1RoYZmER+3iJRd4SVNB0Ayzxh4H5NuBn+5y1sGzgGWKdO/goppGEL/b9jGr
 vucXq/MjbUsqtcGsDZzcOUioUvOhJjnQFfxGsT3HPhhwSJcILQv3SgCqO/ZTx3q28anTMh6RYjVuB
 BUEhp1y9ZAOrb9yp5KpXeR0S7OL0VeSYptp+2bSPXSyJ1s9I7VtXlYj03S8aWSA1fkWpGYm+3ASiS
 9C+tGsrrxvhxu0ROeDb4QCOV3X5RnWRap91v39ukMBQ1YfDTWnqVlCVGqO0V6ZKuHa3scyc8pMPIG
 Yg7TCUUJnws35jMfSma5lNpWkjRg3XWMMBkPunUhcr2OR8w4WfLN3h1+vRovnNTwfku/tVWy5a5v6
 Kx9FAmqfnMA/za4lgpnERLT98TghLD5z98EjzeZIk=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1hzM56-0003ge-FC
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Sun, 18 Aug 2019 16:22:54 +0200
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: Support FIDO2/CTAP2 security tokens as keystore
Message-ID: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
Date: Sun, 18 Aug 2019 16:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

currently the private key ist stored on HDD which is quite insecure.
I suggest to support FIDO2/CTAP2 security tokens as keystore (see 
https://en.wikipedia.org/wiki/Client_to_Authenticator_Protocol).

Have Phun,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
