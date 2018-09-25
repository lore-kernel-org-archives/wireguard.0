Return-Path: <SRS0=0td0=MH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17CAC43382
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 05:20:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8AF720877
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 05:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8AF720877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e4ef11a;
	Tue, 25 Sep 2018 05:18:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95e60af8
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 05:18:19 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9455d7e4
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 05:18:19 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 2826120083;
 Tue, 25 Sep 2018 05:20:52 +0000 (UTC)
Date: Tue, 25 Sep 2018 10:20:51 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Aaron W. Swenson" <aaron@grandmasfridge.org>
Subject: Re: IPv6 Not Getting Past Server
Message-ID: <20180925102051.025c281f@natsu>
In-Reply-To: <20180922195522.GA25561@gengoff>
References: <20180922195522.GA25561@gengoff>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

T24gU2F0LCAyMiBTZXAgMjAxOCAxNTo1NToyMiAtMDQwMAoiQWFyb24gVy4gU3dlbnNvbiIgPGFh
cm9uQGdyYW5kbWFzZnJpZGdlLm9yZz4gd3JvdGU6Cgo+IEnigJltIGdvaW5nIHRvIHVzZSB0aGUg
b2ZmaWNpYWwgZG9jdW1lbnRhdGlvbiBJUCBhZGRyZXNzZXMuIEkgYW0gdXNpbmcgcmVhbCBJUHY2
Cj4gYWRkcmVzc2VzIGFuZCBub3QgdXNpbmcgTkFUNjYuIE5hdHVyYWxseSwgTkFUIGlzIGJlaW5n
IHVzZWQgZm9yIElQdjQuIEhlcmUgYXJlCj4gdGhlIGRlZmluaXRpb25zIEnigJltIHVzaW5nOgo+
IAo+ICAgICBTZXJ2ZXIgUHVibGljIElQdjY6IDIwMDE6REI4OjpERUFEOkYwMEQvNjQKPiAgICAg
U2VydmVyIFB1YmxpYyBJUHY0OiAxOTIuMC4yLjEKPiAgICAgUm91dGVkIC8xMTY6IDIwMDE6REI4
OjpCRUVGOjMwMDAvMTE2CgpBcmUgeW91IHN1cmUgeW91IGhhdmUgYSAqcm91dGVkKiBzdWJuZXQg
ZnJvbSB5b3VyIElTUD8gTW9yZW92ZXIsIGRvZXMKdGhpcyAvMTE2IGxpZSB3aXRoaW4gdGhlIGFi
b3ZlIC82ND8gKGluIHlvdXIgb2JmdXNjYXRlZCBleGFtcGxlIGl0IGRvZXMpCgpJdCBjb3VsZCBi
ZSB0aGF0IHlvdXIgcHJvdmlkZXIgZ2l2ZXMgeW91IG5vdCBhIHJvdXRlZCBzdWJuZXQsIGJ1dCBh
biBvbi1saW5rCm9uZSBpbnN0ZWFkLiBJbiB3aGljaCBjYXNlIHlvdSBjYW4gdXNlIElQcyBmcm9t
IGl0IG9uIHlvdXIgc2VydmVyIGRpcmVjdGx5LApidXQgY2FuJ3Qgcm91dGUgaXQgc29tZXdoZXJl
IGVsc2UgKGJlY2F1c2UgdGhlIHVwc3RyZWFtIHJvdXRlciBleHBlY3RzIGFsbCBJUHMKdG8gYmUg
cmVhY2hhYmxlIGRpcmVjdGx5IG9uIHRoZSBzYW1lIGxpbmsgdGhhdCBpdCBoYXMgdG8geW91ciBz
ZXJ2ZXIpLgoKT25lIHdvcmthcm91bmQgaXMgdG8gc2V0IHVwIG5kcHBkLCB3aGljaCB0dXJucyBh
biBvbi1saW5rIHN1Ym5ldCBpbnRvIHJvdXRlZDoKaHR0cHM6Ly9naXRodWIuY29tL0RhbmllbEFk
b2xmc3Nvbi9uZHBwZApCdXQgaW4gbXkgZXhwZXJpZW5jZSBpdCBkb2VzIG5vdCB3b3JrIG9uIGFs
bCBJU1BzL2hvc3RzLgoKCj4gICAgIFNlcnZlciBXaXJlZ3VhcmQgSVB2NjogMjAwMTpEQjg6OkJF
RUY6MzAwMQo+ICAgICBTZXJ2ZXIgV2lyZWd1YXJkIElQdjQ6IDEwLjAuMC4xCj4gICAgIENsaWVu
dCBXaXJlZ3VhcmQgSVB2NjogMjAwMTpEQjg6OkJFRUY6MzAwMgo+ICAgICBDbGllbnQgV2lyZWd1
YXJkIElQdjQ6IDEwLjAuMC4yCgpZb3UgZGlkbid0IHBvc3QgeW91ciBXaXJlR3VhcmQncyBBbGxv
d2VkSVBzIHNldHRpbmcsIGJ1dCBJIHRlbmQgdG8gYXNzdW1lCmV2ZXJ5dGhpbmcgaXMgZmluZSB0
aGVyZS4gSnVzdCBkb24ndCBmb3JnZXQgdGhhdCB0byByb3V0ZSB0byB0aGUgb3V0c2lkZSB3b3Js
ZApBbGxvd2VkSVBzIG9uIHRoZSBjbGllbnQgbXVzdCBjb250YWluIDo6LzAgZm9yIHRoZSBzZXJ2
ZXIuCgo+IEkgY2FuIHBpbmcgdGhlIG91dHNpZGUgd29ybGQgdGhyb3VnaCBJUHY0IGp1c3QgZmlu
ZS4gSG93ZXZlciwgd2l0aCBJUHY2IEkgY2FuCj4gb25seSBwaW5nIHRoZSBzZXJ2ZXLigJlzIElQ
djYgYWRkcmVzc2VzICgyMDAxOkRCODo6QkVFRjozMDAxIGFuZAo+IDIwMDE6REI4OjpERUFEOkYw
MEQpLiBUaGUgb3V0c2lkZSB3b3JsZCBzdGF5cyBvdXQgb2YgcmVhY2guIFRoZSBwYWNrZXRzIGFy
ZSBqdXN0Cj4gZHJvcHBlZC4gSeKAmW0gbm90IGdldHRpbmcgbmV0d29yayB1bnJlYWNoYWJsZSBv
ciBhbnkgb3RoZXIgZXJyb3IgbWVzc2FnZSBiYWNrLgoKUnVuIHRjcGR1bXAgb24gdGhlIHNlcnZl
ciBib3RoIG9uIHRoZSBXRyBzaWRlIGFuZCBvbiB0aGUgb3V0Z29pbmcgaW50ZXJmYWNlLAphbmQg
eW91J2xsIGJlIGFibGUgdG8gc2F5IG1vcmUgcHJlY2lzZWx5IHdoZXJlIG9yIGJ5IHdob20gdGhl
eSBhcmUgZHJvcHBlZC4KCj4gV2hlbiBJIGVuYWJsZWQgZm9yd2FyZGluZyBmb3IgSVB2NiBvbiB0
aGUgc2VydmVyLCBJIGRpZCBoYXZlIHRvIG1hbnVhbGx5IGFkZAo+IHRoZSByb3V0ZSBzbyB0aGF0
IElQdjYgd291bGQgY29udGludWUgd29ya2luZyBvbiB0aGUgc2VydmVyCj4gKGlwIC1yIHJvdXRl
IGFkZCBkZWZhdWx0IGZlODA6OjEpLgoKVGhpcyBpcyBiZWNhdXNlIHRoZSBkZWZhdWx0IGJlaGF2
aW9yIGlzIHN1Y2ggdGhhdCBlbmFibGluZyByb3V0aW5nIHByZWNsdWRlcwphY2NlcHRpbmcgUm91
dGUgQWR2ZXJ0aXNlbWVudHMgZnJvbSB1cHN0cmVhbSByb3V0ZXJzLCBzbyB5b3UgbG9zdCB0aGUg
cm91dGUKeW91IHdlcmUgZ2V0dGluZyB2aWEgdGhvc2UuIFRvIGtlZXAgYWNjZXB0aW5nIHRoZW0s
IHNldCBhY2NlcHRfcmEgdG8gMgooZWNobyAyID4gL3Byb2Mvc3lzL25ldC9pcHY2L2NvbmYvZXRo
WC9hY2NlcHRfcmEpCgo+IEkgY2FuIFNTSCBpbnRvIHRoZSBzZXJ2ZXIsIGFuZCBwaW5nIHRoZQo+
IG91dHNpZGUgd29ybGQgbm8gcHJvYmxlbS4gQW5kLCB0aGUgb3V0c2lkZSB3b3JsZCBjYW4gcmVh
Y2ggbXkgc2VydmVyIHZpYSBJUHY2Cj4ganVzdCBmaW5lLCB0b28uCgpUcnkgYWRkaW5nIG9uZSBv
ZiB0aGUgSVBzIHlvdSB3YW50ZWQgdG8gcm91dGUgaW50byBXRyBkaXJlY3RseSB0byBzZXJ2ZXIn
cwp1cGxpbmsgaW50ZXJmYWNlIGFuZCBzZWUgaWYgaXQgYmVjb21lcyBwaW5nYWJsZSBmcm9tIHRo
ZSBvdXRzaWRlIHdvcmxkLiBJZiBzbywKdGhhdCB3b3VsZCBjb25maXJtIChpZiBhIGxpdHRsZSBi
aXQpIHRoZSBub24tcm91dGVkIHN1Ym5ldCBoeXBvdGhlc2lzLgoKLS0gCldpdGggcmVzcGVjdCwK
Um9tYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2ly
ZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlz
dHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
