Return-Path: <SRS0=ChNg=ZA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B63FA372C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Nov 2019 15:28:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B220C2178F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Nov 2019 15:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="FWFow4ar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B220C2178F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaabcee5;
	Fri, 8 Nov 2019 15:28:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2369a94
 for <wireguard@lists.zx2c4.com>; Fri, 8 Nov 2019 15:28:31 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68a73149
 for <wireguard@lists.zx2c4.com>; Fri, 8 Nov 2019 15:28:31 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id DDD112280A;
 Fri,  8 Nov 2019 16:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1573226909; bh=AUqERPaD/fEjflnoOiQHVNA3uXeylK+oFe9MwXw6ais=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=FWFow4arlAlE8w6tUolWwGexHDK/aetYjcOMiiKBJaogisXSa+Xfb6A0sYt8im90d
 4L+iUxfrtD/rxeiAKBW8HqMGpoIDzOVqcaMRzSidox6HsDF6Ew/cRob4h7c33wt+KS
 Zxqjp4FNVpouy6AYAL3sok4Y2iGGvocC/zWXF9z5XwW128DTt1Wpz/F3nQdq8caW7H
 FkPpHJar2i8yhWaGq7qskDuXS6O6NEJa+0UumiURJ4uU0m+UoVBbSr6NPLsZ5SArLV
 PGgwiIttm/MnugHclwmsRpMspN8wrhTxsFb2HuaaLUzdZAwqAXu0n1ocMQj6f/wrQi
 HSn+bOlRXFf+Q==
Received: by diamond.localdomain (Postfix, from userid 1000)
 id 811EF13E2BBC; Fri,  8 Nov 2019 16:29:31 +0100 (CET)
References: <87pni3ljzh.fsf@ungleich.ch>
 <20191107215054.GA23531@matrix-dream.net>
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Ivan =?utf-8?Q?Lab=C3=A1th?= <labawi-wg@matrix-dream.net>
Subject: Re: Netfilter redirect does not work with wireguard
In-reply-to: <20191107215054.GA23531@matrix-dream.net>
Date: Fri, 08 Nov 2019 16:29:31 +0100
Message-ID: <87mud61j50.fsf@ungleich.ch>
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

