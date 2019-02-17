Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1855CC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B96B2176F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wieliczko.ninja header.i=@wieliczko.ninja header.b="05JYZ4Wm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B96B2176F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wieliczko.ninja
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce71a5bf;
	Mon, 18 Feb 2019 22:53:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c40cec4b
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 12:32:33 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fbde2e1
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 12:32:33 +0000 (UTC)
Date: Sun, 17 Feb 2019 12:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wieliczko.ninja;
 s=protonmail; t=1550407248;
 bh=RbV4SciXVX5zvjzZfeJqQSA+b4Coqrp4xVaDjb83lPA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=05JYZ4Wmw5RH+dpBzt23hH0iEYUS++yiZVjPkSglvCZPgSGek+osIRPrlZZzFPItV
 uUArWCQdbOHQJ0QlQlMnpIyBRz3IzMxXnCcsSLDHDF5l65f7t7R9UyTNf8aXc0tno0
 /y0V8vQCG/nknvubC1TvG06MTvC72YnBlX8u1I5Q=
To: "noloader@gmail.com" <noloader@gmail.com>
From: Eryk Wieliczko <eryk@wieliczko.ninja>
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
Message-ID: <CHanFQf0BHc_tN8WFKYbpEbjSNMTveoCt1-zENLXnF_XJpdYLN4ywKtkwQ9mjdEYd55O4fQyMNHwRozH7Qi30CjTkiuUO_nPsHNLe_D5EyI=@wieliczko.ninja>
In-Reply-To: <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
Feedback-ID: uBwOhQgAUjO-mCE4v8RZ81RKX0ASW5ZgKh4bYtmyPYWTuWTyJ1pXSKwKpskmlyjfvo8TDukOEh7ekSlJK3Gk3A==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Feb 2019 23:53:53 +0100
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

