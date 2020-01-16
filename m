Return-Path: <SRS0=8jGa=3F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6C6C33CB6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Jan 2020 11:55:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A29520663
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Jan 2020 11:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="nX/UkQfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A29520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cba5c542;
	Thu, 16 Jan 2020 11:55:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9db4063
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 11:55:15 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1907879
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 11:55:15 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1579175713; bh=4y3xlnN4e2Xm5T4hzXwBczpa8vU1aFXtJaAzne6YqDo=;
 h=From:To:Cc:Subject:In-Reply-To:Date:From;
 b=nX/UkQfAysSgx7jIW+mfOCOAWR9f2/i8bC2ul91Khjm1OTtS9CadrM2NZi90i1ua1
 jKvk+pio+Wz32wMLl1wL2QcCG6FC+TvnDzQA36sDGzmbmex4rDftdW3C0KwojHdyVk
 Nmuraeb/OEGR7XeEBxbz/Io+csdofjDMylGyJX40CPpihYe4Hkopcjj/AoKyP1RJGc
 8FjmhbTWZUQ46YwXqi8lU3s3mffv8W/bSWDWrvOrdqnIcE3YpfRd5OQOVqzHOXXjp7
 smzBM3SzTDwvX6AtxXXgJLptR3xs1zGZZ0RUli2CpePTazsORRs6X/8mDD8ASsx9Ae
 Qfaw0lJnPtbew==
To: Motiejus =?utf-8?Q?Jak=C5=A1tys?= <motiejus.jakstys@gmail.com>
Subject: Re: multiple endpoints for a single peer -- implementation details
In-Reply-To: <CAFVMu-qhABgo2zgw7bb4hSuZUKnApLG=856CN-aw7xQshzzNBw@mail.gmail.com>
Date: Thu, 16 Jan 2020 12:55:12 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87o8v3sjj3.fsf@toke.dk>
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

