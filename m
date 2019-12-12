Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79D0C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 19:12:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5818D21556
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 19:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=trustiosity.com header.i=@trustiosity.com header.b="XUDFhmTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5818D21556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trustiosity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 695f7716;
	Thu, 12 Dec 2019 19:12:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b9202e2
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 19:11:58 +0000 (UTC)
Received: from mx.trustiosity.com (mx.trustiosity.com [54.186.28.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc13eb2b
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 19:11:58 +0000 (UTC)
Received: from [192.168.212.66] (csm.ldm [192.168.212.66])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: zrm@trustiosity.com)
 by mx.trustiosity.com (Postfix) with ESMTPSA id B762C4205CD
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2019 14:11:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
 s=mx; t=1576177916; bh=9t/obJ+DpC5e67e4SnAAXeHMUlbVjPXmR2E6aRLiFuQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XUDFhmTd44XODLKH92ZoMMdLxGqp+XEp+TuV8DDa2v8sfuwAxnEzg+v7dp9US1FHc
 zeMomk4X+eQoxSihdEMqDHd0V+04ml3rCmlldAJMzGekGpmMC5fJ+fJQrDy7IJfp72
 dF38NFFYmis1yN/wjgnhaJdVKKiQaqLEfzTSBH/I=
Subject: Re: Wireguard for Windows - local administrator necessary?
To: wireguard@lists.zx2c4.com
References: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10C9B3E6A8@PLANJAVA.amebis.doma>
From: zrm <zrm@trustiosity.com>
Message-ID: <b341c46c-5be8-4f6c-401f-beea6d13c8ba@trustiosity.com>
Date: Thu, 12 Dec 2019 14:11:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <99D61A626FDA8A4B90A270669121BE10C9B3E6A8@PLANJAVA.amebis.doma>
Content-Language: en-US
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

T24gMTEvMjcvMTkgMDY6MjcsIFNpbW9uIFJvem1hbiB3cm90ZToKPiBIaSBDaHJpcyEKPiAKPiBU
aGlzIGlzIFdpcmVHdWFyZCBkZXNpZ24uIFJlY29uZmlndXJpbmcgbmV0d29yayAtIHdoaWNoIChk
aXMpY29ubmVjdGluZyAKPiBWUE4gaXMg4oCTIGlzIGFkbWluaXN0cmF0aXZlIHRhc2suCj4gCj4g
SWYgeW91ciBvcmdhbml6YXRpb24gaXNzdWVzIGxhcHRvcHMgdG8gdGhlaXIgZW1wbG95ZWVzLCB0
aGUgY29ycG9yYXRlIAo+IFZQTiBzaG91bGQgYmUgdXAgYXQgYWxsIHRpbWVzLiBZb3UgZG9uJ3Qg
d2FudCB0aGVtIHRvIGRpc2Nvbm5lY3QgZnJvbSAKPiBWUE4gYW5kIHVzZSB0aG9zZSBsYXB0b3Bz
IG9uIGNvbXByb21pc2VkIG5ldHdvcmtzLCBkbyB5b3U/Cj4gCj4gSSBkaWQgaGF2ZSBhbiBpc3N1
ZSB3aGVuIHJvYW1pbmcgbGFwdG9wcyB0byBhbmQgZnJvbSBjb3Jwb3JhdGUgV2lGaSwgYXMgCj4g
dGhlIGVuZHBvaW50IElQIGNoYW5nZXMg4oCTIHJlc3RhcnRpbmcgdGhlIHR1bm5lbCBoZWxwZWQs
IGJ1dCBhZGRpbmcgYSAKPiBzY2hlZHVsZWQgdGFzayB0byByZXNldCBlbmRwb2ludCBJUCBldmVy
eSAyIG1pbnV0ZXMgdXNpbmcgd2cuZXhlIGNvbW1hbmQgCj4gbGluZSB3b3JrcyBsaWtlIGEgY2hh
cm0gaGVyZS4gSWYgdGhhdCdzIHRoZSByZWFzb24geW91IHdvdWxkIHdhbnQgeW91ciAKPiB1c2Vy
cyB0byBtYW5pcHVsYXRlIFdpcmVHdWFyZCB0dW5uZWxzPwo+IAo+IEJlc3QgcmVnYXJkcywKPiAK
PiBTaW1vbgoKSXQgbWFrZXMgc2Vuc2UgdGhhdCB1c2VycyBzaG91bGRuJ3QgYmUgYWJsZSB0byBt
YW5pcHVsYXRlIFdpcmVHdWFyZCAKdHVubmVscyBieSBkZWZhdWx0LCBidXQgc2hvdWxkbid0IGl0
IGJlIHBvc3NpYmxlIHRvIGNoYW5nZSB0aGUgZGVmYXVsdCAKdGhyb3VnaCBzb21ldGhpbmcgbGVz
cyBkcmFzdGljIHRoYW4gZ2l2aW5nIHRoZSB1c2VyIGZ1bGwgYWRtaW5pc3RyYXRvciAKYWNjZXNz
PwoKRm9yIGV4YW1wbGUsIHRoZSByZWdpc3RyeSBpbiBtb2Rlcm4gV2luZG93cyBpcyBwZXJtaXNz
aW9uZWQgd2l0aCBBQ0xzLiAKSXQgY291bGQgYmUgbWFkZSB0aGUgY2FzZSB0aGF0IG1vZGlmeWlu
ZyBhIFdpcmVHdWFyZCB0dW5uZWwgb24gV2luZG93cyAKaXMgZG9uZSBieSB3cml0aW5nIHRvIGEg
cGFydGljdWxhciByZWdpc3RyeSBsb2NhdGlvbiBhbmQgdGhlbiBwb2tpbmcgdGhlIApzZXJ2aWNl
IHRvIHByb21wdCBpdCB0byBsb29rIHRoZXJlIGZvciBuZXcgY29uZmlndXJhdGlvbi4gVGhlbiB0
aGUgCmFkbWluaXN0cmF0b3IgY291bGQgZXhwbGljaXRseSBnaXZlIGEgdXNlciBvciBncm91cCBw
ZXJtaXNzaW9uIHRvIG1vZGlmeSAKdGhhdCByZWdpc3RyeSBsb2NhdGlvbiBpZiB0aGV5IHNob3Vs
ZCBiZSBhYmxlIHRvIG1vZGlmeSBXaXJlR3VhcmQgCmNvbmZpZ3VyYXRpb24uIE9yIHRoZSBzYW1l
IHRoaW5nIGNvdWxkIGFsc28gYmUgZG9uZSB3aXRoIGEgZmlsZXN5c3RlbSAKbG9jYXRpb24uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBt
YWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
