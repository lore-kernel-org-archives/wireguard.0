Return-Path: <SRS0=1inu=HO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E5C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Feb 2021 02:33:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52CB64E56
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Feb 2021 02:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A52CB64E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9cbb929;
	Fri, 12 Feb 2021 02:33:55 +0000 (UTC)
Received: from pv50p00im-ztdg10021901.me.com (pv50p00im-ztdg10021901.me.com
 [17.58.6.55])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56ce8127
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Feb 2021 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1613097232;
 bh=PQb9jRqs65XjD5QxIwD+6ftL2Pq40/llHLPl8Ftqyc8=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
 b=d2AXPY0lhLOlXJmD+/XcF34TLehjj546RtiFt8vOTIikvkirhe+vt6zVJq7OcPYNd
 vvqx7weFgJwFCBdFonXdQ/O6WEIpOJe1U/pvkoE8f/GKcnEa+7DUecFi744mjFIssP
 +p7I8O/ZBUcZPZUPgzPNitZPWaVXTTaZJm90g90F8eut2Bt9Nk2RKTjpnS1oWJVjL1
 rRAMsBHE5D2a24Mf+vdrdm8GVYHXZtTDNa4NuONAIZlT6VbNA9yue0EHOvTRvZA4vo
 eGeDXtin47HvZTj7J+tcLu+I8QeOXlzvYgFuc/mckVvg+2MgBsl8kYCv47uR1+b+Tz
 jCgAqkzuTTJ4Q==
Received: from [192.168.1.103] (unknown [1.200.155.37])
 by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id 22CDA880594
 for <wireguard@lists.zx2c4.com>; Fri, 12 Feb 2021 02:33:52 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5b6Q5ZWf6ICA?= <birdman_hsu@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 12 Feb 2021 10:33:49 +0800
Subject: Possible to have direct download link for WireGuard macOS client?
Message-Id: <49FB35F7-ABFB-4AE3-AEB2-EB7A0B76AC55@icloud.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPad Mail (18D52)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=562 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102120018
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

As many users in China, there are some difficulties downloading WireGuard ma=
cOS client from Apple App Store, wondering if there are some direct links ab=
le to download it?

Thanks/Br,=20

Birdman Hsu=20

Sent from my iPad Pro 11!=
