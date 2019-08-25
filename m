Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2BFC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:30:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567FC206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567FC206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6862b097;
	Sun, 25 Aug 2019 19:30:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c9a2967
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:30:41 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dc98ee1
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:30:41 +0000 (UTC)
Received: from [192.168.127.216] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, TLS: TLS1.2,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by telperion.info with ESMTPSA
 id 0000000000046ACE.000000005D62E280.00006E41; Sun, 25 Aug 2019 12:33:20 -0700
Mime-Version: 1.0 (1.0)
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
From: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <9e7fce79-f7ae-6018-551c-02727e21a03a@proxel.se>
Date: Sun, 25 Aug 2019 12:30:09 -0700
Message-Id: <1A226EFF-39DF-4D64-A7D2-3D8B78F7F7FE@pallas.us>
References: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
 <20190818170928.ps2fymkisd4giefv@feather.localdomain>
 <c8accebb-1a7f-7b3e-26b5-2d0b13347fb3@bartschnet.de>
 <8cd089e7-0da9-b69a-2fbb-f961c4803936@urlichs.de>
 <9e7fce79-f7ae-6018-551c-02727e21a03a@proxel.se>
To: Andreas Karlsson <andreas@proxel.se>
Cc: wireguard@lists.zx2c4.com
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

VGhlIHByaXZhdGUga2V5IGlzIGluIGtlcm5lbCBtZW1vcnkgYW5kIGlzIGF2YWlsYWJsZSB2aWEg
bmV0bGluayBhbmQgY2xpLgoKfkRlcnJpY2sg4oCiIGlQaG9uZQoKPiBPbiBBdWcgMjQsIDIwMTks
IGF0IDEyOjAxIFBNLCBBbmRyZWFzIEthcmxzc29uIDxhbmRyZWFzQHByb3hlbC5zZT4gd3JvdGU6
Cj4gCj4+IE9uIDgvMjQvMTkgNDowOCBQTSwgTWF0dGhpYXMgVXJsaWNocyB3cm90ZToKPj4gQW55
b25lIHdpdGggKnJvb3QqIGFjY2VzcyB0byB0aGUgcnVubmluZyBtYWNoaW5lIGNhbiBkbyB0aGF0
LiBUaGV5IGFsc28KPj4gY2FuIHRyaXZpYWxseSByZWFkIHRoZSBrZXJuZWwgbWVtb3J5IChpZiBu
b3RoaW5nIGVsc2UsIGJ5IGluc3RhbGxpbmcgYQo+PiBtb2R1bGUpIGFuZCB3YWxrIHRoZSBrZXJu
ZWwgZGF0YSBzdHJ1Y3R1cmVzIHRvIGZpbmQgdGhlIHByaXZhdGUgYW5kL29yCj4+IHNoYXJlZCBr
ZXkuCj4gCj4gTm8sIGFueW9uZSB3aXRoIHJvb3QgYWNjZXNzIGNhbiBvbmx5IGdldCB0aGUgc2hh
cmVkIGtleSB1c2VkIGZvciBlbmNyeXB0aW5nIGRhdGEsIG5vdCB0aGUgYWN0dWFsIHByaXZhdGUg
a2V5LiBUaGUgcHJpdmF0ZSBrZXkgZG9lcyBuZXZlciBsZWF2ZSB0aGUgZGV2aWNlLgo+IAo+IERv
ZXMgdGhpcyBhZGQgZW5vdWdoIGV4dHJhIHNlY3VyaXR5IHRvIGJlIHdvcnRoIGl0PyBObyBpZGVh
LiBJIGhhdmVuJ3Qgd29ya2VkIG11Y2ggd2l0aCBzeXN0ZW1zIGxpa2UgdGhpcywgb25seSBhIGxp
dHRsZSBiaXQgd2l0aCBTU0wgYW5kIFNtYXJ0Q2FyZHMuCj4gCj4gQW5kcmVhcwo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gV2lyZUd1YXJkIG1haWxp
bmcgbGlzdAo+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPiBodHRwczovL2xpc3RzLnp4MmM0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRA
bGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8v
d2lyZWd1YXJkCg==
