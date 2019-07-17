Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CDEC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 18:52:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8992E21849
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 18:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="YJiEMN08"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8992E21849
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41fa2069;
	Wed, 17 Jul 2019 18:52:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92433309
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 18:52:54 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a2ed8a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 18:52:54 +0000 (UTC)
Date: Wed, 17 Jul 2019 18:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1563389573;
 bh=02w+HE7B3n8keO2/JjYxgcm1AyMDuCCtJyZ5toKgVl8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=YJiEMN08sDl6mYo/9+9538TQ8Z/dy2k7plE8A95yFcfjxNJpkJ5EYPxh18o7S4SOc
 yr9yVKSBOgI2DSu4Nx2MKpXkmCabCa8D258M88zzLgeOtDFSVx9GKMbX4b0rSSkzgd
 oR9rUXnywvNcDzJiJd9wRWL9aANcyzq8rWUX8JkM=
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [PATCH] treewide: more portable bash shebangs
Message-ID: <XHxn90sHSAhU8FiiH8HlaKCedl2W9YOY4Qzv0bfjAydxpP_K80LpTD-DNGmCWG4h6krilLjhoryjWE2c-uwCHjvhQPGIwnrg0UkZUbZxDGM=@protonmail.ch>
In-Reply-To: <55df869d-87e2-6d55-6e70-8b110cad2086@higgsboson.tk>
References: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
 <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
 <c58e3e33-bf95-1154-bfe2-7b87e4e730c7@higgsboson.tk>
 <EELepAK6aanjfQM-_vvGuS0aAwISwGlhv5Gq2DPFexSRvZ7mFpTMbe4-hNPhtBxkRVmSJPHpojmb6KeRgRIv9sbEwajUSwnfYVkawwMc9DU=@protonmail.ch>
 <55df869d-87e2-6d55-6e70-8b110cad2086@higgsboson.tk>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

T24gV2VkbmVzZGF5LCBKdWx5IDE3LCAyMDE5IDY6MzkgUE0sIErDtnJnIFRoYWxoZWltIDxqb2Vy
Z0BoaWdnc2Jvc29uLnRrPiB3cm90ZToKPgo+IEl0IGRvZXMgbm90IG1ha2UgYW55dGhpbmcgd29y
c2UuIFlvdXIgdGhyZWF0IG1vZGVsIGlzIHVucmVhc29uYWJsZSBhbmQgb3V0IG9mIHNjb3BlCj4g
b2Ygd2hhdCB0aGUgc2NyaXB0cyBhcmUgaW50ZW5kZWQgdG8gZ3VhcmFudGVlLgo+IFRoZXJlIGFy
ZSB0b25lcyBvZiBvdGhlciBlbnZpcm9ubWVudCB2YXJpYWJsZXMgbGlrZSBMRF9QUkVMT0FEIG9y
IExEX0xJQlJBUllfUEFUSAoKQW5kIGhvdyBleGFjdGx5IHlvdSBnZXQgaW50byBwb3NpdGlvbiB0
byBkZWNpZGUgd2hhdApzY29wZSBpcyByZWFzb25hYmxlIGZvciB3aXJlZ3VhcmQgc2NyaXB0cz8K
ClNhbWUgYXMgeW91IEkgY2FuIGNsYW0gdGhhdCB5b3VyIHVzZS1jYXNlIGlzIG91dCBvZiBzY29w
ZSBhbmQgaW5zdGVhZApvZiBmb3JjaW5nIGV2ZXJ5b25lIGVsc2UgdG8gcGF0Y2gtb3V0IHlvdXIg
Y2hhbmdlcyB5b3UgY2FuIGdvIGJhY2sgdG8KcGF0Y2hpbmcgdGhlIGNvZGUgYnkgeW91cnNlbGYg
aW4gYSB3YXkgeW91IHdpc2ggYW5kIHdpdGggYWNjb3JkYW5jZSB0bwp0aHJlYXQgbW9kZWwgeW91
IG1heSBvciBub3QgaGF2ZS4gR29vZCBsdWNrLgoKSm9yZGFuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1
YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3dpcmVndWFyZAo=
