Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B9FC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:01:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204AB2077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="JBF82fVA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204AB2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d9d6494;
	Mon, 9 Dec 2019 16:01:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a66d380
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:01:43 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5785e05
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:01:43 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1575907301; bh=NraEdSdmsvgNaRPHVYtyMr8NW/WE9oChAqBR+CFL2UA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JBF82fVA8spExcXgZ1B/AJSG+SveqdtENFg491FU+rQAmkRWaYRGgveRDwJqBMfeI
 bZIt9MNk3J3s3qt05aIaacyx13oSbuVn74iYKrRj4UmNmNEIXq2TipgDkQk3KcGyD7
 Be0jOMIChfUOqudRZvGyZC4aOPy4EqfHbV5yaxCZMHgdR4MfyE41YCQTDx0+knG6do
 XpICGEUxpyNvyXWWb1slRWRs1tVTeqrMwGrRG0fvNBwlU1QPkY7JAxsXFrOdIhhEEb
 EUX/raM+zwFzzT7vjzJ51u134N4F5pmB+EREdOk+LhyyjmhGSe5kXfr99GWJD9dvWl
 WfnuB7Hfla40w==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: organization of wireguard linux kernel repos moving forward
In-Reply-To: <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
References: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
 <87d0cxlldu.fsf@toke.dk>
 <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
