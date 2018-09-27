Return-Path: <SRS0=TKOU=MJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D733BC43382
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Sep 2018 14:58:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EC621582
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Sep 2018 14:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D8vdkeU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7EC621582
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f26b003e;
	Thu, 27 Sep 2018 14:55:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9affb4cf
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 14:55:23 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06af7561
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 14:55:22 +0000 (UTC)
Date: Thu, 27 Sep 2018 14:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1538060293;
 bh=CQfwSwoRUZ56VFI6U6VjRXYMcSLqzDsj6oiIIKfr0+A=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=D8vdkeU07iil35vO2zwX5hiv2Z4jpoHAb6svYvUIPC6kRaSW1x+XgQaiGGe3LDYqv
 TlFFVwob5LyTOtA/shWcc84pYPtk9aTz3eDzGywCGWF0UshZfzban7PO6MI4Hk9ziX
 o9GG8iq9RZseV/5YVLuZ/9F8wIA3QWr9xit5TCp4=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Lane Russell <lanerussell@protonmail.com>
Subject: Connection issues with Google Fi
Message-ID: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
Feedback-ID: jhVgiX6_q-2hbdKQuEXcQXOKG_NeIdN6tYuPxgmVVFfYrZt1KrXoO6kRAhv_E12tTMk04CLY8AR2Ll0xF8yi-Q==:Ext:ProtonMail
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============7017825188079908328=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============7017825188079908328==
Content-Type: multipart/alternative;
	boundary="b1_95edf32b256c334bec6b3c87ba40b7b4"

This is a multi-part message in MIME format.

--b1_95edf32b256c334bec6b3c87ba40b7b4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

VXNpbmcgYSBOZXh1cyA2UCBvbiBHb29nbGUgRmksIEknbSBub3RpY2luZyB0aGF0IHdoZW4gcm9h
bWluZyBiZXR3ZWVuIGNlbGx1bGFyIGFuZCBXaUZpLCBJIG9jY2FzaW9uYWxseSBsb3NlIHRoZSBh
YmlsaXR5IHRvIHVzZSBXaXJlR3VhcmQuIENvbWluZyBmcm9tIFZlcml6b24sIEkgZGlkbid0IHBy
ZXZpb3VzbHkgaGF2ZSB0aGlzIGlzc3VlLgoKSSBjYW4gb25seSBhc3N1bWUgdGhpcyBoYXMgc29t
ZXRoaW5nIHRvIGRvIHdpdGggRmkgbWFuaXB1bGF0aW5nIHRoZSByb3V0aW5nIHRhYmxlIGluIHN1
Y2ggYSB3YXkgdGhhdCBicmVha3MgV2lyZUd1YXJkIGNvbm5lY3Rpdml0eS4gSSB2ZXJpZmllZCB0
aGF0IFdpRmkgQXNzaXRhbnQgaXMgZGlzYWJsZWQuIEEgc2ltcGxlIHR1bm5lbC11cCwgdHVubmVs
LWRvd24gZG9lc24ndCBzZWVtIHRvIGZpeCB0aGUgaXNzdWUuIFJlYm9vdGluZyBmaXhlcyB0aGUg
aXNzdWUuCgpOZXh0IHRpbWUgdGhlIGlzc3VlIG9jY3VycywgSSBjYW4gZHVtcCB0aGUgaXAgcnVs
ZSBsaXN0LCBidXQgbWF5IG5lZWQgc29tZSBhc3Npc3RhbmNlIGZpZ3VyaW5nIG91dCB3aGljaCBp
cCB0YWJsZXMgdG8gcHVsbC4gSXMgdGhpcyB0aGUgaW5mbyB0aGF0IHdpbGwgYmUgbmVlZGVkIHRv
IHRyb3VibGVzaG9vdD8=


--b1_95edf32b256c334bec6b3c87ba40b7b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5Vc2luZyBhIE5leHVzIDZQIG9uIEdvb2dsZSBGaSwgSSdtIG5vdGljaW5nIHRoYXQgd2hl
biByb2FtaW5nIGJldHdlZW4gY2VsbHVsYXIgYW5kIFdpRmksIEkgb2NjYXNpb25hbGx5IGxvc2Ug
dGhlIGFiaWxpdHkgdG8gdXNlIFdpcmVHdWFyZC4gQ29taW5nIGZyb20gVmVyaXpvbiwgSSBkaWRu
J3QgcHJldmlvdXNseSBoYXZlIHRoaXMgaXNzdWUuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSBjYW4gb25seSBhc3N1bWUgdGhpcyBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggRmkgbWFu
aXB1bGF0aW5nIHRoZSByb3V0aW5nIHRhYmxlIGluIHN1Y2ggYSB3YXkgdGhhdCBicmVha3MgV2ly
ZUd1YXJkIGNvbm5lY3Rpdml0eS4gSSB2ZXJpZmllZCB0aGF0IFdpRmkgQXNzaXRhbnQgaXMgZGlz
YWJsZWQuIEEgc2ltcGxlIHR1bm5lbC11cCwgdHVubmVsLWRvd24gZG9lc24ndCBzZWVtIHRvIGZp
eCB0aGUgaXNzdWUuIFJlYm9vdGluZyBmaXhlcyB0aGUgaXNzdWUuPGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+TmV4dCB0aW1lIHRoZSBpc3N1ZSBvY2N1cnMsIEkgY2FuIGR1bXAgdGhlIGlw
IHJ1bGUgbGlzdCwgYnV0IG1heSBuZWVkIHNvbWUgYXNzaXN0YW5jZSBmaWd1cmluZyBvdXQgd2hp
Y2ggaXAgdGFibGVzIHRvIHB1bGwuIElzIHRoaXMgdGhlIGluZm8gdGhhdCB3aWxsIGJlIG5lZWRl
ZCB0byB0cm91Ymxlc2hvb3Q/PGJyPjwvZGl2Pg==



--b1_95edf32b256c334bec6b3c87ba40b7b4--


--===============7017825188079908328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7017825188079908328==--

