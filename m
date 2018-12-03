Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29092C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 19:40:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB4B208A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 19:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="Auu2G0Ud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB4B208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56ed8ae9;
	Mon, 3 Dec 2018 19:32:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d468289e
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 19:32:12 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6cbbd1d
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 19:32:12 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1543865996; bh=fo3WWQJ0jXIJwWh9P5+IVMr5BWVergj9w6dnbZNLUq0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Auu2G0UdLOd7ZNIkooMomLcgLzmoZPtbEPv+juvGFPt9IcFnFxU3/OtSRowaP6jrY
 8Lsf1Z867gsa20D/JNDxS1SHxFuCCMhuhiyR6v75t4jYCU5gsyE3vig5K7qGlIwktz
 4bh8lRCuxjNqGk8Ynw+fgpGRDkd5eRRsv9aelJRPfU/uw5uJFcOs8hcGITJ9aBfFkh
 6XMrVjQBmuDowJzVk5lR+Owu4GASqN1AqYvJ/VMQA2NoK0J2FWfhrLWltpXsz5sBZ4
 RUNY6+0CAq7l4b06MIXQtcVdZU9k9ivTggeI2aPwAjH8TPzywDDB6H14CUIalWDcNW
 H1K+g4i2j25Kg==
To: Matthias Urlichs <matthias@urlichs.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Host routes =?utf-8?Q?=E2=80=93?= ARP on wireguard interfaces?
In-Reply-To: <428b91e9-f3a1-c385-4663-79dcb74dc7f3@urlichs.de>
References: <8f102b9a-c476-24b7-c800-d4abdb4318d1@urlichs.de>
 <87h8fukb1d.fsf@toke.dk> <428b91e9-f3a1-c385-4663-79dcb74dc7f3@urlichs.de>
Date: Mon, 03 Dec 2018 21:39:53 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <878t16jt6e.fsf@toke.dk>
MIME-Version: 1.0
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

