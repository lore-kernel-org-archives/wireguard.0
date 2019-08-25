Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A63C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8040A206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8040A206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a73b3b9d;
	Sun, 25 Aug 2019 19:24:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a10631c
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:24:08 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddd1ad4d
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:24:07 +0000 (UTC)
Received: from [192.168.127.216] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, TLS: TLS1.2,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by telperion.info with ESMTPSA
 id 0000000000046AB6.000000005D62E0F6.000051F2; Sun, 25 Aug 2019 12:26:46 -0700
Mime-Version: 1.0 (1.0)
Subject: Re: Support of multiple endpoints to support IPv6/IPv4 protocol change
From: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <87h86fq4ss.fsf@line.ungleich.ch>
Date: Sun, 25 Aug 2019 12:23:35 -0700
Message-Id: <915FDB2D-7452-433C-A3FE-63EF75916417@pallas.us>
References: <87h86fq4ss.fsf@line.ungleich.ch>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
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

SSByZWNlbnRseSByYW4gaW50byB0aGlzIGlzc3VlLiBNeSBzb2x1dGlvbiB3YXMgdG8gc29ydCBh
IGxpc3Qgb2YgZW5kcG9pbnQgYWRkcmVzc2VzIChub3QgZG9tYWlucykgYnkgcHJpb3JpdHkgYW5k
IGZpcnN0IGNoZWNrIHdoZXRoZXIgdGhlIGNsaWVudCBoYWQgYSByb3V0ZSB0byBhbiBhZGRyZXNz
IGJlZm9yZSBwaWNraW5nIGl0LiBJdCB3b3VsZCBiZSBuaWNlIGlmIFdpcmVndWFyZCBrZXB0IGEg
bGlzdCBvZiBmYWxsYmFjayBhZGRyZXNzZXMgaW4gY2FzZSB0aGUgY3VycmVudGx5IGFjdGl2ZSBh
ZGRyZXNzIHN0b3BwZWQgd29ya2luZywgYnV0IHRoaXMgY2FuIGJlIGFjaGlldmVkIGJ5IHRvb2xp
bmcgdG9kYXkuCgp+RGVycmljayDigKIgaVBob25lCgo+IE9uIEF1ZyAxNywgMjAxOSwgYXQgNjo1
MCBBTSwgTmljbyBTY2hvdHRlbGl1cyA8bmljby5zY2hvdHRlbGl1c0B1bmdsZWljaC5jaD4gd3Jv
dGU6Cj4gCj4gCj4gSGVsbG8sCj4gCj4gVEw7RFIKPiBIb3cgZGlmZmljdWx0IGlzIGl0IHRvIGFk
ZCBzdXBwb3J0IGZvciBtdWx0aXBsZSBlbmRwb2ludHMgaW4gd2lyZWd1YXJkPwo+IAo+IE15IHBy
b2JsZW0gaXMgdGhhdCBzb21ldGltZXMgd2UgbmVlZCB0byBjb25uZWN0IHRvIHRoZSBWUE4gc2Vy
dmVyCj4gdmlhIElQdjQsIHNvbWV0aW1lcyB2aWEgSVB2NiBhbmQgdGhlIG90aGVyIHByb3RvY29s
IHdvbid0IHdvcmsgYW55bW9yZS4KPiAKPiAKPiBMb25nIHN0b3J5Ogo+IFdlIGFyZSBhIGNsb3Vk
IHByb3ZpZGVyIG9mZmVyaW5nIGZyZWUgSVB2NiBWUE5zIHdpdGggVk1zLCB0byBlbmFibGUKPiBj
dXN0b21lcnMgdG8gaGF2ZSBJUHY2IGFueXdoZXJlLiBJbiBzb21lIHNpdHVhdGlvbnMgY3VzdG9t
ZXJzIGFyZQo+IGNvbmZ1c2VkLCBiZWNhdXNlIHRoZWlyIG5ldHdvcmsgZG9lc24ndCB3b3JrIGFu
eW1vcmUgd2hpbGUgd2lyZWd1YXJkIGlzCj4gYWN0aXZlIG9yIHRoZSB0dW5uZWwgZG9lc24ndCB3
b3JrIGluIHNvbWUgbmV0d29ya3MuIEkgd2lsbCBkZXNjcmliZSBzb21lCj4gc2l0dWF0aW9ucyB0
aGF0IHdlIGV4cGVyaWVuY2VkIGFuZCBob3cgd2Ugd29yayBhcm91bmQgaXQgYXQgdGhlIG1vbWVu
dC4KPiAKPiAKPiBTdG9yeSAxOiB1c2luZyBWUE4gaW4gVlBOCj4gU29tZSBvZiBvdXIgY3VzdG9t
ZXJzIGhhdmUgYW4gSVB2NiB0dW5uZWwgdG8gcHJvdmlkZSBhIC80OCB0byB0aGVpcgo+IG5ldHdv
cmsuIFRoZXkgdXN1YWxseSB1c2UgYSBjb3VwbGUgb2YgLzY0cyB0byBzZXBhcmF0ZSB0aGVpciBp
bnRlcm5hbAo+IG5ldHdvcmtzLiBTb21lIG9mIHRoZXNlIGN1c3RvbWVycyBhbHNvIGhhdmUgYSBW
UE4gdG8gdGhlaXIgZW5kIGRldmljZQo+IChsaWtlIGEgbm90ZWJvb2spIHdpdGggYW5vdGhlciAv
NDggcm91dGVkIHRvIGl0LiBJbiB0aGlzIHNpdHVhdGlvbiwgdGhleQo+IGFyZSB1bmFibGUgdG8g
cmVhY2ggdGhlIFZQTiBzZXJ2ZXIgb3IgbG9jYWwgY2xpZW50cyBpZiB0aGV5IGRvbid0Cj4gZXhw
bGljaXRseSBjaGFuZ2UgdGhlaXIgY29uZmlndXJhdGlvbiB0byByZWFjaCB0aGUgVlBOIHNlcnZl
ciB2aWEgSVB2NAo+IGluc3RlYWQgb2YgSVB2NjoKPiAKPiBXaXRoIGEgc3RhbmRhcmQgY29uZmln
LCB0aGUgRE5TIG5hbWUgb2YgdGhlIHR1bm5lbCBlbmRwb2ludCBpbgo+IGluIHdnMC5jb25mLCBu
b3QgZml4ZWQgdG8gSVB2NC9JUHY2LCB3ZSBoYWQgdGhlIGZvbGxvd2luZyByZXBvcnQ6Cj4gCj4g
SW4gdGhpcyBjYXNlIGlmIHRoZSBub3RlYm9vayBjb25uZWN0cyB2aWEgSVB2NiB0byB0aGUgVlBO
IHNlcnZlciwKPiBpdCBlZmZlY3RpdmVseSBjb25uZWN0cyB0byB0aGUgVlBOIHNlcnZlciB0aHJv
dWdoIHRoZSBWUE4uIFdlIGhhZAo+IHJlcG9ydHMgdGhhdCBpbiB0aGlzIHNpdHVhdGlvbiB0aGUg
bm90ZWJvb2sgY2FuIGVpdGhlciBub3QgZXN0YWJsaXNoIHRoZQo+IFZQTiB0dW5uZWwgb3IgaXMg
dW5hYmxlIHRvIHJlYWNoIGxvY2FsIGRldmljZXMKPiAKPiBXb3JrYXJvdW5kIGZyb20gc29tZSBj
dXN0b21lcnM6IGhhcmQgY29kZSB0aGUgSVB2NCBhZGRyZXNzIGFzIGFuIGVuZHBvaW50Cj4gCj4g
U3RvcnkgMjogQ2hhbmdlIGZyb20gSVB2NCBvbmx5IHRvIElQdjYgb25seSBuZXR3b3Jrcwo+IAo+
IFdlIGhhdmUgcmVwb3J0cyBmcm9tIGNsaWVudHMgdGhhdCB0aGUgVlBOIGlzIG5vdCBlc3RhYmxp
c2hlZCBhZ2FpbiwgaWYKPiB0aGV5IHN3aXRjaCBmcm9tIGFuIElQdjQgb25seSBuZXR3b3JrIHRv
IGFuIElQdjYgb25seSBuZXR3b3JrIGFuZCB2aWNlCj4gdmVyc2EuIEkgYXNzdW1lIHRoaXMgaXMg
ZHVlIHRvIHdpcmVndWFyZCByZXNvbHZpbmcgdGhlIGFkZHJlc3MgYXQKPiBzdGFydHVwIGFuZCBu
ZXZlciByZS1yZXNvbHZpbmcgYW5kL29yIG5vdCBzdG9yaW5nIGFsbCBETlMgcmVzdWx0cyAoQSBh
bmQKPiBBQUFBIGFuc3dlcnMpLgo+IAo+IFdvcmthcm91bmQgZnJvbSBzb21lIGN1c3RvbWVyczog
cmVzdGFydCB3aXJlZ3VhcmQgd2hlbiBjaGFuZ2luZwo+IHVuZGVybHlpbmcgcHJvdG9jb2wgbmV0
d29yawo+IAo+IAo+IFN0b3J5IDM6IENvbWJpbmF0aW9uIG9mIGFib3ZlCj4gU29tZSBvZiBvdXIg
Y2xpZW50cyBoYXJkIGNvZGVkIHRoZSBJUHY0IGFkZHJlc3Mgb2YgdGhlIHR1bm5lbCBlbmRwb2lu
dAo+IGluIHRoZWlyIHdnMC5jb25mIHRvIGF2b2lkIHRoZSBwcm9ibGVtIGZyb20gc3RvcnkgMS4g
SG93ZXZlciB0aGlzIGJyZWFrcwo+IHRoZWlyIEludGVybmV0IHdoZW4gc3dpdGNoaW5nIHRvIElQ
djYgb25seSBuZXR3b3Jrcy4gSW4gdGhpcyBjYXNlIHRoZQo+IGVuZHBvaW50IGlzIGZpeGVkIHRv
IElQdjQsIGJ1dCB0aGV5IGRvbid0IGhhdmUgYW55IElQdjQgY29ubmVjdGl2aXR5Lgo+IAo+IFdv
cmthcm91bmQgZnJvbSBzb21lIGN1c3RvbWVyczogcmVjb25maWd1cmUgd2lyZWd1YXJkIHRvIHVz
ZSBoYXJkY29kZWQKPiBJUHY2IG9yIElQdjQgb25seSBlbmRwb2ludC4KPiAKPiAKPiAtLQo+IFlv
dXIgU3dpc3MsIE9wZW4gU291cmNlIGFuZCBJUHY2IFZpcnR1YWwgTWFjaGluZS4gTm93IG9uIHd3
dy5kYXRhY2VudGVybGlnaHQuY2guCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4gV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQo+IGh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpX
aXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9s
aXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
