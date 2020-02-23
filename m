Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01212C35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 07:28:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4675206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 07:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4675206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17e8a57b;
	Sun, 23 Feb 2020 07:25:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c60de09c
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 07:25:11 +0000 (UTC)
Received: from home-imac.localdomain (ca163152.hicat.ne.jp [202.95.163.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9d22821
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 07:25:10 +0000 (UTC)
Received: by home-imac.localdomain (Postfix, from userid 501)
 id 947E827B6EA8; Sun, 23 Feb 2020 16:28:22 +0900 (JST)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-android] Japanese translation: Change "Deselect All"
 to "Toggle All".
Date: Sun, 23 Feb 2020 16:26:45 +0900
Message-Id: <20200223072644.92645-1-tanioka404@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
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

SmFwYW5lc2UgdHJhbnNsYXRpb24gY29ycmVzcG9uZGluZyB0byBjb21taXQ6IGIzZWJmY2QyMDM1
ODkzYTFjMjU0Zjk2MDdlNjIyNjNlZTgwNGJmZDYKClNpZ25lZC1vZmYtYnk6IEVpamkgVGFuaW9r
YSA8dGFuaW9rYTQwNEBnbWFpbC5jb20+Ci0tLQogYXBwL3NyYy9tYWluL3Jlcy92YWx1ZXMtamEv
c3RyaW5ncy54bWwgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy1qYS9zdHJpbmdz
LnhtbCBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLWphL3N0cmluZ3MueG1sCmluZGV4IDIwNDRm
NGIuLjI5MjBkMTUgMTAwNjQ0Ci0tLSBhL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLWphL3N0cmlu
Z3MueG1sCisrKyBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLWphL3N0cmluZ3MueG1sCkBAIC02
Niw3ICs2Niw3IEBACiAgICAgPHN0cmluZyBuYW1lPSJkYXJrX3RoZW1lX3N1bW1hcnlfb24iPuOD
gOODvOOCr++8iOWknOmWk++8ieODhuODvOODnuOCkuS9v+eUqOS4rTwvc3RyaW5nPgogICAgIDxz
dHJpbmcgbmFtZT0iZGFya190aGVtZV90aXRsZSI+44OA44O844Kv44OG44O844Oe44KS5L2/55So
44GZ44KLPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJkZWxldGUiPuWJiumZpDwvc3RyaW5n
PgotICAgIDxzdHJpbmcgbmFtZT0iZGVzZWxlY3RfYWxsIj7jgZnjgbnjgabjga7pgbjmip7jgpLo
p6PpmaQ8L3N0cmluZz4KKyAgICA8c3RyaW5nIG5hbWU9InRvZ2dsZV9hbGwiPuOBmeOBueOBpuOB
rueKtuaFi+OCkuWIh+OCiuabv+OBiDwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZG5zX3Nl
cnZlcnMiPkROUyDjgrXjg7zjg5A8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9ImVkaXQiPue3
qOmbhjwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZW5kcG9pbnQiPuOCqOODs+ODieODneOC
pOODs+ODiDwvc3RyaW5nPgotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
