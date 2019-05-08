Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0325CC04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:08:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4972173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=carmickle.com header.i=@carmickle.com header.b="ZBKwdKRz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4972173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carmickle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4209162;
	Sat, 11 May 2019 13:07:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12901841
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 19:29:23 +0000 (UTC)
Received: from mail.carmickle.com (mail.carmickle.com
 [IPv6:2600:3c03::f03c:91ff:fe6e:212c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6f706c8
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 19:29:23 +0000 (UTC)
Received: from [IPv6:2001:470:1f07:6f1:1a1:752b:5733:16dd] (unknown
 [IPv6:2001:470:1f07:6f1:1a1:752b:5733:16dd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.carmickle.com (Postfix) with ESMTPSA id 3969D4989C45;
 Wed,  8 May 2019 19:29:23 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Wireguard Link issue
From: Frank Carmickle <frank@carmickle.com>
In-Reply-To: <e31bad62-8b62-eaaa-30a1-6aaff6060881@hetzner-cloud.de>
Date: Wed, 8 May 2019 15:29:20 -0400
Message-Id: <A062DDE7-CB9F-4210-8FD6-74A40DF85E26@carmickle.com>
References: <e31bad62-8b62-eaaa-30a1-6aaff6060881@hetzner-cloud.de>
To: Joshua Grimm <joshua.grimm@hetzner-cloud.de>
X-Mailer: Apple Mail (2.3445.9.1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=carmickle.com;
 s=20160808-mail; t=1557343763; bh=1wGMXOMwQapxcW+XQ1NC0kwmNYfX8ueQ/DZdS5Y7qNs=;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 b=ZBKwdKRz3GU80SSm/2UgA2lL4iP6KBIjRL3agRpPzqctReCzBgMFwrQEeFnVIKSDZLPDc9Mtptg4Z/tIphVX8NSl0t4Xav0VdSvWKbW1OWrtj5dX8SHgPUuii8XGI9P0Ya0MBaWwVnvPBL2sItQVQ9XvuascFrPzuekhNQfOhu0=
X-Mailman-Approved-At: Sat, 11 May 2019 15:07:56 +0200
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

SGVsbG8gSm9zaCwKCj4gT25BcHIgMjMsIDIwMTksIGF0IDU6NDkgQU0sIEpvc2h1YSBHcmltbSA8
am9zaHVhLmdyaW1tQGhldHpuZXItY2xvdWQuZGU+IHdyb3RlOgo+IAo+IEhleSBHdXlzLAo+IAo+
IEkgaGF2ZSB1c2VkIFdpcmVndWFyZCBmb3IgcXVpdGUgc29tZSB0aW1lIG5vdyBhbmQgSSdtIGZh
Y2luZyBhIHByb2JsZW0uCj4gCj4gZXZlcnkgb3RoZXIgZGF5IG9uZSB3aXJlZ3VhcmQgbGluayBz
dG9wcyB3b3JraW5nLiBJdCBqdXN0IHN0b3BzCj4gYWNjZXB0aW5nIHRyYWZmaWM6Cj4gCj4gcm9v
dEBibGFkZXJ1bm5lci0yOn4jIHBpbmcgLWMgMSAxMC4wLjEuMQo+IFBJTkcgMTAuMC4xLjEgKDEw
LjAuMS4xKSA1Nig4NCkgYnl0ZXMgb2YgZGF0YS4KPiAKPiAtLS0gMTAuMC4xLjEgcGluZyBzdGF0
aXN0aWNzIC0tLQo+IDEgcGFja2V0cyB0cmFuc21pdHRlZCwgMCByZWNlaXZlZCwgMTAwJSBwYWNr
ZXQgbG9zcywgdGltZSAwbXMKPiAKPiB3ZyB0ZWxscyBtZSB0aGF0IHRoZSBsaW5rIGlzIHVwIGFu
ZCBoYW5kc2hha2VzIGFyZSBzdGlsbCB3b3JraW5nOgo+IAo+IHBlZXI6IFE3cE82WFVlQktpMmR0
U1pPSXlYanBreVVFU2J2R0hmU0Y3Y3UxS21EMWc9Cj4gICBlbmRwb2ludDogcmVkYWN0ZWQ6NTE4
MjAKPiAgIGFsbG93ZWQgaXBzOiAwLjAuMC4wLzAKPiAgIGxhdGVzdCBoYW5kc2hha2U6IDExIHNl
Y29uZHMgYWdvCj4gICB0cmFuc2ZlcjogMTYyLjY3IEdpQiByZWNlaXZlZCwgOC4zMiBHaUIgc2Vu
dAo+ICAgcGVyc2lzdGVudCBrZWVwYWxpdmU6IGV2ZXJ5IDEgbWludXRlCj4gCj4gaWYgSSByZXN0
YXJ0IHRoZSBsaW5rIHdpdGgKPiAKPiBzeXN0ZW1jdGwgcmVzdGFydCB3Zy1xdWlja0B3ZzAKPiAK
PiBpdCB3b3JrcyBhZ2Fpbi4KPiAKPiBIZXJlIGlzIHRoZSByZWxldmVudCBwYXJ0IG9mIG15IGNv
bmZpZzoKPiAKPiBbSW50ZXJmYWNlXQo+IEFkZHJlc3MgPSAxMC4wLjEuMwo+IFByaXZhdGVLZXkg
PSByZWRhY3RlZAo+IExpc3RlblBvcnQgPSA1MTgyMAo+IFRhYmxlID0gb2ZmCj4gRndNYXJrID0g
MTIzNAo+IAo+IFtQZWVyXQo+IFB1YmxpY0tleSA9IHJlZGFjdGVkCj4gQWxsb3dlZElwcyA9IDAu
MC4wLjAvMAo+IEVuZHBvaW50ID0gcmVkYWN0ZWQ6NTE4MjAKPiBQZXJzaXN0ZW50S2VlcGFsaXZl
PTYwCgpJ4oCZbSBndWVzc2luZyB0aGlzIGlzIHRvIGluZnJlcXVlbnQgZm9yIGEgTkFUIHRpbWVy
LiBUcnkgMjAgc2VjcyBhbmQgc2VlIGlmIGl04oCZcyBhbnkgYmV0dGVyLgoKPiBJIHRyaWVkIHJ1
bm5pbmcgd2lyZWd1YXJkIGluIHRoaXMgZGVidWcgbW9kZSB3aXRoCj4gCj4gZWNobyAibW9kdWxl
IHdpcmVndWFyZCArcCIgPi9zeXMva2VybmVsL2RlYnVnL2R5bmFtaWNfZGVidWcvY29udHJvbAo+
IAo+IHRoZSBvbmx5IG1lc3NhZ2VzIEkgZ2V0IGFyZToKPiAKPiBbNjc3NTY5LjEwNTU1MV0gd2ly
ZWd1YXJkOiB3ZzA6IFNlbmRpbmcgaGFuZHNoYWtlIGluaXRpYXRpb24gdG8gcGVlciAxCj4gKHJl
ZGFjdGVkOjUxODIwKQo+IFs2Nzc1NjkuMTE2NzQ0XSB3aXJlZ3VhcmQ6IHdnMDogUmVjZWl2aW5n
IGhhbmRzaGFrZSByZXNwb25zZSBmcm9tIHBlZXIgMQo+IChyZWRhY3RlZDo1MTgyMCkKPiBbNjc3
NTY5LjExNjc2MV0gd2lyZWd1YXJkOiB3ZzA6IEtleXBhaXIgMjg1NTEgZGVzdHJveWVkIGZvciBw
ZWVyIDEKPiBbNjc3NTY5LjExNjc2NV0gd2lyZWd1YXJkOiB3ZzA6IEtleXBhaXIgMjg1NTQgY3Jl
YXRlZCBmb3IgcGVlciAxCj4gWzY3NzU2OS4xMTY3NzVdIHdpcmVndWFyZDogd2cwOiBTZW5kaW5n
IGtlZXBhbGl2ZSBwYWNrZXQgdG8gcGVlciAxCj4gKHJlZGFjdGVkOjUxODIwKQo+IFs2Nzc1ODUu
MTA1NjAzXSB3aXJlZ3VhcmQ6IHdnMDogUmV0cnlpbmcgaGFuZHNoYWtlIHdpdGggcGVlciAxCj4g
KHJlZGFjdGVkOjUxODIwKSBiZWNhdXNlIHdlIHN0b3BwZWQgaGVhcmluZyBiYWNrIGFmdGVyIDE1
IHNlY29uZHMKPiBbNjc3NTg1LjEwNTY0NF0gd2lyZWd1YXJkOiB3ZzA6IFNlbmRpbmcgaGFuZHNo
YWtlIGluaXRpYXRpb24gdG8gcGVlciAxCj4gKHJlZGFjdGVkOjUxODIwKQo+IFs2Nzc1ODUuMTEy
ODc3XSB3aXJlZ3VhcmQ6IHdnMDogUmVjZWl2aW5nIGhhbmRzaGFrZSByZXNwb25zZSBmcm9tIHBl
ZXIgMQo+IChyZWRhY3RlZDo1MTgyMCkKPiBbNjc3NTg1LjExMjg5M10gd2lyZWd1YXJkOiB3ZzA6
IEtleXBhaXIgMjg1NTMgZGVzdHJveWVkIGZvciBwZWVyIDEKPiBbNjc3NTg1LjExMjg5OF0gd2ly
ZWd1YXJkOiB3ZzA6IEtleXBhaXIgMjg1NTUgY3JlYXRlZCBmb3IgcGVlciAxCj4gWzY3NzU4NS4x
MTI5MDddIHdpcmVndWFyZDogd2cwOiBTZW5kaW5nIGtlZXBhbGl2ZSBwYWNrZXQgdG8gcGVlciAx
Cj4gKHJlZGFjdGVkOjUxODIwKQo+IAoKTWF5YmUgc29tZW9uZSBmYW1pbGlhciB3aXRoIHRoZSBj
b2RlIGNhbiB0ZWxsIHVzIGlmICJSZWNlaXZpbmcgaGFuZHNoYWtlIHJlc3BvbnNlIGZyb20gcGVl
ciAx4oCdIG1pZ2h0IGJlIGJldHRlciBwaHJhc2VkLCAibGlzdGVuaW5nIGZvciByZXNwb25zZSBm
cm9tIHBlZXIgMSI/CgoKLS1GQwoKPiBIZXJlIGFyZSBzb21lIG1vcmUgZGV0YWlsczoKPiAKPiB0
aGlzIGlzIGEgNiBub2RlIG5ldHdvcmsgd2l0aCBvbmUgbm9kZSBhY3RpbmcgYXMgZ2F0ZXdheSwg
SSBzZXQgdGhlCj4gcm91dGVzIHZpYSBQcmVVcC9Qb3N0VXAgYW5kIHJlbW92ZSB0aGVtIHZpYSBQ
cmVEb3duL1Bvc3REb3duLgo+IAo+IHJvb3RAYmxhZGVydW5uZXItMjp+IyB1bmFtZSAtYQo+IExp
bnV4IGJsYWRlcnVubmVyLTIgNC40LjAtMTQ1LWdlbmVyaWMgIzE3MS1VYnVudHUgU01QIFR1ZSBN
YXIgMjYKPiAxMjo0Mzo0MCBVVEMgMjAxOSB4ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXgK
PiAKPiByb290QGJsYWRlcnVubmVyLTI6fiMgaXAgbGluayBzaG93IHdnMAo+IDM6IHdnMDogPFBP
SU5UT1BPSU5ULE5PQVJQLFVQLExPV0VSX1VQPiBtdHUgMTQyMCBxZGlzYyBub3F1ZXVlIHN0YXRl
Cj4gVU5LTk9XTiBtb2RlIERFRkFVTFQgZ3JvdXAgZGVmYXVsdCBxbGVuIDEKPiAgICAgbGluay9u
b25lCj4gICAgIAo+IHJvb3RAYmxhZGVydW5uZXItMjp+IyBkcGtnIC1sIHwgZ3JlcCB3aXJlZ3Vh
cmQKPiBpaSAgd2lyZWd1YXJkLWRrbXMgICAgICAgICAgICAgICAgICAKPiAwLjAuMjAxOTA0MDYt
d2cxfnhlbmlhbCAgICAgICAgICAgICAgICAgICAgYWxsICAgICAgICAgIGZhc3QsIG1vZGVybiwK
PiBzZWN1cmUga2VybmVsIFZQTiB0dW5uZWwgKERLTVMgdmVyc2lvbikKPiBpaSAgd2lyZWd1YXJk
LXRvb2xzICAgICAgICAgICAgICAgICAKPiAwLjAuMjAxOTA0MDYtd2cxfnhlbmlhbCAgICAgICAg
ICAgICAgICAgICAgYW1kNjQgICAgICAgIGZhc3QsIG1vZGVybiwKPiBzZWN1cmUga2VybmVsIFZQ
TiB0dW5uZWwgKHVzZXJsYW5kIHV0aWxpdGllcykKPiAKPiBQbGVhc2UgaGVscCBtZSBkZWJ1Z2dp
bmcgdGhpcyBJc3N1ZSwgSSdtIGEgYmlnIGZhbiBvZiBXaXJlZ3VhcmQgYW5kCj4gd291bGQgbG92
ZSB0byB1c2UgaXQgd2l0aCBtb2RlIHByb2plY3RzCj4gCj4gSGF2ZSBhIG5pY2UgRGF5LAo+IEpv
c2hpCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBX
aXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4gV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQo+IGh0dHBz
Oi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBs
aXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFp
bG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
