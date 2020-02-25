Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2C8C35E01
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 15:45:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D975E2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 15:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D975E2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0014091c;
	Tue, 25 Feb 2020 15:41:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f8e5bf2
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 15:41:44 +0000 (UTC)
Received: from home-imac.localdomain (ca163152.hicat.ne.jp [202.95.163.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebc42c3b
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 15:41:44 +0000 (UTC)
Received: by home-imac.localdomain (Postfix, from userid 501)
 id 71A1A27C7856; Wed, 26 Feb 2020 00:45:08 +0900 (JST)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2 wireguard-windows] Add Japanese translation to resources.rc
Date: Wed, 26 Feb 2020 00:44:28 +0900
Message-Id: <20200225154427.99376-1-tanioka404@gmail.com>
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

U2lnbmVkLW9mZi1ieTogRWlqaSBUYW5pb2thIDx0YW5pb2thNDA0QGdtYWlsLmNvbT4KLS0tCiBy
ZXNvdXJjZXMucmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9yZXNvdXJjZXMucmMgYi9yZXNvdXJjZXMucmMKaW5kZXggMTRjMGNlMC4u
YjViNzc5YSAxMDA2NDQKLS0tIGEvcmVzb3VyY2VzLnJjCisrKyBiL3Jlc291cmNlcy5yYwpAQCAt
NTYsNiArNTYsMTMgQEAgVkVSU0lPTklORk9fVEVNUExBVEUoCiAgICJodHRwczovL3d3dy53aXJl
Z3VhcmQuY29tLyIKICkKIAorTEFOR1VBR0UgTEFOR19KQVBBTkVTRSwgU1VCTEFOR19ERUZBVUxU
CitWRVJTSU9OSU5GT19URU1QTEFURSgKKyAgIjA0MTEwNGIwIiwgMHg0MTEsIDB4NGIwLAorICAi
V2lyZUd1YXJkOiDpq5jpgJ/jgafjgIHnj77ku6PnmoTjgafjgIHjgrvjgq3jg6XjgqLjgaogVlBO
IOODiOODs+ODjeODqyIsCisgICJodHRwczovL3d3dy53aXJlZ3VhcmQuY29tLyIKKykKKwogTEFO
R1VBR0UgTEFOR19TTE9WRU5JQU4sIFNVQkxBTkdfREVGQVVMVAogVkVSU0lPTklORk9fVEVNUExB
VEUoCiAgICIwNDI0MDRiMCIsIDB4NDI0LCAweDRiMCwKLS0gCjIuMjUuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlz
dApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxt
YW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
