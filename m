Return-Path: <SRS0=WErI=2X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59198C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 20:43:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C94217F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 20:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C94217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eef22f1c;
	Thu, 2 Jan 2020 20:43:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c3099ff
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 20:43:40 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout003aa.msg.pkvw.co.charter.net [47.43.26.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f007bd6
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 20:43:39 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id n7JjiODuFSkogn7JjiXoEQ; Thu, 02 Jan 2020 20:43:39 +0000
X-Authority-Analysis: v=2.3 cv=eKttc0h1 c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=6M_dfDrfAAAA:8
 a=FpMv8LeWE9bxL3zFDP8A:9 a=QEXdDO2ut3YA:10 a=-RP_3b4F4lPIh3iPpEQP:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
From: Eddie <stunnel@attglobal.net>
Subject: Re: wg-quick: syntax error, unexpected saddr
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
Date: Thu, 2 Jan 2020 12:43:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFEjM8in6c8FYoVZKq2qv2Oqxq7k69Gwpoujr7cAmyYowFd8FlHTIS5UezHVVqmcY1J7C5Dcavnvc0sCMQH9qpw9ZQ3DvWPlw+lECRfBZ7SQHv2iQYlx
 gmsKK2Dnthbs9HeMXQvXsAyMmax8h4ii069kGlrZe2SBRMqg8551crMyd/JK+6kLCR2fnJtan02JUA==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: stunnel@attglobal.net
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

SSBkb24ndCB1c2UgdGhvc2UgcGFja2FnZXMgZm9yIHdpcmVndWFyZC7CoCBJIGJ1aWxkIG15IG93
biBmcm9tIHNvdXJjZS4KCkJ1dCB5ZXMsIHRoZSByZXN0IG9mIFNsYWNrIHNlZW1zIHRvIGJlIHN0
dWNrIGluIGEgdGltZS13YXJwLgoKQ2hlZXJzLgoKCgpPbiAxLzIvMjAyMCAxMjoxMCBQTSwgSmFz
b24gQS4gRG9uZW5mZWxkIHdyb3RlOgo+IE9uIDEvMi8yMCA2OjI1IEFNLCBFZGRpZSB3cm90ZToK
PiA+IEZpcnN0IHRpbWUgcnVubmluZyB3aXJlZ3VhcmQgYXMgYSBuYXRpdmUgY2xpZW50IG9uIG15
IFNsYWNrd2FyZSAxNC4yCj4gPiBzeXN0ZW0gdGhyb3dzIHRoaXM6Cj4KPiBTbyBmYXIgYXMgSSBj
YW4gdGVsbCwgU2xhY2t3YXJlIGhhc24ndCB1cGRhdGVkIGl0cyBXaXJlR3VhcmQgc2luY2UgCj4g
MjAxODogaHR0cHM6Ly9zbGFja2J1aWxkcy5vcmcvcmVwb3NpdG9yeS8xNC4yL25ldHdvcmsvV2ly
ZUd1YXJkLwo+Cj4gSSd2ZSB0cmllZCBzZXZlcmFsIHRpbWVzIHRvIGNvbnRhY3QgdGhlIG1haW50
YWluZXJzIGFuZCBoYXZlIG5vdCAKPiByZWNlaXZlZCBhIHJlcGx5Lgo+Cj4gSXQgc291bmRzIGxp
a2UgdGhlaXIga2VybmVsIGFuZC9vciBuZnQgYXJlIHNpbWlsYXJseSBiaXRyb3R0ZWQ/Cj4KPiBN
YXliZSBjb25zaWRlciBhIG5ldyBkaXN0cm8uCj4KPiBBbHRlcm5hdGl2ZWx5LCBqdXN0IGdldCBy
aWQgb2YgbmZ0IGZyb20geW91ciBzeXN0ZW0sIGFuZCBpdCB3aWxsIAo+IGZhbGxiYWNrIHRvIHVz
aW5nIGlwdGFibGVzLgo+Cj4gSmFzb24KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlz
dHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCg==
