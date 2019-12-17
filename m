Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9137DC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:21:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13A62176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=henki-fr.20150623.gappssmtp.com header.i=@henki-fr.20150623.gappssmtp.com header.b="0sAkm2up"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E13A62176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=henki.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 885f01f1;
	Thu, 19 Dec 2019 01:21:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac647dc3
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 18:26:47 +0000 (UTC)
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44017867
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 18:26:47 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id f7so3796583uaa.8
 for <wireguard@lists.zx2c4.com>; Tue, 17 Dec 2019 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=henki-fr.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ZG2QVQWuRy0obK+/mD3rNx3EoRu+ElnlAxZe4YKIZiA=;
 b=0sAkm2upv4B7DNQ2cBjdvyBGWZfSROoAY/VIlT9mOImwbDuZS9GxN5euYrXAJFmZ45
 BDtn43Zo9LclGQ1gZgnIjRz2yvpy0SzJk0x7edimapVd5hhD5g0p/k7kbFYaACQ/Ef/E
 70Awc/FEhQnqaHXJhJ57G7UmEYe3XJvRpMjG4weC8e4uzhahv0HKGP8kjosuoTtrBPVW
 cM9+7v/vvOXDSPs22pffTA2ZKcPX0lNdzqntZIf1VPxuG5zUE91gQIpz0FLk1sX9+5ug
 YA/izUJOUQVXaQP7ZkIyRE+tWnFwjuTTUq1A6UEq/LP1XyM5liv4/dhJ81I4yOY1Yv9l
 eH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ZG2QVQWuRy0obK+/mD3rNx3EoRu+ElnlAxZe4YKIZiA=;
 b=rK5O5qyJiVgokE3g7vMz4ByPB4mp1EX/ZSSscvqugn+3yL7KErj0wXgD/8abrM8crE
 w55rXU8CIV4YJaIS/SDbaoa0EH0iYKlgLjzqNaioNqod8zxPf/+VRN2nyEZ8jLpw//+Q
 efoo+ZBrlC9hMfm3qJ7rQyi2KVdWK13Apqlj75i6W3fJxwHn6MZjj7O/F/MXD2tsnX98
 aJqNJJmIC90ezBPzO3g1zbBGy9n9LHVxv0wMh/wXzyC+P5VcznU4zaCc3p1+eOX5kBvE
 UQx7Jk0o4owVGGAxEUECFmOC/ubWVtCcSUK2/Ge2amKVkqIn0GU5ov4i+GkF5zK9pabN
 P/VQ==
X-Gm-Message-State: APjAAAXIpUInm/oqRt28zPzZsZob43/Xcvs6VzuIjsRzYgpgUX3fNeYR
 UGsiEEVRe5wblPm634wrmb4aLDJze18F7uDojTPzsbO1
X-Google-Smtp-Source: APXvYqzZlzW+SkSZeerFyfFGEsloR8TF4AgS3bcJKg6l297p6N4xaGwe+87vj9TA/vUAQUDQUnwU7av6Nm8zMWmge4s=
X-Received: by 2002:a9f:3e84:: with SMTP id x4mr4133938uai.83.1576607205807;
 Tue, 17 Dec 2019 10:26:45 -0800 (PST)
Received: from 1058052472880 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Dec 2019 10:26:45 -0800
From: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@henki.fr>
MIME-Version: 1.0
Date: Tue, 17 Dec 2019 10:26:45 -0800
Message-ID: <CA+jiYFD1SD-FgjgkwSTmkog1CYJYrEY87MKwD3StzAmmCJkn3w@mail.gmail.com>
Subject: MTU on wireguard-apple for IPv6
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 19 Dec 2019 02:21:07 +0100
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

