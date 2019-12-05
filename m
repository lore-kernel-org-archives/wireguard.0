Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4224C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 19:13:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7563C2464D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 19:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Mi5wYYVJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7563C2464D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd68e54c;
	Thu, 5 Dec 2019 19:13:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12a296c4
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 19:13:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14327b20
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 19:13:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd37b2d8
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 18:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:mime-version:content-type
 :content-transfer-encoding; s=mail; bh=Rm6gbfUgseviTMTFcuJueQwFi
 Rw=; b=Mi5wYYVJLh2PjgKK4VpzBRPtaGivvY2ecWNzgF0O18rUEbGF72pGHUo5z
 SFFO12OAFu44nhyr5/Rd3Qv5SOVZ4gbEhb531Vhnw+8so096sX/zR0C/nGWeptTL
 H+02wBqGZTLVE3PhieEEHqEetXGLE+Q9uyrXtq38D5qwHgztKz2e86rGF4+V+9DE
 c0Clt8KLJBSsRgi9go6949GALmFght3aWA8JxC8jAf687NLhdnKU67soMEkWu63T
 5FsFxVC8TGgd/RbFJHh/m9CObTJCOT88u9YdnDYUooaLRqTfCLXX5Q6BzzAJd2vv
 lf9zA0vpzC1m57Bthp9+KRY4y5REA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a5c4f45d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 18:18:25 +0000 (UTC)
Date: Thu, 5 Dec 2019 20:13:18 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
Message-ID: <20191205191318.GA44156@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
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

