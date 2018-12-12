Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22881C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:02:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9314218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcJs2YBZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9314218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1352a543;
	Wed, 2 Jan 2019 17:59:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e08cc2d5
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 13:19:42 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id daee4315
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 13:19:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 96so17720714wrb.2
 for <wireguard@lists.zx2c4.com>; Wed, 12 Dec 2018 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=f0i596agavnR8VahN5Sxh3MkVKz1nUG8neIAIQ+AoV0=;
 b=kcJs2YBZJdruOdGBqPm1rj9vs5tVxQz6tr8YZQ/7pSGQkkJsLaJAzyu0YQHYx5nbh1
 Krd3dOxNr7zNPzqk+zLVXNXdl/YQ5LjR6e3IYrSsk/ExQvxM1PN0qPzwXjwY1sDDyjoK
 k3FaPAG2HuLA9i2hc6V75rnAuOaZsxENpVNDHJ0BHXmhzElFWdmJ/f40yoH+5QdgNjTZ
 hrvUIOu3gkSK4vW95c0fHcKn/ommRcRig0lU6arUocx0SK441BAg6pEWpDQbjJ/GrJG5
 7tahTAW9Hk8rqAV8JwvXXkA8qp20dGQmj0EAzKhSxQkFZQkwT6JiYGLLGAN+j5hlJlbD
 MmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=f0i596agavnR8VahN5Sxh3MkVKz1nUG8neIAIQ+AoV0=;
 b=Zy+SnNTUy09Ll/ozMKqZq1+j+wZjNWmgSjn4/Xqdu4uDGUqJDayRTtoKyuNaUSZ2bj
 DQZrbDfZW154LoU1WBwXCW1sb2nuAwfAzu9REpWz2DjpvJfELEPbnc1H64yQmX8dihBP
 ZfOQ/9l/w4+vekGpfrlmWriTzoIagwurbqIjNHp+myTw57Jv5Sguctt7REWiviv3agwH
 XtHK50XpRa8tBCfabI3/ADV3f1MiK/2jjcQXvyRq2OJYg0tPNu/nUtP77XCmvNp6tFjB
 bgNXC6b+Fyc/oLTQzWayQx11P3o/vEblGwvzrqB3aWPnesseaxrDTRZfAOuUgu1FLcis
 xgCQ==
X-Gm-Message-State: AA+aEWbb9XiKeHdSttQRP/lYXNS+ZdwxJ4xKJNX7v15vC1wR5/5Mqs8z
 QD4Afl28vkaOutHC/01vkZgcpNrVax0=
X-Google-Smtp-Source: AFSGD/XMr4dNqLz0uO8IN0xEt9bjO2hpe4tjy6nx4QG3vWw5FCIF65+gTA/XDVjkLd3UCda6q9VcHQ==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr16274722wrq.108.1544621316081; 
 Wed, 12 Dec 2018 05:28:36 -0800 (PST)
Received: from [192.168.1.35] ([62.4.55.54])
 by smtp.gmail.com with ESMTPSA id e142sm5213787wmf.46.2018.12.12.05.28.35
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Dec 2018 05:28:35 -0800 (PST)
From: Jack Ivanov <e601809@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: iOS On Demand configuration
Message-Id: <6E7B68BA-590C-49B7-9C8E-91097ED58396@gmail.com>
Date: Wed, 12 Dec 2018 14:28:34 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.101.1)
X-Mailman-Approved-At: Wed, 02 Jan 2019 18:59:32 +0100
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

SGkgZXZlcnlib2R5LAoKSeKAmW0ganVzdCBjdXJpb3VzLCBpcyBpdCBwb3NzaWJsZSB0byBjb25m
aWd1cmUgb24tZGVtYW5kIG1vZGUgb24gV2lyZUd1YXJkIGlPUyB2aWEgY29uZmlndXJhdGlvbiBm
aWxlcyBvciBhcHBsZSBwcm9maWxlcz8gSSBrbm93IGl04oCZcyBwb3NzaWJsZSB0byBkbyBtYW51
YWxseSB2aWEgdGhlIGFwcCBzZXR0aW5ncywgYnV0IEnigJltIGxvb2tpbmcgZm9yIGFuIGF1dG9t
YXRpYyB3YXkuCgpUaGFua3MhCgotLSAKQmVzdCBSZWdhcmRzLApKYWNrCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QK
V2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3dpcmVndWFyZAo=
