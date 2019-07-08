Return-Path: <SRS0=olyW=VF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70715C606AF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Jul 2019 11:36:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562322064A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Jul 2019 11:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="ceR2YVTc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562322064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74a75e00;
	Mon, 8 Jul 2019 11:36:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87850ad9
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jul 2019 11:36:48 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97a42069
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jul 2019 11:36:45 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1562585801; bh=4GT/3/A3tvjnXw41l6yshQ0xJq2/0Lt3CXmrqFu+6g4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ceR2YVTc4gfX6/bT7xGgG5mCQDgRJ2OH7o5rrkt6/7czANLAqX2kcmoUeW7J6s70B
 hXshWoQiEtW2butnA37THUq1mfoosNsa/I7Y/0DcHOfJ5+JYJMYwO4EFFtgo2AuXTJ
 sTzdvibkZWpWoyjplzq+e79gvgbEfa+mQuz5jaYVGl9rLMN1mck1u8z8+13xwpLt0Y
 SnwMEku9wHE7o+n1do8gpe6Z/8OGP3auoyK4SUOAOTbwuhPTwxij66U1fgh/t3ea24
 Zaa6qmchHtm4ZC76dL4mfRkRYdJqHuoUr9B8IjPmSvsRqpBJyLU13uYr1j0sQEEexz
 G3bCeCZRLIRNw==
To: Janne =?utf-8?Q?He=C3=9F?= <janne@hess.ooo>, bird-users@network.cz
Subject: Re: Introduce Wireguard support to bird
In-Reply-To: <121dc434-986e-91a9-591d-47948289a34c@hess.ooo>
References: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
 <87pnnp59a3.fsf@toke.dk> <121dc434-986e-91a9-591d-47948289a34c@hess.ooo>
Date: Mon, 08 Jul 2019 13:36:41 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87muhozrjq.fsf@toke.dk>
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

