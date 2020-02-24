Return-Path: <SRS0=Pzr+=4M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E62C35671
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Feb 2020 13:57:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D1D20836
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Feb 2020 13:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3cmIX9H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D1D20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe1965e7;
	Mon, 24 Feb 2020 13:54:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e243096b
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:54:16 +0000 (UTC)
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1fcb972
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:54:16 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id a33so3221387uad.11
 for <wireguard@lists.zx2c4.com>; Mon, 24 Feb 2020 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GDIJ07Iabkcy+V77B0bbSDZV0zncqp5C0ekgxcJfMLw=;
 b=T3cmIX9HdklGxIRJbYGKHpGO6GXOBEa0fkSjvgmsKLpCaiwYt28geoD9Ci6ckYHT6L
 heF/KORGHYUR5cwhc6+BPc1Y+SfU9dHjNQDI/4hcB3bSJ3yy0xs9Fn5BrmtX97Afg9bZ
 /1kEsyH+JB5Nie55iYd5MEv3Xx136nm2EoxV5wi9r2Kf9MzUMabPfgioMeDrGCbGj5yq
 X2RXhq1mhb0hxhv5T6M3mZO5o+5mrg7MkZyTtXRBaMaKQD+LVPxD2X/Bn5+WR7f74VTZ
 gthQpWnQikot3XXkVImkiYjFmnW/h0CbRN+I7jgZDep5MpCt9jyM83kDiDkP9fhL5o8C
 ZUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GDIJ07Iabkcy+V77B0bbSDZV0zncqp5C0ekgxcJfMLw=;
 b=I/eSOnQd0irj0C7KXcGs11Zo4XZk1CkR2T0aAChhCqAQlT4gyKh+iEab2leKOu8vqV
 rMUeHn1pNpEhviUD4Yi+LAuKAqqshlI4oTBHLtPIynQviMnA86o5+5lyvj5T74faxXmS
 QGrJTnElV8gBEBXaq04tQ1pKRRKARurBNobqRt9nQtVjVN5ZM93FTbNPgM9tv1piZ9ns
 12gQ/SkPfxmmaFJlCU3jVCeu/1UudWhcshz1Jl7RuHfp7FanBfbP+k9zruYKZCCRVeGm
 nuqmLmazShN9Ozm5pRLC6w7BcBw9/tfPQ22OaXusZ+NolYuqoTNiwyRom507x6ke1gTL
 +1ag==
X-Gm-Message-State: APjAAAVRPIH64GtCNMvlGLSg/iEEYmBqMitA1d1xe80AxCcO4k7L/R+e
 h8VVuOL+gWFShBughDca8K4MZCv0+JL1E9TXle5Xgi/W
X-Google-Smtp-Source: APXvYqxhFV/RSiY+ayWaSpPO6UG51ZXXtrCa8AZZG+RSx+Ogy5GakkCUatvitBSHw8HAqqpibWYLBM2nbf5PQWUhqew=
X-Received: by 2002:a9f:3046:: with SMTP id i6mr25481671uab.15.1582552660191; 
 Mon, 24 Feb 2020 05:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
 <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>
 <CAA2ss9GG5P2QgRtO=sBSKywTqAniB4rfk7qSWOkvTtVnvPNsXg@mail.gmail.com>
 <3a52d59c-0784-4eaf-aedd-ce7baba2f5c3@rozman.si>
 <CAA2ss9FUyK_Hrk3AoPLd9cKe1Mpci=yt28L_zY9kQ7S2_1eqkw@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0760855@PLANJAVA.amebis.doma>
In-Reply-To: <99D61A626FDA8A4B90A270669121BE10D0760855@PLANJAVA.amebis.doma>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Mon, 24 Feb 2020 22:57:29 +0900
Message-ID: <CAA2ss9FaHPH7achZkZ2i+RazeVjPW=SSCfe3DBj3NP-v-vcB2Q@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

