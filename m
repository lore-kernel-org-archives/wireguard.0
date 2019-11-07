Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D12C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB3620678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="fcsW97tV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB3620678
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de6bcdb1;
	Wed, 27 Nov 2019 09:04:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5144ebcb
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 02:38:41 +0000 (UTC)
Received: from pv50p00im-ztdg10021901.me.com (pv50p00im-ztdg10021901.me.com
 [17.58.6.55])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38552e84
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 02:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1573094319;
 bh=F2L1379QoafA4KTSE9E+xxJmGyst2H7Z37vW1aSI7Q4=;
 h=Content-Type:From:Subject:Message-Id:Date:To;
 b=fcsW97tVuTKHghKCglicDYaj/ClHTYcCzG1NqXh1AvIJB6puuovsc6wIJBmB+mJH/
 4pt+huPyIrIQCQuJ23MKTC8mL6mpGWw9pgwKUEyvuivwp/IPT6dpF45haziROUY53x
 Yxh/dEvJo90UHwz584/y07fOknajjfrGgJxHLrchTufzYNxu+S9OI8uf4CFhDR5mfN
 paKu+/99VrslEMpiDo/74UYY06CrK7bdyRnSb/bI0rijy4C2c8+qGjJdiamN0ntE0x
 8W6ySbGFMk8CPWccIfd1OOskw4prmdBZU4/9+D5xwtFl2dFERjSLmg4flba8FY7obB
 IbKJuIOTpv84g==
Received: from [192.168.8.100] (unknown [180.217.73.173])
 by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id B4E5B88066F
 for <wireguard@lists.zx2c4.com>; Thu,  7 Nov 2019 02:38:39 +0000 (UTC)
From: =?utf-8?B?5b6Q5ZWf6ICA?= <birdman_hsu@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Possible to add to allow importing xml file with multiple tunnel
 configurations
Message-Id: <BC5A60FB-A4C4-4713-B82B-C13566102147@icloud.com>
Date: Thu, 7 Nov 2019 10:38:37 +0800
To: wireguard@lists.zx2c4.com
X-Mailer: iPad Mail (17B84)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-06_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=568 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911070027
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:04:23 +0100
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

Hi!

Is it possible to add to allow importing xml file with multiple tunnel configurations?

Currently, we can import multiple tunnel configuration with zip file containing multiple individual conf files.

But it is not easy if there is many tunnels to handle.

If all tunnel configurations can be put in one xml file, then it is very easy to edit / change for distribution.

Kindly consider this possibility in the future release of WG clients.

Thanks/Br, 

Birdman Hsu 

Sent from my iPad Pro 10.5!

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