SmFubmUgSGXDnyA8amFubmVAaGVzcy5vb28+IHdyaXRlczoKCj4gT24gNi84LzE5IDEyOjE4IEFN
LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+IEphbm5lIEhlw58gPGphbm5lQGhl
c3Mub29vPiB3cml0ZXM6Cj4+IAo+Pj4gSGV5IGV2ZXJ5b25lLAo+Pj4KPj4+IGFzIGFkdmVydGlz
ZWQsIEkgaGF2ZSBjb21wbGV0ZWQgdGhlIFdpcmVndWFyZCBzdXBwb3J0Lgo+Pj4gWW91IG1pZ2h0
IHNlZSB0aGF0IEkgYW0gbm90IHJlYWxseSBhIEMgZXhwZXJ0LCBidXQgSSBob3BlIHRoZSBjb2Rl
IGlzIGdvb2QgZW5vdWdoLgo+Pj4gSWYgeW91IG5lZWQgbWUgdG8gY2hhbmdlIGFueXRoaW5nIG9y
IGhhdmUgYWRkaXRpb25hbCBxdWVzdGlvbnMsIGp1c3QKPj4+IGxldCBtZSBrbm93Lgo+PiAKPj4g
SGkgSmFubmUKPj4gCj4+IEF3ZXNvbWUgdGhhdCB5b3UgaGF2ZSB0YWtlbiB0aGUgdGltZSB0byBp
bXBsZW1lbnQgdGhpcyEKPj4gCj4+IEknbGwgbGV0IHRoZSBCaXJkIG1haW50YWluZXJzIGNvbW1l
bnQgb24gdGhlIGFwcHJvYWNoIG9mIGVtYmVkZGluZyB0aGUKPj4gd2lyZWd1YXJkIG5ldGxpbmsg
bGlicmFyeTsgYnV0IEkgaGF2ZSB0d28gb3RoZXIgY29uY2VybnM6Cj4+IAo+PiAtIEFzIGZhciBh
cyBJIGNhbiB0ZWxsIHRoZXJlJ3Mgbm90aGluZyBwcmV2ZW50aW5nIEJpcmQgZnJvbSByZW1vdmlu
Zwo+PiAgICBBbGxvd2VkSVBzIHRoYXQgaXQgZGlkIG5vdCBpdHNlbGYgaW5zdGFsbCBmcm9tIGFu
IGludGVyZmFjZSwgcmlnaHQ/Cj4+IAo+PiAtIFRoZSBhbGdvcml0aG0gaXMgYmFzaWNhbGx5IE8o
UCpNKk4pIGZvciBpbnNlcnRpbmcgTiByb3V0ZXMgb24gYW4KPj4gICAgaW50ZXJmYWNlIHdpdGgg
UCBwZWVycyB0aGF0IGVhY2ggaGF2ZSBNIGV4aXN0aW5nIEFsbG93ZWRJUHMuIFRoYXQgaXMKPj4g
ICAgbm90IGdvaW5nIHRvIHNjYWxlIHZlcnkgZmFyIDovCj4+IAo+PiAtVG9rZQo+PiAKPgo+IEhp
IFRva2UsCj4KPiB0aGFua3MgZm9yIHlvdXIgcmV2aWV3Lgo+Cj4gWW91ciBmaXJzdCBvYnNlcnZh
dGlvbiBpcyBjb3JyZWN0LiBEdWUgdG8gZGlmZmVyZW5jZXMgaW4gc2VtYW50aWNzLCB0aGlzIAo+
IGNhbm5vdCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUgc2FtZSB3YXkgaXQgaXMgaW1wbGVtZW50ZWQg
aW4gdGhlIEtSVCAKPiBwcm90b2NvbCBiZWNhdXNlIEFsbG93ZWRJUHMgZG9uJ3QgaGF2ZSBhIG5v
dGlvbiBvZiB0aGUgcHJvdG8gZmllbGQuCgpZZWFoLCBub3Qgc3VyZSB3aGF0IGEgZ29vZCB3YXkg
dG8gaGFuZGxlIHRoYXQgbWlnaHQgYmUuIFlvdSBjb3VsZCBhZGQKdGhpcyBjYXBhYmlsaXR5IHRv
IHRoZSB1cHN0cmVhbSB3aXJlZ3VhcmQ/IAoKPiBBZGRyZXNzaW5nIHlvdXIgc2Vjb25kIHBvaW50
LCB0aGUgV2lyZUd1YXJkIG5ldGxpbmsgaW50ZXJmYWNlIGFuZCAKPiBsaWJyYXJ5IG9ubHkgb2Zm
ZXIgYW5kIHVuZGVyc3RhbmQgdGhlIHBlZXJzIGFuZCBhbGxvd2VkIElQcyBhcyBhIGxpbmtlZCAK
PiBsaXN0Lgo+IEFzIHdlIG9ubHkgZ2V0IGVhY2ggcm91dGUgc2VwZXJhdGVseSwgd2UgY2Fubm90
IHByb2Nlc3MgbXVsdGlwbGUgcm91dGVzIAo+IGluIG9uZSBydW4uIFdlJ3JlIG9wZW4gdG8gc3Vn
Z2VzdGlvbnMgYW5kIHBhdGNoZXMuCgpXZWxsLCB0aGVyZSBhcmUgYSBjb3VwbGUgb2Ygb3B0aW9u
cywgSSBndWVzczoKCi0gRml4IHRoZSB3aXJlZ3VhcmQgbmV0bGluayBpbnRlcmZhY2UgdG8gd29y
ayBiZXR0ZXIgd2l0aAogIGluc2VydGlvbi9kZWxldGlvbiBzZW1hbnRpY3MuCgotIENhY2hlIHRo
ZSBrZXJuZWwgcmVzcG9uc2UgaW4gYSBkYXRhIHN0cnVjdHVyZSB0aGF0IGFsbG93cyBtb3JlCiAg
ZWZmaWNpZW50IGxvb2t1cHMuCgoKQmVmb3JlIGRvaW5nIGFueSBvZiB0aGlzLCB5b3UgbWF5IHdh
bnQgdG8gd2FpdCBmb3IgZmVlZGJhY2sgb24gd2hldGhlcgp0aGlzIGFwcHJvYWNoIHRvIGFkZGlu
ZyB0aGUgc3VwcG9ydCBpcyB0aGUgcmlnaHQgd2F5IHRvIGdvLiBQZXJzb25hbGx5LApJIHRlbmQg
dG8gdGhpbmsgdGhhdCB0aGUgInJpZ2h0IiB3YXkgdG8gYWRkIHRoZSBzdXBwb3J0IGlzIGJ5Cmlu
dHJvZHVjaW5nIGEgbmV3ICd3aXJlZ3VhcmQnIHByb3RvY29sIHR5cGUgdG8gQmlyZC4gQnV0IHRo
YXQncyB1cCB0bwpPbmRyZWogZXQgYWwsIG9mIGNvdXJzZSA6KQoKLVRva2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlz
dApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxt
YW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
