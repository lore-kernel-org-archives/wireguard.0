Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9982C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 23:24:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3EB20838
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 23:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/Qy9rJ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3EB20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45b94204;
	Fri, 7 Dec 2018 23:16:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b681a982
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 11:38:41 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e5676a7
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 11:38:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r24so1155732wmh.0
 for <wireguard@lists.zx2c4.com>; Fri, 07 Dec 2018 03:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=cJ9x3vh0iygFaFpMoeCudeRBU3bY7sUby8KN4uoO3i4=;
 b=d/Qy9rJ/0MpZY4KtxUTg5pxnp+FhfCjAr0fZjE3vXYBSPUbT0qeBZOwwm+NTKjB/Q3
 EafPVxY/J64sKufxeVu44BMsoOu958Na4nWBXGsgz4RlAXimr/ETNAGWnNSMRfzhqHFm
 9EIYTmmoKuLzKVIoQ2BnJwtLacLNC36DZG9glZYo1zuqQfPgHTSALJxrl2m9xlSmUL1D
 4aaxn7Ac3wQblBjuDXGtlEG4rybwdv3N7MlvumfTdEM3oENs1NsJtOmUziJ860kvjuRC
 rNmDpZHjMzJMvLu5k4zoSnXPOJBaeb1GZzITjZd1CydRzdpJ8x4j+yF+osc6CLtewiN2
 pnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=cJ9x3vh0iygFaFpMoeCudeRBU3bY7sUby8KN4uoO3i4=;
 b=XyG5VBWnIq9aPEDYUpcqdU3Q0QLtmw+1/I8dp5+YncYmNg4KyXd4Dq0cFk4gx7fXuM
 hUCQSpj6JJWQQ+VR2kI/Ls7Fb3f6A4IzbZzBgIq05aieLoI0kY6xUTlbP9yv83KfxWd+
 QgCLwSDxNEhTduVyEtM0iyvM8ukehNslLSC7LJwwNO/QezcSrPlFJHwI/9vLcPZgP8L9
 gmBokfMwJwal3PseI0fLWsCNwOJegTJQGF5xL6iC5tf5K4F/Q3+EJ1Gr5n5uyJgoRG8I
 dLigpKEkeBk2QniZTVM3pVHihT8y9EWqbn5KEMyrU7iKRI+7aHdY+p3ENwlZQanWOm/x
 2Yqw==
X-Gm-Message-State: AA+aEWb/DYjpuvZ3iU9fwLUmscDpe9drpGUgoth6FzV9FRUluP9TXq87
 E76zeNsiStVq/AzuBSHQMueh4Xr+
X-Google-Smtp-Source: AFSGD/Xw0H+AHi1S3Q73w5IMBYW3Xfz7VXpWg7RKOcBCi1l8XLjLpnza8sNYfWScnlxE1zAoHVlvSw==
X-Received: by 2002:a1c:b455:: with SMTP id d82mr2047146wmf.78.1544183216348; 
 Fri, 07 Dec 2018 03:46:56 -0800 (PST)
Received: from [172.16.20.6] ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id y1sm1947882wme.1.2018.12.07.03.46.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 03:46:55 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: "bus error" when generating public key
Message-Id: <2DE53C12-A1B1-4E06-9391-7F64BC7328A2@gmail.com>
Date: Fri, 7 Dec 2018 15:46:53 +0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Mailman-Approved-At: Sat, 08 Dec 2018 00:16:05 +0100
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

