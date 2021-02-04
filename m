Return-Path: <SRS0=DQwu=HJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B61C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Feb 2021 15:48:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA1364E43
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Feb 2021 15:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA1364E43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixigo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cca5e4a2;
	Sun, 7 Feb 2021 15:46:08 +0000 (UTC)
Received: from mail.aixigo.de (mail.aixigo.de [2001:67c:13b0:ffff::60])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 812a9eb3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Feb 2021 07:51:36 +0000 (UTC)
Received: from srvvm01.ac.aixigo.de (mail.ac.aixigo.de [172.19.96.11])
 by mail.aixigo.de (OpenSMTPD) with ESMTPS id b341507e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Feb 2021 08:51:36 +0100 (CET)
Received: from dpcl082.ac.aixigo.de (dpcl082.ac.aixigo.de [172.19.97.128])
 by srvvm01.ac.aixigo.de (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 1147pZHN2327055; Thu, 4 Feb 2021 08:51:35 +0100
From: Harald Dunkel <harald.dunkel@aixigo.com>
Subject: QR code is very useful, if its available
To: wireguard@lists.zx2c4.com
Message-ID: <0e968b54-d3c3-bc15-9139-e7e1b6b79138@aixigo.com>
Date: Thu, 4 Feb 2021 08:51:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at srvvm01.ac.aixigo.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Sun, 07 Feb 2021 15:46:06 +0000
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

Hi folks,

2 remarks about the very useful QR code feature:

* Too bad its missing on some platforms. All these road warrior
    laptops (Mac or Intel) do have a camera.
* Maybe it would be possible to support password protected QR
    codes? Not sure if such a thing exists at all.


Regards
Harri

