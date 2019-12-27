Return-Path: <SRS0=tjFT=2S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC4C2D0C6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Dec 2019 12:12:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD36B20409
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Dec 2019 12:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="axK2VG+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD36B20409
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cf79f3a;
	Sat, 28 Dec 2019 12:12:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5fab112
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 18:28:21 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 619ab150
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 18:28:21 +0000 (UTC)
Date: Fri, 27 Dec 2019 18:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1577471299;
 bh=AnJ7W9EWH1llrNT2WZBepyvzHPG1q3CA1q9WHwZ9huw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=axK2VG+1/P+kPA7ChxCFl7h7Do6H8yt/2Lw1YY4IqmkDPRYkMxD/vSHSPHqO8yM+v
 Focg+OqgTebHe3I4GIeiexYRNAhQNFwK1QiGMzwHV6Cq7cOyQihtmEm60Q0Sw69CHT
 +LUdLmykE05IDC589XK7eJc5PIj/UKZwwffxXi/4=
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
From: Devin Smith <devinrsmith@protonmail.com>
Subject: Re: remove peer endpoint
Message-ID: <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
In-Reply-To: <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
Feedback-ID: XeGiycWlBLSU4ELhwyilafnp6KvXo0lPbKJxA_NjPuEyMu8EOfSDLrsklLCIx1Se8qkoT0W-9YiW9Q-F6KAU4g==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 28 Dec 2019 13:12:08 +0100
Cc: "WireGuard@lists.zx2c4.com" <WireGuard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Devin Smith <devinrsmith@protonmail.com>
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

SWYgSSdtIG5vdCBtaXN0YWtlbiwgYHdnIHNldCA8aW50ZXJmYWNlPiBwZWVyIDxiYXNlNjQ+IHJl
bW92ZWAgcmVtb3ZlcyB0aGUgd2hvbGUgcGVlciAtIEknbSBsb29raW5nIHRvIHJlbW92ZSBqdXN0
IHRoZSBwZWVyJ3MgZW5kcG9pbnQgYXR0cmlidXRlIFtlbmRwb2ludCA8aXA+Ojxwb3J0Pl0uCgri
gJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDigJDigJDigJDigJDi
gJAKT24gRnJpZGF5LCBEZWNlbWJlciAyNywgMjAxOSAxMDo1MSBBTSwgTG9ubmllIEFiZWxiZWNr
IDxsaXN0c0Bsb25uaWUuYWJlbGJlY2suY29tPiB3cm90ZToKCj4gPiBPbiBEZWMgMjcsIDIwMTks
IGF0IDk6NTEgQU0sIERldmluIFNtaXRoIGRldmlucnNtaXRoQHByb3Rvbm1haWwuY29tIHdyb3Rl
Ogo+ID4gSXMgaXQgcG9zc2libGUgdG8gcmVtb3ZlIHRoZSBlbmRwb2ludCBvZiBhIHBlZXIgdmlh
IHRoZSBgd2cgc2V0YCBjb21tYW5kPyBBbGwgb2YgdGhlIG90aGVyIHBlZXIgYXR0cmlidXRlcyAo
cHJlc2hhcmVkLWtleSwgcGVyc2lzdGVudC1rZWVwYWxpdmUsIGFsbG93ZWQtaXBzKSBhcmUgcmVt
b3ZhYmxlIGluIHRoaXMgZmFzaGlvbiAoYW5kIGRvY3VtZW50ZWQgaW4gdGhlIG1hbiBwYWdlKS4g
SSd2ZSB0cmllZCBgd2cgc2V0IDxpbnRlcmZhY2U+IHBlZXIgPGJhc2U2NC1wdWJsaWMta2V5PiBl
bmRwb2ludCAwYCAuLi4KPgo+IFllcywgdGhpcyB3b3JrczoKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0KPgo+IHdnIHNldCA8aW50ZXJmYWNlPiBwZWVyIDxiYXNlNjQtcHVibGljLWtleT4gcmVtb3Zl
Cj4gLS0KPgo+IElmIHlvdSBmb3JnZXQsICJ3ZyBzZXQgLS1oZWxwIiB3aWxsIHJlbWluZCB5b3Uu
Cj4KPiBMb25uaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0
cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
