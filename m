Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4088AC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 16:00:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAD72070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 16:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SsuKEU00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDAD72070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d64e866;
	Sun, 25 Aug 2019 15:58:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4577d09e
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:58:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cb67d00
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:57:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543b365e
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=UM9hvIn/O8hE
 3S7XJBI4qochjpc=; b=SsuKEU00M9TrOHglKwEnSQwAitda9KiCUbYOk3ZFzDaW
 lx8mxlxw4rWxrpNfQvy5ehbuO51jDiqoenw+otQSI4Ar2bQHKwCfLpVRUqBHWvWb
 MgFcApB+ndVc3ebYUTFXgb8DXEAvPFbmyUrm0tGBjYEmKMmHp/cIZ31Y2frtIJjF
 Y81UguRsDmoMY1z1DIlqBt0V+de4WS+llJKe2uVtCL6U53y/XzcM7nq1o9WL9o/K
 eQ2loIu3xflBGITclJWNr7l5aedSsHh01RhWgeauWUXvakIyA0BnNiehCkXzovXM
 B7ihFf+prLU9WH5Rm1EKpeMYhd2R90OrN/1op3gX4Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fdcf3287
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:15:12 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id n13so4909169uap.9
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:57:00 -0700 (PDT)
X-Gm-Message-State: APjAAAWW4Blgc3KhIbgKbnTwpd3BEYLksiG4tmhGv2HoX8OoVe3J/6E4
 bqy7jtD4XFK04kIvccnIfCclGMAIOkQ6XccEeFk=
X-Google-Smtp-Source: APXvYqwbvP6UEt3wTuQ6v4S2dvF8Iz6ydwdSr7q9FTxXBQ+/Wh09fa+5LEQPjsMJYT4RdmYVRsb+kVosVDTQzsZG50Q=
X-Received: by 2002:ab0:2685:: with SMTP id t5mr6434499uao.48.1566748619723;
 Sun, 25 Aug 2019 08:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <E6BE60A6-0A9F-4A45-9FCE-155410ECDC6F@gmail.com>
In-Reply-To: <E6BE60A6-0A9F-4A45-9FCE-155410ECDC6F@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:56:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9rPiyV73jUF9p=nQ+_8JswON1usWbOKpaT6SavsOokpdA@mail.gmail.com>
Message-ID: <CAHmME9rPiyV73jUF9p=nQ+_8JswON1usWbOKpaT6SavsOokpdA@mail.gmail.com>
Subject: Re: Nonce in out-of-order messages
To: Hristo Georgiev <hristo.metal@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgOTozNiBBTSBIcmlzdG8gR2VvcmdpZXYgPGhyaXN0by5t
ZXRhbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8KPiBJ4oCZbSB3b3JraW5nIG9uIGZpbGUg
dHJhbnNmZXIgcHJvdG9jb2wgaW5zcGlyZWQgYnkgTm9pc2UgYW5kIFdpcmVndWFyZCBvdmVyIFVE
UCAgd2l0aCBzdGF0aWMga2V5cyBzbyB0aGUgaGFuZHNoYWtlIHBhdHRlcm4gaXMgZ29pbmcgdG8g
YmUgTm9pc2VfSUtfMjU1MTlfQ2hhQ2hhUG9seV9CTEFLRTJzICBvciBLSy4gSW4gZ2VuZXJhbCBp
4oCZbSB0cnlpbmcgdG8gZm9sbG93IE5vaXNlU29ja2V0IHNwZWMgYnV0IGFkYXB0ZWQgdG8gVURQ
IGFuZCBpIHdhcyB3b25kZXJpbmcgd2hlcmUgdG8gcGxhY2UgdGhlIOKAmG5vbmNl4oCZIGludG8g
cGFja2V0IHRvIGV4dGVuZCB0aGUgcHJvdG9jb2wgYXMgZGVzY3JpYmVkIGludG8gcC4xMS40IGlu
IE5vaXNlUHJvdG9jb2wgc3BlYyBodHRwOi8vd3d3Lm5vaXNlcHJvdG9jb2wub3JnL25vaXNlLmh0
bWwjb3V0LW9mLW9yZGVyLXRyYW5zcG9ydC1tZXNzYWdlcyAuICBTbyBJIGhhZCBhIGxvb2sgaW50
byBXaXJlR3VhcmQgaW1wbGVtZW50YXRpb24gKHdoaWNoIEkgdXNlIGEgbG90IGluIG11bHRpcGxl
IHNpdGVzLCBtb3N0bHkgb24gRWRnZVJvdXRlcnMpCj4gc28gd2hhdCBpIGZvdW5kIGluIG5vaXNl
LmMgbGluZSA0NDUgbWVzc2FnZV9kZWNyeXB0Ogo+Cj4gY2hhY2hhMjBwb2x5MTMwNV9kZWNyeXB0
KGRzdF9wbGFpbnRleHQsIHNyY19jaXBoZXJ0ZXh0LCBzcmNfbGVuLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaGFzaCwgTk9JU0VfSEFTSF9MRU4sCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwIC8qIEFsd2F5cyB6ZXJvIGZvciBOb2lzZV9J
SyAqLywga2V5KSkKPgo+IENvcnJlY3QgbWUgaWYgSeKAmW0gbWlzdGFrZW4sIEnigJltIG5vdCBD
IHByb2dyYW1lciBub3IgY3J5cHRvZ3JhcGhlciwgSSB0aGluayB0aGlzIHplcm8gaGVyZSBpcyB0
aGUgTm9uY2UuIElmIHRoYXTigJlzIHRoZSBjYXNlIHdoYXQgc2VjdXJpdHkgc2FjcmlmaWNlcyBh
bmQgdGhlIGNoYW5jZSBmb3IgcmVwbGF5IGF0dGFja3MgYXJlPwo+IFdvdWxkIGl0IGJlIE9rIGlm
IEkgYWxzbyBoYXJkY29kZSB0aGUgTm9uY2UgdG8gMCBpbiBteSBpbXBsZW1lbnRhdGlvbj8KClRo
aXMgaXNuJ3QgdGhlIG5vbmNlIHVzZWQgYXMgcGFydCBvZiB0aGUgdHJhbnNwb3J0IG9iamVjdCwg
YnV0IHJhdGhlcgphIHNpbmdsZSBlbmNyeXB0aW9uL2RlY3J5cHRpb24gdGhhdCBoYXBwZW5zIHdp
dGggYSB1bmlxdWUga2V5IGFzIHBhcnQKb2YgdGhlIGhhbmRzaGFrZS4gSXQgYmVpbmcgemVybyBp
cyBhIG5hdHVyYWwgY29uc2VxdWVuY2Ugb2YgdGhlCnByb3RvY29sIGZsb3cuCgpEb24ndCBoYXJk
Y29kZSBhIHplcm8gbm9uY2UgaW4gdHJhbnNwb3J0IG1lc3NhZ2VzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cldp
cmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9s
aXN0aW5mby93aXJlZ3VhcmQK
