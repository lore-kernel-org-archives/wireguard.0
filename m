Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6329CC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:49:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE470206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="T85stz7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE470206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f91192e9;
	Sun, 25 Aug 2019 18:49:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62b604e7
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 17:23:40 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a27621ce
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 17:23:40 +0000 (UTC)
Received: from Alex (unknown [192.168.177.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: news@lindenberg.one)
 by mailarchive.lindenberg.one (Postfix) with ESMTPSA id 45F5B2805B9;
 Sun, 25 Aug 2019 19:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1566753812;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=oWMROadIOcGnldCEVpy8ku2pM6XEKJ6DFkf3frGt+D0=;
 b=T85stz7kUyuZpP/LnohRCeJiXrkCKFq2Nc27aUCf7D/2t0JI9I6Y7omSbeSHE0yBDoJkaA
 vFjxoj3YEh4Ii+NbhhLBcjxrbUgAJ5ZFYBTf3w7+HBnBineGqeqZaemneIJK57Pp3pmYXN
 L4XyfXHV0sQCl0ZfBReBZZZ2CLdRMAWJSijFtArjHVKmW5Kyh71b+PPMj9nucfKNCOF5xJ
 S98Iic6eO4yNww5b1FkGgVKBZ+KG3r7HDoGmL1Ivypanbb5oHzD7F4w4B666JKf+Tw8Nsn
 dBKAHFaEIueCVXYDW5ejKkQRcdPFqU8TBlVkWzHCRut136Q+w+YVxxT7IphK1w==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>,
 "'Simon Rozman'" <simon@rozman.si>
References: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
 <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
In-Reply-To: <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
Subject: AW: Hyper-V 2019: unable to create wintun device: no interfaces found
Date: Sun, 25 Aug 2019 19:23:32 +0200
Message-ID: <014e01d55b69$d19256e0$74b704a0$@lindenberg.one>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-de
Thread-Index: AQGl1jjZadwHrDiDTTS7Xq7i75kXDAJFFK7Hp1j7T6A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one; 
 s=dkim180429; t=1566753812;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=oWMROadIOcGnldCEVpy8ku2pM6XEKJ6DFkf3frGt+D0=;
 b=ioYtyDAs6BjdQu95JCGXN5YhJGeYvGpicq4tDJKTbNB2oE6n240hvrRKpqo89L2lCEsolh
 NAF15DFXMKDYFkDuZDkkWoSGg2VKEEopdGkAdWBBy3LnfQQiVLiggGIvf4j8qtSIjyla52
 RzsXLMJgSj1gzbqv2Z/OJer+a5RttHkw89FVLkZSlyRBYHwIduTg23VET/Gd2hEIjzvjP7
 n4QyrRyAiDkUeqIa23SGn5+qSv3Vd6AvsG6GxJBIbc4VqKTcc+zEH1qk/Tnu7p6KJ3Kj/7
 tXQy4YXzNE9sbnOkv5nS7t0AkN+5d6sRsdEdErTJGny+444nSD0yz9rRlPeVCw==
ARC-Seal: i=1; s=dkim180429; d=lindenberg.one; t=1566753812; a=rsa-sha256;
 cv=none;
 b=R0dItnK9QexzRFrb2iTTOmG804nlUaZmyamZQVGiQzWZK0zzBK/1BlAwYvRRUb3TprfYTIs9YoQo2fIfxpRj72NtZJEekM/o6pPCO9tqQywcm4KNrCKWU9Nhg0l64Hc1EQo+kN2GOwB9aJl2U1fQFHHvqPzD+osDqFgDICFY4PKhGKI47A3x5b87GOcd6TRU2Rj+IgQO7lvQMszqawcvYvUGChbJEUHrSq3IPZ8mjbp8yV0MQbpaJGSDntzX01mfvntLA8TsaeAiwJoBNoY2hDtqkyoSggbBhTdgHfGToaXCZUxN8NkqGWwAGcFL2mB+wsIxrUz8MhKzX+gC8QqO1Q==
ARC-Authentication-Results: i=1; auth=pass smtp.auth=news@lindenberg.one
 smtp.mailfrom=news@lindenberg.one
X-Mailman-Approved-At: Sun, 25 Aug 2019 20:49:41 +0200
Cc: 'WireGuard mailing list' <wireguard@lists.zx2c4.com>
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

SGVsbG8gSmFzb24sIGFsbCwKbXkgZXhwZXJpbWVudHMgd2VyZSBhY3R1YWxseSByb3VnaGx5IHRo
cmVlIHdlZWtzIGFnbyB3aXRoIHZlcnNpb25zIC4xOCBhbmQgLjE5LCBhbmQgdGhhdCBtYWlsIHdh
cyBzb21laG93IHN0dWNrLi4KSnVzdCByZXRyaWVkIHdpdGggLjIyLCBhbmQgdGhlIGdvb2QgbmV3
cyBpcyB0aGF0IEkgd2FzIGFibGUgdG8gc2V0IHVwIGEgdHVubmVsIGJldHdlZW4gYSBIeXBlci1W
IGFzIGEgc2VydmVyIGFuZCBhIHdpbmRvd3MgY2xpZW50LiBUaGUgb2xkIGVycm9yIG9uIHdpbnR1
biBpcyBnb25lLiAKSSBkaWRuwrR0IGhhdmUgdGhlIG9wcG9ydHVuaXR5IHRvIGNoZWNrIHdpdGgg
dHdvIEh5cGVyLVZzIHlldCwgYW5kIEkgYW0gYWxzbyB1bnN1cmUgd2hldGhlciBJIGFjdHVhbGx5
IHdhbnQgdG8gY2hhbmdlIHRoZSB3b3JrYXJvdW5kICh1c2luZyBhbiBVYnVudHUgdm0gb24gZWl0
aGVyIHNpZGUgYXMgcm91dGVycykgbm93IHdpdGggdGhlIHdpbmRvd3MgdmVyc2lvbiBpbiB0aGF0
IGVhcmx5IHN0YWdlLCBpbiBwYXJ0aWN1bGFyIGFzIEkgYWxzbyBoYWQgdG8gdHJpY2sgd2lyZWd1
YXJkIHRvIHdvcmsgYXJvdW5kIHRoZSBkeW5hbWljIElQIGlzc3VlIG1vc3QgR2VybWFucyBmYWNl
LiBXaXRoIHRoZSBVYnVudHUgdm1zIEkgY2FuIHBpbmcgdGhlIHNlcnZlciBmcm9tIHRoZSBjbGll
bnQsIGFuZCBpZiBpdCBpcyB1bnJlYWNoYWJsZSBJIGFtIHB1bGxpbmcgZG93biB0aGUgaW50ZXJm
YWNlIGFuZCB0aGVuIHVwIGFnYWluLiBUaGlzIGNhbiBwcm9iYWJseSBhbHNvIGJlIGRvbmUgd2l0
aCB0aGUgYXBwbGljYXRpb24gb24gV2luZG93cyBieSBhY3RpdmF0aW5nIGFuZCBkZWFjdGl2YXRp
bmcgdGhlIGludGVyZmFjZSwgYnV0IEkgZGVmaW5pdGVseSBuZWVkIHRoaXMgdG8gYmUgYXV0b21h
dGVkIHNvbWVob3csIGJlIGl0IGEgc2NyaXB0IG9yIHByZWZlcmFibHkgd2lyZWd1YXJkIHN1cHBv
cnRpbmcgZHluYW1pYyBpcCBhZGRyZXNzZXMgb3V0IG9mIHRoZSBib3guClRoYW5rcywgSm9hY2hp
bQoKLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQpWb246IEphc29uIEEuIERvbmVu
ZmVsZCA8SmFzb25AengyYzQuY29tPiAKR2VzZW5kZXQ6IFN1bmRheSwgMjUgQXVndXN0IDIwMTkg
MTc6NTQKQW46IEpvYWNoaW0gTGluZGVuYmVyZyA8d2lyZWd1YXJkQGxpbmRlbmJlcmcub25lPjsg
U2ltb24gUm96bWFuIDxzaW1vbkByb3ptYW4uc2k+CkNjOiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0
IDx3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tPgpCZXRyZWZmOiBSZTogSHlwZXItViAyMDE5OiB1
bmFibGUgdG8gY3JlYXRlIHdpbnR1biBkZXZpY2U6IG5vIGludGVyZmFjZXMgZm91bmQKCk9uIFN1
biwgQXVnIDI1LCAyMDE5IGF0IDk6MzQgQU0gSm9hY2hpbSBMaW5kZW5iZXJnIDx3aXJlZ3VhcmRA
bGluZGVuYmVyZy5vbmU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBJIGFtIHVzaW5nIFdpcmVndWFy
ZCBmb3IgcXVpdGUgc29tZSB0aW1lIG9uIFVidW50dSwgYW5kIGFtIG5vdyB0cnlpbmcgdG8gdXNl
IGl0IG9uIEh5cGVyLVYgMjAxOSBhcyB3ZWxsLiBNeSBnb2FsIGlzIHRvIHNldCB1cCBhIFZQTiBi
ZXR3ZWVuIHR3byBIeXBlci1WIHN5c3RlbXMgYW5kIGFsbG93IGNvbm5lY3Rpb25zIGJldHdlZW4g
dGhlIHZpcnR1YWwgbWFjaGluZXMgaG9zdGVkIChpbmNsdWRpbmcgU2FtYmEgQUQgRENzKS4KPgo+
IEkgZG93bmxvYWRlZCBhbmQgaW5zdGFsbGVkIFdpcmVndWFyZCBmb3IgV2luZG93cywgYW5kIGNy
ZWF0ZWQgYSB0dW5uZWwgY29uZmlndXJhdGlvbiBvbiBzZXJ2ZXIgYW5kIGNsaWVudC4gSG93ZXZl
ciB3aGVuIEkgdHJ5IHRvIGFjdGl2YXRlIGFueSBvZiB0aGVzZSwgSSBnZXQgdGhlIG1lc3NhZ2Ug
4oCcVW5hYmxlIHRvIGNyZWF0ZSBXaW50dW4gZGV2aWNlOiBubyBpbnRlcmZhY2VzIGZvdW5k4oCd
IG9uIGJvdGggc2lkZXMuCj4KPiBUbyBtZSBpdCBkb2VzbsK0dCBsb29rICBsaWtlIGFuIGlzc3Vl
IHdpdGggdGhlIGNvbmZpZ3VyYXRpb24gYnV0IG1vcmUgbGlrZWx5IFdpblR1biBpcyBtaXNzaW5n
ICh0cmllZCB0byBkb3dubG9hZCBzZXBhcmF0ZWx5LCBidXQgYXMgaXQgaXMgYSAubXNtIEkgYXNz
dW1lIHRoYXQgaXMgaW5jbHVkZWQgaW4gd2lyZWd1YXJkIGluc3RhbGxhdGlvbikgb3IgZG9lcyBu
b3Qgd29yayB3aXRoIEh5cGVyLVYgMjAxOS4KPgo+IEFueSBzdWdnZXN0aW9uPwo+Cj4gVGhhbmtz
LCBKb2FjaGltCgpJbnRlcmVzdGluZy4gV2UganVzdCByZXdvcmtlZCB0aGUgV2ludHVuIGluc3Rh
bGxhdGlvbiBwcm9jZXNzLCB0byBob3BlZnVsbHkgbWFrZSBpdCBtb3JlIHJlbGlhYmxlLiBDb3Vs
ZCB5b3UgdHJ5IGFnYWluLCBhbmQgcGVyaGFwcyBwcm92aWRlIGEgYml0IG9mIGxvZ2dpbmcgdG9v
PwoKVHJ5IHJ1bm5pbmcgdGhpczoKCm1zaWV4ZWMgL2xvZyBzZW5kLXRvLWphc29uLXBsZWFzZS50
eHQgL2kgaHR0cHM6Ly9kb3dubG9hZC53aXJlZ3VhcmQuY29tL3dpbmRvd3MtY2xpZW50L3dpcmVn
dWFyZC1hbWQ2NC0wLjAuMjIubXNpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJj
NC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
