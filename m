Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8089BC35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 07:49:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0AB206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 07:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ/jc0zB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B0AB206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9ca7218;
	Sun, 23 Feb 2020 07:45:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d643dfd5
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 07:45:49 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7c49c60
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 07:45:49 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id x123so3882600vsc.2
 for <wireguard@lists.zx2c4.com>; Sat, 22 Feb 2020 23:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=cp6IXs90j55o/U2l3f3X+bNA21MfrdTCXhVRV+n2GZQ=;
 b=YQ/jc0zBtSkMimqA8UJeRIz1EktEj94dw35xuS0z7ZKstgFI97q2qfKGf/+aNS7ZCV
 v9hTo2ZOt2kdCNDj5MaRS35A6nSj7xYymfLWAmj1gSbFLMuE0KI6Gio9ytesk3sNpkft
 0zja1jH5yI9CGcv59MXAgTEKVMprf9q8AutredBCHGBcLNWZarGOZJIFs+l0GpBM3jOk
 dKFeBX71yjvkTR79eQpaWEoYUwmQhjnywvAS8BvMu7pizRrDw16zMycvOdCz81T5z2Ln
 YCiMPUtJ4QYKKNL+uc2kbIZRDHpVmIycwOeJCTIakPxNQgtVHbQwQLC3ykkGz0mhvaqG
 +51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=cp6IXs90j55o/U2l3f3X+bNA21MfrdTCXhVRV+n2GZQ=;
 b=GjXOZLoQRnIvC2YZKXxoEnXxknkQkGAWcmX3dkoZbjEm/b093A7s/am/oIKwTb5ZJL
 RTVIO2WGSLmE7yVUGIdKFvrCa0HiVo+3NNI4mKZrEzjAMrFQJxVqca1TSME4GTDiMhZO
 9EUvS7Q+iu4SUxH7EAohw9HeYG0FWavQhYfb+uj7BEVR/Zz2CSRd8deDGvkZSEJfWdJv
 NJS+CNqT/6+kMaq1CFj/RK371dVPNiv6Lvj/CDvfBdrBS/etOkgYZXv5Vi+BsySDxxHJ
 VgY9rnQDA9P4spfEP/pWW+hRIVEyYLJaLMiyZNgz7t5FwD95WezfwoszxP9eZkWH9huv
 oMUQ==
X-Gm-Message-State: APjAAAVWmWaAIqQfr0FTdLW2XhsrQNoHrOUYhwySQVOqG8eX3jOVzzpj
 ZbWnDco6SnB/AJqTKEsx/EDOSa1Bq3RygbL3PnxMJ+GM
X-Google-Smtp-Source: APXvYqyUBQpVRdAbuVAFPuId55QZKTG76dF8d2EQXAmIJgYBpGJRcWvj/0xlSG7kDPoiqNWJ4mc84tKPGciNa5GxUa4=
X-Received: by 2002:a67:7987:: with SMTP id u129mr24512120vsc.83.1582444142923; 
 Sat, 22 Feb 2020 23:49:02 -0800 (PST)
MIME-Version: 1.0
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
 <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>
In-Reply-To: <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 23 Feb 2020 16:48:51 +0900
Message-ID: <CAA2ss9GG5P2QgRtO=sBSKywTqAniB4rfk7qSWOkvTtVnvPNsXg@mail.gmail.com>
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