TW90aWVqdXMgSmFrxaF0eXMgPG1vdGllanVzLmpha3N0eXNAZ21haWwuY29tPiB3cml0ZXM6Cgo+
IE9uIFRodSwgSmFuIDE2LCAyMDIwIGF0IDExOjU1IEFNIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNl
biA8dG9rZUB0b2tlLmRrPiB3cm90ZToKPj4KPj4gTW90aWVqdXMgSmFrxaF0eXMgPG1vdGllanVz
Lmpha3N0eXNAZ21haWwuY29tPiB3cml0ZXM6Cj4+Cj4+ID4gWy4uLl0KPj4gQmVmb3JlIHlvdSBn
byBhbmQgcmUtaW52ZW50IHRoZSBoYXBweSBleWViYWxscyBhbGdvcml0aG0sIG1heSBJIHN1Z2dl
c3QKPj4geW91IHJlYWQgdGhlIFJGQz8gOikKPj4KPj4gaHR0cHM6Ly90b29scy5pZXRmLm9yZy9o
dG1sL3JmYzgzMDUKPj4KPj4gU3BlY2lmaWNhbGx5LCB0aGUgY29uc2lkZXJhdGlvbnMgZm9yIGhv
dyB0byBkbyBtdWx0aXBsZSBjb25uZWN0aW9uCj4+IGF0dGVtcHRzIHNhZmVseSB3aXRob3V0IG92
ZXJsb2FkaW5nIHRoZSBuZXR3b3JrIGlzIHJlbGV2YW50IGZvciB0aGlzLiBBcwo+PiBpcyB0aGUg
Yml0IGFib3V0IHNvcnRpbmcgRE5TIHJlc3BvbnNlcy4KPgo+IEZyb20gdGhlIFJGQyBJIGxlYXJu
ZWQgdGhhdCB0aGUgY2xpZW50IHNob3VsZCBub3QgaXNzdWUgcGFyYWxsZWwKPiByZXF1ZXN0cywg
YW5kIHRpbWUgYmV0d2VlbiB0cmllcyBtdXN0IGJlIHJlYXNvbmFibGUgKHNheSAxMDBtcykuIFNv
Cj4gdGhlIG9yaWdpbmFsIHByb2JsZW0gZ29lcyBhd2F5LiBUaGFua3MgZm9yIHRoZSBsaW5rLgoK
WW91J3JlIHdlbGNvbWUgOikKCj4+IFsuLi5dCj4+Cj4+ID4gMi4gbW9yZSBhIGNvbmNlcm46IG5l
aXRoZXIga2VybmVsLCBub3Igd2lyZWd1YXJkLWdvIGltcGxlbWVudGF0aW9ucwo+PiA+IGFyZSB3
aWxsaW5nIHRvIGFjY2VwdCBtb3JlIHRoYW4gb25lIGVuZHBvaW50LCBhbmQgaXQgd291bGQgYmUg
bWVzc3kgdG8KPj4gPiBleHRlbmQ6Cj4+ID4KPj4gPiBpbmNsdWRlL3VhcGkvbGludXgvd2lyZWd1
YXJkLmgKPj4gPiAgIFdHUEVFUl9BX0VORFBPSU5UOiBzdHJ1Y3Qgc29ja2FkZHJfaW4gb3Igc3Ry
dWN0IHNvY2thZGRyX2luNgo+PiA+Cj4+ID4gZGV2aWNlL3VhcGkuZ286Cj4+ID4gICBjYXNlICJl
bmRwb2ludCI6Cj4+ID4gICAuLi4KPj4gPiAgICAgZW5kcG9pbnQsIGVyciA6PSBDcmVhdGVFbmRw
b2ludCh2YWx1ZSkKPj4gPgo+PiA+IEVuZHBvaW50IGlzIGZpeGVkIHRvIGJlIGEgc2luZ2xlIFVE
UCBhZGRyZXNzLCBhbmQgYm90aCBrZXJuZWwgYW5kCj4+ID4gd2lyZWd1YXJkLWdvIHJlZnVzZSB1
bmtub3duIGtleXMuIFRvIGhhdmUgdG9vbGluZwo+PiA+IGJhY2t3YXJkcy1jb21wYXRpYmlsaXR5
IChpLmUuIHVzZSBuZXdlciB3aXJlZ3VhcmQtdG9vbHMgd2l0aCBvbGRlcgo+PiA+IGtlcm5lbCBp
bXBsZW1lbnRhdGlvbnMpLCB3aXJlZ3VhcmQtdG9vbHMgd291bGQgbmVlZCB0byBrbm93IHRoZQo+
PiA+IHN1cHBvcnRlZCAiZmVhdHVyZXMiIG9mIHRoZSB1bmRlcmx5aW5nIGltcGxlbWVudGF0aW9u
LiBBbmQgdGhlcmUgaXMgbm8KPj4gPiB2ZXJzaW9uIG5lZ290aWF0aW9uIGJldHdlZW4gdGhlIHVz
ZXIva2VybmVsIHNwYWNlLiBXaGljaCBtYWtlcyBpdAo+PiA+IHRyaWNreSB0byBhZGQgZmVhdHVy
ZXMgbGlrZSB0aGlzLgo+Pgo+PiBFaD8gVGhlIGtlcm5lbCBBUEkgaXMgbmV0bGluayAtIHlvdSBj
b3VsZCBqdXN0IGFkZCBtdWx0aXBsZQo+PiBXR1BFRVJfQV9FTkRQT0lOVCBhdHRyaWJ1dGVzLiBP
ciBhZGQgYSBuZXcgb25lCj4+IChXR1BFRVJfQV9FTkRQT0lOVFNfTVVMVEk/KS4gU2FtZSB0aGlu
ZyBmb3Igd2lyZWd1YXJkLWdvIChJIGFzc3VtZSkuCj4KPiBOZXcgbmV0bGluayBhdHRyaWJ1dGUg
aW4gdXNlcnNwYWNlIGFsb25lIHdvdWxkIG1lYW4gdGhhdCBvbGRlciBrZXJuZWxzCj4gd2lsbCBu
b3QgdW5kZXJzdGFuZCB0aGUgbWVzc2FnZS4gTm93IHRoYXQgSSBsb29rZWQgYXQgdGhlIGhlYWRl
cnMKPiBhZ2Fpbiwga2VybmVsIGRvZXMgc2VuZCBXR1BFRVJfQV9QUk9UT0NPTF9WRVJTSU9OLiBX
aGljaCBzb2x2ZXMgdGhlCj4gcHJvYmxlbS4gR28gaGFzIGFuIGVxdWl2YWxlbnQgInByb3RvY29s
X3ZlcnNpb24iLgoKT3IgYSBuZXcgdXNlcnNwYWNlIGp1c3QgYWRkcyB0aGUgbmV3IGF0dHJpYnV0
ZSwgYW5kIGlmIHRoZSBrZXJuZWwKZG9lc24ndCB1bmRlcnN0YW5kIGl0LCBpdCB3aWxsIGJlIHJl
amVjdGVkIGFuZCB1c2Vyc3BhY2UgY2FuIGZhbGwgYmFjawp0byB0aGUgb2xkIGJlaGF2aW91ci4g
QXQgbGVhc3QgSSBob3BlIHRoYXQncyB3aGF0IHRoZSBrZXJuZWwgZG9lcyA6KQoKLVRva2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1h
aWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQu
Y29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
