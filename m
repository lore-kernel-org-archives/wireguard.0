Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE57AC35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 08:35:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E220214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 08:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKJrjGPK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E220214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b90f90a2;
	Sun, 23 Feb 2020 08:32:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af0190d7
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 08:32:08 +0000 (UTC)
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92e3a492
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 08:32:08 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id b79so3890467vsd.9
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 00:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=x0G9C0TS/ABMjM/hFtC1iAnL73aLE6qHFcifycu6vtE=;
 b=OKJrjGPKlUG+aQwZp7xIikaO7PnyiREZ0XmeGrczBQpzS0j7ZysV5nfueFNdAN7u2D
 6k3UxbE6Q5IRJMf4rHNOY2zGzJPAYHwo2UhGOxGaeqSkolVyl9c/DqCCn04RM/EOUul4
 U8OkdAUs7xyRciie5RJrNW3dRdIhWtTl97B7j3PteSCY8KuJg5gmLnjKgwDL2hKeBZ0I
 872dKJqeBlxLZyPpCX076tDSJm4egjd6ZURKuRQiikupK6AEMz/BJbmEiMaWCYTKcotu
 BL11yhzJ5P7qbNEXcN4VWrVpDHcWSY0CJj2WUp7IbXiuK67sBsOX3BqvRJTKyfK7hQIE
 kM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=x0G9C0TS/ABMjM/hFtC1iAnL73aLE6qHFcifycu6vtE=;
 b=doDP0dDklRnLeUJz9IAL5eVYBcZV4nsWCqDSsgJVGD4O54YwW+1nFodyxBOKENUQ2s
 GO9Mot6sWk51zf2WXkRNoETQNO/pnns1/08i8G0vRmY2UgsPsDFLgXC8TXEukOe/qSCG
 LKYKRC/Z8Kp9PGyK6CBtxEPIuZp4mFadOfVM+btol2X+rXeELuBEl+KnJtAiy9nwz48d
 S/xocmcglxt5xr70KA4QfZjTKoOR/HiPwMN+6zn/RPBI1DOoKbmeG0sGQs/N37WXc01B
 DdTJ3icguDLkfCG/EQt+TwuRAiBqMNH3adeo8YwhN3Kr6dgJ/Z9G56LAcSoTwPez2NQ5
 bKsQ==
X-Gm-Message-State: APjAAAWMiTKU7/Z5q5V2S7Q2zD/tCRu4EzRzvYTmeqD/tXl6NGFwjJ9/
 2CF8z0I8mOfDXNJobe5PGXVNf77Tb9M1EATzWoF6AMq41QU=
X-Google-Smtp-Source: APXvYqzpajYoUwKWF2dVExaHoE0VoOtPNfACRZTqNcOng63Y0mq6mCspqbvXCLiXaQKMj0YCNDlWQGniwPlIpytpeDo=
X-Received: by 2002:a05:6102:3034:: with SMTP id
 v20mr26061445vsa.28.1582446921933; 
 Sun, 23 Feb 2020 00:35:21 -0800 (PST)
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
In-Reply-To: <3a52d59c-0784-4eaf-aedd-ce7baba2f5c3@rozman.si>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 23 Feb 2020 17:35:10 +0900
Message-ID: <CAA2ss9FUyK_Hrk3AoPLd9cKe1Mpci=yt28L_zY9kQ7S2_1eqkw@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: Simon Rozman <simon@rozman.si>, 
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

