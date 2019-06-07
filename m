Return-Path: <SRS0=ogfi=UG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D55FC2BCA1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jun 2019 22:18:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D1620840
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jun 2019 22:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="GWhBq2Hp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D1620840
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31f9ce84;
	Fri, 7 Jun 2019 22:18:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ffae89e
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 22:18:48 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aef52774
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 22:18:48 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1559945925; bh=jlBRDKOH3tPRFY84/2OY88GSQ8BhLTWbkdXUjJU/rds=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GWhBq2Hpn+wp8D5AfOZOm4s0KlEP8ZSeAMeJfJ2q7CHndjkR3o/0HZiyGAdR3PpfO
 PVRmdXyNIKIS4tCGUFHjoKWeueiIPmGc8UDoB0SmBnVqbWHGY6tlDVcdy+fhngcaQR
 6vkEc8ixC1mxS/7QlhWBaaUc4NZMBOD2sw38N51+T943EdkIL3ZTINtEL4n0mXZydL
 HyxKCdmlKdbtEbw5dTxnZe7RkbfixRXEdNGjr+SQ/bfBp60M2dXK3m4CjGTWEMwOFC
 P4AjUbJK2wCcsp4U6ue4Fp7EwN8z2ncNT6/H+eTQ9VHUtZghcvOhFUcKjdoDLp5HKa
 lTg3tcl6vf8tw==
To: Janne =?utf-8?Q?He=C3=9F?= <janne@hess.ooo>, bird-users@network.cz
Subject: Re: Introduce Wireguard support to bird
In-Reply-To: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
References: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
Date: Sat, 08 Jun 2019 00:18:44 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87pnnp59a3.fsf@toke.dk>
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

SmFubmUgSGXDnyA8amFubmVAaGVzcy5vb28+IHdyaXRlczoKCj4gSGV5IGV2ZXJ5b25lLAo+Cj4g
YXMgYWR2ZXJ0aXNlZCwgSSBoYXZlIGNvbXBsZXRlZCB0aGUgV2lyZWd1YXJkIHN1cHBvcnQuCj4g
WW91IG1pZ2h0IHNlZSB0aGF0IEkgYW0gbm90IHJlYWxseSBhIEMgZXhwZXJ0LCBidXQgSSBob3Bl
IHRoZSBjb2RlIGlzIGdvb2QgZW5vdWdoLgo+IElmIHlvdSBuZWVkIG1lIHRvIGNoYW5nZSBhbnl0
aGluZyBvciBoYXZlIGFkZGl0aW9uYWwgcXVlc3Rpb25zLCBqdXN0Cj4gbGV0IG1lIGtub3cuCgpI
aSBKYW5uZQoKQXdlc29tZSB0aGF0IHlvdSBoYXZlIHRha2VuIHRoZSB0aW1lIHRvIGltcGxlbWVu
dCB0aGlzIQoKSSdsbCBsZXQgdGhlIEJpcmQgbWFpbnRhaW5lcnMgY29tbWVudCBvbiB0aGUgYXBw
cm9hY2ggb2YgZW1iZWRkaW5nIHRoZQp3aXJlZ3VhcmQgbmV0bGluayBsaWJyYXJ5OyBidXQgSSBo
YXZlIHR3byBvdGhlciBjb25jZXJuczoKCi0gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhlcmUncyBu
b3RoaW5nIHByZXZlbnRpbmcgQmlyZCBmcm9tIHJlbW92aW5nCiAgQWxsb3dlZElQcyB0aGF0IGl0
IGRpZCBub3QgaXRzZWxmIGluc3RhbGwgZnJvbSBhbiBpbnRlcmZhY2UsIHJpZ2h0PwoKLSBUaGUg
YWxnb3JpdGhtIGlzIGJhc2ljYWxseSBPKFAqTSpOKSBmb3IgaW5zZXJ0aW5nIE4gcm91dGVzIG9u
IGFuCiAgaW50ZXJmYWNlIHdpdGggUCBwZWVycyB0aGF0IGVhY2ggaGF2ZSBNIGV4aXN0aW5nIEFs
bG93ZWRJUHMuIFRoYXQgaXMKICBub3QgZ29pbmcgdG8gc2NhbGUgdmVyeSBmYXIgOi8KCi1Ub2tl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFy
ZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
