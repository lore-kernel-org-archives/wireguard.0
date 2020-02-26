Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488C3C4BA06
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:25:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5CF2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLlktFDe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5CF2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8baa3bb;
	Wed, 26 Feb 2020 03:21:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91c07bbf
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:21:22 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44feb8bd
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:21:21 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 6so592962pgk.0
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 19:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4UpuWpdSoqLouEm727r3BfPK6oMMg1FJHFDrFAsn/I=;
 b=QLlktFDeg0mJElua0h3yP+7CuYDSxLqKiNS1q2C1EtNd+9mnkKwWN6SWRR/4HjzM4l
 Yvl2BSGYPNCFQiXUq1mMj516OlDKjHbac48IPezmVHIFrv0itl7+V16uDMabSm5tirjC
 W/EF2/oSHAAWT2WHWqkNL7lpDd/1+ZlP2H3WX7YZbNEUt2mIk/2YwZOkh+dLh7TzC9cA
 jw7FIzstZ6/jXo1HmWH4HTo0VsD+rL6mUOI/1XKJOjfyNNeVOqKPNhKOK8lbM/wvTBxI
 MlfL2ksQHDtRNvwZoEp/JpBNwy3PWlWdC9ON/powenaUemoaAlv1foHpP/jmW2hHr6yn
 GrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4UpuWpdSoqLouEm727r3BfPK6oMMg1FJHFDrFAsn/I=;
 b=g7ZPv4BqjANCmYEaNa38RzE4ymwiCBi8wcgxv5sE6YAZCp87YDLa/OzUe9gR/CwKuC
 KCRnBptr5yOHh3noa9CwJ1Q0NLmiNC/RnCI7UsWUq9FJTTTrazr057t/XPChwo+FFXJo
 SUjx4lM/+GHYJSheXy94O6kqMIDcGt/MxrxjJlF401PgiVqtu6YXVR00LWQpwD/0AVa+
 8GOoVojCiHV2UvfoSOTWcDP47u+yPWl6HSF9Zp2pFkPbsp5hfMBtjKohrvWzVqbIxXWh
 AZUhGnthwxt40/5HyaMQeuUV9+HTsDX+8GOmKM2hneZzEChI5CPWElAmJWNAPNF0Tmhl
 4pNw==
X-Gm-Message-State: APjAAAWFvicwmRmGF/ggrsEisqJe0HnA4MYsctqUK1l9+y0cVAEeRhx4
 9pQxLmDzUIZdhJ/m+DQK92+A94oW3Y8wPA==
X-Google-Smtp-Source: APXvYqxpt6p14ADarsFygNoBw8FdoXTu6C3iV4o9w9PbcyU2i6srZBMXKXPF3QECKHmhnWrBlZBg8A==
X-Received: by 2002:aa7:9aa7:: with SMTP id x7mr1970621pfi.78.1582687496615;
 Tue, 25 Feb 2020 19:24:56 -0800 (PST)
Received: from home-imac.catsrv1.hicat.ne.jp (ca163152.hicat.ne.jp.
 [202.95.163.152])
 by smtp.gmail.com with ESMTPSA id z27sm546718pfj.107.2020.02.25.19.24.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 19:24:56 -0800 (PST)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-android] remove <item quantity=one> tag due to no
 plural form in Japanese.
Date: Wed, 26 Feb 2020 12:24:43 +0900
Message-Id: <20200226032442.2668-1-tanioka404@gmail.com>
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

