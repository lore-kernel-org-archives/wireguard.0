Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A58C35DEA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94C62072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="akWeDGH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94C62072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vip.qq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b70d6d7;
	Tue, 25 Feb 2020 00:43:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdf1f20e
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 11:09:56 +0000 (UTC)
Received: from qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e9baf73
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1582456387; bh=gcEsvo1pK//HSD0D5AnJ+eDwC+fRG6paBf2Q1Fde62c=;
 h=From:To:Cc:Subject:Date;
 b=akWeDGH4SeRKDQZk7thkKbAez3xebBLa5JVArmyCbdGE32FoGvEDIaRi17dznB3QN
 UAqyFUll2lipGywISmYsEkBmEIkJ/cnPRPvIqX5A9n3R7bhKRQVOAmNC68YLwnXqBp
 +RjMgq/aoF0dsCQ5kaVJ3PfEmibtz/zvH7wrTeiM=
Received: from localhost.localdomain ([240e:30c:203:c62a:40a7:e093:b857:6359])
 by newxmesmtplogicsvrsza2.qq.com (NewEsmtp) with SMTP
 id 3420A87C; Sun, 23 Feb 2020 19:13:02 +0800
X-QQ-mid: xmsmtpt1582456382tg11i2he1
X-QQ-XMAILINFO: OEADv/rmrvQh+IKeUto2RzPevo0ewYuL5i71drJIUorPHCuovriYIVGH2WNuwy
 x7oVjJJ/XWF6bkOr8iJXUUZEZXYLwIZFg4jL/50sQEpBMBiNL2cBlucesFiHGquepmr6OlsG/w7+
 zxzSetSwIFEBLE95HKmaWlLbTlfExzYvBKUS/LkpTETLpOmnQX8GcWvqDjoJmXVpNIMhoQf3aQ3U
 w+VcRy2WtDRJDgD++KrD0p5Mq4CVy83jggqhaKQ95X+iem5IUS2eb9MiingoblCS8/FRIJ6JvNPc
 bI0XDGv8cmj1u3KYYfCwCyYA9KY9H1B/xlQlZiuFDQz6G+xEbE8PuI5SXa1cyayn0yWlt2SuvnvO
 Xreg7knGOXCg8vZPnr1vjD/eDp4hBQBgPX6oJ2df/zMwyqxxTAyFXt8TZirqVwWTQtmgY0NyKp7/
 lj6VvN8gIHng7ZqCa4hUXu53rEp4YJXZj/JrvkBulNHtGCKjOdox0ZZeR5ZzLrQiF9l7qeZJ+bhX
 IzsRkb/9XL0vjcXh+yKkCsxdsqqMvoxq2yymO6/vPS+JG/jlE55HMvfo/VLqWAR0YsCwcd6sHn+e
 1JiHhQQVty6WWiwwMCJWVF2T1r+z+Fpf5Ld4b4q6WKtaF6wj2Qmg/r/Jjo
From: srb12345@vip.qq.com
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Update Simplified Chinese translation
Date: Sun, 23 Feb 2020 19:12:48 +0800
Message-Id: <20200223111248.1083-1-srb12345@vip.qq.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 01:43:43 +0100
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

