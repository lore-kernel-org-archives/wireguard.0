Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598C9C35DF2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 06:07:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF0C20656
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 06:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF0C20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libassi.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ce55686;
	Tue, 25 Feb 2020 06:04:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1948375
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 06:04:13 +0000 (UTC)
Received: from smtp2.outgoing.loopia.se (smtp2.outgoing.loopia.se
 [93.188.3.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f862b8aa
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 06:04:13 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id D3F4B2E5DFCC
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 07:07:40 +0100 (CET)
Received: from s499.loopia.se (unknown [172.22.191.5])
 by s807.loopia.se (Postfix) with ESMTP id B54CD2E27659;
 Tue, 25 Feb 2020 07:07:40 +0100 (CET)
Received: from s470.loopia.se (unknown [172.22.191.5])
 by s499.loopia.se (Postfix) with ESMTP id B15C51CDAF12;
 Tue, 25 Feb 2020 07:07:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s498.loopia.se ([172.22.191.5])
 by s470.loopia.se (s470.loopia.se [172.22.190.10]) (amavisd-new, port 10024)
 with LMTP id rQPdSnNtOpyi; Tue, 25 Feb 2020 07:07:38 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: peter@libassi.se
X-Loopia-Originating-IP: 78.82.164.216
Received: from [10.79.0.17] (c-d8a4524e.03-77-73746f30.bbcust.telenor.se
 [78.82.164.216]) (Authenticated sender: peter@libassi.se)
 by s498.loopia.se (Postfix) with ESMTPSA id 843A947085A;
 Tue, 25 Feb 2020 07:07:38 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: FreeBSD wireguard wg-quick remote IP address assignment is
 incorrect
From: Peter Libassi <peter@libassi.se>
In-Reply-To: <CAHmME9oh74nx_eZz19vn=n+U6gF0M6Dtu--EnGw8dVwSnvX9cg@mail.gmail.com>
Date: Tue, 25 Feb 2020 07:07:38 +0100
Message-Id: <94EEC84F-00C1-446A-9AE7-61CACB38CD64@libassi.se>
References: <01F8520D-6F1E-4DFB-BC07-80D9838EF35D@libassi.se>
 <CAHmME9ozSn+f1s9+q4-L_PA+Q76YY81X8_P2i4jMhYM8Or-17Q@mail.gmail.com>
 <645AC0E3-6440-4ABF-9589-179F5AEDE00E@libassi.se>
 <CAHmME9oh74nx_eZz19vn=n+U6gF0M6Dtu--EnGw8dVwSnvX9cg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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

Cgo+IDIzIGZlYi4gMjAyMCBrbC4gMTY6MzIgc2tyZXYgSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNv
bkB6eDJjNC5jb20+Ogo+IAo+IE9uIFN1biwgRmViIDIzLCAyMDIwIGF0IDI6MjUgUE0gUGV0ZXIg
TGliYXNzaSA8cGV0ZXJAbGliYXNzaS5zZT4gd3JvdGU6Cj4+IAo+PiBPaywgV2VsbCBldmVuIGlm
IHVzaW5nIGFub3RoZXIgbG9jYWwgSVAgaW4gcmFuZ2UgMTI3LjAuMC4wLzggd2UgY2Fu4oCZdCBi
ZSBjZXJ0YWluIHdlIHdpbGwgY2xhc2ggd2l0aCBzb21ldGhpbmcgZWxzZS4KPj4gCj4+IEhvdyBh
Ym91dCBhZGRpbmcgYSBkaXJlY3RpdmUgZm9yIHRoZSByZW1vdGUgaW50ZXJmYWNlIGFkZHJlc3Mg
aW4gd2cuY29uZj8gTGlrZSB0aGlzOgo+PiAKPj4gIyBjYXQgL3Vzci9sb2NhbC9ldGMvd2lyZWd1
YXJkL3dnMC5jb25mCj4+IFtJbnRlcmZhY2VdCj4+IFByaXZhdGVLZXkgPSA8LT4KPj4gTGlzdGVu
UG9ydCA9IDc3NzcKPj4gQWRkcmVzcyA9IDE5Mi4xNjguMi4xLzMyCj4+IFJlbW90ZUFkZHJlc3Mg
PSAxOTIuMTY4LjIuMgo+PiAKPj4gW1BlZXJdCj4+IFB1YmxpY0tleSA9IDwtPgo+PiBBbGxvd2Vk
SVBzID0gMTkyLjE2OC4yLjAvMjQKPj4gRW5kcG9pbnQgPSAxNzIuMTYuMC4yMzo3Nzc3Cj4+IAo+
PiAjIGRpZmYgL3Vzci9sb2NhbC9iaW4vd2ctcXVpY2sub3JnIC4vd2ctcXVpY2sKPj4gMTdhMTgK
Pj4+IFJFTU9URV9BRERSRVNTPSIiCj4+IDg2YTg4Cj4+PiBSZW1vdGVBZGRyZXNzKSBSRU1PVEVB
RERSRVNTPSIkdmFsdWUiOyBjb250aW51ZSA7Owo+PiAxNzVjMTc3LDE4MQo+PiA8IGNtZCBpZmNv
bmZpZyAiJElOVEVSRkFDRSIgaW5ldCAiJDEiICIkezElJS8qfSIgYWxpYXMKPj4gLS0tCj4+PiAg
ICBpZiBbWyAtbiAkUkVNT1RFQUREUkVTUyBdXTsgdGhlbgo+Pj4gY21kIGlmY29uZmlnICIkSU5U
RVJGQUNFIiBpbmV0ICIkMSIgIiRSRU1PVEVBRERSRVNTIiBhbGlhcwo+Pj4gICAgZWxzZQo+Pj4g
ICAgICAgICAgICAgICAgY21kIGlmY29uZmlnICIkSU5URVJGQUNFIiBpbmV0ICIkMSIgIiR7MSUl
Lyp9IiBhbGlhcwo+Pj4gICAgZmkKPiAKPiBUaGlzIGlzIG5vdCBhIGNvcnJlY3QgZml4OyB3ZSdy
ZSBub3QgZ29pbmcgdG8gYWRkIGEgY29uZmlndXJhdGlvbiBub2IKPiB0byB3b3JrIGFyb3VuZCBG
cmVlQlNEIG5ldHdvcmsgc3RhY2sgZ290Y2hhcy4KPiAKPiBSYXRoZXIsIEknZCBwcmVmZXIgdG8g
c2VlIGFsbCB0aGUgRnJlZUJTRCB3Zy1xdWljayBzZW1hbnRpY3MgcmVkb25lCj4gYXJvdW5kIG11
bHRpcGxlIHJvdXRpbmcgdGFibGVzIGFuZCBtYXJrcywgbXVjaCBsaWtlIG9uIExpbnV4LCB0aG91
Z2ggSQo+IGRvbid0IGtub3cgaWYgdGhhdCdzIHBvc3NpYmxlLiBCYXJyaW5nIHRoYXQsIGEgcHJv
cGVyIHNvbHV0aW9uCj4gcHJvYmFibHkgaW52b2x2ZXMgcmUtcmVhZGluZyB0aGUgaWZjb25maWcg
bWFuIHBhZ2UgYSBmZXcgZG96ZW4gdGltZXMKPiB0byBmaW5kIG91dCBob3cgdG8gaGF2ZSBpbnRl
cmZhY2UgYWRkcmVzc2VzIGFzIHdlIG5lZWQgdGhlbS4KCkl0IHdvcmtzIHBlcmZlY3RseSBmb3Ig
bXkgc2luZ2xlIHNpdGUtMi1zaXRlIHVzZSBjYXNlLiBZb3UgaGF2ZSB0d28gb3B0aW9ucyBhcyBJ
IHNlZSBpdC4gRWl0aGVyIGNvbnZpbmNlIHRoZSBGcmVlQlNEIHRlYW0gdG8gZHJvcCB0aGUgZGVz
dF9hZGRyZXNzIHJlcXVpcmVtZW50IG9yIGltcGxlbWVudCBsb2NhbC9yZW1vdGUgYWRkcmVzcyBh
d2FyZW5lc3MgcGVyIFtQZWVyXSBpbiB0aGUgd2ctcXVpY2sgc2NyaXB0LgoKL1BldGVyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFp
bGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5j
b20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
