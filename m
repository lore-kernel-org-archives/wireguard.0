Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D85C35254
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:26:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2767922522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jikken.de header.i=@jikken.de header.b="FOk4n2ie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2767922522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=jikken.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e59a4f39;
	Sat, 8 Feb 2020 21:24:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00201998
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 22:19:36 +0000 (UTC)
Received: from shinsetsu.jikken.de (shinsetsu.jikken.de [92.60.39.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdafcba6
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jikken.de;
 s=Mv0BmWWr5KBeokdR; t=1581114048;
 bh=LPPlWNVOgdtjHgAeptu94XhwPJj309i3Lvmk/GOMasU=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=FOk4n2iereXegGVixVP4Ujad3nKWpPo0iPxjlCHPE7mMCY6Bt9vlKjgzOg/OZx/KN
 YVT2951Gi2+dxDljcqUKjTZysLNOxATzG9uEzayIEXqkaVnoI9Wkoc5SAM//qfY2Ij
 a/o8j03fnt/dnz0v5IALjDqJaGEFicPgjIkLotK4=
Date: Fri, 7 Feb 2020 23:20:47 +0100
From: Inrin <inrin@jikken.de>
To: wireguard@lists.zx2c4.com
Subject: Re: BGP over multiple wireguard vpn link
Message-ID: <20200207222047.r5n2lfeegyznlchf@nisshoku>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:24:08 +0100
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

SGVsbG8gTWlraSwKCk9uIEZyaSwgSmFuIDE3LCAyMDIwIGF0IDA1OjUzOjU3UE0gKzA3MDAsIFJv
YmVydG8gMDA3IHdyb3RlOgo+SSB3b3VsZCBsaWtlIHRvIHRlc3QgbXVsdGlwbGUgVlBOIGxpbmtz
IHdpdGggQkdQIHdoaWNoIGlzIGZvciBjb250cm9sbGluZwo+dHJhZmZpYy4KPkkgaGF2ZSBubyBw
cm9ibGVtIHRvIG1ha2UgQkdQIG92ZXIgbXVsdGlwbGUgbGlua3MgYnV0IG9uY2UgSSB0cmllZCB0
byBwaW5nCj50aGVuIEkgZm91bmQgYSBwcm9ibGVtIGJlY2F1c2UgSSBjYW5ub3Qgc2V0IEFsbG93
ZWQtSVBzIDAuMC4wLjAvMCB0byBhbGwKPnRoZSB3aXJlZ3VhcmQgbGlua3MuCkNvdWxkIHlvdSBl
bGFib3JhdGUgb24gaG93IHlvdSdyZSBjb25maWd1cmluZyB5b3VyIFdHIGxpbmtzPwpFLmcuIHdn
K2lwcm91dGUyLCB3Zy1xdWljaywgc3lzdGVtZC1uZXR3b3JrZCwg4oCmCgpCZXN0IHJlZ2FyZHMs
CklucmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldp
cmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xp
c3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