SGksCgpUaGFuayB5b3UgZm9yIHRoZSBpbnN0cnVjdGlvbi4KWWVzLCBKYXBhbmVzZSBkb2Vzbid0
IGhhdmUgcGx1cmFsLiBJIHdpbGwgdXNlIHRoaXMgZmlsZS4KCldoZW4gZmluaXNoZWQsIEkgd2ls
bCBzZW5kICJyZXNvdXJjZXMucmMiIGFuZCAibWVzc2FnZXMuZ290ZXh0Lmpzb24iIHRvIHlvdS4K
V2hpY2ggc3R5bGUgZG8geW91IHByZWZlcj8gImdpdCBmb3JtYXQtcGF0Y2giIG9yICJhdHRhY2ht
ZW50Ij8KClJlZ2FyZHMsCkVpamkKCjIwMjDlubQy5pyIMjPml6Uo5pelKSAxOToxOSBTaW1vbiBS
b3ptYW4gPHNpbW9uQHJvem1hbi5zaT46Cj4KPiBIaSEKPgo+IDEuIEZvciBzdGFydGVycywgSSds
bCBuZWVkIHRoZSB0cmFuc2xhdGlvbiBvZiAiV2lyZUd1YXJkOiBGYXN0LCBNb2Rlcm4sIFNlY3Vy
ZSBWUE4gVHVubmVsIiBzdHJpbmcuIFRoaXMgc3RyaW5nIGlzIHdyaXR0ZW4gaW50byAuZXhlIHJl
c291cmNlcyBhbmQgaXMgbG9jYXRlZCBzZXBhcmF0ZWx5IChpbiByZXNvdXJjZXMucmMpLgo+Cj4g
Mi4gVHJhbnNsYXRlIHRoaXMgZmlsZTogaHR0cHM6Ly9naXQuengyYzQuY29tL3dpcmVndWFyZC13
aW5kb3dzL3RyZWUvbG9jYWxlcy9qYS9tZXNzYWdlcy5nb3RleHQuanNvbj9oPXNyL2wxOG4uIEZp
bGwgdGhlICJ0cmFuc2xhdGlvbiIgc3RyaW5nIHByb3BlcnRpZXMgd2l0aCBKYXBhbmVzZSB0ZXh0
LiBKYXBhbmVzZSBkb2Vzbid0IGhhdmUgcGx1cmFsLCByaWdodD8gSWYgeW91IG5lZWQgdG8gd29y
ZCBzb21lIHRyYW5zbGF0aW9uIGRpZmZlcmVudGx5IChiYXNlZCBvbiBhIGNhcmRpbmFsIHZhcmlh
YmxlKSwgeW91IG1heSBleHRlbmQgInRyYW5zbGF0aW9uIiBzdHJpbmcgcHJvcGVydHkgaW50byB0
byBhICJzZWxlY3QiIG9iamVjdC4gU2VlIGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJlZ3VhcmQt
d2luZG93cy90cmVlL2xvY2FsZXMvZW4vbWVzc2FnZXMuZ290ZXh0Lmpzb24/aD1zci9sMThuIG9y
IGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJlZ3VhcmQtd2luZG93cy90cmVlL2xvY2FsZXMvZnIv
bWVzc2FnZXMuZ290ZXh0Lmpzb24/aD1zci9sMThuIGZvciBwbHVyYWwgZXhhbXBsZXMgKHNlYXJj
aCBmb3IgInBsdXJhbCIpLiAoWWVzLCB3ZSBhcmUgdXNpbmcgRW5nbGlzaC10by1FbmdsaXNoIHRy
YW5zbGF0aW9uIHRvIHRyYW5zbGF0ZSAie1NlY29uZHN9IHNlY29uZChzKSIgaW50byBuaWNlciB0
byByZWFkICIxIHNlY29uZCIsICIyIHNlY29uZHMiLi4uKQo+Cj4gMy4gRGVsaXZlciB0cmFuc2xh
dGlvbiB0byBtZSBhbmQgSSBzaGFsbCBoYW5kbGUgYSBjb21taXQgaW4geW91ciBuYW1lLiBCZWZv
cmUgcHVibGlzaGluZywgSSB3aWxsIG1ha2Ugc29tZSBzY3JlZW5zaG90cyBpbiBKYXBhbmVzZSwg
Zm9yIHlvdSB0byBjb25maXJtLgo+Cj4gQmVzdCByZWdhcmRzLAo+IFNpbW9uCj4KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBFaWppIFRhbmlva2EgPHRhbmlva2E0MDRA
Z21haWwuY29tPgo+ID4gU2VudDogU3VuZGF5LCBGZWJydWFyeSAyMywgMjAyMCA5OjM1IEFNCj4g
PiBUbzogU2ltb24gUm96bWFuIDxzaW1vbkByb3ptYW4uc2k+OyB3aXJlZ3VhcmRAbGlzdHMuengy
YzQuY29tCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBZGQgamFwYW5lc2UgdHJhbnNsYXRpb24u
Cj4gPgo+ID4gVGhhbmsgeW91IGZvciBxdWljayByZXBseSEKPiA+Cj4gPiBJIHJlYWQgUkVBRE1F
Lm1kLgo+ID4gQnV0IEkgZG9uJ3QgaGF2ZSBXaW5kb3dzIGVudmlyb25tZW50IEkgY2FuIHVzZSBm
cmVlbHksIHNvIGNvdWxkIHlvdQo+ID4gZ2VuZXJhdGUgSmFwYW5lc2UgbWVzc2FnZXMuanNvbiBm
aWxlPwo+ID4KPiA+IFRoYW5rcywKPiA+Cj4gPiAyMDIw5bm0MuaciDIz5pelKOaXpSkgMTc6MjMg
U2ltb24gUm96bWFuIDxzaW1vbkByb3ptYW4uc2k+Ogo+ID4gPgo+ID4gPiBIaSEKPiA+ID4KPiA+
ID4gUGxlYXNlLCBzZWUgdGhlIHNpbXBsZSB0cmFuc2xhdGlvbiBpbnN0cnVjdGlvbnMgaW4gdGhl
IHNyL2wxOG4gYnJhbmNoCj4gPiBSRUFETUUubWQgZmlsZS4KPiA+ID4KPiA+ID4gSWYgeW91IGRv
bid0IGhhdmUgV2luZG93cyBhdCB5b3VyIGRpc3Bvc2FsLCBJIGNhbiBnZW5lcmF0ZSBhbiBlbXB0
eQo+ID4gSmFwYW5lc2UgbWVzc2FnZXMuanNvbiBmaWxlIGZvciB5b3UuCj4gPiA+Cj4gPiA+IEJl
c3QgcmVnYXJkcywKPiA+ID4gU2ltb24KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+ID4gRnJvbTogRWlqaSBUYW5pb2thIDx0YW5pb2thNDA0QGdtYWlsLmNvbT4KPiA+
ID4gU2VudDogU3VuZGF5LCAyMyBGZWJydWFyeSAyMDIwIDA4OjQ5Cj4gPiA+IFRvOiBTaW1vbiBS
b3ptYW47IHdpcmVndWFyZEBsaXN0cy56eDJjNC5jb20KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SF0gQWRkIGphcGFuZXNlIHRyYW5zbGF0aW9uLgo+ID4gPgo+ID4gPiBIaSBTaW1vbiEKPiA+ID4K
PiA+ID4gSSBmaW5pc2hlZCB3aXJlZ3VhcmQtYXBwbGUgdHJhbnNsYXRpb24gdG8gSmFwYW5lc2Uu
Cj4gPiA+IFNvIEkgd2lsbCBzdGFydCB0byB0cmFuc2xhdGUgd2lyZWd1YXJkLXdpbmRvd3MuCj4g
PiA+Cj4gPiA+IEhvdyBkbyBJIHdvcmsgb24gaXQ/Cj4gPiA+IEkgZ3Vlc3M6Cj4gPiA+IC0gY2hl
Y2tvdXQgc3IvaTE4bgo+ID4gPiAtIGNyZWF0ZSBsb2NhbGVzL2phL21lc3NhZ2VzLmdvdGV4dC5q
c29uCj4gPiA+IC0gdHJhbnNsYXRlICJtZXNzYWdlIiBpbnRvICJ0cmFuc2xhdGlvbiIgZmllbGQK
PiA+ID4gLSBzZW5kIHBhdGNoIHRvIE1MCj4gPiA+Cj4gPiA+IElzIHRoaXMgY29ycmVjdD8KPiA+
ID4gVGhhbmtzLAo+ID4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20K
aHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