SGV5IGZvbGtzLAoKV2lsbGlhbSB1bmVtYmFyZ29lZCBoaXMgbmljZSB2dWxuIHRoaXMgd2Vlazog
aHR0cHM6Ly9zZWNsaXN0cy5vcmcvb3NzLXNlYy8yMDE5L3E0LzEyMgoKSXQgYXBwZWFycyB0byBh
ZmZlY3QgYmFzaWNhbGx5IG1vc3QgY29tbW9uIHVuaXggbmV0d29yayBzdGFja3MuIFRoaXMKaXNu
J3QgYSBXaXJlR3VhcmQgdnVsbmVyYWJpbGl0eSwgYnV0IHJhdGhlciBzb21ldGhpbmcgaW4gdGhl
IHJvdXRpbmcKdGFibGUgY29kZSBhbmQvb3IgVENQIGNvZGUgb24gYWZmZWN0ZWQgb3BlcmF0aW5n
IHN5c3RlbXMuIEhvd2V2ZXIsIGl0CmRvZXMgYWZmZWN0IHVzLCBzaW5jZSBXaXJlR3VhcmQgZXhp
c3RzIG9uIHRob3NlIGFmZmVjdGVkIE9TZXMuCgpTb21lIG1pZ2h0IGNoYWxrIGl0IHVwIHRvIGp1
c3QgYSBjb25maWd1cmF0aW9uIGVycm9yLCBkaXNtaXNzaW5nIGl0IGFzLAoid2VsbCwgaWYgeW91
IGNvbmZpZ3VyZSB5b3VyIG5ldHdvcmtpbmcgc3RhY2sgcG9vcmx5LCBiYWQgdGhpbmdzIHdpbGwK
aGFwcGVuLCIgYnV0IEkgZG9uJ3QgcmVhbGx5IGJ1eSB0aGF0OiB0aGUgbmV0d29yayBzZXR1cHMg
YWZmZWN0ZWQgYnkKdGhpcyB2dWxuZXJhYmlsaXR5IGFyZSBwcmV0dHkgbXVjaCB0aGUgbm9ybSBl
dmVyeXdoZXJlLgoKQW5kIGl0IHR1cm5zIG91dCB0aGF0IHdlIGFjdHVhbGx5IGFyZSBpbiB0aGUg
YnVzaW5lc3Mgb2YgcHJvcGVybHkKY29uZmlndXJpbmcgcGVvcGxlJ3MgbmV0d29ya2luZyBzdGFj
a3MuIFNwZWNpZmljYWxseSwgdGhlIHRvb2xzIHdlIHNoaXAKY29tZSB3aXRoIHRoZSBsaXR0bGUg
YmFzaCBzY3JpcHQsIHdnLXF1aWNrKDgpLCB3aGljaCBpcyBhIHBvcHVsYXIgd2F5IG9mCmF1dG9t
YXRpbmcgc29tZSBjb21tb24gdGFza3MuIFdlJ3ZlIHN0YXJ0ZWQgbG9va2luZyBhdCBrZXJuZWwt
bGV2ZWwKbWl0aWdhdGlvbnMgd2l0aGluIHRoZSBMaW51eCBuZXR3b3JraW5nIHN0YWNrLCBidXQg
YmVmb3JlIHRob3NlIGFyZQpyZWFkeSwgSSB0aG91Z2h0IGl0IHdvdWxkIGJlIHBydWRlbnQgdG8g
cHV0IHNvbWUgZmlyc3QtbGV2ZWwgZGVmZW5zZXMKaW50byB3Zy1xdWljayg4KSBpdHNlbGYuCgpG
b3IgdGhhdCByZWFzb24sIHNpbmNlIE5vdmVtYmVyLCB3Zy1xdWljayg4KSBoYXMgYWRkZWQgYSBm
ZXcgaXB0YWJsZXMoOCkKcnVsZXMuIEkgcmVhbGx5IGRpc2xpa2UgaGF2aW5nIHdnLXF1aWNrKDgp
IGdyb3cgYW55IHNvcnQgb2YgZGVwZW5kZW5jeQpvbiBpcHRhYmxlcyg4KSAoYW5kIGV2ZW50dWFs
bHkgb24gbmZ0YWJsZXMoOCkpLCBidXQgYXQgdGhlIG1vbWVudCwgSQpkb24ndCBzZWUgYSB2aWFi
bGUgYWx0ZXJuYXRpdmUuIFN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lLiBJbiBwYXJ0aWN1bGFyLAp3
ZSdyZSBhZGRpbmcgYSBydWxlIHRoYXQgaXMgc29tZXRoaW5nIGxpa2U6CgrCoCDCoCBpcHRhYmxl
cyAtdCByYXcgLUkgUFJFUk9VVElORyAhIC1pIHdnMCAtZCAxMC4xODIuMTIuOCAtbSBhZGRydHlw
ZSAhIC0tc3JjLXR5cGUgTE9DQUwgLWogRFJPUAoKd2hlcmUgd2cwIGlzIHRoZSBXaXJlR3VhcmQg
aW50ZXJmYWNlIGFuZCAxMC4xODIuMTIuOCBpcyB0aGUgbG9jYWwgSVAgb2YKdGhlIGludGVyZmFj
ZS4KClRoaXMgc2F5cyB0byBkcm9wIGFsbCBwYWNrZXRzIHRoYXQgYXJlIHNlbnQgdG8gdGhhdCBJ
UCBhZGRyZXNzIHRoYXQKYXJlbid0IGNvbWluZyBmcm9tIHRoZSBXaXJlR3VhcmQgaW50ZXJmYWNl
LiBBbmQgaXQncyBkb25lIHZlcnkgZWFybHkgaW4KTmV0ZmlsdGVyLCBpbiB0aGUgInJhdyIgdGFi
bGUuIFRoZSByZXNlYXJjaGVycyBoYXZlIGNvbmZpcm1lZCB0aGF0IHRoaXMKbWl0aWdhdGVzIHRo
ZSBpc3N1ZS4KCkFkZGluZyBpcHRhYmxlcyg4KSBpbnRvIHdnLXF1aWNrKDgpIGhhcyBiZWVuIHBy
ZWRpY3RhYmx5IHByb2JsZW1hdGljLAphbmQgaXQnbGwgcHJvYmFibHkgYmUgYXQgbGVhc3QgYW5v
dGhlciBzbmFwc2hvdCB1bnRpbCB3ZSBnZXQgdGhpbmdzCmJ1Zy1mcmVlIG9uIGFsbCB0aGUgZGlm
ZmVyZW50IHZhcmlhdGlvbnMgb2YgdGhlIHV0aWxpdHkgdGhhdCBkaXN0cm9zCnNoaXAsIGJ1dCB3
ZSdsbCBnZXQgdGhlcmUuIEluIHRoZSBtZWFudGltZSwgSSdkIGNlcnRhaW5seSBhcHByZWNpYXRl
CnBhdGNoZXMgdG8gZG8gdGhlIHNhbWUgd2l0aCBuZnRhYmxlcyg4KSwgYXMgd2VsbCBhcyBzb21l
IGZyZXNoIHRob3VnaHRzCm9uIGhvdyB0byBhY2NvbXBsaXNoIHRoaXMgc2FtZSB0aGluZyBfd2l0
aG91dF8gdGhlIGZpcmV3YWxsLiAoSW4gdGhlCnByb2Nlc3Mgb2Ygd3JpdGluZyB0aGlzIGVtYWls
LCBmb3IgZXhhbXBsZSwgSSBoYWQgYW4gaWRlYSByZWdhcmRpbmcKaXAtcnVsZSg4KSB0aGF0IG1p
Z2h0IHdvcmsgb3V0LCBidXQgSSBoYXZlbid0IHRyaWVkIHlldC4pIFdlIGFsc28gaGF2ZQpzb21l
IG5vbi1MaW51eCBvcGVyYXRpbmcgc3lzdGVtcyB0byBjb25zaWRlci4KCgpGZWVkYmFjayB3ZWxj
b21lLgoKUmVnYXJkcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQu
Y29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
