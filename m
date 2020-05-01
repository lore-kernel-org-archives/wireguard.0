Return-Path: <SRS0=vxWX=6P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39F3C47256
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:56:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A6E2166E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="hb0Likxc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A6E2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f9de6c;
	Fri, 1 May 2020 21:44:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0fdb9231
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588370181;
 bh=XTgKHO3kiuTcSrIH+DGbig0OIsJj3MWF7rzkWvocSLY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=hb0LikxcQyHgm7zE+S2X5epc3R+/TwI1ZmxIowmbUduVnSUNF72tl5WXZWBdSKA3Y
 Upx97xKcsVmLiYa+T5KNrpQ8v4bWzh/p+x0PJmdzQiuSeIHJ0kXZAWxwGAIf+7DfzU
 EWTW3zAV4gopEB5AsJfJtelB+2epK+cM989AaB0o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([87.166.110.18]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSc1L-1jbbga3CHp-00SyXr; Fri, 01
 May 2020 23:56:21 +0200
From: Martin Hauke <mardnh@gmx.de>
To: wireguard@lists.zx2c4.com
Cc: Martin Hauke <mardnh@gmx.de>
Subject: [PATCH] systemd: add file wg-quick.target
Date: Fri,  1 May 2020 23:55:55 +0200
Message-Id: <20200501215555.9775-1-mardnh@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MdptGRz1g3p+akwm09s398AFBlyQeAznD373cRmrmXdt5hRIgoD
 HBl42CtVsr+mecFsStXmxKPz9vxnGbpIqDrtnZhy1X5lOJ97SbVxmVMn6lj8Y6R5OODmZrK
 jC5mCgujyi06ZlpRyplMSP7kzTjijI2tb2jTebvLIe18HpkOqLbQ8DTvLgDTkfd+35O5eSj
 Qi+MfjkE5msHITCbEOQoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j6v75F1pa1k=:39EEjaEx2cq5ckTxaL62cU
 WedyMsjepCXwmnNxPG6lumDy+rKzmh3udJTNaMyqhn7TpXapW8+Xeh7NZpLkfRXgPT+1pAJAK
 V4BcsKCOpnyLJq6fpscjRBfpVNfBmr4Ht7QfeeUpMRN8cZYWbGc7VXwppw0+AGt+r9kLXBeor
 0DC1oWloABIj6D+o55UKS4cWjOy4+D1UW8k8vKKkNyYJI03Tn0w31jlECY6JGpgwyviK0nW23
 +n7DmHNIDp8WkxOOqN701M2xkKFFXgyAM1mG1AuKz3TuZiAXiFl/7mCEDPQhF4UncnYAil5Dp
 qyNE7K3LLuenUJtF4rbyikaF82xw7Oubho6IRhuHlE1rAxKeGh1LIjQsEFHgI4IE/ekKFIsw+
 yeUC3QQlAgfO5BtMsINmlWKOL70TBUVR8ZT5ovZz9Ne5O6h6ngsJEUUpfw5FyXyT3baKNG6F7
 anrJlAScudv4jkmgpS2fBEEfOGelq4PGBgwIArtib1qSbY0eWJJrnh70+pA05Qi2XbO2VFak1
 /I59h1Q2Bty6eD94QE7cPBfZLIXmhG9VkAZ1crAw6/wxOd0JlZF1euPF9y83hK69w0PmSjcxE
 n7baH4ZdRhEYAR5TzYMs5kJZTFwyG5Womw/zp/LMnN4YZYxjwGauT9HdGdOPHewwzFIHm7CUF
 N+2bBLS5XTWmC5FUszhmJvLkVRZC8XoDTAn9fJbiv1tMwwi9UaYCCK/Zt5l4j5WDpPZkNwA0n
 xMApNt6ehCNO/xGGWULzH25eXnQg0/irSviFeQRQbYZJFcDEQpgo7q+ypFcbF4y6W/ithFp07
 0DZA2LIepMfQkquNVMZymg7pgY1YNPJOboiG/Or8rNUPD5XIXbjuhsqbnpGKF96dzjwvSeEtF
 kXI9orZobNC3QXKhuAYhHX3xT3EpOqC+TCdwnwsYcXPb8J4Nc0yIaDqqZFe4mzJCBwaf1ulNR
 B9gKn9n1mWfee7qYFVBuEmtN8ihnRV/wn19YjABosKi0Dq9OO8seyqcmjxcoTEafA3U+b3O94
 w2RR8z+QQjkbGD9Y9xdst/wMlXwHAsiGXHhRwIRokWvzZGooEIpB4qEiwkJeaTJSWctodRRz9
 J5TZ1aA4jWLt/qt/Qwvm5xO30cvhHOnetZPw7Itu9J+GF2BPh7J4xVNjZvTsqqlKS1NTH6juV
 F9K60hFePcr0Tc5N5+31VU8Zp6lbqAZJhxXIt8yrPAGbChn3iPiBK2yO6uFVMXbuk1nS2CHT2
 926NIGiYwVuMYcCtB
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

Add file wg-quick.target, which allows you to start/stop all
wg-quick@.service instances at once.

Signed-off-by: Martin Hauke <mardnh@gmx.de>
=2D--
 src/systemd/wg-quick.target   | 2 ++
 src/systemd/wg-quick@.service | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 src/systemd/wg-quick.target

diff --git a/src/systemd/wg-quick.target b/src/systemd/wg-quick.target
new file mode 100644
index 0000000..c209890
=2D-- /dev/null
+++ b/src/systemd/wg-quick.target
@@ -0,0 +1,2 @@
+[Unit]
+Description=3DWireGuard Tunnels via wg-quick(8)
diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index 7c5f9d1..a9cbb58 100644
=2D-- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -2,6 +2,7 @@
 Description=3DWireGuard via wg-quick(8) for %I
 After=3Dnetwork-online.target nss-lookup.target
 Wants=3Dnetwork-online.target nss-lookup.target
+PartOf=3Dwg-quick.target
 Documentation=3Dman:wg-quick(8)
 Documentation=3Dman:wg(8)
 Documentation=3Dhttps://www.wireguard.com/
=2D-
2.26.2

