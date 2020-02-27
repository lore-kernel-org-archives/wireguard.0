Return-Path: <SRS0=l04w=4P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF79C4BA24
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Feb 2020 09:43:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91472467F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Feb 2020 09:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPpWtYZi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D91472467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd5ab63e;
	Thu, 27 Feb 2020 09:39:53 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7169153
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Feb 2020 09:39:51 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id l7so918135pff.6
 for <wireguard@lists.zx2c4.com>; Thu, 27 Feb 2020 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGGaAU5rIUFhImkazv+eUIp15/yi7Lhm6tXgpdvFBfQ=;
 b=nPpWtYZi9/D7Sgl8wdKE4sXnugFGEx+HrpTiNDYCC5SpX9cF69MgVs7MB/8X4vDv9x
 rHtCndsxTg8wycvagwU3rwk6R6NpPYki/BP3Dev7vqpjF4L7/2t66II87dh47YeE2BUu
 m4HT2YbB9TiXK2iPStmYKDyFEelOIPZ+RIMY+keQbgZ19rlvfKyl+XIVFcBv9pMkWwTN
 /2+iGuLfpxPppedJieIqf59B/N9SbQcLAbPlwXONpVA/DcFrjvu45YUtO326ScigiY8e
 BRgIKpE+g+KCKpFmaxxiEdeF0uHwT3iWjz0XPNAaQgY1H9mKrG2Nn7UtkFX3o45opn24
 X2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGGaAU5rIUFhImkazv+eUIp15/yi7Lhm6tXgpdvFBfQ=;
 b=IciIp4f4BLFBxton8S153jVW6uJIaL6DBloPywIew5iYGSy79Ozf804zPzu4/EvK9B
 6boSmaIHA1HEjHQM79CudxnPiijRTQ9wi32H+4ND6YP8lbnwrW7xRtuCsZeFGOVRV+/S
 QGCL2K9GkSPe1kdkqjAkvVinmVehs60zpL5SfID1mQYTqZZMj+Nb7urPwoRSatvxPtiS
 ikf6hkDR3v51Q7mlrYXb3t9xv4BZ6TmRU2GFosETCiiAuS56GN1na7MUzF4BzDJgycW6
 KalZi5JbrY7LvzV13NBYNyXsxJdvNawo2XKxqJmzAiFhkWF5XGTUEf4r13v161gZYwCc
 rRNw==
X-Gm-Message-State: APjAAAVF/dWj+g0oUlu8acjdH238dTd7gxZRNo+ehXQ6qtvnq8hPm9hp
 0I9x1mJxpBt3zP+SG2Vhs7N/NBPmZ7E=
X-Google-Smtp-Source: APXvYqw2ytfDP/ymz8hpfxfOqCLcjvYkU07C2rQEQPP8kFGabw5Bagal6W5qui+BVwcxg4R4I3T56g==
X-Received: by 2002:a63:1246:: with SMTP id 6mr3227785pgs.4.1582796616165;
 Thu, 27 Feb 2020 01:43:36 -0800 (PST)
Received: from home-imac.catsrv1.hicat.ne.jp (ca163152.hicat.ne.jp.
 [202.95.163.152])
 by smtp.gmail.com with ESMTPSA id q12sm6184106pfh.158.2020.02.27.01.43.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Feb 2020 01:43:35 -0800 (PST)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-windows] l18n: change EnumerationSeparator for
 Japanese.
Date: Thu, 27 Feb 2020 18:43:27 +0900
Message-Id: <20200227094326.9597-1-tanioka404@gmail.com>
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

SSBncmVwcGVkIHNvdXJjZSB0cmVlIGFuZCBmb3VuZCB0aGF0ICdFbnVtZXJhdGlvblNlcGFyYXRv
cicgaXMgdXNlZApmb3IgbXVsdGlwbGUgSVAgYWRkcmVzc2VzIHNlcGFyYXRpb24uIEluIHRoZXNl
IHNpdHVhdGlvbiwgY29tbWEgaXMKYmV0dGVyIHRoYW4gIuOAgSIgaW4gSmFwYW5lc2UuCigi44CB
IiBpcyB1c2VkIGZvciBKYXBhbmVzZSBzZW50ZW5jZSBzZXBhcmF0b3IsIGJ1dCBzZXBhcmF0aW9u
IGJ5IGNvbW1hCmlzIG1vcmUgcHJlZmVyYWJsZSB0byBlbnVtZXJhdGUgQVNDSUkgdmFsdWVzLikK
ClNpZ25lZC1vZmYtYnk6IEVpamkgVGFuaW9rYSA8dGFuaW9rYTQwNEBnbWFpbC5jb20+Ci0tLQog
bG9jYWxlcy9qYS9tZXNzYWdlcy5nb3RleHQuanNvbiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9sb2NhbGVzL2ph
L21lc3NhZ2VzLmdvdGV4dC5qc29uIGIvbG9jYWxlcy9qYS9tZXNzYWdlcy5nb3RleHQuanNvbgpp
bmRleCAzNTAxNDU4Li43MjNjYjZjIDEwMDY0NAotLS0gYS9sb2NhbGVzL2phL21lc3NhZ2VzLmdv
dGV4dC5qc29uCisrKyBiL2xvY2FsZXMvamEvbWVzc2FnZXMuZ290ZXh0Lmpzb24KQEAgLTQ1NSw3
ICs0NTUsNyBAQAogICAgICAgICB7CiAgICAgICAgICAgICAiaWQiOiAiW0VudW1lcmF0aW9uU2Vw
YXJhdG9yXSIsCiAgICAgICAgICAgICAibWVzc2FnZSI6ICJbRW51bWVyYXRpb25TZXBhcmF0b3Jd
IiwKLSAgICAgICAgICAgICJ0cmFuc2xhdGlvbiI6ICLjgIEiLAorICAgICAgICAgICAgInRyYW5z
bGF0aW9uIjogIiwgIiwKICAgICAgICAgICAgICJjb21tZW50IjogIkluc2VydGVkIGJldHdlZW4g
aXRlbXMgd2hlbiBsaXN0aW5nIChlLmcuIOKAmCwg4oCZIG9yIOKAmOOAgeKAmSkiCiAgICAgICAg
IH0sCiAgICAgICAgIHsKQEAgLTE0OTQsNCArMTQ5NCw0IEBACiAgICAgICAgICAgICBdCiAgICAg
ICAgIH0KICAgICBdCi19ClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQorfQotLSAKMi4yNS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3Vh
cmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56
eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