CkhlbGxvLAoKdGhlcmUgYXJlIGFjdHVhbGx5IG5vIHJlcGxpZXMgYXQgYWxsLCB3aGljaCBpcyB3
aHkgSSAqYXNzdW1lZCogdGhhdCB0aGUKcGFja2V0cyBkbyBub3QgYWN0dWFsbHkgYXJyaXZlIGF0
IHRoZSB3aXJlZ3VhcmQgY29kZS4KCkhvdyBkb2VzIHdpcmVndWFyZCBpbnRlZ3JhdGUgaW50byB0
aGUga2VybmVsIC8gbmV0ZmlsdGVyIGZsb3c/IE9yIGluCm90aGVyIHdvcmRzLCBob3cgaXMgdGhl
IGV4cGVjdGVkIGJlaGF2aW91ciBvZiBzb21ldGhpbmcgbGlrZSB3aGF0IEkgYW0KdHJ5aW5nIHRv
IGRvPwoKQmVzdCwKCk5pY28KCnAucy46IEkgd2FzIGFsc28gdGhpbmtpbmcgYWJvdXQgbmVlZGlu
ZyBTTkFULCBidXQgSSBkb24ndCBzZWUgYW55CnJlcGxpZXMgZ2VuZXJhdGVkIGF0IHRoZSBtb21l
bnQuCgoKSXZhbiBMYWLDoXRoIDxsYWJhd2ktd2dAbWF0cml4LWRyZWFtLm5ldD4gd3JpdGVzOgoK
PiBIZWxsbywKPgo+IGhhdmUgeW91IGNoZWNrZWQgdGhlIHNvdXJjZSBwb3J0IG9mIHJlcGxpZXMs
IG9yIHdoZXRoZXIKPiB0aGVyZSBhcmUgYW55IHJlcGxpZXM/Cj4KPiAjIHRjcGR1bXAgLW5uCj4K
PiBUY3BkdW1wIHNob3VsZCBzaG93IHByZS1OQVQgYWRkcmVzc2VzIG9uIGluY29taW5nIHBhY2tl
dHMKPiBhbmQgQUZBSUsgcG9zdC1OQVQgb24gb3V0Z29pbmcgcGFja2V0cywgaS5lLiB3aGF0IGdv
ZXMgb24KPiB0aGUgd2lyZS4KPgo+IFlvdSBtaWdodCBuZWVkIHRvIGFwcGx5IFNOQVQgb24gb3V0
Z29pbmcgcGFja2V0cywgd2hpY2gKPiBtaWdodCBoYXBwZW4gYXV0b21hdGljYWxseSB3aXRoIFRD
UCBjb25uZWN0aW9uIHRyYWNraW5nLAo+IGJ1dCBJIHdvdWxkbid0IHJlYWxseSBleHBlY3QgaXQg
b24gY29ubmVjdGlvbi1sZXNzIFVEUC4KPgo+IFJlZ2FyZHMsCj4gSXZhbgo+Cj4gT24gVGh1LCBO
b3YgMDcsIDIwMTkgYXQgMDU6Mzg6NDJQTSArMDEwMCwgTmljbyBTY2hvdHRlbGl1cyB3cm90ZToK
Pj4KPj4gSGVsbG8sCj4+Cj4+IEkgYW0gZXhwZXJpbWVudGluZyB3aXRoIG5mdCAvIG5ldGZpbHRl
ciByZWRpcmVjdHMgdG8gc3VwcG9ydCB3aXJlZ3VhcmQKPj4gcGFja2V0cyBvbiAqYW55KiB1ZHAg
cG9ydC4gSSB0cmllZCB1c2luZyB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb24gZm9yCj4+IG5m
dGFibGVzOgo+Pgo+PiBbMTc6MzQ6MTRdIHZwbi0yYTBhZTVjMTp+IyBjYXQgL2V0Yy9uZnRhYmxl
cy5jb25mCj4+ICMhL3Vzci9zYmluL25mdCAtZgo+Pgo+PiBmbHVzaCBydWxlc2V0Cj4+Cj4+IHRh
YmxlIGlwIG5hdCB7Cj4+IAljaGFpbiBwcmVyb3V0aW5nIHsKPj4gCQl0eXBlIG5hdCBob29rIHBy
ZXJvdXRpbmcgcHJpb3JpdHkgMDsKPj4KPj4gCQkjIFNTSCB3b3Jrcwo+PiAJCXRjcCBkcG9ydCAh
PSAyMiByZWRpcmVjdCB0byAyMgo+Pgo+PiAJCSMgd2lyZWd1YXJkIGRvZXNuJ3QKPj4gCQl1ZHAg
ZHBvcnQgIT0gNTE4MjAgcmVkaXJlY3QgdG8gNTE4MjAKPj4gCX0KPj4KPj4gCWNoYWluIHBvc3Ry
b3V0aW5nIHsKPj4gCQl0eXBlIG5hdCBob29rIHBvc3Ryb3V0aW5nIHByaW9yaXR5IDA7Cj4+IAl9
Cj4+IH0KPj4KPj4gSG93ZXZlciBhcyB5b3UgY2FuIHNlZSBpbiB0aGUgY29tbWVudHMsIHRoaXMg
ZG9lcyBub3Qgd29yayB3aXRoCj4+IHdpcmVndWFyZCwgaG93ZXZlciBpdCBkb2VzIHdvcmsgd2l0
aCBTU0guCj4+Cj4+IEkgY2FuIHNlZSB0aGF0IHdpcmVndWFyZCBpcyBrZXJuZWwgc3BhY2UsIGFu
ZCBzc2ggdXNlciBzcGFjZSwgYnV0IGRvZXMKPj4gdGhhdCBjYXVzZSB0aGUgbmV0ZmlsdGVyIHBh
cnQgdG8gYmUgc2tpcHBlZCBvciBhbSBJIGRvaW5nIHNvbWUgc2lsbHkKPj4gbWlzdGFrZSBoZXJl
Pwo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+Cj4+IE5pY28KPj4KPj4KPj4gLS0KPj4gTW9kZXJuLCBh
ZmZvcmRhYmxlLCBTd2lzcyBWaXJ0dWFsIE1hY2hpbmVzLiBWaXNpdCB3d3cuZGF0YWNlbnRlcmxp
Z2h0LmNoCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPj4gV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQo+
PiBodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAoKCi0t
Ck1vZGVybiwgYWZmb3JkYWJsZSwgU3dpc3MgVmlydHVhbCBNYWNoaW5lcy4gVmlzaXQgd3d3LmRh
dGFjZW50ZXJsaWdodC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20K
aHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
