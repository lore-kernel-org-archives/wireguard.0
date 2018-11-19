Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A81FC43610
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 15:11:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7492086A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 15:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="zB8wzRTx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7492086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ded4f4d4;
	Mon, 19 Nov 2018 15:05:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8b20f63
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 14:59:01 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 681c2747
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 14:59:00 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id p82-v6so25466490oih.11
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 07:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qA8RNiUGFZycMA+2o5KwhvK8pdeGAY343CP9/QerVjU=;
 b=zB8wzRTx7Gv5wU4C3VCcAmyYcbkZ0NlbrZ4RyJXV9xJ9qXK8jP4fwUaeNfewbsPlz0
 Wqx5cbHPUXZBGHtPvuvr1ooU83bndmHciwcGv9qC1Qfl3dxm1B2nsV/zhyO04kPlK+vR
 agGIMbDRItmTSEd8K+X9EqnBjoTcL9rvLscPqFKfWM66HN1yRDPAt6UxUUgBDFrttJCQ
 VR4/udjkQqb/e3P7L7EQOn8T2V5Pk0Kw5Y9Vq8PigG/ND6vE1ENV+6eBrzjNVQC6X294
 lQ37OODXg8kFxTRPOJtuoHs8DeuKY9CZrzVcVAqTocbvoI4Qoir8vtpNNHvFqUPP6jQB
 v1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qA8RNiUGFZycMA+2o5KwhvK8pdeGAY343CP9/QerVjU=;
 b=jA2A6zPsnYzfnPJF/pKjGG2g0eNws70gYS550s+8ClOSqUBkxBOOuaYtvooARUhT1W
 XTVfqEl/Qxf5bXHk9u17g9BYrKUFUp5LRnQjzkRXu9eJ6nQBXEhOQtTKAptlB0fdoWQA
 wm/Qp4cgGnL9AAisTPNmnDr4zH1JVa4AXonsAk5XCcNtem0Wb1e8KiQ5QfyFMMXe7ByQ
 7qW/wltuBFyqXTC8jm6+rFN0i2YgmVsihd2IWydWpM9jdOgRueilyJMY6hXj6DzKt9iw
 sXqR4/5/kkuEz26tUPLA72a8mbRmg0Epqk63C9T+Wmp90e7WmjueEm52BJT0XGP7NpNF
 w7yg==
X-Gm-Message-State: AGRZ1gLdJToNnH9lyACIhwC+S/Ilzqx+Ux+uVmbRPCCXJiv5BPb44m7f
 P7rbnVWgAuXq8yyX8jCnDPZL9Cj0dWKDkJFs8s5+qs/y
X-Google-Smtp-Source: AJdET5eIusmJZJ0A+G2rzjSSN1LcY6HI4tqrE2l3Xy1+kP2Ygbn2IWDJDYvZiY8x15N9bdZv1KlR4ydEuym9d59Y5qQ=
X-Received: by 2002:aca:ec55:: with SMTP id k82mr6460895oih.55.1542639899444; 
 Mon, 19 Nov 2018 07:04:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4a:2f0d:0:0:0:0:0 with HTTP; Mon, 19 Nov 2018 07:04:58
 -0800 (PST)
In-Reply-To: <41797799-8633-d195-54cb-ca3f38fbd371@t0x0sh.org>
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
 <41797799-8633-d195-54cb-ca3f38fbd371@t0x0sh.org>
From: John <graysky@archlinux.us>
Date: Mon, 19 Nov 2018 10:04:58 -0500
Message-ID: <CAO_nJAb5zoW+YRtt4BvB9YJzBm9w3DmXnuyGZ=362E3G7ofcQA@mail.gmail.com>
Subject: Re: Problem to load wireguard LKM in Archlinux
To: Tosh <tosh@t0x0sh.org>
X-Mailman-Approved-At: Mon, 19 Nov 2018 16:05:15 +0100
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
Content-Type: multipart/mixed; boundary="===============8289337772222292139=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8289337772222292139==
Content-Type: multipart/alternative; boundary="000000000000392688057b05d7ef"

--000000000000392688057b05d7ef
Content-Type: text/plain; charset="UTF-8"

Are you certain that the dkms rebuild was triggered?  Seems like like it
was not.  Perhaps manually trigger it and reboot.

On Monday, November 19, 2018, Tosh <tosh@t0x0sh.org> wrote:

> Hello,
>
> I'm using Wireguard on ArchLinux since a long time, and today I have
> some troubles to start my VPN. Here is the log of dmeg when I try to
> 'modprobe wireguard' :
>
> wireguard: Unknown symbol poly1305_blocks_avx (err
> -2)
> wireguard: Unknown symbol poly1305_emit_avx (err
> -2)
> wireguard: Unknown symbol poly1305_blocks_avx512 (err
> -2)
> wireguard: Unknown symbol chacha20_avx512vl (err
> -2)
> wireguard: Unknown symbol chacha20_avx2 (err -2)
> wireguard: Unknown symbol poly1305_blocks_avx2 (err
> -2)
> wireguard: Unknown symbol chacha20_avx512 (err -2)
>
> I did a MAJ of my system yesterday, but wireguard wasn't upgraded, so I
> don't know where the problem come from...Seems a LKM related to crypto
> is missing, but I don't know which one is.
>
> My kernel is 4.19.2-arch1-1-ARCH, and my wireguard packages are :
>
> - community/wireguard-dkms 0.0.20181115-1
>
> - community/wireguard-tools 0.0.20181115-1
>
> Thanks for your work,
>
> --
> -TOSH-
>
> If you need privacy you can encrypt your mails with my GPG key:
> 9B79 7754 00E2 23C7 FC90  E5C6 E5D9 1B2F 0BD5 3C6A
>
>

