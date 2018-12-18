Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2820C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:19:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A6C2089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=oeg.com.au header.i=@oeg.com.au header.b="0bBytHEd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A6C2089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=oeg.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cae67bb;
	Tue, 8 Jan 2019 02:16:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c70f8702
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 10:35:40 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ead6d464
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 10:35:39 +0000 (UTC)
Received: from HigherTime.pineview.net (HigherTime.pineview.net
 [203.33.246.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 24AE88015D
 for <wireguard@lists.zx2c4.com>; Tue, 18 Dec 2018 21:06:04 +1030 (ACDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oeg.com.au; s=mail;
 t=1545129364; bh=SQJU/ADldttopEX9XZ20leuaYruY+dPWp22RBM4gUUQ=;
 h=From:Subject:To:Reply-To:Date;
 b=0bBytHEd9MT2q0P3+eJyFMoqWlEbiVUNeWmA0Our076/RnhupohcGfYh/6KBBywYb
 ETmfLS7SlVGG9fs8gQl00G3rWht/7W4EiJfjxxLoLIgq1ZtRRymPaL01mSmrrPF1aR
 KtKJ80S46RDoHVNHeUWSRBptGoKtv4UQpXy2QRdg=
From: Mike O'Connor <mike@oeg.com.au>
Subject: Traffic flow stopping
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mike@oeg.com.au; prefer-encrypt=mutual; keydata=
 xsDiBD4b8L4RBACiRiGuVGTs1gf7StsJVp5NsWzmCko3Sx4dsRziVB9ri4ySeJb3VKeLJrYf
 cPfPC/ZGdLQnPMjNHdVFxuAXBmcqTvWpXYW/9Je1gqeKbqyYrCvi16/aFTdsC/D3QFKQrJyj
 Hd/E+uGIYLtbyRAdDotjQZYRWbo7i5ulThdlw7fz5wCgt/szt2+bZdsBeGLpV56WZHr2p5ED
 /3pL6WXbKfqbZusUU4n07ciAiGTXIYFqoF6OoRnexxBqQuK1Q0FijycYfuJVz9iKvmO0KIu5
 ReFZ8GejO3mVCJGQKHgmA7DOnw62vm8P4x8CfautZQ09Fb02oejY3bAFT4CU9EWFfS/NLGsz
 dePNrykK/Z0R/ShIkSX51Nh3a5OpA/9UQsGRQRwStHPFVzLmCMR/xPU1H07WNDWuqfq8YcTO
 simy+QFvouO1exiCMlpRHcaW7BxB2vCFPpPFV5QVeeR/fZHFqdkmQXfO9yXJm1qV7Bv6W02D
 E16jYtHTKIpOdu1A6ycwm8i9gTBpVgaVRFrtN7pv6FK5el1KaayQsSylR80fTWlrZSBPJ0Nv
 bm5vciA8bWlrZUBvZWcuY29tLmF1PsJhBBMRAgAhAhsDBgsJCAcDAgMVAgMDFgIBAh4BAheA
 BQJG35YYAhkBAAoJEH4EH+zmGBT1jrMAn0eatcDjJFQ+p+Yi+3hvqKDttTX2AJ9VXEJ8BRSA
 TZTr1AU5X3Eis8O1ec7BTQRENxYTEAgAw3R+FQaRC0KYJ7Dv+VsO0EKECcXh3BGh5Y0KaGOm
 yVjLa5lrkovADpg0vjqjqtdtTjhJ9stNhize32zOsvyc48KRSZDknruCk6BdgUA0MnDlQfAL
 h/L/OxiZlI1w6FXKrN9r0nhAdJtiJCmE0lMTW4adrLrrD8BndcI2L1zpLy5ZErfYaXzKu+MA
 aAAdrNsvI8DU+npUa89cr0tbKJWDIBHis8XrLIo+ugnlengs00i2aHbwmZC8+x9/Q0uzNbxO
 MeZERAyV1ZMbDChn8wHQGNaO2Nr4wfKOQOY/U/tg80blfgrsJhznPQeBAMSMcwPc3X3PnpPh
 vB18UGuTLVJatwADBQgAiFZ4VnQmrwZIHqzX1eX0QUFzN5IjQjWC8X9005D6aleXN1oIJ7lJ
 e4HnXL0jqlg7ditGNRS9qGNkoyNTzcgtPU7PsH3dPvCBDEmQhAGC2L4QvVQoalqlrcmpuciI
 MtqMehCYZ3OVO5RyJjaJApBuXdx+//GzAyaVCygrruzrZNhY4f05KAigra+MvRx66lGb89AU
 M0W2OF0ssaPhQv4JOE+vT4H9fVgZFAcfF1Hrj2VOhor/z981dWcKTFahJ7v2zyzQW8+q6ZP/
 56uk6eq8/CZLEekheC/qGWzTgywuz1XDJibBSJzRGG17dt0vQALGosAh2AW8ZsEvPfsW0U6U
 PcJJBBgRAgAJBQJENxYTAhsMAAoJEH4EH+zmGBT1l1sAn3qHKP0JNoQj3FmgFCGrCMpER8hY
 AJ93RlAGjkYKoQQVaxHLgAMsqBSiJg==
Message-ID: <8ca3e6e3-174b-c19a-f502-76b1550c5a9d@oeg.com.au>
Date: Tue, 18 Dec 2018 21:06:03 +1030
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:16:23 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Mike O'Connor <mike@oeg.com.au>
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

SGkgQWxsCgpTbyBJJ3ZlIGJlZW4gdXNpbmcgV2lyZWd1YXJkIHRvIHJvdXRlIHBhcnQgb2YgbXkg
Y2xhc3MgQyB0byBteSBob21lIGZvcgphYm91dCA0IG1vbnRocyBub3csIGJ1dCBmb3IgdGhlIGxh
c3QgZmV3IGRheXMgdGhlIHRyYWZmaWMgc3RvcHMgZm9yIGEKc2hvcnQgd2hpbGUgZXZlcnkgZmV3
IG1pbnV0ZXMuCgpJIGNhbiBub3QgdGhpbmsgb2YgYW55dGhpbmcgd2hpY2ggaGFzIGNoYW5nZWQs
IHR1cm5pbmcgT3BlblZQTiBiYWNrIG9uCmZpeGVzIGV2ZXJ5dGhpbmcuIEkndmUgdHJpZWQgcmVk
dWNpbmcgdGhlIGtlZXBhbGl2ZSB0aGlua2luZyB0aGUgTkFUCnJvdXRlIGNvdWxkIGhhdmUgYmVl
biB0aGUgaXNzdWUgYnV0IHRoYXQgaGFzIG5vdCBoZWxwLgoKQSBmZXcgZGV0YWlsOgoKVmVyc2lv
biAwLjAuMjAxODExMTktd2cxfnRydXN0ecKgCgpDTElFTlQ6Cgpyb290QGd3On4jIHdnCmludGVy
ZmFjZTogd2ctcDJwCsKgIHB1YmxpYyBrZXk6IDN6THphU29Ud2YraDVBWWd2R016MFhuR1lKR1FY
NHRQYlpjTXppVUxrMUk9CsKgIHByaXZhdGUga2V5OiAoaGlkZGVuKQrCoCBsaXN0ZW5pbmcgcG9y
dDogNTE4MjAKwqAgZndtYXJrOiAweGNhNmMKCnBlZXI6IHhTY2N5bUNaRFV4Y0Q3dkZyR3R3QWl5
WUdjbFExaFVRQ215OG5MRExMZ2M9CsKgIGVuZHBvaW50OiAyMDIuMTkxLjk4LjE5Mzo1MTgyMArC
oCBhbGxvd2VkIGlwczogMC4wLjAuMC8wLCA6Oi8wCsKgIGxhdGVzdCBoYW5kc2hha2U6IDIxIHNl
Y29uZHMgYWdvCsKgIHRyYW5zZmVyOiAzLjU4IEdpQiByZWNlaXZlZCwgMTIuMjAgR2lCIHNlbnQK
wqAgcGVyc2lzdGVudCBrZWVwYWxpdmU6IGV2ZXJ5IDEwIHNlY29uZHMKcm9vdEBndzp+IyBwaW5n
IDguOC44LjgKUElORyA4LjguOC44ICg4LjguOC44KSA1Nig4NCkgYnl0ZXMgb2YgZGF0YS4KCgpe
QwotLS0gOC44LjguOCBwaW5nIHN0YXRpc3RpY3MgLS0tCjYgcGFja2V0cyB0cmFuc21pdHRlZCwg
MCByZWNlaXZlZCwgMTAwJSBwYWNrZXQgbG9zcywgdGltZSA0OTk5bXMKCgpTRVJWRVI6CgppbnRl
cmZhY2U6IHdnLXAycArCoCBwdWJsaWMga2V5OiB4UypnYz0KwqAgcHJpdmF0ZSBrZXk6IChoaWRk
ZW4pCsKgIGxpc3RlbmluZyBwb3J0OiA1MTgyMAoKcGVlcjogM3oqazFJPQrCoCBlbmRwb2ludDog
MjAzLjEyMi4yMjQuNTc6NTE4MjAKwqAgYWxsb3dlZCBpcHM6IDAuMC4wLjAvMArCoCBsYXRlc3Qg
aGFuZHNoYWtlOiAyMSBzZWNvbmRzIGFnbwrCoCB0cmFuc2ZlcjogMTIuMjAgR2lCIHJlY2VpdmVk
LCAzLjU4IEdpQiBzZW50CsKgIHBlcnNpc3RlbnQga2VlcGFsaXZlOiBldmVyeSAxMCBzZWNvbmRz
CgpBbnkgaWRlYXMgPyBBbnkgbW9yZSB0ZXN0cyBvciBkZWJ1ZyAoaWYgeW91IHRlbGwgbWUgaG93
KSBJIGNvdWxkIHByb3ZpZGUgPwoKClRoYW5rcwoKTWlrZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3Vh
cmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGlu
Zm8vd2lyZWd1YXJkCg==
