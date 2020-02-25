Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261CC35DF8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 07:07:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C0C72176D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 07:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmKhGVnR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C0C72176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id faf6d08d;
	Tue, 25 Feb 2020 07:04:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 551ad664
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 07:04:03 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb20a677
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 07:04:03 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id n27so7392456vsa.0
 for <wireguard@lists.zx2c4.com>; Mon, 24 Feb 2020 23:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tFYa22sGxjUKyFrTpLP0KbfS/1ElDdaxkr6IY1fNvdo=;
 b=YmKhGVnR8uQVY6nBnVo0zNv8dXyKaJz8GM1ximnUGB9BfmQxEOhfsJVwla47TW6WPL
 bSqgOQ6WDeA0q9DZa2DpMC27iJvgP45KgEvIAgaMxNnWBe0CDf0r6cIQQx22U+a9TdZ9
 n0OrHZAZtwO+eOJogkgsTeLKDKKhHHabI9hLiKth7cuUX4pCpWtZIfY/87biUk/3Xj2a
 XQcwRCH8FHnkzD7FGKvg6AuJfUxIFhxhOCIBC6QDqJ8EzokOYtbxMQqq3MWzxbiKgcs2
 pAewUj3wInHdwz8gnP29+mG9Gi6yuEyLasMCOVDNhyYZUkvuBHNj41K0iI3vzQgwtrdK
 oOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tFYa22sGxjUKyFrTpLP0KbfS/1ElDdaxkr6IY1fNvdo=;
 b=Oxm/C+M7dp38F/pBKiY2a4OFzSuU9J/NZYkCpcQz9CbbK5D5LVqBGEM4zJVqD1n1xw
 5jiIwFgX+n5EJiK97XUMand8rQuuH1Vkj7XIGpOlvDpLeVFqxDf7F4tfh4SNptbB4s1Q
 lhtcP8jZFGk8o5K3ZYSFFTsOHmNCuRgl+A86K9yAsvfUzRcOS17J8ApBAVEZaNuF2VGO
 QGYRk7DbbH/vkswSYbkWZA/1c2qJuF7WgGo6VM1YRN81qhFuQg9lY+FEV2BYRSN/g9qm
 QOQrC3xPCDVgpOH3JKnueiMxWaOMibxgqSKhUOyuWsGK2QZCq3T7HtHE0eGYq+LgDu9p
 D0nA==
X-Gm-Message-State: APjAAAUcwqn2a506lTqK9irK7L9fXdmlKKYwFIvHj4SLc2UuIgeQfeCc
 ONRUQSuPov44FepOh0e8hUAx0Q3stxu5TVPKvrqdRgLLFCWwTg==
X-Google-Smtp-Source: APXvYqy5HJCwunCEDWCywUMIVHUfm8Bgy8oO7hSWhJBb7qfhBqMN6cwhB+fzxJZCZqbcjbqHFhdKLj3aWeev8B70gD0=
X-Received: by 2002:a67:2701:: with SMTP id n1mr27893144vsn.103.1582614451612; 
 Mon, 24 Feb 2020 23:07:31 -0800 (PST)
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
Date: Tue, 25 Feb 2020 16:07:18 +0900
Message-ID: <CAA2ss9EORZq+NzY0zeDVFNna6cf8T62S+GxsddiWEkaFC10LNA@mail.gmail.com>
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