TWF0dGhpYXMgVXJsaWNocyA8bWF0dGhpYXNAdXJsaWNocy5kZT4gd3JpdGVzOgoKPiBPbiAwMy4x
Mi4xOCAxNDoxNCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+PiBJJ20gbm90IHN1
cmUgSSBxdWl0ZSB1bmRlcnN0YW5kIHdoYXQgaXQgaXMgeW91IGFyZSB0cnlpbmcgdG8gYWNoaWV2
ZTsKPj4gd2h5IGNhbid0IGp1c3QgeW91IHJlY29uZmlndXJlIHRoZSB3aXJlZ3VhcmQgaW50ZXJm
YWNlIHRvIHJvdXRlIHRoZSBJUAo+PiB0byB0aGUgcmlnaHQgcGVlcj8KPgo+IEJlY2F1c2UgdGhh
dCAoYSkgcmVxdWlyZXMgYSBuZXcgbWVjaGFuaXNtIGFuZCAoYikgcmVxdWlyZXMgbG9ja2luZywK
PiBiZWNhdXNlIGN1cnJlbnRseSB5b3UgY2FuJ3QgYXRvbWljYWxseSByZW1vdmUvYWRkIGFuIGFk
ZHJlc3MgZnJvbS90byBhIHBlZXIuCj4KPiBGb3IgYSAibm9ybWFsIiBpbnRlcmZhY2UgSSdkIGNo
YW5nZSB0aGUgaG9zdCByb3V0ZSB0byB3aGF0ZXZlciB0aGUKPiBuZXh0aG9wIHRvIHRoZSByZWFs
IGRlc3RpbmF0aW9uIGFkZHJlc3MgaXMsIGFuZCBJJ20gKmRvbmUqLiBUaGF0J3Mgb25lCj4gYXRv
bWljICJpcCByb3V0ZSByZXBsYWNlIiBjb21tYW5kIChvciBpdHMgbmV0bGluayBlcXVpdmFsZW50
KS4gSSd2ZQo+IGZvdW5kIGEgY291cGxlIG9mIEhBIG1hbmFnZW1lbnQgcHJvZ3JhbXMgd2hpY2gg
Y2FuIGRvIHRoYXQuCj4KPiBGb3IgYSB3aXJlZ3VhcmQgaW50ZXJmYWNlIEkgbmVlZCB0byBmaW5k
IHRoZSBjb3JyZWN0IHBlZXIgKGJ5IG1hdGNoaW5nCj4gdGhlIHJlYWwgZGVzdGluYXRpb24gYWdh
aW5zdCBhbGwgQWxsb3dlZC1JUCBlbnRyaWVzKSwgbG9jayB0aGUgcGVlcgo+IGFnYWluc3QgY2hh
bmdlcywgcmVhZCB0aGUgQWxsb3dlZC1JUCBsaXN0LCBhZGQgdGhlIG11bHRpaG9tZWQgYWRkcmVz
cywKPiBhbmQgd3JpdGUgdGhlIGxpc3QgYmFjay4gQmVmb3JlL2FmdGVyIEkgZG8gYWxsIG9mIHRo
aXMgSSBoYXZlIHRvIHJlbW92ZQo+IHRoZSBtdWx0aWhvbWVkIGFkZHJlc3MgZnJvbSB3aGF0ZXZl
ciBwZWVyIGl0IHdhcyBwcmV2aW91c2x5IHNldCB0bywgc28KPiB0aGVyZSdzIGFuIGluZGV0ZXJt
aW5hdGUgdGltZSBkdXJpbmcgd2hpY2ggdGhlIGRlc3RpbmF0aW9uIGlzIGVpdGhlcgo+IHVucmVh
Y2hhYmxlIG9yIHJhbmRvbS4gVGhlIGFmb3JlbWVudGlvbmVkIEhBIG1hbmFnZXJzIGhhdmUgbm8g
aWRlYSB3aGF0Cj4gd2lyZWd1YXJkIGlzLCBhbmQgdGhlaXIgYXV0aG9ycyBtYXkgb3IgbWF5IG5v
dCBiZSBpbnRlcmVzdGVkIGluCj4gc3BlY2lhbC1jYXNpbmcgYSBzdGlsbC1zb21ld2hhdC1vYnNj
dXJlIG5ldHdvcmsgaW50ZXJmYWNlIHR5cGUuCgpJJ20gcHJldHR5IHN1cmUgeW91IGRvbid0IGhh
dmUgdG8gZ28gdGhyb3VnaCB0aGF0IHdob2xlIGRhbmNlLiBZb3UgY2FuCmp1c3QgYWRkIHRoZSBB
bGxvd2VkSVAgdG8gdGhlIG5ldyBwZWVyLCB3aGljaCBXaXJlZ3VhcmQgd2lsbCBpbnRlcnByZXQK
YXMgYSAnbW92ZScuCgpUaGF0IHN0aWxsIGxlYXZlcyB0aGUgJ25ldyBtZWNoYW5pc20nIGNvbXBs
YWludCwgb2YgY291cnNlLiBJJ20gbm90IHN1cmUKaXQncyBxdWl0ZSB0cml2aWFsIHRvIGhhdmUg
dGhlIGtlcm5lbC1zaWRlIGRvIHdoYXQgeW91IHdhbnQsIHRob3VnaCwgc28KaXQgbWF5IG5vdCBi
ZSBzb21ldGhpbmcgdGhhdCBpcyBsaWtlbHkgdG8gc2hvdyB1cC4gSSBoYXZlIGEgc2ltaWxhcgpw
cm9ibGVtIGJlY2F1c2UgSSB3YW50IHRvIHJ1biByb3V0aW5nIHByb3RvY29scyBvdmVyIHdpcmVn
dWFyZDsgbXkgcGxhbgppcyB0byB0ZWFjaCB0aGUgQmlyZCByb3V0aW5nIGRhZW1vbiBhYm91dCB3
ZyBwZWVycyB0byByZXNvbHZlIHRoaXMuLi4KCi1Ub2tlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3dpcmVndWFyZAo=
