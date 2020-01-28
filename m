Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D7FC33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:49:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEDAA2467E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAecP73w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEDAA2467E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8134e871;
	Tue, 28 Jan 2020 10:49:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3691d2bd
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:49:31 +0000 (UTC)
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81673045
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:49:31 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 66so11527143otd.9
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 02:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lxRY4oEKnE8ma/nTL2VrGDU1itr21LejS/2bkXxhGE8=;
 b=DAecP73wMic9GrgRvlJ55Wc8qab9z54q2RkWlP46Zl5fSS/rTiAS9kEc8yb3b4ztnn
 32EOAJPm3tbmzH/Fcnle4uTavZrIQZ5Jf+w9ZYaPN/ZkOtR4DHvAjy3Z164LT9k7PvB3
 bkU+lnvgLtbW7sTjys9Xh6lwoRRrJCda5CucOZQRDIq0V+ttKtvK2pDULdkKJRWokGJd
 wJwZ65xVg0qUvYq+GdsR+7MTZw0+AAUz/IDYzUvWhSw3qhyR/nJyytdz6iJPnMsdbeI7
 sGRdPlTRxJhGblL6eKNNZ/co0WAw8PLHMNtG8BtKd8U+/qccIjPBwfz0vNURFa1jaVtI
 xyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lxRY4oEKnE8ma/nTL2VrGDU1itr21LejS/2bkXxhGE8=;
 b=OftHsIZtQ7/iWngrGeFinBB6O72U8bWCNfPZ0AFz/xlMegmiH4YN/b2e41PJq0D5qe
 wDoEFNf/45c3ElcXRe74TLdnSPATFaM1XsRGcOSAB2oPyc6sJyho0nnCil19UttiXk/h
 zEx2YvopzfQ/Wj9ESoBvmNBCx2ZsGhJlCs9dLkzeixp+m80bNMtMXs5SlOVYIKafkacR
 +POTnDqTFn8LgikBl4E8K/vCHPfeuc4wM1epsWsMnrUX37oNP2CsLWXsLVsOQQmcgIAk
 qm3H0OzOrNcHfdY1bOYoyco82jI/pgia8kORsw6EhU1joBJUVLMLo8vAWF+cG9QfShn3
 suJg==
X-Gm-Message-State: APjAAAXDJAdt+vWSYrEoFUoy3lLwv39aHevW3ZalfREdGXxl/G8rbSQS
 tQLKv+0VybwHWUq0DORsvjpcFMMsNwlGrLFDiXAU3KM9
X-Google-Smtp-Source: APXvYqzW91+Y6e8bLBzlJgVhhkQ7Cd9DdWDviqMQahD6H2ICenpfsQqlzx6sOLH9zS6IqRBqIogXrGdx5Ns1Sbzl9TE=
X-Received: by 2002:a9d:6183:: with SMTP id g3mr15699123otk.304.1580208570888; 
 Tue, 28 Jan 2020 02:49:30 -0800 (PST)
MIME-Version: 1.0
References: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
 <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
In-Reply-To: <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
From: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date: Tue, 28 Jan 2020 12:49:19 +0200
Message-ID: <CAPWNY8W4oXesE53MMDNZC092xN8nK9iyKV-pcNpvMxcH1y4LuQ@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: Linux and FreeBSD: Add support to search domain
 in wg-quick
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

VGhhdCBtaWdodCBiZSB0cnVlLCBidXQgSU1ITyB0aGUgbGlzdCBvZiBzZWFyY2ggZG9tYWlucyBk
b2Vzbid0IGZhbGwKdW5kZXIgInNwZWNpYWxpemVkIG9wdGlvbnMiIOKAkyBpdCBpcyBldmVuIGRl
cGxveWVkIHZpYSBESENQIGFuZCBzaW1pbGFyCm1lY2hhbmlzbXMgYWxtb3N0IGFzIGNvbW1vbmx5
IGFzIHRoZSBsaXN0IG9mIEROUyByZXNvbHZlcnMgdGhlbXNlbHZlcywKc28gaWYgYSBWUE4gY2xp
ZW50IHN1cHBvcnRzIHRoZSBsYXR0ZXIgdGhlbiBpdCBtYWtlcyBzZW5zZSB0byBzdXBwb3J0CmJv
dGguCgoKT24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTI6MzcgUE0gSmFzb24gQS4gRG9uZW5mZWxk
IDxKYXNvbkB6eDJjNC5jb20+IHdyb3RlOgo+Cj4gSSdtIG5vdCBzbyBzdXJlIHRoYXQgd2Ugd2Fu
dCB0byBmaWxsIHdnLXF1aWNrKDgpIHVwIHdpdGggZXZlcnkgZG5zCj4gbm9iLi4uIElmIHlvdSBo
YXZlIHNwZWNpYWxpemVkIG5ldHdvcmtpbmcgcmVxdWlyZW1lbnRzLCB3Zy1xdWljayg4KSBpcwo+
IHByb2JhYmx5IG5vdCBmb3IgeW91IGFueXdheS4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPiBXaXJlR3Vh
cmRAbGlzdHMuengyYzQuY29tCj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQKCgoKLS0gCk1hbnRhcyBNaWt1bMSXbmFzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2ly
ZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3dpcmVndWFyZAo=
