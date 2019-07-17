Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C897CC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 17:33:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C7F21743
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 17:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="DKxxIkH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C7F21743
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543649d8;
	Wed, 17 Jul 2019 17:32:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c944b37d
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 17:32:55 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c47cda1a
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 17:32:54 +0000 (UTC)
Date: Wed, 17 Jul 2019 17:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1563384773;
 bh=jrBDfScA7PQN9puUpLV3Bkz15fOuecx/Z+bXwy6cXBk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=DKxxIkH5Ey0f7rVAr0epKQ0hv1OHjjWZo6ZaWLZiziOhs/TPLcQ8pxmOud0dxHqMr
 rIEe8N6CAlZaBwA5sC+Q0RHb2SVyAOEPvCitUxEAbh0RlYewXulz6P6xZzXMGG5y8b
 xUrTGKZtKxFDVIUyUS19F9OAg7EAKDx8Xhsfvp6Q=
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [PATCH] treewide: more portable bash shebangs
Message-ID: <EELepAK6aanjfQM-_vvGuS0aAwISwGlhv5Gq2DPFexSRvZ7mFpTMbe4-hNPhtBxkRVmSJPHpojmb6KeRgRIv9sbEwajUSwnfYVkawwMc9DU=@protonmail.ch>
In-Reply-To: <c58e3e33-bf95-1154-bfe2-7b87e4e730c7@higgsboson.tk>
References: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
 <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
 <c58e3e33-bf95-1154-bfe2-7b87e4e730c7@higgsboson.tk>
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

T24gVHVlc2RheSwgSnVseSAxNiwgMjAxOSAxMDowOCBQTSwgSsO2cmcgVGhhbGhlaW0gPGpvZXJn
QGhpZ2dzYm9zb24udGs+IHdyb3RlOgoKPiBPbiAxNi8wNy8yMDE5IDE4LjMyLCBKb3JkYW4gR2xv
dmVyIHdyb3RlOgo+Cj4gPiBPbiBUdWVzZGF5LCBKdWx5IDE2LCAyMDE5IDEyOjIxIFBNLCBKw7Zy
ZyBUaGFsaGVpbSBqb2VyZ0BoaWdnc2Jvc29uLnRrIHdyb3RlOgo+ID4KPiA+ID4gV2hpbGUgL3Vz
ci9iaW4vZW52IGlzIG1vcmUgb3IgbGVzcyBhdmFpbGFibGUgb24gYWxsIFBPU0lYIHN5c3RlbXMK
PiA+ID4gL2Jpbi9iYXNoIG1pZ2h0IG5vdCBiZS4gVGhpcyBpcyBwYXJ0aWN1bGFyIHRoZSBjYXNl
IG9uIE5peE9TIGFuZCB0aGUgQlNECj4gPiA+IGZhbWlseSAoL3Vzci9sb2NhbC9iaW4vYmFzaCku
IERvd25zdHJlYW0gcGFja2FnZXJzIHdvdWxkIG9mdGVuIHJld3JpdGUKPiA+ID4gdGhvc2Ugc2hl
YmFuZ3MgYmFjayBhdXRvbWF0aWNhbGx5IGFzIHRoZXkgY2FuIHJlbHkgb24gYWJzb2x1dGUgcGF0
aHMKPiA+ID4gYnV0IGhhdmluZyBwb3J0YWJsZSBzaGViYW5ncyBpbiB0aGUgcmVwb3NpdG9yeSBo
ZWxwcyB0byBydW4gdGhlIGNvZGUKPiA+ID4gd2l0aG91dCBhbnkgZnVydGhlciBtb2RpZmljYXRp
b24uCj4gPgo+ID4gVGhlIHJlYXNvbiBhbG1vc3QgZXZlcnlvbmUgaGFyZGNvZGVzIGJhc2ggdG8g
L2Jpbi9iYXNoIGlzIHRoZSBwb3RlbnRpYWwKPiA+IGVudmlyb25tZW50IGF0dGFjayB3aGVyZSBz
b21lb25lIGNyZWF0ZSBtYWxpY2lvdXMgImJhc2giIGFuZCBleHBvcnQgaXQgaW4gUEFUSDoKPiA+
IGh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9saWJyYXJ5L2FyY2hpdmUvZG9jdW1lbnRhdGlv
bi9PcGVuU291cmNlL0NvbmNlcHR1YWwvU2hlbGxTY3JpcHRpbmcvU2hlbGxTY3JpcHRTZWN1cml0
eS9TaGVsbFNjcmlwdFNlY3VyaXR5Lmh0bWwKPiA+IE9idmlvdXNseSB3ZyBzY3JpcHRzIGFyZSBo
YW5kbGluZyBxdWl0ZSBzZW5zaXRpdmUgZGF0YSBsaWtlIHByaXZhdGUga2V5cy4uLgo+ID4gU2Vy
aW91c2x5IGlmIHlvdSBleGNlcHQgdGhhdCBkb3duc3RyZWFtIHBhY2thZ2VycyB3b3VsZCByZXdy
aXRlIGl0IGJhY2sgdG8KPiA+IC9iaW4vYmFzaCB0aGVuIHdoeSB0aGUgb3RoZXJzIGNhbid0IHJl
d3JpdGUgaXQgdG8gL3Vzci9iaW4vZW52IGJhc2ggcmlnaHQKPiA+IG5vdyBpZiB0aGlzIGlzIHNv
bWV0aGluZyB0aGV5IHdhbnQ/Cj4gPiBKb3JkYW4KPgo+IFRoaXMgYXJndW1lbnQgZG9lcyBub3Qg
YXBwbHkgaGVyZSBzaW5jZSBhbGwgY29tbWFuZHMgaW50ZXJuYWxseSBjb3VsZAo+IGJlIHJlZGly
ZWN0ZWQgYnkgYSBQQVRIIGNoYW5nZSBhcyB3ZWxsIHNpbmNlIHRoZSBQQVRIIGlzIG5vdCBzZXQg
aW4gdGhlIHNjcmlwdHMuCgpZZXAsIHRoYXQncyBzb21ldGhpbmcgdG8gYWN0dWFsbHkgZml4IGFz
IHlvdSB3b24ndCBmaXggdGhpbmdzIGJ5IG1ha2luZyBpdCB3b3JzZS4KCj4gSSBhbSBhbHNvIG5v
dCBxdWl0ZSBzdXJlIHdoYXQgdGhyZWF0IG1vZGVsIGhlcmUgaXM/Cj4gVGhlIHNjcmlwdHMgY2hh
bmdlZCBoZXJlIGFyZSBub3QgZGVzaWduZWQgdG8gcnVuIGZyb20gYSBDR0kgY29udGV4dAo+IGFu
ZCBhcmUgbm90IGhhcmRlbmVkIGZvciB0aGF0IHB1cnBvc2UuCj4gVGhlIGlkZWEgaXMgdGhhdCB5
b3UgY2FuIHJ1biB0aGUgc2NyaXB0cyB1bm1vZGlmaWVkIGZyb20gdGhlIHJlcG9zaXRvcnkKPiB3
aXRob3V0IGhhdmluZyB0byBhbHRlciB0aGUgZmlsZXMsIHdoaWNoIGlzIGNvbnZlbmllbnQgZm9y
IGRldmVsb3BtZW50IHcuci50IHRvIGdpdC4KClRoZW4gc2ltcGx5IHJ1biAiYmFzaCA8c2NyaXB0
LnNoPiIgYW5kIGNhbGwgaXQgYSBkYXkuCgpKb3JkYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
