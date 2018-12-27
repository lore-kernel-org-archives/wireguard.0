Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A4EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 16:20:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E90206A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 16:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="f4iFV239"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E90206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a5af7d5;
	Thu, 27 Dec 2018 16:18:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543d2e1a
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 16:18:26 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 576238fd
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=smgk3IXNRuA+zMjh04yYoMwbPkOW8tnPvtpAyhlgmE0=; b=f4iFV239wYIVh4hu70f2rI1isY
 p2heET0bOOsXFMDNt686PqwxBglE1HB2XGLZscT/fwFv9uHq5P2zI5rExmENh4qTaDPxOOWiLimg9
 eAAQfbDC5zHkMSNGgESnyxaqy79ZmeNlkIzlLPoVACEWLFQHSOq4t7ZNhU4ns9+U13BeaCN51GY4H
 f4eRwnhiWSPaSfafTS6UCZGji9oWNhXtQJyY5arLd3TVcQK51RFjvJuMY52t4bqcsLuvxLw6Pfchb
 ps6VdnxAREJwNbKPHpuKas4Q/JcTKhwp8yp6DdKiP12RiX2FBoLT+cki8hvNaRAWCKszkr+NCAbYv
 UuRkPvPCczMRZoPaagpfz4MT8b4vBQwNL4E0enAIdLdgJwOlAD0koDEJuuVb63rwK0A1UUFLYgbqy
 If4ULUEIs7cknYCep7sv8+jjdV78OFoADw0yjtV5NW0E+f6U72j6ZgdK+aL1ZhtJ8rS8GcT8o6CEq
 A680hIFkexUFbaUiVkko9Ht7PUSpiHWcJUcEVpdrMcmYL0jPgk3KIodJfRLoYacfbUiYPu00kFf1k
 OL+Wr8XN7G+6n52i1nuTo5kegKgz+cAvrMhlOZ1bo75VBy06cYoQOFKWAre0h/LKNVs7MYfx6GE3o
 q1Ftnzx9i/LTcON7Eduw8icmJxLINaEmAQopn1NfM=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gcYO8-0003hk-6q
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Thu, 27 Dec 2018 17:20:01 +0100
To: wireguard@lists.zx2c4.com
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: wg-quick: Separate files for interface and peer definitions?
Message-ID: <5c712311-26d6-f2e2-d941-aec6881b67e9@bartschnet.de>
Date: Thu, 27 Dec 2018 17:19:56 +0100
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

we want to distribute the same file with peer definitions to all Wireguard peers.

Is there any way in wg-quick to use one configuration file for the interface definition and another file for the definition of peers?


Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
