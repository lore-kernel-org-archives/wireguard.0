Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EA2C3F2D4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 08:35:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994A0246AF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 08:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/1ZC+AL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 994A0246AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d95d6a3c;
	Sat, 29 Feb 2020 08:31:31 +0000 (UTC)
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [2607:f8b0:4864:20::e41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f330a67d
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Feb 2020 08:31:28 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id u26so3512473vsg.2
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 00:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WGm6UhOJemj4nnvQMaFO+cnGYEUF5gEMtwhSnXhnhN8=;
 b=c/1ZC+ALF8ciOrYTbRmXZo88TG/JDs1gCdj6Sai9chRxzFrvwfORMT1NRESWl1Q9ho
 WWtX+SaYU/IS9K0mt7FH0/hmv6iYvlqm43MOiAb7dczqOB/Y8GoZYP0r1yx89/NE5ouX
 ag7nYEA014i2cvdPYfoDt77gqExxE2AQY1BiNrUXmBbB9PnW8E1EcRxzT9kFFVATLxS0
 UKrAarFML+aN3B9/0tnYVNW/g5u+8angEu6xZsVUiPqh9xtuAxQ0skjY29FjV3Cgbj1G
 Bpco5RwQ2kP78xHEmnHr8peRRzULQ7DA1wFkS4x3pNNMrKZwdx4FOYLWG35r914j2iWv
 sucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=WGm6UhOJemj4nnvQMaFO+cnGYEUF5gEMtwhSnXhnhN8=;
 b=Mg6ieKi5oqBGDOorLrIbgE3E2un0GW3LTz3RYOx6yPnqBijpTslNYwZZTcvye5JmD9
 2is+5MHfbTm5uGYIkgUvQeFZUy/xQI24vesA5dmT8sRGQ7bMktJ9T47prytHjRds+ZAd
 xdbyJAwXIbn81s+FkH0rrQ1uA4mi0fEHYDoT3unRS6ANH3l8mTKNxVsUKoO30BXdL2wF
 G/p/SUJJzdC8Gx2feL/zyWd3lxkRSUyyujjQ56Gk0TIpvaki5sB+plXZfATwjOqMB5F1
 0NJ23dExl5dI2+CFNHCcandlnWasG3PDEOsyCdcJc0eeV5M+IuoegNEDQTyxguEJGju+
 y9Bw==
X-Gm-Message-State: ANhLgQ1okOhZ3o85AE682M6Nz9fsb08enETkCC7xrk4wdHwYfC7jFjrE
 8l03tM4xagVwjGD3k02wX344jZi6wO/9BrbjMVrjBkV/Usg=
X-Google-Smtp-Source: ADFU+vtsZk4D+o7DaPbTG3d2dfEnecd7nzb05KUBtF7D9SPKN/+9GfVUQvU27QOawQNMDwYyqu0fhei9bZTsfdMJEbw=
X-Received: by 2002:a67:2701:: with SMTP id n1mr4583425vsn.103.1582965328503; 
 Sat, 29 Feb 2020 00:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
 <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
 <bc47c4f7-4aa4-fc6e-8f3c-34366c756236@sholland.org>
 <3bce7f79-88df-8035-6eb9-1e19e51c01a5@gmail.com>
In-Reply-To: <3bce7f79-88df-8035-6eb9-1e19e51c01a5@gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sat, 29 Feb 2020 17:35:17 +0900
Message-ID: <CAA2ss9HbDro5vgS0W8_cTQUetLFzjUCqXO1CHmsHprM7_Q+mXA@mail.gmail.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
To: wireguard@lists.zx2c4.com
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

SGkgVmFzaWxpIQoKRGlkIHlvdSBzZW5kIHBhdGNoIHRvIE1MPwpJZiBzbywgSSB0aGluayB0aGF0
IHlvdXIgcGF0Y2ggaXMgaW4gdGhlIG1vZGVyYXRpb24gcXVldWUuIEkgaGFkIG1ldApzYW1lIHNp
dHVhdGlvbiB3aGVuIHNlbmRpbmcgbXkgcGF0Y2ggYmVjYXVzZSBvZiBib2R5IHNpemUgKG92ZXIg
NDAKS0IpLgoKSSB0aGluayBpdCdzIG9rYXkgaWYgeW91IHdhaXQuCgpSZWdhcmRzLAoKMjAyMOW5
tDLmnIgyOeaXpSjlnJ8pIDE2OjAzIFZhc2lsaSBQdXBraW4gPGRpZ2dlc3RAZ21haWwuY29tPjoK
Cj4KPiBPbiAyNi4wMi4yMDIwIDY6NTksIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gT24gMi8y
NS8yMCA5OjQ0IFBNLCBWYXNpbGkgUHVwa2luIHdyb3RlOgo+ID4+IEl0IHNlYW1zIHRoYXQgcnVz
c2lhbiB0cmFuc2xhdGlvbiBpcyB2ZXJ5IGJhc2ljIGFuZCBub3QgdXRpbGl6ZQo+ID4+IHF1YW50
aXR5PSJ0d28iCj4gPj4gYW5kIHF1YW50aXR5PSJmZXciIGZvcm1zLCB3aXRob3V0IHRoZW0gc29t
ZSBwbHVyYWxzIHJlYWRzIG9kZC4gRG8geW91IG5lZWQgaGVscAo+ID4+IGZpeGluZyBpdCBvciBp
dCBpcyBkb25lIG9uIHB1cnBvc2U/Cj4gPiBJIGRvbid0IHRoaW5rIGl0IHdhcyBkb25lIG9uIHB1
cnBvc2U7IGxpa2VseSB0aGUgdHJhbnNsYXRvciB3YXMgdW5hd2FyZSBvZiB0aGUKPiA+IGFkZGl0
aW9uYWwgb3B0aW9ucyBmb3IgcXVhbnRpdHkgaW4gPGl0ZW0+IHRhZ3MuIEkgYW0gaGFwcHkgdG8g
bWVyZ2UgcGF0Y2hlcwo+ID4gaW1wcm92aW5nIHRoZSB0cmFuc2xhdGlvbiAod2hpY2ggaXMgcmVh
bGx5IHVwIHRvIHlvdXIganVkZ2VtZW50LCBzaW5jZSBJIGRvbid0Cj4gPiBzcGVhayBhbnkgb2Yg
dGhlc2UgbGFuZ3VhZ2VzKS4KPgo+IEhhdmUgeW91IHJlY2VpdmVkIHRoZSBwYXRjaD8KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFdpcmVHdWFyZCBt
YWlsaW5nIGxpc3QKPiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCj4gaHR0cHM6Ly9saXN0cy56
eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3Vh
cmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGlu
Zm8vd2lyZWd1YXJkCg==