SeKAmW0gd29ya2luZyB0byBhZGQgV2lyZUd1YXJkIHN1cHBvcnQgdG8gYW4gZW1iZWRkZWQgZGlz
dHJvIHRoYXQgcnVucyBvbiBhIG1peCBvZiB4ODYgYW5kIEFSTSBoYXJkd2FyZS4gSeKAmW0gdXNp
bmcgNC4xOS43IGFzIHRoZSBrZXJuZWwgYmFzZSwgY3Jvc3MgY29tcGlsaW5nIHVzaW5nIGEgd2Vs
bCBwcm92ZW4gdG9vbGNoYWluIGFuZCBidWlsZC1zeXN0ZW0uIFRoZSBrZXJuZWwgZGVmY29uZmln
IGNhbiBiZSBzZWVuIGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9MaWJyZUVMRUMu
dHYvYmxvYi9hbWxvZ2ljL3Byb2plY3RzL0FtbG9naWMvbGludXgvbGludXguYWFyY2g2NC5jb25m
CgpJIHNlZSBubyBjb21waWxlIGVycm9ycyB3aGVuIGJ1aWxkaW5nIHRoZSBrZXJuZWwgbW9kdWxl
IG9yIHdpcmVndWFyZCB0b29scy4gVGhlIGtlcm5lbCBtb2R1bGUgbG9hZHMgd2l0aG91dCBlcnJv
cnMgYW5kIOKAmHdn4oCZIGNhbiBnZW5lcmF0ZSBwcml2YXRlIGFuZCBwcmVzaGFyZWQga2V5cywg
YnV0IHdoZW4gY3JlYXRpbmcgYSBwdWJsaWMga2V5IGZyb20gdGhlIHByaXZhdGUga2V5IOKAmHdn
IHB1YmtleSA8IC9wYXRoL3RvL3ByaXZhdGVrZXknIGZhaWxzIHdpdGgg4oCcQnVzIGVycm9y4oCd
IGFuZCBubyBrZXkgaXMgZ2VuZXJhdGVkLgoKZG1lc2cgZnJvbSB0aGUgZGV2aWNlIGFmdGVyIHRo
ZSBmYWlsdXJlOiBodHRwOi8vaXguaW8vMXZyYgoKbW9kaW5mbyB3aXJlZ3VhcmQKZmlsZW5hbWU6
ICAgICAgIC9saWIvbW9kdWxlcy80LjE5Ljcva2VybmVsL25ldC93aXJlZ3VhcmQvd2lyZWd1YXJk
LmtvCmFsaWFzOiAgICAgICAgICBuZXQtcGYtMTYtcHJvdG8tMTYtZmFtaWx5LXdpcmVndWFyZAph
bGlhczogICAgICAgICAgcnRubC1saW5rLXdpcmVndWFyZAp2ZXJzaW9uOiAgICAgICAgMC4wLjIw
MTgxMTE5CmF1dGhvcjogICAgICAgICBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNv
bT4KZGVzY3JpcHRpb246ICAgIFdpcmVHdWFyZCBzZWN1cmUgbmV0d29yayB0dW5uZWwKbGljZW5z
ZTogICAgICAgIEdQTCB2MgpzcmN2ZXJzaW9uOiAgICAgMUNGRTEyRjhFNUNGMDBEQjg0MkZENTAK
ZGVwZW5kczogICAgICAgIGlwdjYsdWRwX3R1bm5lbCxpcDZfdWRwX3R1bm5lbAppbnRyZWU6ICAg
ICAgICAgWQpuYW1lOiAgICAgICAgICAgd2lyZWd1YXJkCnZlcm1hZ2ljOiAgICAgICA0LjE5Ljcg
U01QIHByZWVtcHQgbW9kX3VubG9hZCBhYXJjaDY0CgpsZGQgL3Vzci9iaW4vd2cKCWxpYmMuc28u
NiA9PiAvdXNyL2xpYi9saWJjLnNvLjYgKDB4Zjc3NzEwMDApCgkvbGliL2xkLWxpbnV4LWFybWhm
LnNvLjMgPT4gL3Vzci9saWIvbGQtbGludXgtYXJtaGYuc28uMyAoMHhmNzhhZDAwMCkKCknigJlt
IG5vdCBhIGNvZGluZyBkZXZlbG9wZXIsIGJ1dCBJ4oCZbSBhYmxlIHRvIGZvbGxvdyBpbnN0cnVj
dGlvbnMgdG8gYSByZWFzb25hYmxlIGxldmVsIGlmIHRoZXJlIGlzIHNvbWUga2luZCBvZiBkZWJ1
Z2dpbmcgb3IgYWRkaXRpb25hbCBvdXRwdXQgdGhhdCB3b3VsZCBiZSB1c2VmdWwuCgpDYW4geW91
IHNwb3QgdGhlIHByb2JsZW0/IEFueSBzdWdnZXN0aW9ucz8KCkNocmlzdGlhbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5n
IGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
