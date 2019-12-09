Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DB6C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 12:50:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D69120726
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 12:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qQQss+Bz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D69120726
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ad45056;
	Mon, 9 Dec 2019 12:49:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17a7ee58
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:49:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f8f1e9d
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:49:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25122ad6
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=xUqq53kk40Pa
 RW6u1XxXI0JPgYk=; b=qQQss+BzxNG6IujtnBRLVBMx2UfVXXeNkMoAZUmUmSDH
 gBQswu+tiZioSDUWD/rq2N7FoQc++Ruop5b7W30yRLFHdKFdk+jrVuzpKVgVzF3W
 W2SrZVWc+z20iIZQaUs2xouAuvTx+urbWhh0011OhZUZnoVa1I6ZIyZ5ClVcizS+
 RfV4zgzE7gHAOWW/3mbMJIPE7B0urOVRUBiyP2q4+NliKqKixmfac1yz07M0BNFu
 KjCBrY2nhc6pJYcY/zoP8qK0EOEwOcaJMmrJtjh7BcDAv/KTDBAlWAXsmD2GhRFD
 H5mdM3sA+EIlrkolV580okANkw46OoQJFa4cCXjSUg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc51e287
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 11:54:08 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id d62so6131692oia.11
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 04:49:32 -0800 (PST)
X-Gm-Message-State: APjAAAXy7ntPx1VZvPZD7kc2oe8PzDFXQ7qj9d/FJDDGirGnXs4yDLow
 oVzdxOinkB8GA2EHyPVVPGc2NrR4aS/YbP+rn28=
X-Google-Smtp-Source: APXvYqwOzIdO7q1spvx3hUouA9yi+b9gMiJTQ7zsvN5FAvPerpV3NOoXuWjh3/dEq0IxWyqOCiJ0elBZC3i7KlTDbcE=
X-Received: by 2002:aca:2109:: with SMTP id 9mr8317760oiz.119.1575895771647;
 Mon, 09 Dec 2019 04:49:31 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
 <87d0cxlldu.fsf@toke.dk>
In-Reply-To: <87d0cxlldu.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Dec 2019 13:49:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
Message-ID: <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
Subject: Re: organization of wireguard linux kernel repos moving forward
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxOjQzIFBNIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8
dG9rZUB0b2tlLmRrPiB3cm90ZToKPgo+ICJKYXNvbiBBLiBEb25lbmZlbGQiIDxKYXNvbkB6eDJj
NC5jb20+IHdyaXRlczoKPgo+ID4gMikgd2lyZWd1YXJkLXRvb2xzLmdpdCB3aWxsIGhhdmUgdGhl
IHVzZXJzcGFjZSB1dGlsaXRpZXMgYW5kIHNjcmlwdHMsCj4gPiBzdWNoIGFzIHdnKDgpIGFuZCB3
Zy1xdWljayg4KSwgYW5kIGJlIGVhc2lseSBwYWNrYWdlYWJsZSBieSBkaXN0cm9zLgo+ID4gVGhp
cyByZXBvIHdvbid0IGJlIGxpdmUgdW50aWwgd2UgZ2V0IGEgYml0IGNsb3NlciB0byB0aGUgNS42
IHJlbGVhc2UsCj4gPiBidXQgd2hlbiBpdCBpcyBsaXZlLCBpdCB3aWxsIGxpdmUgYXQ6Cj4gPiBo
dHRwczovL2dpdC56eDJjNC5jb20vd2lyZWd1YXJkLXRvb2xzLyBbY3VycmVudGx5IDQwNHNdCj4g
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC96eDJjNC93
aXJlZ3VhcmQtdG9vbHMuZ2l0Lwo+ID4gW2N1cnJlbnRseSA0MDRzXQo+Cj4gQW55IHBsYW5zIGZv
ciBpbnRlZ3JhdGluZyB0aGlzIGZ1cnRoZXIgd2l0aCBpcHJvdXRlMj8gT25lIGNvdWxkIGltYWdp
bmUKPiBlaXRoZXIgdGVhY2hpbmcgJ2lwJyBhYm91dCB0aGUgd2lyZWd1YXJkLXNwZWNpZmljIGNv
bmZpZyAoa2V5cyBldGMpLCBvcgo+IGV2ZW4ganVzdCBtb3ZpbmcgdGhlICd3ZycgYmluYXJ5IHdo
b2xlc2FsZSBpbnRvIGlwcm91dGUyPwoKSSdkIGRlZmluaXRlbHkgYmUgaW50ZXJlc3RlZCBpbiB0
aGlzLiBCYWNrIGluIDIwMTUsIHRoYXQgd2FzIHRoZSBwbGFuLgpUaGVuIGl0IHRvb2sgYSBsb25n
IHRpbWUgdG8gZ2V0IHRvIHdoZXJlIHdlIGFyZSBub3csIGFuZCBzaW5jZSB0aGVuCndnKDgpIGhh
cyByZWFsbHkgZXZvbHZlZCBpbnRvIGl0cyBvd24gdXNlZnVsIHRoaW5nLiBUaGUgZWFzaWVzdCB0
aGluZwp3b3VsZCBiZSB0byBtb3ZlIHdnKDgpIHdob2xlc2FsZSBpbnRvIGlwcm91dGUyIGxpa2Ug
eW91IHN1Z2dlc3RlZDsKdGhhdCdkIGFsbG93IHBlb3BsZSB0byBjb250aW51ZSB1c2luZyB0aGVp
ciBpbmZyYXN0cnVjdHVyZSBhbmQgd2hhdG5vdAp0aGV5J3ZlIHVzZWQgZm9yIGEgbG9uZyB0aW1l
IG5vdy4gQSBtb3JlIG51YW5jZWQgYXBwcm9hY2ggd291bGQgYmUKY29taW5nIHVwIHdpdGggYSBf
cGFyYWxsZWxfIGlwcm91dGUyIHRvb2wgd2l0aCBtb3N0bHkgdGhlIHNhbWUgc3ludGF4CmFzIHdn
KDgpIGJ1dCBhcyBhIHN1YmNvbW1hbmQgb2YgaXAoOCkuIE9yaWdpbmFsbHkgdGhlIGxhdHRlciBh
cHBlYWxlZAp0byBtZSwgYnV0IGF0IHRoaXMgcG9pbnQgbWF5YmUgdGhlIGZvcm1lciBpcyBiZXR0
ZXIgYWZ0ZXIgYWxsLiBJCnN1cHBvc2Ugc29tZXRoaW5nIHRvIGNvbnNpZGVyIGlzIHRoYXQgd2co
OCkgaXMgYWN0dWFsbHkgYQpjcm9zcy1wbGF0Zm9ybSB0b29sIG5vdywgd2l0aCBhIHVuaWZpZWQg
c3ludGF4IGFjcm9zcyBhIHdob2xlIGJ1bmNoIG9mCm9wZXJhdGluZyBzeXN0ZW1zLiBCdXQgaXQn
cyBhbHNvIGp1c3QgYm9yaW5nIEMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0
LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
