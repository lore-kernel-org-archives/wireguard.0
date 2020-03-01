Return-Path: <SRS0=jj7n=4S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9E7C3F2CE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 06:54:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25BB2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 06:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNpNprS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A25BB2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4a1e690;
	Sun, 1 Mar 2020 06:50:03 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60b887de
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 06:50:00 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id h5so3625911vsc.4
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 22:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PwusBvPxMFyMmCO6qU4zvTmwjbqunwKAM43ampOKsnY=;
 b=dNpNprS+LWF8IFklItJM7NYeA9F8P6QZIocGpATaaawGP86ox6FbPovZsY/2IcPfAw
 oLUh6zqk8lGWhs+OwgXRjlp/4SdqpEDrP0QNNhrmdb1yZjAzZFOB6QVkiMZ3JRYfiI7E
 oye3EKaXEVd94cpQbNOMtreTlsSbCARoVJ0ORR6Vw2VuhhhMQJTGurIotRu2ovv6iPVa
 ZfflQPcA96bL6I0rz94r1eR0ko4h1G0IWf7HPs5Zj/WTOZx+oqXIzZGBwomNT8N3BSUd
 W3SDKEbTCGcom5wTcfEXYLM/irWqidJ7R27DzfCa8kuNW/sJtoIfVb3R8Ixtm3j6o956
 xX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PwusBvPxMFyMmCO6qU4zvTmwjbqunwKAM43ampOKsnY=;
 b=mcdo8oYUiOGeT9xKmwzCpTw0j+LKDYhQVWWs0CFkR4rGCdfgqXxLLAvT2xbLsgbRa6
 iAeUzXfdm7hGNyckLj4FQp09XNlmh3FYZA8gXIpTzEokaIKE5KYYQ/gNlzdTY0qLlfGE
 ZY4Vv2m0TB8cQsQbgnvcmk/BQpYpvOTBNbAU1dkoW5OFj6h3sXJ0RzSKozKTwDbPjy75
 mFPlNylFDobHCdStjNWqr11OTWuxexJRL7d1wzuGh0Abam0fR3/P5WpeNVmOPU3M33tf
 j/wV5I2HjWUsrXGjxz0E3DSz/cU/hfAWoNUp4BIGiW3JHaget9UnqovBssIdTDDAt9Xq
 L69w==
X-Gm-Message-State: ANhLgQ0OR79AxU3uqfIxtOXUIOF3MsIpMkBw3QWZlm0DcKjibuY0Gpmv
 vOK3XtWC6oIsTHFYwJyI+C/bFgLjoZWv/3b0Kl8=
X-Google-Smtp-Source: ADFU+vsHCYYy0uWQ/Mq6jCiXlUCnrsU0rdXWtBB61PTssQfy8szUdhFKaMX+OhOUjCDxQ4pVxO0GmWG+hzjxZEY9BXc=
X-Received: by 2002:a05:6102:a01:: with SMTP id
 t1mr291037vsa.102.1583045648187; 
 Sat, 29 Feb 2020 22:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
 <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
 <bc47c4f7-4aa4-fc6e-8f3c-34366c756236@sholland.org>
 <3bce7f79-88df-8035-6eb9-1e19e51c01a5@gmail.com>
 <CAA2ss9HbDro5vgS0W8_cTQUetLFzjUCqXO1CHmsHprM7_Q+mXA@mail.gmail.com>
 <5428f486-49cd-0321-de5b-9ef6ca3e8dad@gmail.com>
In-Reply-To: <5428f486-49cd-0321-de5b-9ef6ca3e8dad@gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 1 Mar 2020 15:53:57 +0900
Message-ID: <CAA2ss9Edo9OyoJTHq0H9-AvG2ghGb60L8Z4jKoEWP5GtdF26wg@mail.gmail.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Vasili Pupkin <diggest@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

V2h5IGRvbid0IHlvdSB1c2UgYGdpdCBmb3JtYXQtcGF0Y2hgLCBgZ2l0IHNlbmQtZW1haWxgIGFu
ZCBzZW5kIHRvIE1MPwoKSW4gIlNvdXJjZSBDb2RlIFJlcG9zaXRvcmllcyBhbmQgT2ZmaWNpYWwg
UHJvamVjdHMiIHBhZ2UgKApodHRwczovL3d3dy53aXJlZ3VhcmQuY29tL3JlcG9zaXRvcmllcy8g
KSwgd2lyZWd1YXJkLWFuZHJvaWQgcmVxdWlyZXMKYGdpdCBzZW5kLWVtYWlsYCBhbmQgc2VuZCB0
byBNTC4KQW5kIFNhbXVlbCBIb2xsYW5kIGlzIG5vdCB0aGUgb25seSBjb21taXR0ZXIgb2Ygd2ly
ZWd1YXJkLWFuZHJvaWQsCm90aGVyIGNvbW1pdHRlciBpbiBNTCBjYW4gcmV2aWV3IHlvdXIgcGF0
Y2ggYW5kIGFwcGx5IHNvdXJjZSB0cmVlLgoKSWYgeW91IHVzZSByZXF1aXJlZCBmb3JtYXQsIHlv
dXIgcGF0Y2ggd2lsbCBhY2NlcHQgbW9yZSBxdWlja2x5LCBJIHRoaW5rLgoKQmVzIFJlZ2FyZHMs
CkVpamkgVGFuaW9rYQoKMjAyMOW5tDLmnIgyOeaXpSjlnJ8pIDIxOjU1IFZhc2lsaSBQdXBraW4g
PGRpZ2dlc3RAZ21haWwuY29tPjoKPgo+IE9uIDI5LjAyLjIwMjAgMTE6MzUsIEVpamkgVGFuaW9r
YSB3cm90ZToKPiA+IEhpIFZhc2lsaSEKPiA+Cj4gPiBEaWQgeW91IHNlbmQgcGF0Y2ggdG8gTUw/
Cj4gPiBJZiBzbywgSSB0aGluayB0aGF0IHlvdXIgcGF0Y2ggaXMgaW4gdGhlIG1vZGVyYXRpb24g
cXVldWUuIEkgaGFkIG1ldAo+ID4gc2FtZSBzaXR1YXRpb24gd2hlbiBzZW5kaW5nIG15IHBhdGNo
IGJlY2F1c2Ugb2YgYm9keSBzaXplIChvdmVyIDQwCj4gPiBLQikuCj4gPgo+ID4gSSB0aGluayBp
dCdzIG9rYXkgaWYgeW91IHdhaXQuCj4KPiBOby4gSSd2ZSBqdXN0IHNlbnQgaXQgdG8gU2FtdWVs
IEhvbGxhbmQgdG8gaGlzIGVtYWlsIG9ubHkuIEl0J3Mgbm90IGEKPiBnaXQgcGF0Y2gsIGp1c3Qg
YSBzaW1wbGUgZGlmZiBwYXRjaCB0byB0aGUgcnVzc2lhbiBsYW5ndWFnZSBzdHJpbmdzLAo+IHdp
dGhvdXQgdGhlIGF1dGhvcnNoaXAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0
LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