SGksIHdlIGhhdmUgdXNlcnMgdGhhdCBhcmUgcmVwb3J0aW5nIG1hbnkgaXNzdWVzIHdoZW4gdXNp
bmcgdGhlCldpcmVHdWFyZCBjbGllbnQgb24gTWFjT1MgbGFwdG9wcyB3aXRoIElQdjYgbmV0d29y
a3MuIEl0IHNlZW1zIHRoYXQKbW9zdCBvZiB0aG9zZSBpc3N1ZXMgZGlzYXBwZWFyIHdoZW4gd2Ug
c2V0IHRoZSBNVFUgdG8gMTI4MCBpbiB0aGUKY29uZmlndXJhdGlvbi4KClNpbmNlIHRoZXkgYXJl
IHVzaW5nIGxhcHRvcHMsIHNvbWUgYXJlIGZyZXF1ZW50bHkgb24gYmFkbHkgYmVoYXZlZApuZXR3
b3Jrcy4gUmVhZGluZyB0aGUgc291cmNlIGNvZGUsIGl0IHNlZW1zIHRoYXQgdGhpcyBzaXR1YXRp
b24gaXMKaGFuZGxlZCBkaWZmZXJlbnRseSBvbiBpT1MgdnMgTWFjT1MgaW4gZ2VuZXJhdGVOZXR3
b3JrU2V0dGluZ3MoKToKCgrCoCDCoCDCoCDCoCBsZXQgbXR1ID0gdHVubmVsQ29uZmlndXJhdGlv
bi5pbnRlcmZhY2UubXR1ID8/IDAKCsKgIMKgIMKgIMKgIC8qIDAgbWVhbnMgYXV0b21hdGljIE1U
VS4gSW4gdGhlb3J5LCB3ZSBzaG91bGQganVzdCBkbwrCoCDCoCDCoCDCoCDCoCogYG5ldHdvcmtT
ZXR0aW5ncy50dW5uZWxPdmVyaGVhZEJ5dGVzID0gODBgIGJ1dCBpbgrCoCDCoCDCoCDCoCDCoCog
cHJhY3RpY2UgdGhlcmUgYXJlIHRvbyBtYW55IGJyb2tlbiBuZXR3b3JrcyBvdXQgdGhlcmUuCsKg
IMKgIMKgIMKgIMKgKiBJbnN0ZWFkIHNldCBpdCB0byAxMjgwLiBCb29ob28uIE1heWJlIHNvbWVk
YXkgd2UnbGwKwqAgwqAgwqAgwqAgwqAqIGFkZCBhIG5vYiwgbWF5YmUsIG9yIGlPUyB3aWxsIGRv
IHByb2JpbmcgZm9yIHVzLgrCoCDCoCDCoCDCoCDCoCovCsKgIMKgIMKgIMKgIGlmIG10dSA9PSAw
IHsKwqAgwqAgwqAgwqAgwqAgwqAgI2lmIG9zKGlPUykKwqAgwqAgwqAgwqAgwqAgwqAgbmV0d29y
a1NldHRpbmdzLm10dSA9IE5TTnVtYmVyKHZhbHVlOiAxMjgwKQrCoCDCoCDCoCDCoCDCoCDCoCAj
ZWxzZWlmIG9zKG1hY09TKQrCoCDCoCDCoCDCoCDCoCDCoCBuZXR3b3JrU2V0dGluZ3MudHVubmVs
T3ZlcmhlYWRCeXRlcyA9IDgwCsKgIMKgIMKgIMKgIMKgIMKgICNlbHNlCsKgIMKgIMKgIMKgIMKg
IMKgICNlcnJvcigiVW5pbXBsZW1lbnRlZCIpCsKgIMKgIMKgIMKgIMKgIMKgICNlbmRpZgrCoCDC
oCDCoCDCoCB9IGVsc2UgewrCoCDCoCDCoCDCoCDCoCDCoCBuZXR3b3JrU2V0dGluZ3MubXR1ID0g
TlNOdW1iZXIodmFsdWU6IG10dSkKwqAgwqAgwqAgwqAgfQoKCkRvZXMgYG5ldHdvcmtTZXR0aW5n
cy50dW5uZWxPdmVyaGVhZEJ5dGVzID0gODBgIG1lYW5zIHRoZSBNVFUgd2lsbAp1c2VkIGJlIHRo
ZSBvbmUgb2YgdGhlIGludGVyZmFjZSBtaW51cyA4MCBiaXRzIG9mIG92ZXJoZWFkIGZvciB0aGUK
V2lyZUd1YXJkIHByb3RvY29sPwoKU29tZSBvZiBvdXIgdXNlcnMgd2hlcmUgdGV0aGVyaW5nIG92
ZXIgdGhlaXIgcGhvbmUgY29ubmVjdGlvbiBzbyBpdApzZWVtcyB0aGF0IDEyODAgaXMgYXBwcm9w
cmlhdGUgaW4gdGhhdCBjYXNlLCBidXQgSeKAmW0gY29uZnVzZWQgYXMgdG8Kd2h5IGNvbm5lY3Rp
b25zIG5vdCBnb2luZyB0aHJvdWdoIHRoZSBXaXJlR3VhcmQgdHVubmVsIHdoZXJlIG5vdAppbXBh
Y3RlZCBpbiB0aGF0IGNhc2UuCgpEb2VzIGl0IHJlYWxseSBtYWtlIHNlbnNlIHRvIHRyZWF0IGxh
cHRvcHMgYW5kIGlPUyBkZXZpY2VzIGRpZmZlcmVudGx5CmFyZSBzb21ldGltZSBjb25uZWN0ZWQg
dG8gcmFuZG9tIG5ldHdvcmtzPyBTaG91bGQgdGhpcyBiZSBjaGFuZ2VkIHRvCmBuZXR3b3JrU2V0
dGluZ3MubXR1ID0gTlNOdW1iZXIodmFsdWU6IDEyODApYCBpbiBhbGwgY2FzZXM/CgpSw6ltaQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