Date: Mon, 09 Dec 2019 17:01:41 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87blshij2y.fsf@toke.dk>
MIME-Version: 1.0
Cc: Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Ikphc29uIEEuIERvbmVuZmVsZCIgPEphc29uQHp4MmM0LmNvbT4gd3JpdGVzOgoKPiBPbiBNb24s
IERlYyA5LCAyMDE5IGF0IDE6NDMgUE0gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRv
a2UuZGs+IHdyb3RlOgo+Pgo+PiAiSmFzb24gQS4gRG9uZW5mZWxkIiA8SmFzb25AengyYzQuY29t
PiB3cml0ZXM6Cj4+Cj4+ID4gMikgd2lyZWd1YXJkLXRvb2xzLmdpdCB3aWxsIGhhdmUgdGhlIHVz
ZXJzcGFjZSB1dGlsaXRpZXMgYW5kIHNjcmlwdHMsCj4+ID4gc3VjaCBhcyB3Zyg4KSBhbmQgd2ct
cXVpY2soOCksIGFuZCBiZSBlYXNpbHkgcGFja2FnZWFibGUgYnkgZGlzdHJvcy4KPj4gPiBUaGlz
IHJlcG8gd29uJ3QgYmUgbGl2ZSB1bnRpbCB3ZSBnZXQgYSBiaXQgY2xvc2VyIHRvIHRoZSA1LjYg
cmVsZWFzZSwKPj4gPiBidXQgd2hlbiBpdCBpcyBsaXZlLCBpdCB3aWxsIGxpdmUgYXQ6Cj4+ID4g
aHR0cHM6Ly9naXQuengyYzQuY29tL3dpcmVndWFyZC10b29scy8gW2N1cnJlbnRseSA0MDRzXQo+
PiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3p4MmM0
L3dpcmVndWFyZC10b29scy5naXQvCj4+ID4gW2N1cnJlbnRseSA0MDRzXQo+Pgo+PiBBbnkgcGxh
bnMgZm9yIGludGVncmF0aW5nIHRoaXMgZnVydGhlciB3aXRoIGlwcm91dGUyPyBPbmUgY291bGQg
aW1hZ2luZQo+PiBlaXRoZXIgdGVhY2hpbmcgJ2lwJyBhYm91dCB0aGUgd2lyZWd1YXJkLXNwZWNp
ZmljIGNvbmZpZyAoa2V5cyBldGMpLCBvcgo+PiBldmVuIGp1c3QgbW92aW5nIHRoZSAnd2cnIGJp
bmFyeSB3aG9sZXNhbGUgaW50byBpcHJvdXRlMj8KPgo+IEknZCBkZWZpbml0ZWx5IGJlIGludGVy
ZXN0ZWQgaW4gdGhpcy4gQmFjayBpbiAyMDE1LCB0aGF0IHdhcyB0aGUgcGxhbi4KPiBUaGVuIGl0
IHRvb2sgYSBsb25nIHRpbWUgdG8gZ2V0IHRvIHdoZXJlIHdlIGFyZSBub3csIGFuZCBzaW5jZSB0
aGVuCj4gd2coOCkgaGFzIHJlYWxseSBldm9sdmVkIGludG8gaXRzIG93biB1c2VmdWwgdGhpbmcu
IFRoZSBlYXNpZXN0IHRoaW5nCj4gd291bGQgYmUgdG8gbW92ZSB3Zyg4KSB3aG9sZXNhbGUgaW50
byBpcHJvdXRlMiBsaWtlIHlvdSBzdWdnZXN0ZWQ7Cj4gdGhhdCdkIGFsbG93IHBlb3BsZSB0byBj
b250aW51ZSB1c2luZyB0aGVpciBpbmZyYXN0cnVjdHVyZSBhbmQgd2hhdG5vdAo+IHRoZXkndmUg
dXNlZCBmb3IgYSBsb25nIHRpbWUgbm93LiBBIG1vcmUgbnVhbmNlZCBhcHByb2FjaCB3b3VsZCBi
ZQo+IGNvbWluZyB1cCB3aXRoIGEgX3BhcmFsbGVsXyBpcHJvdXRlMiB0b29sIHdpdGggbW9zdGx5
IHRoZSBzYW1lIHN5bnRheAo+IGFzIHdnKDgpIGJ1dCBhcyBhIHN1YmNvbW1hbmQgb2YgaXAoOCku
IE9yaWdpbmFsbHkgdGhlIGxhdHRlciBhcHBlYWxlZAo+IHRvIG1lLCBidXQgYXQgdGhpcyBwb2lu
dCBtYXliZSB0aGUgZm9ybWVyIGlzIGJldHRlciBhZnRlciBhbGwuIEkKPiBzdXBwb3NlIHNvbWV0
aGluZyB0byBjb25zaWRlciBpcyB0aGF0IHdnKDgpIGlzIGFjdHVhbGx5IGEKPiBjcm9zcy1wbGF0
Zm9ybSB0b29sIG5vdywgd2l0aCBhIHVuaWZpZWQgc3ludGF4IGFjcm9zcyBhIHdob2xlIGJ1bmNo
IG9mCj4gb3BlcmF0aW5nIHN5c3RlbXMuCgpIbW0sIEkgZG9uJ3QgcmVhbGx5IGhhdmUgYW55IG9w
aW5pb24gYWJvdXQgd2hpY2ggYXBwcm9hY2ggbWFrZXMgdGhlIG1vc3QKc2Vuc2U7IEknbSBwcmlt
YXJpbHkgY29uY2VybmVkIHdpdGggZ2V0dGluZyB0aGUgc3VwcG9ydCBpbnRvIGlwcm91dGUyIHNv
CnRoYXQgaXQgaXMgcG9zc2libGUgdG8gc2V0IHVwIGFuZCBjb25maWd1cmUgYSB3aXJlZ3VhcmQg
dHVubmVsICJvdXQgb2YKdGhlIGJveCIuIEJvdGggYXBwcm9hY2hlcyB3b3VsZCBhY2hpZXZlIHRo
YXQsIEkgdGhpbmsuLi4KCj4gQnV0IGl0J3MgYWxzbyBqdXN0IGJvcmluZyBDLgoKV2VsbCwgd2Ug
Y291bGQgYWx3YXlzIHJld3JpdGUgaXQgaW4gUnVzdCBvciBzb21ldGhpbmc/IDspCgotVG9rZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