Q29uZmlndXJpbmcgc3VjaCB0aGluZ3MgaXMgYW4gYWRkaXRpb25hbCB1bm5lY2Vzc2FyeSBzdGVw
LiBPcGVuVlBOL3RpbmMgZG9uJ3QgcmVxdWlyZSBzdWNoIGhhY2tzLiBPbmNlIHlvdSBzdGFydCBP
cGVuVlBOLCBpdCdzIGdvbm5hIHdvcmsgdW50aWwgdGhlIHNlcnZlciBkaWVzIG9mIG9sZCBhZ2Uu
IDotKQoKVGhpcyBpcyBhIHByb2JsZW0gdGhhdCdzIGdvbm5hIGJpdGUgc29tZSB1c2VycyBpbiB0
aGUgbGVhc3Qgb3Bwb3J0dW5lIG1vbWVudCwganVzdCBsaWtlIGl0IGJpdCBEYXZpZC4gQW5kIGl0
J3MgYSByZWFzb24gd2h5IEknbSBjdXJyZW50bHkgdXNpbmcgdGluYy4KCuKAkOKAkOKAkOKAkOKA
kOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKAkApPbiBTdW5kYXks
IEZlYnJ1YXJ5IDE3LCAyMDE5IDU6MDggQU0sIEplZmZyZXkgV2FsdG9uIDxub2xvYWRlckBnbWFp
bC5jb20+IHdyb3RlOgoKPiBPbiBTYXQsIEZlYiAxNiwgMjAxOSBhdCAxMDozNSBQTSBEYXZpZCBL
ZXJyIGRhdmlkQGtlcnIubmV0IHdyb3RlOgo+Cj4gPiBFcmlrLCBzZWUgaGVyZSBmb3IgYSBwcm9w
b3NlZCBmaXguIE5vIHJlc3BvbnNlIGZyb20gdGhlIFdpcmVHdWFyZCB0ZWFtIHlldC4KPiA+IGh0
dHBzOi8vbGlzdHMuengyYzQuY29tL3BpcGVybWFpbC93aXJlZ3VhcmQvMjAxOS1KYW51YXJ5LzAw
Mzg0Mi5odG1sCj4gPiBSZWNlbnRseSBJIGhhZCBhIHBvd2VyIG91dGFnZSBhbmQgYm90aCBteSBn
YXRld2F5IGFuZCBjYWJsZSBtb2RlbSB3ZW50IG9mZmxpbmUuIE9uIHBvd2VyIHJlY292ZXJ5IGJv
dGggZGV2aWNlcyBzdGFydCB1cCwgYnV0IHRoZSBnYXRld2F5IGNvbXBsZXRlcyBzdGFydHVwIGJl
Zm9yZSB0aGUgY2FibGUgbW9kZW0gY29tcGxldGVzIGl0cyBwcm90b2NvbCBuZWdvdGlhdGlvbnMs
IHNvIGluaXRpYWxseSB0aGUgZXh0ZXJuYWwgbmV0d29yayAoZXRoMCkgaXMgbm90IGZ1bmN0aW9u
YWwuIFRoYXQgY29tZXMgb25saW5lIHNheSBvbmUgbWludXRlIGxhdGVyIGFuZCBhbGwgaXMgd2Vs
bC4KPiA+IEV4Y2VwdCB0aGF0IGFsbCBpcyBub3Qgd2VsbC4gV2lyZWd1YXJkIGZhaWxlZCB0byBz
dGFydCB1cCBiZWNhdXNlIEkgaGF2ZSBFbmRwb2ludD08YSBVUkw+IGluc3RlYWQgb2YgYSBJUCBh
ZGRyZXNzLiBBbmQgYmVjYXVzZSBleHRlcm5hbCBpbnRlcmZhY2UgaXMgbm90IGxpdmUgeWV0LCBE
TlMgbG9va3VwIGZhaWxzIGFuZCBXaXJlZ3VhcmQgZG9lcyBub3QgZ3JhY2VmdWxseSBoYW5kbGUg
aXQuIFRoaXMgaXMgcmVhbGx5IGltcG9ydGFudCBiZWNhdXNlIFdpcmVndWFyZCBtYXkgYmUgbXkg
b25seSB3YXkgaW50byBteSBsb2NhbCBuZXR3b3JrLgo+ID4gQXMgd29yay1hcm91bmQgSSByZXBs
YWNlZCB0aGUgVVJMIHdpdGggdGhlIElQIGFkZHJlc3MuLi4gYnV0IHRoYXQgaXMgbm90IGEgbG9u
ZyB0ZXJtIHNvbHV0aW9uIGlmIHRoZSBlbmRwb2ludCBpcyBub3QgYSBzdGF0aWMgSVAgYWRkcmVz
cy4KPiA+IFdpcmVndWFyZCBuZWVkcyB0byBoYW5kbGUgdGhlIHNpdHVhdGlvbiB3aGVyZSBleHRl
cm5hbCBuZXR3b3JrIG1heSBub3QgaGF2ZSBzdGFiaWxpemVkIGF0IHRoZSB0aW1lIGl0IHN0YXJ0
cyB1cC4gVGhlIGFib3ZlIGxpbmsgcHJvcG9zZWQgYSBmaXguCj4KPiBGb3JnaXZlIG15IGlnbm9y
YW5jZS4uLiBTaG91bGQgaW5pdCBqdXN0IHJldHJ5IHRoZSBzZXJ2aWNlIHN0YXJ0Pwo+IFNvbWV0
aGluZyBsaWtlIHRoaXMgKGZyb20gU3lzdGVtZCk6Cj4KPiBbVW5pdF0KPiBTdGFydExpbWl0SW50
ZXJ2YWw9MzYwCj4gU3RhcnRMaW1pdEJ1cnN0PTUKPgo+IFRoZSBzdGF0ZW1lbnRzIGFib3ZlIHNh
eSB0byByZXRyeSA1IHRpbWVzIHdpdGhpbiAzNjAgc2Vjb25kcy4KPgo+IEplZmYKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGlu
ZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20v
bWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