SGkgU2ltb24sCgpJIHJlYWQgInJlc291cmNlcy5yYyIsIGFuZCBzdGFydCB3b3JraW5nLgphbmQg
SSBoYXZlIHF1ZXN0aW9uIGFib3V0IGl0LgoKLSBGb3IgSmFwYW5lc2UgcmVzb3VyY2UsIGNvcHkg
ZnJvbSBsaW5lIDQ1LTUwIGFuZCBwYXN0ZSBpdCBhdCBFT0YKLSBSZXdyaXRlICJMQU5HX0VOR0xJ
U0giIHRvICJMQU5HX0pBUEFORVNFIgotIFJld3JpdGUgIjA0MDkwNGIwIiB0byAiMDQxMTA0YjAi
Ci0gUmV3cml0ZSAiMHg0MDkiIHRvICIweDQxMSIKLSBUcmFuc2xhdGUgIldpcmVHdWFyZDogRmFz
dCwgTW9kZXJuLCBTZWN1cmUgVlBOIFR1bm5lbCIgaW50byBKYXBhbmVzZQoKSSBnb29nbGVkIGFu
ZCBmb3VuZCB0aGF0ICIweDQxMSIgbWVhbnMgIkphcGFuZXNlIi4KaHR0cHM6Ly9kb2NzLm1pY3Jv
c29mdC5jb20vZW4tdXMvd2luZG93cy93aW4zMi9tZW51cmMvdmVyc2lvbmluZm8tcmVzb3VyY2UK
CklzIHRoaXMgY29ycmVjdD8KClJlZ2FyZHMsCgoyMDIw5bm0MuaciDIz5pelKOaXpSkgMTk6MTkg
U2ltb24gUm96bWFuIDxzaW1vbkByb3ptYW4uc2k+Ogo+Cj4gSGkhCj4KPiAxLiBGb3Igc3RhcnRl
cnMsIEknbGwgbmVlZCB0aGUgdHJhbnNsYXRpb24gb2YgIldpcmVHdWFyZDogRmFzdCwgTW9kZXJu
LCBTZWN1cmUgVlBOIFR1bm5lbCIgc3RyaW5nLiBUaGlzIHN0cmluZyBpcyB3cml0dGVuIGludG8g
LmV4ZSByZXNvdXJjZXMgYW5kIGlzIGxvY2F0ZWQgc2VwYXJhdGVseSAoaW4gcmVzb3VyY2VzLnJj
KS4KPgo+IDIuIFRyYW5zbGF0ZSB0aGlzIGZpbGU6IGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJl
Z3VhcmQtd2luZG93cy90cmVlL2xvY2FsZXMvamEvbWVzc2FnZXMuZ290ZXh0Lmpzb24/aD1zci9s
MThuLiBGaWxsIHRoZSAidHJhbnNsYXRpb24iIHN0cmluZyBwcm9wZXJ0aWVzIHdpdGggSmFwYW5l
c2UgdGV4dC4gSmFwYW5lc2UgZG9lc24ndCBoYXZlIHBsdXJhbCwgcmlnaHQ/IElmIHlvdSBuZWVk
IHRvIHdvcmQgc29tZSB0cmFuc2xhdGlvbiBkaWZmZXJlbnRseSAoYmFzZWQgb24gYSBjYXJkaW5h
bCB2YXJpYWJsZSksIHlvdSBtYXkgZXh0ZW5kICJ0cmFuc2xhdGlvbiIgc3RyaW5nIHByb3BlcnR5
IGludG8gdG8gYSAic2VsZWN0IiBvYmplY3QuIFNlZSBodHRwczovL2dpdC56eDJjNC5jb20vd2ly
ZWd1YXJkLXdpbmRvd3MvdHJlZS9sb2NhbGVzL2VuL21lc3NhZ2VzLmdvdGV4dC5qc29uP2g9c3Iv
bDE4biBvciBodHRwczovL2dpdC56eDJjNC5jb20vd2lyZWd1YXJkLXdpbmRvd3MvdHJlZS9sb2Nh
bGVzL2ZyL21lc3NhZ2VzLmdvdGV4dC5qc29uP2g9c3IvbDE4biBmb3IgcGx1cmFsIGV4YW1wbGVz
IChzZWFyY2ggZm9yICJwbHVyYWwiKS4gKFllcywgd2UgYXJlIHVzaW5nIEVuZ2xpc2gtdG8tRW5n
bGlzaCB0cmFuc2xhdGlvbiB0byB0cmFuc2xhdGUgIntTZWNvbmRzfSBzZWNvbmQocykiIGludG8g
bmljZXIgdG8gcmVhZCAiMSBzZWNvbmQiLCAiMiBzZWNvbmRzIi4uLikKPgo+IDMuIERlbGl2ZXIg
dHJhbnNsYXRpb24gdG8gbWUgYW5kIEkgc2hhbGwgaGFuZGxlIGEgY29tbWl0IGluIHlvdXIgbmFt
ZS4gQmVmb3JlIHB1Ymxpc2hpbmcsIEkgd2lsbCBtYWtlIHNvbWUgc2NyZWVuc2hvdHMgaW4gSmFw
YW5lc2UsIGZvciB5b3UgdG8gY29uZmlybS4KPgo+IEJlc3QgcmVnYXJkcywKPiBTaW1vbgo+Cj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogRWlqaSBUYW5pb2thIDx0YW5p
b2thNDA0QGdtYWlsLmNvbT4KPiA+IFNlbnQ6IFN1bmRheSwgRmVicnVhcnkgMjMsIDIwMjAgOToz
NSBBTQo+ID4gVG86IFNpbW9uIFJvem1hbiA8c2ltb25Acm96bWFuLnNpPjsgd2lyZWd1YXJkQGxp
c3RzLnp4MmM0LmNvbQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gQWRkIGphcGFuZXNlIHRyYW5z
bGF0aW9uLgo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgcXVpY2sgcmVwbHkhCj4gPgo+ID4gSSByZWFk
IFJFQURNRS5tZC4KPiA+IEJ1dCBJIGRvbid0IGhhdmUgV2luZG93cyBlbnZpcm9ubWVudCBJIGNh
biB1c2UgZnJlZWx5LCBzbyBjb3VsZCB5b3UKPiA+IGdlbmVyYXRlIEphcGFuZXNlIG1lc3NhZ2Vz
Lmpzb24gZmlsZT8KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gMjAyMOW5tDLmnIgyM+aXpSjml6Up
IDE3OjIzIFNpbW9uIFJvem1hbiA8c2ltb25Acm96bWFuLnNpPjoKPiA+ID4KPiA+ID4gSGkhCj4g
PiA+Cj4gPiA+IFBsZWFzZSwgc2VlIHRoZSBzaW1wbGUgdHJhbnNsYXRpb24gaW5zdHJ1Y3Rpb25z
IGluIHRoZSBzci9sMThuIGJyYW5jaAo+ID4gUkVBRE1FLm1kIGZpbGUuCj4gPiA+Cj4gPiA+IElm
IHlvdSBkb24ndCBoYXZlIFdpbmRvd3MgYXQgeW91ciBkaXNwb3NhbCwgSSBjYW4gZ2VuZXJhdGUg
YW4gZW1wdHkKPiA+IEphcGFuZXNlIG1lc3NhZ2VzLmpzb24gZmlsZSBmb3IgeW91Lgo+ID4gPgo+
ID4gPiBCZXN0IHJlZ2FyZHMsCj4gPiA+IFNpbW9uCj4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+IEZyb206IEVpamkgVGFuaW9rYSA8dGFuaW9rYTQwNEBnbWFpbC5j
b20+Cj4gPiA+IFNlbnQ6IFN1bmRheSwgMjMgRmVicnVhcnkgMjAyMCAwODo0OQo+ID4gPiBUbzog
U2ltb24gUm96bWFuOyB3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tCj4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIEFkZCBqYXBhbmVzZSB0cmFuc2xhdGlvbi4KPiA+ID4KPiA+ID4gSGkgU2ltb24h
Cj4gPiA+Cj4gPiA+IEkgZmluaXNoZWQgd2lyZWd1YXJkLWFwcGxlIHRyYW5zbGF0aW9uIHRvIEph
cGFuZXNlLgo+ID4gPiBTbyBJIHdpbGwgc3RhcnQgdG8gdHJhbnNsYXRlIHdpcmVndWFyZC13aW5k
b3dzLgo+ID4gPgo+ID4gPiBIb3cgZG8gSSB3b3JrIG9uIGl0Pwo+ID4gPiBJIGd1ZXNzOgo+ID4g
PiAtIGNoZWNrb3V0IHNyL2kxOG4KPiA+ID4gLSBjcmVhdGUgbG9jYWxlcy9qYS9tZXNzYWdlcy5n
b3RleHQuanNvbgo+ID4gPiAtIHRyYW5zbGF0ZSAibWVzc2FnZSIgaW50byAidHJhbnNsYXRpb24i
IGZpZWxkCj4gPiA+IC0gc2VuZCBwYXRjaCB0byBNTAo+ID4gPgo+ID4gPiBJcyB0aGlzIGNvcnJl
Y3Q/Cj4gPiA+IFRoYW5rcywKPiA+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengy
YzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJk
Cg==