U2lnbmVkLW9mZi1ieTogRWlqaSBUYW5pb2thIDx0YW5pb2thNDA0QGdtYWlsLmNvbT4KLS0tCiBh
cHAvc3JjL21haW4vcmVzL3ZhbHVlcy1qYS9zdHJpbmdzLnhtbCB8IDYgLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcHAvc3JjL21haW4vcmVzL3Zh
bHVlcy1qYS9zdHJpbmdzLnhtbCBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLWphL3N0cmluZ3Mu
eG1sCmluZGV4IDRmMjUyNmUuLjE2Y2QxNjUgMTAwNjQ0Ci0tLSBhL2FwcC9zcmMvbWFpbi9yZXMv
dmFsdWVzLWphL3N0cmluZ3MueG1sCisrKyBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLWphL3N0
cmluZ3MueG1sCkBAIC0xLDI3ICsxLDIxIEBACiA8P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5n
PSJ1dGYtOCI/PgogPHJlc291cmNlcz4KICAgICA8cGx1cmFscyBuYW1lPSJkZWxldGVfZXJyb3Ii
PgotICAgICAgICA8aXRlbSBxdWFudGl0eT0ib25lIj4lZCDjg4jjg7Pjg43jg6vjgpLliYrpmaTj
gafjgY3jgb7jgZvjgpM6ICVzPC9pdGVtPgogICAgICAgICA8aXRlbSBxdWFudGl0eT0ib3RoZXIi
PiVkIOODiOODs+ODjeODq+OCkuWJiumZpOOBp+OBjeOBvuOBm+OCkzogJXM8L2l0ZW0+CiAgICAg
PC9wbHVyYWxzPgogICAgIDxwbHVyYWxzIG5hbWU9ImRlbGV0ZV9zdWNjZXNzIj4KLSAgICAgICAg
PGl0ZW0gcXVhbnRpdHk9Im9uZSI+JWQg44OI44Oz44ON44Or44KS5YmK6Zmk44GX44G+44GX44Gf
PC9pdGVtPgogICAgICAgICA8aXRlbSBxdWFudGl0eT0ib3RoZXIiPiVkIOODiOODs+ODjeODq+OC
kuWJiumZpOOBl+OBvuOBl+OBnzwvaXRlbT4KICAgICA8L3BsdXJhbHM+CiAgICAgPHBsdXJhbHMg
bmFtZT0iZGVsZXRlX3RpdGxlIj4KLSAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im9uZSI+JWQg44OI
44Oz44ON44Or44KS6YG45oqePC9pdGVtPgogICAgICAgICA8aXRlbSBxdWFudGl0eT0ib3RoZXIi
PiVkIOODiOODs+ODjeODq+OCkumBuOaKnjwvaXRlbT4KICAgICA8L3BsdXJhbHM+CiAgICAgPHBs
dXJhbHMgbmFtZT0iaW1wb3J0X3BhcnRpYWxfc3VjY2VzcyI+Ci0gICAgICAgIDxpdGVtIHF1YW50
aXR5PSJvbmUiPiVkIOWAi++8iOWFqCAlZCDlgIvvvInjga7jg4jjg7Pjg43jg6voqK3lrprjgpLj
gqTjg7Pjg53jg7zjg4g8L2l0ZW0+CiAgICAgICAgIDxpdGVtIHF1YW50aXR5PSJvdGhlciI+JWQg
5YCL77yI5YWoICVkIOWAi++8ieOBruODiOODs+ODjeODq+ioreWumuOCkuOCpOODs+ODneODvOOD
iDwvaXRlbT4KICAgICA8L3BsdXJhbHM+CiAgICAgPHBsdXJhbHMgbmFtZT0iaW1wb3J0X3RvdGFs
X3N1Y2Nlc3MiPgotICAgICAgICA8aXRlbSBxdWFudGl0eT0ib25lIj4lZCDlgIvjga7jg4jjg7Pj
g43jg6voqK3lrprjgpLjgqTjg7Pjg53jg7zjg4jmuIg8L2l0ZW0+CiAgICAgICAgIDxpdGVtIHF1
YW50aXR5PSJvdGhlciI+JWQg5YCL44Gu44OI44Oz44ON44Or6Kit5a6a44KS44Kk44Oz44Od44O8
44OI5riIPC9pdGVtPgogICAgIDwvcGx1cmFscz4KICAgICA8cGx1cmFscyBuYW1lPSJzZXRfZXhj
bHVkZWRfYXBwbGljYXRpb25zIj4KLSAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im9uZSI+6Zmk5aSW
44Ki44OX44OqICVkIOWAizwvaXRlbT4KICAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im90aGVyIj7p
maTlpJbjgqLjg5fjg6ogJWQg5YCLPC9pdGVtPgogICAgIDwvcGx1cmFscz4KICAgICA8c3RyaW5n
IG5hbWU9ImFkZF9wZWVyIj7jg5TjgqLjgpLov73liqDjgZnjgos8L3N0cmluZz4KLS0gCjIuMjUu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1
YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMu
engyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