-- 
Sent from Gmail Mobile

--000000000000392688057b05d7ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

QXJlIHlvdSBjZXJ0YWluIHRoYXQgdGhlIGRrbXMgcmVidWlsZCB3YXMgdHJpZ2dlcmVkP8KgIFNl
ZW1zIGxpa2UgbGlrZSBpdCB3YXMgbm90LsKgIFBlcmhhcHMgbWFudWFsbHkgdHJpZ2dlciBpdCBh
bmQgcmVib290Ljxicj48YnI+T24gTW9uZGF5LCBOb3ZlbWJlciAxOSwgMjAxOCwgVG9zaCAmbHQ7
PGEgaHJlZj0ibWFpbHRvOnRvc2hAdDB4MHNoLm9yZyI+dG9zaEB0MHgwc2gub3JnPC9hPiZndDsg
d3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
IDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkhl
bGxvLDxicj4NCjxicj4NCkkmIzM5O20gdXNpbmcgV2lyZWd1YXJkIG9uIEFyY2hMaW51eCBzaW5j
ZSBhIGxvbmcgdGltZSwgYW5kIHRvZGF5IEkgaGF2ZTxicj4NCnNvbWUgdHJvdWJsZXMgdG8gc3Rh
cnQgbXkgVlBOLiBIZXJlIGlzIHRoZSBsb2cgb2YgZG1lZyB3aGVuIEkgdHJ5IHRvPGJyPg0KJiMz
OTttb2Rwcm9iZSB3aXJlZ3VhcmQmIzM5OyA6PGJyPg0KPGJyPg0Kd2lyZWd1YXJkOiBVbmtub3du
IHN5bWJvbCBwb2x5MTMwNV9ibG9ja3NfYXZ4IChlcnI8YnI+DQotMinCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA8d2JyPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+wqDCoMKg
wqDCoMKgPGJyPg0Kd2lyZWd1YXJkOiBVbmtub3duIHN5bWJvbCBwb2x5MTMwNV9lbWl0X2F2eCAo
ZXJyPGJyPg0KLTIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgPHdicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqA8d2JyPsKgwqDCoMKgwqDCoMKgwqA8YnI+DQp3aXJlZ3VhcmQ6IFVu
a25vd24gc3ltYm9sIHBvbHkxMzA1X2Jsb2Nrc19hdng1MTIgKGVycjxicj4NCi0yKcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPHdi
cj7CoMKgwqA8YnI+DQp3aXJlZ3VhcmQ6IFVua25vd24gc3ltYm9sIGNoYWNoYTIwX2F2eDUxMnZs
IChlcnI8YnI+DQotMinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqA8d2JyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+wqDCoMKgwqDCoMKgwqDCoDxicj4NCndpcmVndWFyZDog
VW5rbm93biBzeW1ib2wgY2hhY2hhMjBfYXZ4MiAoZXJyIC0yKTxicj4NCndpcmVndWFyZDogVW5r
bm93biBzeW1ib2wgcG9seTEzMDVfYmxvY2tzX2F2eDIgKGVycjxicj4NCi0yKcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPHdicj7C
oMKgwqDCoMKgPGJyPg0Kd2lyZWd1YXJkOiBVbmtub3duIHN5bWJvbCBjaGFjaGEyMF9hdng1MTIg
KGVyciAtMik8YnI+DQo8YnI+DQpJIGRpZCBhIE1BSiBvZiBteSBzeXN0ZW0geWVzdGVyZGF5LCBi
dXQgd2lyZWd1YXJkIHdhc24mIzM5O3QgdXBncmFkZWQsIHNvIEk8YnI+DQpkb24mIzM5O3Qga25v
dyB3aGVyZSB0aGUgcHJvYmxlbSBjb21lIGZyb20uLi5TZWVtcyBhIExLTSByZWxhdGVkIHRvIGNy
eXB0bzxicj4NCmlzIG1pc3NpbmcsIGJ1dCBJIGRvbiYjMzk7dCBrbm93IHdoaWNoIG9uZSBpcy48
YnI+DQo8YnI+DQpNeSBrZXJuZWwgaXMgNC4xOS4yLWFyY2gxLTEtQVJDSCwgYW5kIG15IHdpcmVn
dWFyZCBwYWNrYWdlcyBhcmUgOjxicj4NCjxicj4NCi0gY29tbXVuaXR5L3dpcmVndWFyZC1ka21z
IDAuMC4yMDE4MTExNS0xPGJyPg0KPGJyPg0KLSBjb21tdW5pdHkvd2lyZWd1YXJkLXRvb2xzIDAu
MC4yMDE4MTExNS0xPGJyPg0KPGJyPg0KVGhhbmtzIGZvciB5b3VyIHdvcmssPGJyPg0KPGJyPg0K
LS0gPGJyPg0KLVRPU0gtPGJyPg0KPGJyPg0KSWYgeW91IG5lZWQgcHJpdmFjeSB5b3UgY2FuIGVu
Y3J5cHQgeW91ciBtYWlscyB3aXRoIG15IEdQRyBrZXk6PGJyPg0KOUI3OSA3NzU0IDAwRTIgMjND
NyBGQzkwwqAgRTVDNiBFNUQ5IDFCMkYgMEJENSAzQzZBPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3Rl
Pjxicj48YnI+LS0gPGJyPlNlbnQgZnJvbSBHbWFpbCBNb2JpbGU8YnI+DQo=
--000000000000392688057b05d7ef--

--===============8289337772222292139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8289337772222292139==--