VGhhbmsgeW91IGZvciBxdWljayByZXBseSEKCkkgcmVhZCBSRUFETUUubWQuCkJ1dCBJIGRvbid0
IGhhdmUgV2luZG93cyBlbnZpcm9ubWVudCBJIGNhbiB1c2UgZnJlZWx5LCBzbyBjb3VsZCB5b3UK
Z2VuZXJhdGUgSmFwYW5lc2UgbWVzc2FnZXMuanNvbiBmaWxlPwoKVGhhbmtzLAoKMjAyMOW5tDLm
nIgyM+aXpSjml6UpIDE3OjIzIFNpbW9uIFJvem1hbiA8c2ltb25Acm96bWFuLnNpPjoKPgo+IEhp
IQo+Cj4gUGxlYXNlLCBzZWUgdGhlIHNpbXBsZSB0cmFuc2xhdGlvbiBpbnN0cnVjdGlvbnMgaW4g
dGhlIHNyL2wxOG4gYnJhbmNoIFJFQURNRS5tZCBmaWxlLgo+Cj4gSWYgeW91IGRvbid0IGhhdmUg
V2luZG93cyBhdCB5b3VyIGRpc3Bvc2FsLCBJIGNhbiBnZW5lcmF0ZSBhbiBlbXB0eSBKYXBhbmVz
ZSBtZXNzYWdlcy5qc29uIGZpbGUgZm9yIHlvdS4KPgo+IEJlc3QgcmVnYXJkcywKPiBTaW1vbgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJvbTogRWlqaSBUYW5pb2thIDx0
YW5pb2thNDA0QGdtYWlsLmNvbT4KPiBTZW50OiBTdW5kYXksIDIzIEZlYnJ1YXJ5IDIwMjAgMDg6
NDkKPiBUbzogU2ltb24gUm96bWFuOyB3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tCj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gQWRkIGphcGFuZXNlIHRyYW5zbGF0aW9uLgo+Cj4gSGkgU2ltb24hCj4K
PiBJIGZpbmlzaGVkIHdpcmVndWFyZC1hcHBsZSB0cmFuc2xhdGlvbiB0byBKYXBhbmVzZS4KPiBT
byBJIHdpbGwgc3RhcnQgdG8gdHJhbnNsYXRlIHdpcmVndWFyZC13aW5kb3dzLgo+Cj4gSG93IGRv
IEkgd29yayBvbiBpdD8KPiBJIGd1ZXNzOgo+IC0gY2hlY2tvdXQgc3IvaTE4bgo+IC0gY3JlYXRl
IGxvY2FsZXMvamEvbWVzc2FnZXMuZ290ZXh0Lmpzb24KPiAtIHRyYW5zbGF0ZSAibWVzc2FnZSIg
aW50byAidHJhbnNsYXRpb24iIGZpZWxkCj4gLSBzZW5kIHBhdGNoIHRvIE1MCj4KPiBJcyB0aGlz
IGNvcnJlY3Q/Cj4gVGhhbmtzLAo+Cj4gMjAyMOW5tDLmnIgxNuaXpSjml6UpIDIzOjEzIEVpamkg
VGFuaW9rYSA8dGFuaW9rYTQwNEBnbWFpbC5jb20+Ogo+ID4KPiA+IEhpIFNpbW9uLAo+ID4KPiA+
IFN1cmUhIEkgd2lsbCBiZSBwbGVhc2VkIHRvIGhlbHAgd2lyZWd1YXJkLXdpbmRvd3MgbG9jYWxp
emF0aW9uLgo+ID4gQ3VycmVudGx5LCBJJ20gd29ya2luZyBvbiB3aXJlZ3VhcmQtYXBwbGUgdHJh
bnNsYXRpb24uIFdoZW4gZmluaXNoZWQsCj4gPiBJIHdpbGwgdHJ5IHRvIHRyYW5zbGF0ZSB3aXJl
Z3VhcmQtd2luZG93cyB0byBKYXBhbmVzZS4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gRWlqaQo+ID4K
PiA+Cj4gPiAyMDIw5bm0MuaciDE25pelKOaXpSkgMTg6NDAgU2ltb24gUm96bWFuIDxzaW1vbkBy
b3ptYW4uc2k+Ogo+ID4gPgo+ID4gPiBIaSBFaWppIQo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiBJ
IHdvbmRlciBpZiB5b3UgbWlnaHQgYmUgd2lsbGluZyB0byBjb250cmlidXRlIEphcGFuZXNlIHRy
YW5zbGF0aW9uIGZvciB0aGUgd2lyZWd1YXJkLXdpbmRvd3MgYXMgd2VsbD8KPiA+ID4KPiA+ID4K
PiA+ID4KPiA+ID4gVGhlIHdpcmVndWFyZC13aW5kb3dzIGhhcyBwZW5kaW5nIGxvY2FsaXphdGlv
biBzdXBwb3J0IGhlcmUgaHR0cHM6Ly9naXQuengyYzQuY29tL3dpcmVndWFyZC13aW5kb3dzL2xv
Zy8/aD1zci9sMThuLiBJIGhhdmUgdHJhbnNsYXRlZCBpdCB0byBTbG92ZW5pYW4gYWxyZWFkeS4g
RnVydGhlcm1vcmUsIEkgc2hvdWxkIGdldCB0aGUgRnJlbmNoIHRyYW5zbGF0aW9uIHRvIGludGVn
cmF0ZSBzb29uIHRvby4KPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gUmVnYXJkcywgU2ltb24KPiA+
ID4KPiA+ID4KPiA+ID4KPiA+ID4gRnJvbTogV2lyZUd1YXJkIDx3aXJlZ3VhcmQtYm91bmNlc0Bs
aXN0cy56eDJjNC5jb20+IE9uIEJlaGFsZiBPZiBFaWppIFRhbmlva2EKPiA+ID4gU2VudDogU2F0
dXJkYXksIEZlYnJ1YXJ5IDE1LCAyMDIwIDExOjIzIEFNCj4gPiA+IFRvOiBTYW11ZWwgSG9sbGFu
ZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPiA+ID4gQ2M6IHdpcmVndWFyZEBsaXN0cy56eDJjNC5j
b20KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gQWRkIGphcGFuZXNlIHRyYW5zbGF0aW9uLgo+
ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiBUaGFuayB5b3UgZm9yIGFwcGx5aW5nIG15IHBhdGNoIQo+
ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiBJJ20gbm93IHRyYW5zbGF0aW5nIHdpcmVndWFyZC1hcHBs
ZSBpbnRvIEphcGFuZXNlLiBXaGVuIGZpbmlzaGVkLCBJIHdpbGwgc2VuZCBwYXRjaC4KPiA+ID4K
PiA+ID4gTmV4dCB0aW1lLCBJIHdpbGwgbm90IGZvcmdldCB5b3VyIGFkdmljZS4KPiA+ID4KPiA+
ID4KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiAyMDIw5bm0Muac
iDE15pelKOWcnykgMTU6MTQgU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Ogo+
ID4gPgo+ID4gPiBPbiAyLzE0LzIwIDExOjI3IFBNLCBFaWppIFRhbmlva2Egd3JvdGU6Cj4gPiA+
ID4gSGksIFNhbXVlbC4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgeW91ciByZXBseSEK
PiA+ID4gPiBJIHJlLWNyZWF0ZWQgcGF0Y2guCj4gPiA+Cj4gPiA+IFRoYW5rcywgYXBwbGllZDoK
PiA+ID4gaHR0cHM6Ly9naXQuengyYzQuY29tL3dpcmVndWFyZC1hbmRyb2lkL2NvbW1pdC8/aWQ9
ODIyZjcyZGY5NTZlY2QzYWFhNmEyYjI1NGUwNTllMzhiYTUxMjJlNApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cldp
cmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9s
aXN0aW5mby93aXJlZ3VhcmQK
