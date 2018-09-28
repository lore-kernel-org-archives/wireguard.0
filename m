Return-Path: <SRS0=QupR=MK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA47BC43382
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Sep 2018 04:39:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74917216FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Sep 2018 04:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="paUVR9Et"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74917216FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24c4aa63;
	Fri, 28 Sep 2018 04:36:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6839e32
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 04:36:06 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6e11e0
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 04:36:05 +0000 (UTC)
Date: Fri, 28 Sep 2018 04:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1538109540;
 bh=stWioYDqF9QyxEnaU0GFmXq9NACBID70FXoFbQYVoPA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=paUVR9EtFG1ffZFHu+LwqS+nfxaFyxewN+l/HtR6cFNikmSFFY2HDqkAZKs2XS3NT
 8Xzv4fSWscd9hLlclx0TOmAIwmB/Bn2psQNVkGFRw1vIA475uX+ECkLSZYV3mRv0Qm
 S7eaS9WLL3TdcnapLxcOER+qbVwvuLXiH6GdAdPU=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Lane Russell <lanerussell@protonmail.com>
Subject: Re: Connection issues with Google Fi
Message-ID: <qKu5swioFkO6-GRUyzeclQ3H7fOed-Uf0Xd4QZRw0pwywVTaZZop9zTIGQ8EBAGGXhSJeTgu3_XSLYgFNaokCvVDSNdkvMr6Y6QiDHme-io=@protonmail.com>
In-Reply-To: <EHYEPfkFpkfKvezFkP0dpmtlpyl6SuHLqMvOWl8PMZhUJZxGjQTmfbL8YqhxxC4NsvFm7p4N6OFTmfURdPerP5quN0wgmhTSDSBgac-GvS0=@protonmail.com>
References: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
 <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
 <EHYEPfkFpkfKvezFkP0dpmtlpyl6SuHLqMvOWl8PMZhUJZxGjQTmfbL8YqhxxC4NsvFm7p4N6OFTmfURdPerP5quN0wgmhTSDSBgac-GvS0=@protonmail.com>
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

SW50ZXJlc3RpbmcsIG5vdyB0aGF0IEkgaGF2ZSBhIGJldHRlciBjaGFuY2UgdG8gbG9vayBhdCB0
aGlzLCBJIHNlZSB0aGF0IHRoZSBsb2dzIHNob3c6CgpGYWlsZWQgdG8gc2VuZCBkYXRhIHBhY2tl
dCB3cml0ZSB1ZHA2IFs6Ol06NDk4OTYtPlsyNjA3Ojc3MDA6MDo4Ojo0OGNhOjg2MGZdOjUxODIw
CgpUaGlzIGlzIGludGVyZXN0aW5nIGJlY2F1c2UgdGhlIEROUyBuYW1lIG15IGNsaWVudCBpbnRl
cmZhY2UgaXMgcG9pbnRlZCBhdCBkb2VzIG5vdCBoYXZlIGEgQUFBQSByZWNvcmQuCgoKU2VudCB3
aXRoIFByb3Rvbk1haWwgU2VjdXJlIEVtYWlsLgoK4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdp
bmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQCk9uIFRodXJzZGF5LCBTZXB0ZW1iZXIg
MjcsIDIwMTggMTI6MjMgUE0sIExhbmUgUnVzc2VsbCA8bGFuZXJ1c3NlbGxAcHJvdG9ubWFpbC5j
b20+IHdyb3RlOgoKPiBJIGJlbGlldmUgSSdtIHVzaW5nIHRoZSB1c2Vyc3BhY2UgaW1wbGVtZW50
YXRpb24uIEkgaGF2ZSBzdG9jayBBbmRyb2lkIG9uIG15IE5leHVzIDZQIGFuZCBpbnN0YWxsZWQg
dGhlIFdpcmVHdWFyZCBhcHAgZnJvbSBHb29nbGUgUGxheS4KPgo+IEkgYW0gYWJsZSB0byBjb25z
aXN0ZW50bHkgcmVwbGljYXRlIHRoZSBpc3N1ZSBieSBicmluZ2luZyB0aGUgV2lyZUd1YXJkIHR1
bm5lbCB1cCB3aGlsZSBjb25uZWN0ZWQgdG8gY2VsbHVsYXIgb25seSwgdGhlbiBjb25uZWN0aW5n
IHRvIFdpRmkuCj4KPiBMb2cgMTogQWZ0ZXIgYnJpbmdpbmcgdXAgdHVubmVsIG9uIGNlbGx1bGFy
LCB0aGVuIHJvYW1pbmcgdG8gV2lmaQo+IGh0dHBzOi8vczMuYW1hem9uYXdzLmNvbS9weXJhaGV4
LW1pc2MvbG9ncy93aXJlZ3VhcmQtbG9nXzFfY2VsbHVsYXIyd2lmaS50eHQKPgo+IExvZyAyOiBB
ZnRlciBjb25uZWN0aW5nIHRvIFdpRmksIEkgcmVzdGFydGVkIHRoZSBXaXJlR3VhcmQgdHVubmVs
Cj4gaHR0cHM6Ly9zMy5hbWF6b25hd3MuY29tL3B5cmFoZXgtbWlzYy9sb2dzL3dpcmVndWFyZC1s
b2dfMl9yZXN0YXJ0X3R1bm5lbC50eHQKPgo+IFNlbnQgd2l0aCBQcm90b25NYWlsIFNlY3VyZSBF
bWFpbC4KPgo+IOKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKA
kOKAkOKAkOKAkOKAkAo+IE9uIFRodXJzZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMTggMTA6NDggQU0s
IEphc29uIEEuIERvbmVuZmVsZCBKYXNvbkB6eDJjNC5jb20gd3JvdGU6Cj4KPiA+IEhpIExhbmUs
Cj4gPiBBcmUgeW91IHVzaW5nIHRoZSBrZXJuZWwgbW9kdWxlIG9yIHRoZSB1c2Vyc3BhY2UgaW1w
bGVtZW50YXRpb24/IENhbgo+ID4geW91IHNlbmQgYSBkZWJ1ZyBsb2c/Cj4gPiBKYXNvbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBt
YWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