SGkgU2ltb24hCgpJIGZpbmlzaGVkIHdpcmVndWFyZC1hcHBsZSB0cmFuc2xhdGlvbiB0byBKYXBh
bmVzZS4KU28gSSB3aWxsIHN0YXJ0IHRvIHRyYW5zbGF0ZSB3aXJlZ3VhcmQtd2luZG93cy4KCkhv
dyBkbyBJIHdvcmsgb24gaXQ/CkkgZ3Vlc3M6Ci0gY2hlY2tvdXQgc3IvaTE4bgotIGNyZWF0ZSBs
b2NhbGVzL2phL21lc3NhZ2VzLmdvdGV4dC5qc29uCi0gdHJhbnNsYXRlICJtZXNzYWdlIiBpbnRv
ICJ0cmFuc2xhdGlvbiIgZmllbGQKLSBzZW5kIHBhdGNoIHRvIE1MCgpJcyB0aGlzIGNvcnJlY3Q/
ClRoYW5rcywKCjIwMjDlubQy5pyIMTbml6Uo5pelKSAyMzoxMyBFaWppIFRhbmlva2EgPHRhbmlv
a2E0MDRAZ21haWwuY29tPjoKPgo+IEhpIFNpbW9uLAo+Cj4gU3VyZSEgSSB3aWxsIGJlIHBsZWFz
ZWQgdG8gaGVscCB3aXJlZ3VhcmQtd2luZG93cyBsb2NhbGl6YXRpb24uCj4gQ3VycmVudGx5LCBJ
J20gd29ya2luZyBvbiB3aXJlZ3VhcmQtYXBwbGUgdHJhbnNsYXRpb24uIFdoZW4gZmluaXNoZWQs
Cj4gSSB3aWxsIHRyeSB0byB0cmFuc2xhdGUgd2lyZWd1YXJkLXdpbmRvd3MgdG8gSmFwYW5lc2Uu
Cj4KPiBSZWdhcmRzLAo+IEVpamkKPgo+Cj4gMjAyMOW5tDLmnIgxNuaXpSjml6UpIDE4OjQwIFNp
bW9uIFJvem1hbiA8c2ltb25Acm96bWFuLnNpPjoKPiA+Cj4gPiBIaSBFaWppIQo+ID4KPiA+Cj4g
Pgo+ID4gSSB3b25kZXIgaWYgeW91IG1pZ2h0IGJlIHdpbGxpbmcgdG8gY29udHJpYnV0ZSBKYXBh
bmVzZSB0cmFuc2xhdGlvbiBmb3IgdGhlIHdpcmVndWFyZC13aW5kb3dzIGFzIHdlbGw/Cj4gPgo+
ID4KPiA+Cj4gPiBUaGUgd2lyZWd1YXJkLXdpbmRvd3MgaGFzIHBlbmRpbmcgbG9jYWxpemF0aW9u
IHN1cHBvcnQgaGVyZSBodHRwczovL2dpdC56eDJjNC5jb20vd2lyZWd1YXJkLXdpbmRvd3MvbG9n
Lz9oPXNyL2wxOG4uIEkgaGF2ZSB0cmFuc2xhdGVkIGl0IHRvIFNsb3ZlbmlhbiBhbHJlYWR5LiBG
dXJ0aGVybW9yZSwgSSBzaG91bGQgZ2V0IHRoZSBGcmVuY2ggdHJhbnNsYXRpb24gdG8gaW50ZWdy
YXRlIHNvb24gdG9vLgo+ID4KPiA+Cj4gPgo+ID4gUmVnYXJkcywgU2ltb24KPiA+Cj4gPgo+ID4K
PiA+IEZyb206IFdpcmVHdWFyZCA8d2lyZWd1YXJkLWJvdW5jZXNAbGlzdHMuengyYzQuY29tPiBP
biBCZWhhbGYgT2YgRWlqaSBUYW5pb2thCj4gPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMTUs
IDIwMjAgMTE6MjMgQU0KPiA+IFRvOiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9y
Zz4KPiA+IENjOiB3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tCj4gPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBBZGQgamFwYW5lc2UgdHJhbnNsYXRpb24uCj4gPgo+ID4KPiA+Cj4gPiBUaGFuayB5b3Ug
Zm9yIGFwcGx5aW5nIG15IHBhdGNoIQo+ID4KPiA+Cj4gPgo+ID4gSSdtIG5vdyB0cmFuc2xhdGlu
ZyB3aXJlZ3VhcmQtYXBwbGUgaW50byBKYXBhbmVzZS4gV2hlbiBmaW5pc2hlZCwgSSB3aWxsIHNl
bmQgcGF0Y2guCj4gPgo+ID4gTmV4dCB0aW1lLCBJIHdpbGwgbm90IGZvcmdldCB5b3VyIGFkdmlj
ZS4KPiA+Cj4gPgo+ID4KPiA+IFRoYW5rcywKPiA+Cj4gPgo+ID4KPiA+IDIwMjDlubQy5pyIMTXm
l6Uo5ZyfKSAxNToxNCBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz46Cj4gPgo+
ID4gT24gMi8xNC8yMCAxMToyNyBQTSwgRWlqaSBUYW5pb2thIHdyb3RlOgo+ID4gPiBIaSwgU2Ft
dWVsLgo+ID4gPgo+ID4gPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkhCj4gPiA+IEkgcmUtY3Jl
YXRlZCBwYXRjaC4KPiA+Cj4gPiBUaGFua3MsIGFwcGxpZWQ6Cj4gPiBodHRwczovL2dpdC56eDJj
NC5jb20vd2lyZWd1YXJkLWFuZHJvaWQvY29tbWl0Lz9pZD04MjJmNzJkZjk1NmVjZDNhYWE2YTJi
MjU0ZTA1OWUzOGJhNTEyMmU0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNv
bQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