RnJvbTogTGlsbGlnYW50TWF0c3VyaSA8c3JiMTIzNDVAdmlwLnFxLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IExpbGxpZ2FudE1hdHN1cmkgPHNyYjEyMzQ1QHZpcC5xcS5jb20+Ci0tLQogYXBwL3NyYy9t
YWluL3Jlcy92YWx1ZXMtemgtckNOL3N0cmluZ3MueG1sIHwgMTAgKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwgYi9hcHAvc3JjL21haW4v
cmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwKaW5kZXggMzM2MGRhZS4uOTdlODcxYSAxMDA2
NDQKLS0tIGEvYXBwL3NyYy9tYWluL3Jlcy92YWx1ZXMtemgtckNOL3N0cmluZ3MueG1sCisrKyBi
L2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnhtbApAQCAtMSwyMSArMSwy
NyBAQAogPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KIDxyZXNvdXJjZXM+
CiAgICAgPHBsdXJhbHMgbmFtZT0iZGVsZXRlX2Vycm9yIj4KKyAgICAgICAgPGl0ZW0gcXVhbnRp
dHk9Im9uZSI+5peg5rOV5Yig6ZmkICVkIOmhue+8miVzPC9pdGVtPgogICAgICAgICA8aXRlbSBx
dWFudGl0eT0ib3RoZXIiPuaXoOazleWIoOmZpCAlZCDpobnvvJolczwvaXRlbT4KICAgICA8L3Bs
dXJhbHM+CiAgICAgPHBsdXJhbHMgbmFtZT0iZGVsZXRlX3N1Y2Nlc3MiPgorICAgICAgICA8aXRl
bSBxdWFudGl0eT0ib25lIj7liKDpmaTkuoYgJWQg6aG5PC9pdGVtPgogICAgICAgICA8aXRlbSBx
dWFudGl0eT0ib3RoZXIiPuWIoOmZpOS6hiAlZCDpobk8L2l0ZW0+CiAgICAgPC9wbHVyYWxzPgog
ICAgIDxwbHVyYWxzIG5hbWU9ImRlbGV0ZV90aXRsZSI+CisgICAgICAgIDxpdGVtIHF1YW50aXR5
PSJvbmUiPuW3sumAieaLqSAlZCDpobk8L2l0ZW0+CiAgICAgICAgIDxpdGVtIHF1YW50aXR5PSJv
dGhlciI+5bey6YCJ5oupICVkIOmhuTwvaXRlbT4KICAgICA8L3BsdXJhbHM+CiAgICAgPHBsdXJh
bHMgbmFtZT0iaW1wb3J0X3BhcnRpYWxfc3VjY2VzcyI+CisgICAgICAgIDxpdGVtIHF1YW50aXR5
PSJvbmUiPuWvvOWFpeS6hiAlZCDpobnvvIzor7vlj5bliLAgJWQg6aG5PC9pdGVtPgogICAgICAg
ICA8aXRlbSBxdWFudGl0eT0ib3RoZXIiPuWvvOWFpeS6hiAlZCDpobnvvIzor7vlj5bliLAgJWQg
6aG5PC9pdGVtPgogICAgIDwvcGx1cmFscz4KICAgICA8cGx1cmFscyBuYW1lPSJpbXBvcnRfdG90
YWxfc3VjY2VzcyI+CisgICAgICAgIDxpdGVtIHF1YW50aXR5PSJvbmUiPuWvvOWFpeS6hiAlZCDp
obk8L2l0ZW0+CiAgICAgICAgIDxpdGVtIHF1YW50aXR5PSJvdGhlciI+5a+85YWl5LqGICVkIOmh
uTwvaXRlbT4KICAgICA8L3BsdXJhbHM+CiAgICAgPHBsdXJhbHMgbmFtZT0ic2V0X2V4Y2x1ZGVk
X2FwcGxpY2F0aW9ucyI+CisgICAgICAgIDxpdGVtIHF1YW50aXR5PSJvbmUiPiVkIOS4quaOkumZ
pOW6lOeUqDwvaXRlbT4KICAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im90aGVyIj4lZCDkuKrmjpLp
maTlupTnlKg8L2l0ZW0+CiAgICAgPC9wbHVyYWxzPgogICAgIDxzdHJpbmcgbmFtZT0iYWRkX3Bl
ZXIiPua3u+WKoOiKgueCuTwvc3RyaW5nPgpAQCAtMzgsNyArNDQsNyBAQAogICAgIDxzdHJpbmcg
bmFtZT0iYmFkX2NvbmZpZ19yZWFzb25fdW5rbm93bl9hdHRyaWJ1dGUiPuWxnuaAp+acquefpTwv
c3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iYmFkX2NvbmZpZ19yZWFzb25fdW5rbm93bl9zZWN0
aW9uIj7oioLmnKrnn6U8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9ImJhZF9jb25maWdfcmVh
c29uX3ZhbHVlX291dF9vZl9yYW5nZSI+5pWw5YC86LaF5Ye66IyD5Zu0PC9zdHJpbmc+Ci0gICAg
PHN0cmluZyBuYW1lPSJiYWRfZXh0ZW5zaW9uX2Vycm9yIj7mlofku7bmianlsZXlkI3lv4Xpobvk
uLogLmNvbmYg5oiWIC56aXA8L3N0cmluZz4KKyAgICA8c3RyaW5nIG5hbWU9ImJhZF9leHRlbnNp
b25fZXJyb3IiPuaJqeWxleWQjeW/hemhu+S4uiAuY29uZiDmiJYgLnppcDwvc3RyaW5nPgogICAg
IDxzdHJpbmcgbmFtZT0iY2FuY2VsIj7lj5bmtog8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9
ImNvbmZpZ19kZWxldGVfZXJyb3IiPuaXoOazleWIoOmZpOmFjee9riDigJwlc+KAnTwvc3RyaW5n
PgogICAgIDxzdHJpbmcgbmFtZT0iY29uZmlnX2V4aXN0c19lcnJvciI+4oCcJXPigJ0g55qE6YWN
572u5bey5a2Y5ZyoPC9zdHJpbmc+CkBAIC02MCw3ICs2Niw3IEBACiAgICAgPHN0cmluZyBuYW1l
PSJkYXJrX3RoZW1lX3N1bW1hcnlfb24iPuato+WcqOS9v+eUqOaal+iJsu+8iOm7keWknO+8ieS4
u+mimDwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZGFya190aGVtZV90aXRsZSI+5L2/55So
5pqX6Imy5Li76aKYPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJkZWxldGUiPuWIoOmZpDwv
c3RyaW5nPgotICAgIDxzdHJpbmcgbmFtZT0iZGVzZWxlY3RfYWxsIj7lhajpg6jlj5bmtog8L3N0
cmluZz4KKyAgICA8c3RyaW5nIG5hbWU9InRvZ2dsZV9hbGwiPuWPjemAiTwvc3RyaW5nPgogICAg
IDxzdHJpbmcgbmFtZT0iZG5zX3NlcnZlcnMiPkROUyDmnI3liqHlmag8L3N0cmluZz4KICAgICA8
c3RyaW5nIG5hbWU9ImVkaXQiPue8lui+kTwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZW5k
cG9pbnQiPuWvueerr+WcsOWdgDwvc3RyaW5nPgotLSAKMi4yNC4xLndpbmRvd3MuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxp
bmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29t
L21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
