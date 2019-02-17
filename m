Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F48AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:01:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DEF21900
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wieliczko.ninja header.i=@wieliczko.ninja header.b="1K5E0Q5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1DEF21900
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wieliczko.ninja
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81bb5c50;
	Mon, 18 Feb 2019 22:52:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e618396
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 13:06:52 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0384f4f8
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 13:06:52 +0000 (UTC)
Date: Sun, 17 Feb 2019 13:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wieliczko.ninja;
 s=protonmail; t=1550409308;
 bh=crzMDWf/TEggFKqT65jqKx2Abdqx50K2gIBvSOOCZvA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=1K5E0Q5Jpf65ha5aa5Z7eVpNcIiFEemzMP0DgT1XxOQ/2e7TLDnBnnLk5eFGl2KLD
 JjqKqMd1k2Ay2ccWPbzkUX0FduET+BZkArQdxFDIuBnGtVqxNJLMBYbZMmqHD1qcHL
 S9Y+79yuK8oYLZZM5b1JaXoorLipC3c5l9Uf1u6E=
To: "noloader@gmail.com" <noloader@gmail.com>
From: Eryk Wieliczko <eryk@wieliczko.ninja>
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
Message-ID: <qtitL38P5VIptTV36IWKsoa4vWvlZyqhe3DFCyki22NSub1EVaaRJAg0NAKtFYKi68OwXXPKJH_firCbnX-X2-UCuFsKhruaQueFmouHj3k=@wieliczko.ninja>
In-Reply-To: <CAH8yC8nz5wwL=xKipUwUtrMqQJ5fHcWAdwzrMpX0Hxck+gO0kQ@mail.gmail.com>
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <CHanFQf0BHc_tN8WFKYbpEbjSNMTveoCt1-zENLXnF_XJpdYLN4ywKtkwQ9mjdEYd55O4fQyMNHwRozH7Qi30CjTkiuUO_nPsHNLe_D5EyI=@wieliczko.ninja>
 <CAH8yC8nz5wwL=xKipUwUtrMqQJ5fHcWAdwzrMpX0Hxck+gO0kQ@mail.gmail.com>
Feedback-ID: uBwOhQgAUjO-mCE4v8RZ81RKX0ASW5ZgKh4bYtmyPYWTuWTyJ1pXSKwKpskmlyjfvo8TDukOEh7ekSlJK3Gk3A==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Feb 2019 23:52:56 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Eryk Wieliczko <eryk@wieliczko.ninja>
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

