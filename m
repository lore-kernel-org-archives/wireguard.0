Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D708FC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 13:47:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3DEA20716
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 13:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rfraile.eu header.i=@rfraile.eu header.b="eo1f8JC4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3DEA20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rfraile.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b5ae575;
	Wed, 29 Jan 2020 13:46:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2027601b
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 13:46:38 +0000 (UTC)
Received: from smtp-relay-00-2.dondominio.net (smtp-relay-00-2.dondominio.net
 [31.214.176.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f1d8f6b
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 13:46:38 +0000 (UTC)
Received: from localhost (smtp-relay-local.scip.local [127.0.0.1])
 by smtp-relay.dondominio.com (Postfix) with SMTP id 5C44E41EF4
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 14:46:37 +0100 (CET)
Received: from mail-node.dondominio.com 
 by smtp-relay.dondominio.com (Postfix) with ESMTP id 6A51E4093F
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 14:46:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfraile.eu; s=dddk;
 t=1580305594; bh=3iA/drnFRvnSFSqeyPl1BiV1v99C3S3yCa4HmZBO1mg=;
 h=Content-Type:Date:From:To:Subject:Message-ID;
 b=eo1f8JC4pvHvBR5sSGqYrKmHJy4Ft6kP/9XH6yT3n76ppQja6aEq6/xgEmhIZBThh
 TRK6WKUqerwPMoaDhvTWwHENFvP9zdkSbHA8/sqGwKYWcR8/ou5Eu8BYTD7jLFZEjW
 RTwbWsXqj0dLJV5i63mcI5Svo7z3yVwKmVBU2uog=
Received: from webmail.rfraile.eu (webmail-05.scip.local [172.21.33.137])
 (Authenticated sender: rfraile@rfraile.eu)
 by mail-node.dondominio.com (Postfix) with ESMTPA id 0993E4089D
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 14:46:33 +0100 (CET)
Received: from [195.110.94.140] via webmail-ha-01.scip.local ([172.21.33.131])
 by webmail.rfraile.eu
 with HTTP (HTTP/1.1 POST); Wed, 29 Jan 2020 14:46:33 +0100
MIME-Version: 1.0
Date: Wed, 29 Jan 2020 14:46:33 +0100
From: Ricardo Fraile <rfraile@rfraile.eu>
To: Wireguard <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] wg-quick: Linux and FreeBSD: Add support to search domain
 in wg-quick
In-Reply-To: <878slreo9y.fsf@ungleich.ch>
References: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
 <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
 <CAPWNY8W4oXesE53MMDNZC092xN8nK9iyKV-pcNpvMxcH1y4LuQ@mail.gmail.com>
 <878slreo9y.fsf@ungleich.ch>
Message-ID: <87e42167b02ded0d465916fea8e004b4@rfraile.eu>
X-Sender: rfraile@rfraile.eu
User-Agent: DD Webmail
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
 (mail-node.dondominio.com [0.0.0.0]); Wed, 29 Jan 2020 14:46:33 +0100 (CET)
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

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpBcyBJJ2xsIHVzZSBpdCB3aXRoIHRoaXMgcGF0Y2gg
YW5kIG1heWJlIGl0IGNhbiBzb2x2ZSB0aGUgaXNzdWUgdG8gCmFueW9uZSBpbiB0aGUgZnV0dXJl
LCBJIHNoYXJlIGl0IG9uIEdpdGh1YjoKCmh0dHBzOi8vZ2l0aHViLmNvbS9yZnJhaWwzL21pc2Mv
dHJlZS9tYXN0ZXIvd2ctcXVpY2sKCgpSZWdhcmRzLAoKClAuRDogQ29uZ3JhdHMgYWJvdXQgdGhl
IHVwc3RyZWFtIHN5bmMhCgoKCkVsIDIwMjAtMDEtMjggMTM6NTIsIE5pY28gU2Nob3R0ZWxpdXMg
ZXNjcmliacOzOgoKPiBJIHNlY29uZCBNYW50YXMgaW4gdGhpcyByZWdhcmQgLSBkb24ndCBibG9h
dCB3Zy1xdWljaywgYnV0IGEgRE5TCj4gc2VhcmNoIHBhdGggaXMgcHJldHR5IHN0YW5kYXJkIHRv
IGJlIHN1Ym1pdHRlZCBieSAiYSBuZXR3b3JrIi4KPiAKPiBXZSBhcmUgbm90IHRhbGtpbmcgZGhj
cCBib290IG9wdGlvbnMsIGV2ZW4gdGhvdWdoIE5UUCBzZXJ2ZXJzIHdvdWxkCj4gcHJvYmFibHkg
YWxzbyBtYWtlIHNlbnNlLCBpZiB5b3Ugc2VlIHdpcmVndWFyZCBhcyBwcm92aWRpbmcgYSBuZXR3
b3JrLgo+IAo+IEJlc3QsCj4gCj4gTmljbwo+IAo+IE1hbnRhcyBNaWt1bMSXbmFzIDxncmF3aXR5
QGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+IFRoYXQgbWlnaHQgYmUgdHJ1ZSwgYnV0IElNSE8gdGhl
IGxpc3Qgb2Ygc2VhcmNoIGRvbWFpbnMgZG9lc24ndCBmYWxsCj4gdW5kZXIgInNwZWNpYWxpemVk
IG9wdGlvbnMiIC0gaXQgaXMgZXZlbiBkZXBsb3llZCB2aWEgREhDUCBhbmQgc2ltaWxhcgo+IG1l
Y2hhbmlzbXMgYWxtb3N0IGFzIGNvbW1vbmx5IGFzIHRoZSBsaXN0IG9mIEROUyByZXNvbHZlcnMg
dGhlbXNlbHZlcywKPiBzbyBpZiBhIFZQTiBjbGllbnQgc3VwcG9ydHMgdGhlIGxhdHRlciB0aGVu
IGl0IG1ha2VzIHNlbnNlIHRvIHN1cHBvcnQKPiBib3RoLgo+IAo+IE9uIFR1ZSwgSmFuIDI4LCAy
MDIwIGF0IDEyOjM3IFBNIEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPiAKPiB3
cm90ZToKPiBJJ20gbm90IHNvIHN1cmUgdGhhdCB3ZSB3YW50IHRvIGZpbGwgd2ctcXVpY2soOCkg
dXAgd2l0aCBldmVyeSBkbnMKPiBub2IuLi4gSWYgeW91IGhhdmUgc3BlY2lhbGl6ZWQgbmV0d29y
a2luZyByZXF1aXJlbWVudHMsIHdnLXF1aWNrKDgpIGlzCj4gcHJvYmFibHkgbm90IGZvciB5b3Ug
YW55d2F5Lgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gV2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPiBo
dHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAoKLS0KTW9k
ZXJuLCBhZmZvcmRhYmxlLCBTd2lzcyBWaXJ0dWFsIE1hY2hpbmVzLiBWaXNpdCB3d3cuZGF0YWNl
bnRlcmxpZ2h0LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRw
czovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBs
aXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFp
bG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
