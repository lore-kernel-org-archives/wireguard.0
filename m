Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D418AC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 18:13:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD3624249
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 18:13:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7W7/ILb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD3624249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b5be16b;
	Thu, 5 Dec 2019 18:13:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfe236e0
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 18:13:09 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b15fa64
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 18:13:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c9so4764969wrw.8
 for <wireguard@lists.zx2c4.com>; Thu, 05 Dec 2019 10:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=YAoYmOqt6XY2bzQ1cc89Z4DfU3/67xMQOTo29a5KVqc=;
 b=X7W7/ILb9T4BrGEgOWj9XrrB3jszSDlOTdcgnA6+GjhPSRsoA0Qclh4UGAvzUhOUfQ
 QQHAaL1X25pbPAYt6CUIxOlyR1PrWE4w5yqjfDnBDBrZ7+8V4kNgKTvA3Wy2y/RNRr3K
 CTBR623pcP67C5W6Fj3nDEXu9k7oh7ppUlkLCgWU6taP3FyWvadYBvBzLpjqCAtpvKb2
 iUCJpXlaa8OebpYrDgHU3Tb2JSD3uBfUHsDiBkJWvamVvsumsHe0LzvfGwl2UWvIX0cE
 A1AqMo36XtLEhtUwNv4+GFbNk02yn33wgyU2u19UhQvUIwYg05AG4n+1k1TeuJeMcmL2
 rE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=YAoYmOqt6XY2bzQ1cc89Z4DfU3/67xMQOTo29a5KVqc=;
 b=fG/3vZw8AKu0R/cOBOMK44RHDdqZ/uB2ofNZPzjqYhA7X9RouCmhqXEl5tUokI2cnF
 dhv7bPBuvqNBtbRavkO9dD2Bq4r54TxJqFX5qs0T/aPnapRBn5vOPBj8/INBxM8H90Gm
 y06pnTAdOdaDWJjALUpmUMQXHnVj8dbVCQBbN1og5L79FnPs2afF7wZmKKfHC9VW/wAu
 lq5wn1H6foqJEBY+I3F8Og/qQzfGVwmAjHksGyM2x4DCBUA2mUMyAWi65DSv2lYdNaXp
 nuvqo1FN+jdVC8RAxPbNMUiR2LF48TXZfCb4s2Ppoei39lDoxES2EWZAzE6Nag9wGxcl
 qsHg==
X-Gm-Message-State: APjAAAX9asOjQqOh+pua7tdMuuMw+D0g7+/gy1/6POzOJvi5QptFzY9o
 bDYnLmGdRi8zCxuyKLyQ7+k=
X-Google-Smtp-Source: APXvYqxdBFpc/sehfG9i5j9XljvddcG0APyxLdAnRXuOyNWnWYrujrLZYnzbleF4WnFuODUxlvOhjA==
X-Received: by 2002:adf:a141:: with SMTP id r1mr11832918wrr.285.1575569588224; 
 Thu, 05 Dec 2019 10:13:08 -0800 (PST)
Received: from ?IPv6:2003:c5:5f30:c501::3?
 (p200300C55F30C5010000000000000003.dip0.t-ipconnect.de.
 [2003:c5:5f30:c501::3])
 by smtp.gmail.com with ESMTPSA id h2sm13362855wrv.66.2019.12.05.10.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 10:13:07 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: Julian Orth <ju.orth@gmail.com>
Subject: CVE-2019-14899 and iifname-based firewall
Message-ID: <229e17a6-9a78-d1a7-0278-81d4ee46e1c3@gmail.com>
Date: Thu, 5 Dec 2019 19:13:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGVsbG8gbGlzdCwgaGVsbG8gSmFzb24sCgpJJ20gdXNpbmcgdGhlIGZvbGxvd2luZyBuZnRhYmxl
cyBydWxlczoKCnRhYmxlIGluZXQgZmlsdGVyIHsKIMKgwqDCoCBjaGFpbiBpbnB1dCB7CiDCoMKg
wqAgwqDCoMKgIHR5cGUgZmlsdGVyIGhvb2sgaW5wdXQgcHJpb3JpdHkgZmlsdGVyCiDCoMKgwqAg
wqDCoMKgIGN0IHN0YXRlIHsgZXN0YWJsaXNoZWQsIHJlbGF0ZWQgfSBhY2NlcHQKCiDCoMKgwqAg
wqDCoMKgIFsuLi5dCgogwqDCoMKgIMKgwqDCoCBpaWZuYW1lICJ3ZzAiIGFjY2VwdAogwqDCoMKg
IMKgwqDCoCB1ZHAgZHBvcnQgNTE4MjAgYWNjZXB0CgogwqDCoMKgIMKgwqDCoCBbLi4uXQoKIMKg
wqDCoCDCoMKgwqAgcmVqZWN0CiDCoMKgwqAgfQp9CgpBZnRlciByZWFkaW5nIGFib3V0IENWRS0y
MDE5LTE0ODk5IEknbSB1bnN1cmUgaWYgdGhpcyBhbGxvd3MgYW4gYXR0YWNrZXIgCnRvIGluamVj
dHMgcGFja2V0cyBpbnRvIHRjcCBjb25uZWN0aW9ucy4KCklmIHNvLCB3aGF0IGlzIHRoZSBiZXN0
IHdheSB0byBwcmV2ZW50IHRoaXM/IElzIHNldHRpbmcgcnBfZmlsdGVyPTEgCnN1ZmZpY2llbnQ/
CgpJbmRlcGVuZGVudGx5IG9mIHRoZSBDVkUgSSB3YW50IHRvIGNvbmZpcm0gaWYgbXkgZmlyZXdh
bGwgcnVsZXMgZG8gd2hhdCAKSSB3YW50IHRoZW0gdG8gZG8uClRoZSBuZnRhYmxlcyBydWxlcyBh
Ym92ZSBhcmUgYmFzZWQgb24gdGhlIGZvbGxvd2luZyBwYXJhZ3JhcGggZnJvbSAKd2lyZWd1YXJk
LmNvbToKCiA+Wy4uLl0gc3lzdGVtIGFkbWluaXN0cmF0b3JzIGRvIG5vdCBuZWVkIGNvbXBsaWNh
dGVkIGZpcmV3YWxsCiA+ZXh0ZW5zaW9ucyBbLi4uXSBidXQgcmF0aGVyIHRoZXkgY2FuIHNpbXBs
eSBtYXRjaCBvbiAiaXMgaXQgZnJvbSB0aGlzCiA+SVA/IG9uIHRoaXMgaW50ZXJmYWNlPyIsIGFu
ZCBiZSBhc3N1cmVkIHRoYXQgaXQgaXMgYSBzZWN1cmUgYW5kCiA+YXV0aGVudGljIHBhY2tldAoK
SXMgdGhpcyBpZGVhIGNvcnJlY3RseSByZXByZXNlbnRlZCBieSB0aGUgcnVsZSAiaWlmbmFtZSB3
ZzAgYWNjZXB0Ij8gCihJJ20gaW50ZW50aW9uYWxseSBhY2NlcHRpbmcgY29ubmVjdGlvbnMgZnJv
bSBhbGwgcGVlcnMgaW4gdGhpcyBjYXNlLikKClRoYW5rIHlvdQpKdWxpYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxp
c3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
