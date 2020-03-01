Return-Path: <SRS0=jj7n=4S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624BEC3F2D1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 07:01:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E0B20675
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 07:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ix1jkuq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E0B20675
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0c54b6c;
	Sun, 1 Mar 2020 06:56:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abfd7816
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 06:56:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd5431e6
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=BN1NMxfFbV15
 dYkPMYTaVQ7Dv6Q=; b=ix1jkuq887P0iNb8fEe0C2FzyDN57rIRHjETyftSd/FS
 3AtqC/34cLbBoa/banGUbY6e9E17OdgBrvbjTDRCIXFur0A5Hnp0y7ZH7ErIfUtl
 hkzEpcqPFykNQymHAExgWFhKC1YkkHbQhqQQVI31dw4wqjI2hmed/GxKdvb44Nmo
 Q7H7AF5Xf7kc5YxzMDaPEes8anRlDr/bePrmyH4y1dl1MgpP43lPNtfywC1AavDD
 wSM5f+kMm47KuZE1J16cLCN0vOv7yCNHRhqmpvzHnuwB6EnMdTDKXCKXB0D6Vgo1
 jdYopI5yaB3PYvG0b2Zuzhv26DMaVMdpBCzXA0oNQQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1be72d64
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 06:56:51 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id r4so5180107iln.0
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 23:00:59 -0800 (PST)
X-Gm-Message-State: APjAAAXPO8Tu1Rrwn/sZozORYW8vAQVR5xgoqzgvL7uSsOLXRx3TSTS0
 OdMomSx5FRgsD2jEFl6eWWrotr+JGRmwx206ir4=
X-Google-Smtp-Source: APXvYqyxAntTGSm3gj3Vuuu1IaGHeq2fFqks8dnJSvx+BbLdNVCkacqoIp1N1Fi2uOSlhdQUKy75DrDL8CHbBtyFDm4=
X-Received: by 2002:a92:d9c5:: with SMTP id n5mr7362210ilq.64.1583046058809;
 Sat, 29 Feb 2020 23:00:58 -0800 (PST)
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
 <CAA2ss9Edo9OyoJTHq0H9-AvG2ghGb60L8Z4jKoEWP5GtdF26wg@mail.gmail.com>
In-Reply-To: <CAA2ss9Edo9OyoJTHq0H9-AvG2ghGb60L8Z4jKoEWP5GtdF26wg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 1 Mar 2020 15:00:45 +0800
X-Gmail-Original-Message-ID: <CAHmME9pwpOdxNmY18uYPUw2uosEn=Wb6nr4KH2hriQXLa3aRLA@mail.gmail.com>
Message-ID: <CAHmME9pwpOdxNmY18uYPUw2uosEn=Wb6nr4KH2hriQXLa3aRLA@mail.gmail.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Vasili Pupkin <diggest@gmail.com>
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

MjAyMOW5tDLmnIgyOeaXpSjlnJ8pIDIxOjU1IFZhc2lsaSBQdXBraW4gPGRpZ2dlc3RAZ21haWwu
Y29tPjoKPiBOby4gSSd2ZSBqdXN0IHNlbnQgaXQgdG8gU2FtdWVsIEhvbGxhbmQgdG8gaGlzIGVt
YWlsIG9ubHkuIEl0J3Mgbm90IGEKPiBnaXQgcGF0Y2gsIGp1c3QgYSBzaW1wbGUgZGlmZiBwYXRj
aCB0byB0aGUgcnVzc2lhbiBsYW5ndWFnZSBzdHJpbmdzLAo+IHdpdGhvdXQgdGhlIGF1dGhvcnNo
aXAuCgpQbGVhc2Uga2VlcCB5b3VyIHJlcGxpZXMgYW5kIHBhdGNoZXMgb24gdGhlIG1haWxpbmcg
bGlzdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2ly
ZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlz
dHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
