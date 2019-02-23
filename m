Return-Path: <SRS0=Z7jZ=Q6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C5BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Feb 2019 12:29:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1CB20850
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Feb 2019 12:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=grandmasfridge.org header.i=@grandmasfridge.org header.b="sTjX8V0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF1CB20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grandmasfridge.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44d64b3d;
	Sat, 23 Feb 2019 12:19:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 501d59fa
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Feb 2019 12:19:55 +0000 (UTC)
Received: from serenity.grandmasfridge.org (grandmasfridge.org [45.56.116.213])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60b89653
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Feb 2019 12:19:55 +0000 (UTC)
Received: from mail.grandmasfridge.org (localhost [IPv6:::1])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: aaron@grandmasfridge.org)
 by serenity.grandmasfridge.org (Postfix) with ESMTPSA id 1D12D7FA89;
 Sat, 23 Feb 2019 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grandmasfridge.org;
 s=serenity; t=1550924937;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVrwYtLifzt+JJlriT1eM6OralKNWI8QTQ+/hO/McSY=;
 b=sTjX8V0novCFAlEHnrc3GGHnxDqmCgyoHsrlttvTHW852KL3iwbqW6K9x5eKcEpm9oFaTA
 R08BwME8X3zrk66pJEkbuHjg4nI8hj59767ZKp+EzzIVIuBeQPZ5svkctQ1nKYvH6qUY/Z
 FGj3QEDTNCwujeHNtPkv63EiBp4/uWI=
MIME-Version: 1.0
Date: Sat, 23 Feb 2019 07:28:57 -0500
From: "Aaron W. Swenson" <aaron@grandmasfridge.org>
To: Roman Mamedov <rm@romanrm.net>
Subject: Re: IPv6 Not Getting Past Server
In-Reply-To: <20180925102051.025c281f@natsu>
References: <20180922195522.GA25561@gengoff> <20180925102051.025c281f@natsu>
Message-ID: <c44b33fee92ce54d1cf5bc7f308b07a4@grandmasfridge.org>
X-Sender: aaron@grandmasfridge.org
User-Agent: Roundcube Webmail/1.3.8
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

T24gMjAxOC0wOS0yNSAwMToyMCwgUm9tYW4gTWFtZWRvdiB3cm90ZToKPiBPbiBTYXQsIDIyIFNl
cCAyMDE4IDE1OjU1OjIyIC0wNDAwCj4gIkFhcm9uIFcuIFN3ZW5zb24iIDxhYXJvbkBncmFuZG1h
c2ZyaWRnZS5vcmc+IHdyb3RlOgo+IAo+PiBJ4oCZbSBnb2luZyB0byB1c2UgdGhlIG9mZmljaWFs
IGRvY3VtZW50YXRpb24gSVAgYWRkcmVzc2VzLiBJIGFtIHVzaW5nIAo+PiByZWFsIElQdjYKPj4g
YWRkcmVzc2VzIGFuZCBub3QgdXNpbmcgTkFUNjYuIE5hdHVyYWxseSwgTkFUIGlzIGJlaW5nIHVz
ZWQgZm9yIElQdjQuIAo+PiBIZXJlIGFyZQo+PiB0aGUgZGVmaW5pdGlvbnMgSeKAmW0gdXNpbmc6
Cj4+IAo+PiAgICAgU2VydmVyIFB1YmxpYyBJUHY2OiAyMDAxOkRCODo6REVBRDpGMDBELzY0Cj4+
ICAgICBTZXJ2ZXIgUHVibGljIElQdjQ6IDE5Mi4wLjIuMQo+PiAgICAgUm91dGVkIC8xMTY6IDIw
MDE6REI4OjpCRUVGOjMwMDAvMTE2Cj4gCj4gQXJlIHlvdSBzdXJlIHlvdSBoYXZlIGEgKnJvdXRl
ZCogc3VibmV0IGZyb20geW91ciBJU1A/IE1vcmVvdmVyLCBkb2VzCj4gdGhpcyAvMTE2IGxpZSB3
aXRoaW4gdGhlIGFib3ZlIC82ND8gKGluIHlvdXIgb2JmdXNjYXRlZCBleGFtcGxlIGl0IAo+IGRv
ZXMpCgpUb29rIG1lIGEgbGl0dGxlIHdoaWxlIHRvIGZvbGxvdyB1cCwgSSBrbm93LCBidXQgdGhp
cyB3YXMgdGhlIGlzc3VlIApwcmVjaXNlbHkuCgpJIHJlcXVlc3RlZCBhIC82NCB0byByZXBsYWNl
IHRoZSAvMTE2LCBhbmQgbm93IGV2ZXJ5dGhpbmcgaXMgd29ya2luZyAKYmVhdXRpZnVsbHkuIEkg
bWFkZSBubyBvdGhlciBjaGFuZ2VzIGJlc2lkZXMgdXBkYXRpbmcgdGhlIElQdjYgCmFkZHJlc3Nl
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1
YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMu
engyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
