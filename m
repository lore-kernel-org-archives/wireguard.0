Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C184C4BA09
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:10:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E581221927
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IozKMH0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E581221927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 042fabf6;
	Wed, 26 Feb 2020 03:06:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 158607a2
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:06:48 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2502359b
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:06:48 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 7so856867vsr.10
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 19:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=oC9KutHCdIEMDx8iTVMqHQF65HrlVytRCmyaEnsH5Jk=;
 b=IozKMH0/yfjiKdUNjR7/arKM1EwiLbpJjluKOEXztSewCvwTIcO40GCJlimftabNQK
 GBfyVBBbwGcFuWDb9CBw2NsoXomEJbSIik1Ll4ttpObqJraelDxBYLI1q7Tog9zFCfjz
 /UwZFpf0PRVRb9xkKpFdre1YFikat1FL9RquoZ1zWx0Iy0zy732lwCeurS1wDwkbF7I4
 8LBnzhIdS7XRx9sLdeYd8ZyC9XraInY0sdU+4Z1681x6N2ZIvVJx/au7zZDsIMMjxLum
 K1TQZwAgbLSCa0xUEHL29IKk+2yyvXFTFJivMkYKXZQTfdJRasUpqRO21m4k2aF+6y8u
 fAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=oC9KutHCdIEMDx8iTVMqHQF65HrlVytRCmyaEnsH5Jk=;
 b=Yl2c4AQT3v2J5r+6bHQtjnDXfnz+0F40+rL+tC8NBqlGskVH+uUKN0VcB4hmpansde
 floQWnXFdlnT7fc1XdnFocZux/7ysUS3vG9Hhx5CXslm68LLguYbrpyLhhEI3le3yuW6
 H0ASuZhMm9a729WZHAf6/QXjL1EmRiZUOFdV6/EHvcGZzqAR6PnTribe5CL/rD3v13OZ
 jFTZtjqHzjO2cVyv6GP4E/mbV150nuu2zjoUomjZoGxiPDk3g6UuPWJDzA6bOm0qluti
 ORphj/vilJhzlfCArqztLdRe2Xkkee4dWwV75R1oEmhbu1ZKqH92p5+wpnLoeHk+TD1O
 4XCg==
X-Gm-Message-State: APjAAAXN7w8pYV7/KpfOMN0lQSSlY8Kmz9s61C0plT9l0PTiMHXKF+ez
 01i8gfxmZWY55UHWw12cDYGqfAQRWB6Do0aQ+j8o6q9moao=
X-Google-Smtp-Source: APXvYqyWapkNiYlswsvdEaYzQ+7zDQa2p9W22XgTnNljIeCoT9q6E7IFg75KkCqKISwdu+I2jjJ03SZaC2FvL83S9rE=
X-Received: by 2002:a67:2701:: with SMTP id n1mr2498641vsn.103.1582686623420; 
 Tue, 25 Feb 2020 19:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
In-Reply-To: <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Wed, 26 Feb 2020 12:10:10 +0900
Message-ID: <CAA2ss9HfYPV4M6PbJvfWgim+gKPXLsHxGofbE112-rBeT-rYXg@mail.gmail.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Samuel Holland <samuel@sholland.org>, wireguard@lists.zx2c4.com
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

VGhhbmtzIQpJIHdpbGwgZml4IGl0IGFzIHRvbGQuCgoyMDIw5bm0MuaciDI25pelKOawtCkgMTE6
NTYgU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Ogo+Cj4gT24gMi8yNS8yMCAy
OjEzIEFNLCBFaWppIFRhbmlva2Egd3JvdGU6Cj4gPiBIaSBTYW11ZWwuCj4gPgo+ID4gSSBhbHJl
YWR5IHRyYW5zbGF0ZWQgaW4gSmFwYW5lc2UsIGJ1dCBJIGRpZG4ndCBjb25jZXJuIGFib3V0IHBs
dXJhbHMuCj4gPgo+ID4gSmFwYW5lc2UgZG9lc24ndCBoYXZlIHBsdXJhbHMsIHNvIGRvZXMgInZh
bHVlcy1qYS9zdHJpbmdzLnhtbCIgbmVlZHMgdGhlc2UgZml4Pwo+ID4gLSByZW1vdmUgcGx1cmFs
cwo+ID4gLSBhZGQgc3RyaW5nIHJlc291cmNlIHRoYXQgaGF2ZSBzYW1lICJuYW1lIiBhdHRyaWJ1
dGUgYXMgcGx1cmFscwo+Cj4gUmVzb3VyY2VzIHRoYXQgaGF2ZSA8cGx1cmFsPiB0YWdzIGluIHRo
ZSB1bnRyYW5zbGF0ZWQgWE1MIHNob3VsZCB1c2UgPHBsdXJhbD4gaW4KPiB0cmFuc2xhdGlvbnMg
YXMgd2VsbC4gSG93ZXZlciwgdGhlIG9ubHkgPGl0ZW0+IHRhZyBpbnNpZGUgdGhlbSBzaG91bGQg
YmUKPiAib3RoZXIiLiAoSXQgc2hvdWxkIGxvb2sgbGlrZSB0aGUgQ2hpbmVzZSB0cmFuc2xhdGlv
biBkaWQgYmVmb3JlIHRoaXMgcGF0Y2guKQo+Cj4gU28gdGhlIG9ubHkgdGhpbmcgdG8gZml4IGlz
IHJlbW92aW5nIHRoZSA8aXRlbSBxdWFudGl0eT0ib25lIj4gdGFncy4KPgo+IFRoYW5rcywKPiBT
YW11ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2ly
ZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlz
dHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