WW91IGFyZSByaWdodCwgSSBnb3QgY29uZnVzZWQuCkkgdGhvdWdodCB0aGF0IHRoaXMgd291bGQg
YmUgc29tZXRoaW5nIHRoYXQgX3RoZSB1c2VyXyB3b3VsZCBoYXZlIHRvIHNldCB1cC4gUGxlYXNl
IGZvcmdpdmUgbXkgaWdub3JhbmNlLiA6LSkKClNpbmNlIHRoZXNlIHNjcmlwdHMgYXJlIGluc3Rh
bGxlZCBieSBXRyBhbmQgbm90IGJ5IGEgdXNlciwgdGhpcyBzb2x1dGlvbiB3b3VsZCBiZSBmaW5l
LgoKCgoKSXNuJ3QgaXQgdGhlIGNhc2UgdGhhdCBjdXJyZW50bHkgV0cgaXMgcGVyZm9ybWluZyBE
TlMgYm90aCBkdXJpbmcgY29uZmlndXJhdGlvbiBBTkQgZHVyaW5nIGNvbm5lY3Rpb24gc2V0dXA/
IEkgc2VlIHRoYXQgdGhlcmUgaXMgX2dldGFkZHJpbmZvXyBpbiBpcGMuYy4uLgpNYXliZSBqdXN0
IHJlbW92aW5nIGFsbCBnZXRhZGRyaW5mbyBmcm9tIGNvbmZpZy5jIHdvdWxkIGJlIGVub3VnaCB0
byBmaXggdGhpcz8KCuKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKA
kOKAkOKAkOKAkOKAkOKAkApPbiBTdW5kYXksIEZlYnJ1YXJ5IDE3LCAyMDE5IDI6MDcgUE0sIEpl
ZmZyZXkgV2FsdG9uIDxub2xvYWRlckBnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBTdW4sIEZlYiAx
NywgMjAxOSBhdCA3OjQwIEFNIEVyeWsgV2llbGljemtvIGVyeWtAd2llbGljemtvLm5pbmphIHdy
b3RlOgo+Cj4gPiA+IEZvcmdpdmUgbXkgaWdub3JhbmNlLi4uIFNob3VsZCBpbml0IGp1c3QgcmV0
cnkgdGhlIHNlcnZpY2Ugc3RhcnQ/Cj4gPiA+IFNvbWV0aGluZyBsaWtlIHRoaXMgKGZyb20gU3lz
dGVtZCk6Cj4gPiA+IFtVbml0XQo+ID4gPiBTdGFydExpbWl0SW50ZXJ2YWw9MzYwCj4gPiA+IFN0
YXJ0TGltaXRCdXJzdD01Cj4gPiA+IFRoZSBzdGF0ZW1lbnRzIGFib3ZlIHNheSB0byByZXRyeSA1
IHRpbWVzIHdpdGhpbiAzNjAgc2Vjb25kcy4KPiA+ID4gQ29uZmlndXJpbmcgc3VjaCB0aGluZ3Mg
aXMgYW4gYWRkaXRpb25hbCB1bm5lY2Vzc2FyeSBzdGVwLiBPcGVuVlBOL3RpbmMgZG9uJ3QgcmVx
dWlyZSBzdWNoIGhhY2tzLiBPbmNlIHlvdSBzdGFydCBPcGVuVlBOLCBpdCdzIGdvbm5hIHdvcmsg
dW50aWwgdGhlIHNlcnZlciBkaWVzIG9mIG9sZCBhZ2UuIDotKQo+Cj4gSSBoYXZlIHRvIGFkbWl0
IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCBjYWxsaW5nIGl0ICJ1bm5lY2Vzc2FyeSIuCj4KPiBU
aGVyZSBzZWVtcyB0byBiZSB0d28gdXNlIGNhc2VzIChtYXliZSBtb3JlPyk6IG1hbnVhbCBzdGFy
dCBhbmQgYXV0bwo+IHN0YXJ0LiBUaGUgYXV0byBzdGFydCBjYXNlIGlzIHVzdWFsbHkgaGFuZGxl
ZCBieSBpbml0IHNjcmlwdHMuIEluaXQKPiBzY3JpcHRzIHVzdWFsbHkgcmV0cnkuCj4KPiBJJ20g
bm90IHRocm93aW5nIHN0b25lcywgYnV0IEkgaGF2ZSB0byBhc2suLi4gV2h5IG5vdCB1c2UgdGhl
IHRvb2xzCj4gYXZhaWxhYmxlIGluc3RlYWQgb2YgYWRkaW5nIGhhY2tzIG9uIHRvcCBvZiBoYWNr
cz8gVGhlIGhhY2tzIGxpa2VseQo+IG1ha2UgdGhlIGNvZGUgYnJpdHRsZS4gQnkgdGhlIHRpbWUg
V2lyZWdhdXJkIGdldHMgdG8gc3VwcG9ydGluZyBBSVgsCj4gRHJhZ29uZmx5LCBIdXJkLCBTb2xh
cmlzIGFuZCBvdGhlciBVbml4IHBlcnNvbmFsaXRpZXMgbm8gb25lIHdpbGwgd2FudAo+IHRvIHRv
dWNoIGl0Lgo+Cj4gSmVmZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNv
bQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
