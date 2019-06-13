Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6446C31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:20:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B907C21479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B907C21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ironai.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3704f1b;
	Tue, 18 Jun 2019 15:20:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8312b492
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 07:30:13 +0000 (UTC)
Received: from achernar.uberspace.de (achernar.uberspace.de [95.143.172.237])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0adc4ad
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 07:30:13 +0000 (UTC)
Received: (qmail 10071 invoked from network); 13 Jun 2019 07:30:09 -0000
Received: from localhost (HELO ?IPv6:2a02:790:ff:1021:e6f8:9cff:feb4:b5e0?)
 (127.0.0.1)
 by achernar.uberspace.de with SMTP; 13 Jun 2019 07:30:09 -0000
Subject: Re: Overlapping AllowedIPs Configuration
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
 <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li> <87lfyfdnyu.fsf@toke.dk>
 <20190607080507.GA26861@matrix-dream.net>
 <9c7934d0-a234-4020-9227-08f18f150846@urlichs.de>
From: Vincent Wiemann <vincent.wiemann@ironai.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vincent.wiemann@ironai.com; prefer-encrypt=mutual; keydata=
 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
 sFWRrW2QGIhjT+Y4XMq8yZQ=
Message-ID: <752d7e84-a0cf-2304-adb8-1446fe0cf418@ironai.com>
Date: Thu, 13 Jun 2019 09:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9c7934d0-a234-4020-9227-08f18f150846@urlichs.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:20:42 +0200
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

Cj4gd2UgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtIGhlcmUsIGFsdGhvdWdoIG91ciBhbGxvd2VkIElQ
IHJhbmdlcyBzaG91bGQgYmUKPiAwLjAuMC4wLzAgZm9yIGFsbCBwZWVycy4KPiBXZSBoYXZlIE9T
UEYgdHJhZmZpYyBvbiB0aGUgd2lyZWd1YXJkIGxpbmtzIHNvIGl0IHNob3VsZCBiZSB0YXNrIG9m
IHRoZQo+IEtlcm5lbCdzIHJvdXRpbmcgdGFibGUgdG8gZGVjaWRlIHdoZXJlIHRvIHNlbmQgd2hh
dC4KClRoaXMgaXMgbm90IHBvc3NpYmxlIHdpdGggYSBsYXllciAzIHR1bm5lbCBhcyB0aGUga2Vy
bmVsIHJvdXRpbmcgdGFibGUgb25seQprbm93cyB3aGljaCByb3V0ZSBnb2VzIHRvIHdoaWNoIGlu
dGVyZmFjZS4KSSdtIHdvcmtpbmcgb24gYSBsYXllciAyIFdpcmVHdWFyZCB2ZXJzaW9uLCBidXQg
ZHVlIHRvIGxhY2sgb2YgZnVuZGluZyBhbmQgZnJlZS10aW1lCml0IGlzIG5vdCBpbiBhIHN0YXRl
IGluIHdoaWNoIEknZCBsaWtlIHRvIHJlbGVhc2UgaXQuCgpBcyBhbHJlYWR5IHN0YXRlZCB0aGVy
ZSBpcyBzdGlsbCB0aGUgcG9zc2liaWxpdHkgdG8gdXNlIGEgc2VwYXJhdGUKV2lyZUd1YXJkIGlu
dGVyZmFjZSBwZXIgcGVlciBvciBsZXQgT1NQRiBzZXQgV2lyZUd1YXJkJ3MgcGVlcidzIHJvdXRl
cyB3aGljaApyZXF1aXJlcyBhIG1vZGlmaWNhdGlvbiBvZiB0aGUgT1NQRiBkYWVtb24uCgpPbiAw
Ny4wNi4xOSAxMjowNywgTWF0dGhpYXMgVXJsaWNocyB3cm90ZTo+IE9uIDA3LjA2LjE5IDEwOjA1
LCBJdmFuIExhYsOhdGggd3JvdGU6Cj4+IEFzIHBlciB0aGUgb3JpZ2luYWwgcXVlc3Rpb24sIEkg
ZG8gZmluZCBpdCBzdHJhbmdlLCB0aGF0IGEgdHJhbnNpZW50Cj4+IG1vZGlmaWNhdGlvbiBvZiBh
IHBlZXIgY2FuIHJlbW92ZSByb3V0ZXMgZnJvbSBhbm90aGVyIHBlZXIuIEFsc28KPj4gZGlzY2Fy
ZGluZyByb3V0ZXMgaW4gZ2VuZXJhbCwgZXZlbiBtb3JlIHNvIHdoZW4gZG9uZSBzaWxlbnRseS4K
Pgo+IEl0IG1pZ2h0IGJlIGhlbHBmdWwgdG8gaGF2ZSBhbiBvcHRpb24gdGhhdCBkaXNhbGxvd3Mg
KHNpbGVudGx5KQo+IHJlcGxhY2luZyBhbm90aGVyIHBlZXIncyByb3V0ZS4KCkFzIGZhciBhcyBJ
IHVuZGVyc3RhbmQsIHRoaXMgc2hvdWxkIG5vdCBoYXBwZW4gYXQgYWxsIGFzIG92ZXJsYXBwaW5n
IHBlZXJzCnNob3VsZCBub3QgYmUgYWxsb3dlZCBhcyB0aGlzIGJyZWFrcyBjcnlwdG9rZXktcm91
dGluZy4KClJlZ2FyZHMsCgpWaW5jZW50IFdpZW1hbm4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRA
bGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8v
d2lyZWd1YXJkCg==
