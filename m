Return-Path: <SRS0=7TlJ=W3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B67EC3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Aug 2019 10:42:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E3322D37
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Aug 2019 10:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E3322D37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=activezone.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1633b728;
	Sat, 31 Aug 2019 10:42:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0d28986
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 10:42:05 +0000 (UTC)
Received: from vintage.nbg1-dc1.freebsdcloud.com
 (vintage.nbg1-dc1.freebsdcloud.com [159.69.229.98])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d09389e
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 10:42:04 +0000 (UTC)
Received: from [159.69.229.119] (ip119.vl8-han.freebsdcloud.com
 [159.69.229.119]) (authenticated bits=0)
 by vintage.nbg1-dc1.freebsdcloud.com (8.15.2/8.15.2) with ESMTPSA id
 x7VAg4wM057949
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Sat, 31 Aug 2019 12:42:04 +0200 (CEST)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: vintage.nbg1-dc1.freebsdcloud.com: Host
 ip119.vl8-han.freebsdcloud.com [159.69.229.119] claimed to be
 [159.69.229.119]
To: wireguard@lists.zx2c4.com
From: Markus Grundmann <markus@activezone.de>
Subject: Remark: src/tools/show.c
Openpgp: preference=signencrypt
Autocrypt: addr=markus@activezone.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <484b9ad8-5e45-86ee-ea11-2c8a81f6da45@activezone.de>
Date: Sat, 31 Aug 2019 12:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: de-DE
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

SSB0aGluayB0aGUgZXhwbGljaXQgdGVybWluYXRpb24gKGJ1ZltdID0gJ1wwJykgaXMgbm90IG5l
ZWRlZC4gUGVyc29uYWx5Ckkgd291bGQgcHJlZmVyIG1lbXNldCgpIHRvIGNsZWFuIHVwIHRoZSBi
dWZmZXIuIHN0cm5jb3B5KCkgcmVkdWNlZCBieQp0d28gaW5zdGVhZCBvZiBhIHNpbmdsZSBjaGFy
cyBwcm90ZWN0cyB0aGUgbGFzdCBzdHJpbmcgdGVybWluYXRvci4gQnV0CndlIHdpbGwgbm90IGRp
ZSB3aGVuIGl0IG5vdCB3YXMgY2hhbmdlZAoKW3NyYy90b29scy9zaG93LmNdCj09PiBlbmRwb2lu
dCgpIDw9PQoxMjIsMTIzYzEyMgotIAkJc3RybmNweShidWYsIGdhaV9zdHJlcnJvcihyZXQpLCBz
aXplb2YoYnVmKSAtIDEpOwotIAkJYnVmW3NpemVvZihidWYpIC0gMV0gPSAnXDAnOwotLS0KKyAJ
CXN0cm5jcHkoYnVmLCBnYWlfc3RyZXJyb3IocmV0KSwgc2l6ZW9mKGJ1ZikgLSAyKTsKMTYyYTE2
MgorIAltZW1zZXQoYnVmLCAwLCBzaXplb2YoYnVmKSk7CjE2NGMxNjQKLSAJCXN0cm5jcHkoYnVm
LCAiTm93Iiwgc2l6ZW9mKGJ1ZikgLSAxKTsKLS0tCisgCQlzdHJuY3B5KGJ1ZiwgIk5vdyIsIHNp
emVvZihidWYpIC0gMik7Cgo9PT4gYWdvKCkgPD09CjE2NmMxNjYKLSAJCXN0cm5jcHkoYnVmLCAi
KCIgVEVSTUlOQUxfRkdfUkVEICJTeXN0ZW0gY2xvY2sgd291bmQgYmFja3dhcmQ7CmNvbm5lY3Rp
b24gcHJvYmxlbXMgbWF5IGVuc3VlLiIgVEVSTUlOQUxfUkVTRVQgIikiLCBzaXplb2YoYnVmKSAt
IDEpOwotLS0KKyAJCXN0cm5jcHkoYnVmLCAiKCIgVEVSTUlOQUxfRkdfUkVEICJTeXN0ZW0gY2xv
Y2sgd291bmQgYmFja3dhcmQ7CmNvbm5lY3Rpb24gcHJvYmxlbXMgbWF5IGVuc3VlLiIgVEVSTUlO
QUxfUkVTRVQgIikiLCBzaXplb2YoYnVmKSAtIDIpOwoxNjljMTY5Ci0gCQlzdHJuY3B5KGJ1ZiAr
IG9mZnNldCwgIiBhZ28iLCBzaXplb2YoYnVmKSAtIG9mZnNldCAtIDEpOwotLS0KLSAJCXN0cm5j
cHkoYnVmICsgb2Zmc2V0LCAiIGFnbyIsIHNpemVvZihidWYpIC0gb2Zmc2V0IC0gMik7CjE3MWQx
NzAKLSAJYnVmW3NpemVvZihidWYpIC0gMV0gPSAnXDAnOwoKLS0gCkJlc3QgcmVnYXJkcywKTWFy
a3VzCgpCZXR0ZXIgUHJpdmFjeSB3aXRoIFBHUCBlbmNyeXB0ZWQgTWFpbDogaHR0cDovL2FjdGl2
ZXpvbmUuZGUvcGdwLwpGaW5nZXJwcmludDogNThDNSA4QkFGIDZGQ0UgQjI0RiAxODgxIEI1Qjgg
RjJBOCBFMUQwIDQ4NEIgMDA1NApUaHJlZW1hIElEOiA3WlJFVDJKWQoK4oCeV2VyIGRpZSBGcmVp
aGVpdCBhdWZnaWJ0IHVtIFNpY2hlcmhlaXQgenUgZ2V3aW5uZW4sCiBkZXIgd2lyZCBhbSBFbmRl
IGJlaWRlcyB2ZXJsaWVyZW4u4oCcIC0tIEJlbmphbWluIEZyYW5rbGluCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QK
V2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3dpcmVndWFyZAo=
