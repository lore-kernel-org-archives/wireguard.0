Return-Path: <SRS0=TKOU=MJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407F9C43382
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Sep 2018 17:23:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60123215F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Sep 2018 17:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="A8B6glgY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60123215F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e2082f5;
	Thu, 27 Sep 2018 17:20:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ecf057d
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 17:20:25 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32bda78c
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 17:20:25 +0000 (UTC)
Date: Thu, 27 Sep 2018 17:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1538068995;
 bh=8poEjni501GsUrMkw0pp74TWz98fgZ6ub5ytNgoS0MA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=A8B6glgYGG+Ql8Qvl1Q26TbLwwK2gE47JCSLSiLXczm6fGCCCqVcgYrV4ZpQVhyaN
 bwN0m5HQzMCUv8kDz+qWug4B2A2UYv+FPlEyp3BisKfsvBduB6epRpnPwUFA9263FI
 dBZj1Q7Xg1ibdxEJ6ssThSgCWBzm7hc4HvqvrFY4=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Lane Russell <lanerussell@protonmail.com>
Subject: Re: Connection issues with Google Fi
Message-ID: <EHYEPfkFpkfKvezFkP0dpmtlpyl6SuHLqMvOWl8PMZhUJZxGjQTmfbL8YqhxxC4NsvFm7p4N6OFTmfURdPerP5quN0wgmhTSDSBgac-GvS0=@protonmail.com>
In-Reply-To: <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
References: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
 <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
Feedback-ID: jhVgiX6_q-2hbdKQuEXcQXOKG_NeIdN6tYuPxgmVVFfYrZt1KrXoO6kRAhv_E12tTMk04CLY8AR2Ll0xF8yi-Q==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Lane Russell <lanerussell@protonmail.com>
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

SSBiZWxpZXZlIEknbSB1c2luZyB0aGUgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uLiBJIGhhdmUg
c3RvY2sgQW5kcm9pZCBvbiBteSBOZXh1cyA2UCBhbmQgaW5zdGFsbGVkIHRoZSBXaXJlR3VhcmQg
YXBwIGZyb20gR29vZ2xlIFBsYXkuCgpJIGFtIGFibGUgdG8gY29uc2lzdGVudGx5IHJlcGxpY2F0
ZSB0aGUgaXNzdWUgYnkgYnJpbmdpbmcgdGhlIFdpcmVHdWFyZCB0dW5uZWwgdXAgd2hpbGUgY29u
bmVjdGVkIHRvIGNlbGx1bGFyIG9ubHksIHRoZW4gY29ubmVjdGluZyB0byBXaUZpLgoKTG9nIDE6
IEFmdGVyIGJyaW5naW5nIHVwIHR1bm5lbCBvbiBjZWxsdWxhciwgdGhlbiByb2FtaW5nIHRvIFdp
ZmkKaHR0cHM6Ly9zMy5hbWF6b25hd3MuY29tL3B5cmFoZXgtbWlzYy9sb2dzL3dpcmVndWFyZC1s
b2dfMV9jZWxsdWxhcjJ3aWZpLnR4dAoKCkxvZyAyOiBBZnRlciBjb25uZWN0aW5nIHRvIFdpRmks
IEkgcmVzdGFydGVkIHRoZSBXaXJlR3VhcmQgdHVubmVsCmh0dHBzOi8vczMuYW1hem9uYXdzLmNv
bS9weXJhaGV4LW1pc2MvbG9ncy93aXJlZ3VhcmQtbG9nXzJfcmVzdGFydF90dW5uZWwudHh0CgoK
ClNlbnQgd2l0aCBQcm90b25NYWlsIFNlY3VyZSBFbWFpbC4KCuKAkOKAkOKAkOKAkOKAkOKAkOKA
kCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKAkApPbiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDI3LCAyMDE4IDEwOjQ4IEFNLCBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0
LmNvbT4gd3JvdGU6Cgo+IEhpIExhbmUsCj4KPiBBcmUgeW91IHVzaW5nIHRoZSBrZXJuZWwgbW9k
dWxlIG9yIHRoZSB1c2Vyc3BhY2UgaW1wbGVtZW50YXRpb24/IENhbgo+IHlvdSBzZW5kIGEgZGVi
dWcgbG9nPwo+Cj4gSmFzb24KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5j
b20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
