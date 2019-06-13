Return-Path: <SRS0=vkhh=UM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12121C31E45
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2019 09:41:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0541721473
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2019 09:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="MMK7CKgY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0541721473
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20c3e962;
	Thu, 13 Jun 2019 09:40:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dc925fd
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 09:40:50 +0000 (UTC)
Received: from mx.0dd.nl (mx.0dd.nl [IPv6:2a04:52c0:101:921::25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78c6a3e6
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 09:40:50 +0000 (UTC)
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id 1210D6019F;
 Thu, 13 Jun 2019 11:40:48 +0200 (CEST)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="MMK7CKgY"; 
 dkim-atps=neutral
Received: from pc-rene.vdorst.com (pc-rene.vdorst.com [192.168.2.125])
 by mail.vdorst.com (Postfix) with ESMTPA id CDF7F1C30D06;
 Thu, 13 Jun 2019 11:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com CDF7F1C30D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1560418847;
 bh=zw7pqvhP2hSdBi81VtuSFqKCZjZLaNMoizFqcS5uiMM=;
 h=From:To:Cc:Subject:Date:From;
 b=MMK7CKgYeDkaD95Aq0Lel2WbL0eC8yykPDN+bvtn4rXKm08Humnn88jtU6GhB/uNI
 c2/7ktYmDXa6UzVp3f593eOldVvL6Zpj+MpUepiQAu0fUCrf6rWnmwLUKABRkFusx4
 NG5jSske7AT0mHrbhlHnJGUB16Wrj/bNOlVbTvT2DehDhmeQOwO/hQnD/pxUs2XGC5
 JuUfG4g9SneJ7ieqoewseZ94jalO5EvNj6ocMQqrp5LgSWEXNQwI1vZK46xxTwK/SD
 nhC9WFtUFm0xZHHy2OCL2DBjI4+KtmdymuXBaAYS8w7KlMwXbRwNRCl4xFNun53V19
 OjA/WUqHCD8tQ==
From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
To: Jason@zx2c4.com
Subject: [PATCH] timers: local_clock() is defined in linux/sched.h in kernel
 below v4.11
Date: Thu, 13 Jun 2019 11:40:16 +0200
Message-Id: <20190613094016.11992-1-opensource@vdorst.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Rml4ZXM6IDdhNzk0NTcyNTVkNSAgKCJnbG9iYWw6IHN3aXRjaCB0byBsb2NhbF9jbG9jaygpIikK
U2lnbmVkLW9mZi1ieTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+Ci0t
LQogc3JjL3RpbWVycy5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvc3JjL3RpbWVycy5oIGIvc3JjL3RpbWVycy5oCmluZGV4IGVmMTIwNTY5
MDkxNS4uM2FmMzI2MDU2ZjNkIDEwMDY0NAotLS0gYS9zcmMvdGltZXJzLmgKKysrIGIvc3JjL3Rp
bWVycy5oCkBAIC02LDcgKzYsMTEgQEAKICNpZm5kZWYgX1dHX1RJTUVSU19ICiAjZGVmaW5lIF9X
R19USU1FUlNfSAogCisjaWYgTElOVVhfVkVSU0lPTl9DT0RFIDwgS0VSTkVMX1ZFUlNJT04oNCwg
MTEsIDApCisjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KKyNlbHNlCiAjaW5jbHVkZSA8bGludXgv
c2NoZWQvY2xvY2suaD4KKyNlbmRpZgogCiBzdHJ1Y3Qgd2dfcGVlcjsKIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
