Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4ACAC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:09:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581B92186A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 581B92186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arcor.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8c5b8bf;
	Fri, 1 Mar 2019 09:59:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1d1056b
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 13:01:50 +0000 (UTC)
Received: from vsmx011.vodafonemail.xion.oxcs.net
 (vsmx011.vodafonemail.xion.oxcs.net [153.92.174.89])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1330186d
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 13:01:50 +0000 (UTC)
Received: from vsmx003.vodafonemail.xion.oxcs.net (unknown [192.168.75.197])
 by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id EAFC23E0552
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 13:10:36 +0000 (UTC)
Received: from [192.168.178.21] (unknown [134.101.134.110])
 by mta-7-out.mta.xion.oxcs.net (Postfix) with ESMTPA id CE9CB30025D
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 13:10:34 +0000 (UTC)
Subject: Re: upgrading raspberry pi required me to re install wireguard
To: wireguard@lists.zx2c4.com
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
 <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
From: sch0rsch@arcor.de
Message-ID: <c817664b-edb2-5a23-6981-99f11e9df335@arcor.de>
Date: Thu, 21 Feb 2019 14:10:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
Content-Language: en-GB
X-VADE-STATUS: LEGIT
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:59:10 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: micha@dietpi.com
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

SW4gY2FzZSBvZiBXaXJlR3VhcmQgRFBLRyBwYWNrYWdlIGJlaW5nIGluc3RhbGxlZCwganVzdCBy
dW46IApkcGtnLXJlY29uZmlndXJlIHdpcmVndWFyZC1ka21zCgpUaGlzIHdpbGwgcmVidWlsZCB0
aGUgbW9kdWxlIGZvciB0aGUgY3VycmVudCBhbmQgbGF0ZXN0IGluc3RhbGxlZCAKa2VybmVsK2hl
YWRlcnMuCgpJbiBzb21lIGNhc2VzLCBrZXJuZWwgcGFja2FnZSB1cGRhdGVzIGV2ZW4gYXV0b21h
dGljYWxseSB0cmlnZ2VyIHRoZSAKcmVidWlsZCwgZS5nLiBvbiBEZWJpYW4geDg2IHdpdGggbGlu
dXgtaW1hZ2UtYW1kNjQvbGludXgtaGVhZGVycy1hbWQ2NCwgCkFGQUlLLiBCdXQgdGhpcyBpcyB1
cCB0byB0aGUgcGFja2FnZSBtYWludGFpbmVycyBhbmQgZGVwZW5kIG9uIHRoZSAKT1MvcGFja2Fn
ZSBzeXN0ZW0uCgpCZXN0IHJlZ2FyZHMKCkFtIDIxLjAyLjIwMTkgdW0gMTM6Mjggc2NocmllYiBs
b2djYWJpbkBmYXN0bWFpbC5uZXQ6Cj4gWWVzLCB0aGUga2VybmVsIGRpZCBnZXQgdXBkYXRlZCwg
Y2F1c2luZyB0aGUgd2cgbW9kdWxlIGRlcGVuZGVuY2llcyB0byAKPiBnZXQgb3V0IG9mIHN5bmMu
IEEgcmVib290IGFmdGVyIHRoZSB1cGRhdGUgc2hvdWxkIHNvbHZlIHRoaXMsIG90aGVyd2lzZSAK
PiB5b3UgbWF5IG5lZWQgdG8gcnVuIHRoZSBwYWNrYWdlJ3MgcHJlaW5zdCBzY3JpcHQgdG8gZ2V0
IHRoZSBtb2R1bGVzIGJhY2sgCj4gaW4gc3luYy4gU2hvdWxkIGJlIG5vIG5lZWQgdG8gcmVpbnN0
YWxsIHRoZSB3ZyBwYWNrYWdlcy4KPiAKPiBPbiBUaHUsIEZlYiAyMSwgMjAxOSwgYXQgMjoxNCBB
TSwgQXJwaXQgR3VwdGEgd3JvdGU6Cj4+IEhpIEFsbAo+Pgo+PiBJIGFtIHJ1bm5pbmcgcmFzcGJl
cnJ5IHBpIHYzIGFuZCByYW4gYXB0LWdldCB1cGRhdGUgYW5kIHVwZ3JhZGUgCj4+IGNvbW1hbmRz
IHRvIGdldCB1cHRvIGRhdGUuIEl0IGFsc28gZW5kZWQgdXAgdXBkYXRpbmcgdGhlIGtlcm5lbCBp
IAo+PiB0aGluay4gSSBzaG91bGQgaGF2ZSBwYWlkIG1vcmUgYXR0ZW50aW9uIHRvIHdoYXQgYWxs
IHdhcyBnZXR0aW5nIHVwZGF0ZWQuCj4+Cj4+IEFmdGVyIHRoZSB1cGRhdGUgd2lyZWd1YXJkIHdh
cyBub3QgcnVubmluZyBhbmQgdXBvbiBkZWJ1Z2dpbmcgaSBmb3VuZCAKPj4gdGhhdCB0aGUgd2ly
ZWd1YXJkIGtlcm5lbCBtb2R1bGUgd2FzIG5vIGxvbmdlciBwcmVzZW50LiBTbyBpIAo+PiB1bmlu
c3RhbGxlZCBhbGwgd2lyZWd1YXJkIHBhY2thZ2VzIGFuZCBpbnN0YWxsZWQgdGhlbSBhZ2FpbiBh
bmQgdGhlIAo+PiBtb2R1bGUgc2hvd2VkIHVwIGFuZCBvbiByZWJvb3Qgc3lzdGVtIHdhcyBiYWNr
IHRvIG5vcm1hbC4gV2hhdCBpIHdhcyAKPj4gY3VyaW91cyB3YXMgaG93IHNob3VsZCBvbmUgZ28g
YWJvdXQgZG9pbmcgb3Mva2VybmVsIHVwZGF0ZXMgaW4gZnV0dXJlIAo+PiBpbiBvcmRlciB0byBh
dm9pZCB0aGlzIGlzc3VlPwo+Pgo+PiBJIGFtIHJ1bm5pbmcKPj4gTGludXggcmFzcGJlcnJ5cGkg
NC4xNC45OC12NysgIzEyMDAgU01QIFR1ZSBGZWIgMTIgMjA6Mjc6NDggR01UIDIwMTkgCj4+IGFy
bXY3bCBHTlUvTGludXgKPj4gTm8gTFNCIG1vZHVsZXMgYXJlIGF2YWlsYWJsZS4KPj4gRGlzdHJp
YnV0b3IgSUQ6UmFzcGJpYW4KPj4gRGVzY3JpcHRpb246UmFzcGJpYW4gR05VL0xpbnV4IDkuOCAo
c3RyZXRjaCkKPj4gUmVsZWFzZTo5LjgKPj4gQ29kZW5hbWU6c3RyZXRjaAo+Pgo+PiBpacKgIHdp
cmVndWFyZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMC4wLjIwMTkwMTIzLTHC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFsbCAgCj4+IMKgIMKgIMKgIMKgIGZhc3QsIG1vZGVybiwg
c2VjdXJlIGtlcm5lbCBWUE4gdHVubmVsIChtZXRhcGFja2FnZSkKPj4gaWnCoCB3aXJlZ3VhcmQt
ZGttc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAuMC4yMDE5MDEyMy0xwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhbGwgIAo+PiDCoCDCoCDCoCDCoCBmYXN0LCBtb2Rlcm4sIHNlY3VyZSBrZXJu
ZWwgVlBOIHR1bm5lbCAoREtNUyB2ZXJzaW9uKQo+PiBpacKgIHdpcmVndWFyZC10b29sc8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgMC4wLjIwMTkwMTIzLTEgICAgICAgICAgICAgIAo+PiDCoGFy
bWhmwqAgwqAgwqAgwqAgZmFzdCwgbW9kZXJuLCBzZWN1cmUga2VybmVsIFZQTiB0dW5uZWwgKHVz
ZXJsYW5kIHV0aWxpdGllcykKPj4KPj4gLS0KPj4gQXJwaXQKPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gV2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+
PiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCj4+IGh0dHBzOi8vbGlzdHMuengyYzQuY29tL21h
aWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCj4+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4gV2ly
ZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQo+IGh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4v
bGlzdGluZm8vd2lyZWd1YXJkCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0
LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
