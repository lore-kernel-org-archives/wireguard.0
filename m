Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5066DC35DF9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 08:01:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE932084E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 08:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1kW/iVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE932084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c775b55;
	Tue, 25 Feb 2020 07:58:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02d2705d
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 07:58:08 +0000 (UTC)
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15d39831
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 07:58:08 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id w67so3264271vkf.1
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 00:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cls8abmHLGL+zZN0SNIY7zUgcXTQMtr87LYnsoexD2U=;
 b=r1kW/iViB9ARJhETEYbzpJBc4oYQekW6k0UU1P5sYH+wcJ05JVJaFqmUhbBmA21EES
 jZwMlMAjfDzRSXvNMwDgfrX/KmbwokFLL9FLuNp7e7sd3rXETycRWNR5gjeT1sAnD5eC
 y1SH1O2CYxYLq0OZ5ehfKugoHFGs6BFQkTvZSUkhiY6RltqnFH2nq6ViI3EECp5OHJBx
 rwFfxjoHYyn8uy53N7u49UKNg1soLIS7XpJjXCj1YqSqVkQo8DtJQbVtoTC8KYrLDCDv
 T9yU/v2jdBVE3HIiSOzav7LRanAXqTkRbKzO/QwtVWyNyZvNQaghVKZC9sW4xObIBXcw
 aRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cls8abmHLGL+zZN0SNIY7zUgcXTQMtr87LYnsoexD2U=;
 b=HN/PJWscoqIAF+j2vMt4lASnd+eqhOIUZNacB7J744fYEBDqHMmTrgQFAgcuOkiMkd
 L6PMgFXVnZSgl5wH6GeVGxOn8NsDoScbpHyIsJdG0szIyjGe8OaOrL66AWmc49+/6hGy
 3sE6G38DKPOOEyU/NBDeQUM0BAwJFs9lsLNfgG4igPgCZWC1GO2552Lw0Dc0Ugkf2Stb
 jVdE22LqcaMeFOAaNSbLn/Sf1uiKp4LnsIsk5OYLKzxk8VwrXQZCce0YOlPoUACFJv1E
 R76Y2rPvbzewhTtkQwI5pf9uItD9g4XKAPBxRRM4Ovg23g+Gvqvm5K/lTUGEeSEUR5i1
 8Pww==
X-Gm-Message-State: APjAAAWEaiDacekVwJXGpOyzDCwl5gIgJcJtiLW8TdmKxlXOt4SCyajE
 XUFv/46Ee4uN/svtSINA9JJm1PZADPi+3PNOcvnYKBJDH60=
X-Google-Smtp-Source: APXvYqwJmcOxs+++7Ne8zlDHkOZEsbnDNTYp5LUVO01OIhz8AGodS8INe98S0Dzi9faGqDo9E2t9VZy1QgDeAilK4/o=
X-Received: by 2002:a1f:aa90:: with SMTP id t138mr24863832vke.83.1582617697277; 
 Tue, 25 Feb 2020 00:01:37 -0800 (PST)
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
 <CAA2ss9EORZq+NzY0zeDVFNna6cf8T62S+GxsddiWEkaFC10LNA@mail.gmail.com>
 <33114245-EBC2-4CD6-B4FF-F3D5B72B6459@rozman.si>
In-Reply-To: <33114245-EBC2-4CD6-B4FF-F3D5B72B6459@rozman.si>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Tue, 25 Feb 2020 17:01:24 +0900
Message-ID: <CAA2ss9H=ptCVs+nqViS2hzK15DcprdAm7UGpHWq-ifR8PpUv2g@mail.gmail.com>
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

VGhhbmtzISBJIHVuZGVyc3Rvb2QuCgoyMDIw5bm0MuaciDI15pelKOeBqykgMTY6MzQgU2ltb24g
Um96bWFuIDxzaW1vbkByb3ptYW4uc2k+Ogo+Cj4gSGkgRWlqaSwKPgo+IFllcywgTWljcm9zb2Z0
LWFzc2lnbmVkIGxvY2FsZSBJRCBmb3IgSmFwYW5lc2UgaXMgMHgwNDExLgo+Cj4gKDB4MDRiMCBz
dGFuZHMgZm9yIFVURi0xNi4gTGVnYWN5IHNvZnR3YXJlIHdvdWxkIHByb2JhYmx5IHNwZWNpZnkg
MHgwM2E0ID0gSmFwYW4gKFNoaWZ0IOKAkyBKSVMgWC0wMjA4KSBoZXJlLiBJJ20gbm90IHN1cmUg
aWYgdGhpcyBwcm9wZXJ0eSBpcyBhY3R1YWxseSB1c2VkIGFueXdoZXJlIG90aGVyIHRoYW4gV2lu
ZG93cyA5NS4pCj4KPiBKdXN0IHB1dCBzb21ldGhpbmcgbGlrZSB0aGlzIHRvIHRoZSByZXNvdXJj
ZXMucmMgZmlsZSBhZnRlciBGcmVuY2ggKHRvIGtlZXAgdGhlIGxpc3Qgc29ydGVkIGJ5IGxhbmd1
YWdlIG5hbWVzIGluIEVuZ2xpc2gpOgo+Cj4gTEFOR1VBR0UgTEFOR19KQVBBTkVTRSwgU1VCTEFO
R19ERUZBVUxUCj4gVkVSU0lPTklORk9fVEVNUExBVEUoCj4gICAiMDQxMTA0YjAiLCAweDQxMSwg
MHg0YjAsCj4gICAiV2lyZUd1YXJkOiDpq5jpgJ/jgafmnIDmlrDjga7lronlhajjgapWUE7jg4jj
g7Pjg43jg6siLAo+ICAgImh0dHBzOi8vd3d3LndpcmVndWFyZC5jb20vIgo+ICkKPgo+IEJlc3Qg
cmVnYXJkcywKPiBTaW1vbgo+Cj4g77u/LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9t
OiBFaWppIFRhbmlva2EgPHRhbmlva2E0MDRAZ21haWwuY29tPgo+IERhdGU6IFR1ZXNkYXksIDI1
IEZlYnJ1YXJ5IDIwMjAgYXQgMDg6MDcKPiBUbzogU2ltb24gUm96bWFuIDxzaW1vbkByb3ptYW4u
c2k+Cj4gQ2M6ICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiA8d2lyZWd1YXJkQGxpc3RzLnp4
MmM0LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBZGQgamFwYW5lc2UgdHJhbnNsYXRpb24u
Cj4KPiAgICAgSGkgU2ltb24sCj4KPiAgICAgSSByZWFkICJyZXNvdXJjZXMucmMiLCBhbmQgc3Rh
cnQgd29ya2luZy4KPiAgICAgYW5kIEkgaGF2ZSBxdWVzdGlvbiBhYm91dCBpdC4KPgo+ICAgICAt
IEZvciBKYXBhbmVzZSByZXNvdXJjZSwgY29weSBmcm9tIGxpbmUgNDUtNTAgYW5kIHBhc3RlIGl0
IGF0IEVPRgo+ICAgICAtIFJld3JpdGUgIkxBTkdfRU5HTElTSCIgdG8gIkxBTkdfSkFQQU5FU0Ui
Cj4gICAgIC0gUmV3cml0ZSAiMDQwOTA0YjAiIHRvICIwNDExMDRiMCIKPiAgICAgLSBSZXdyaXRl
ICIweDQwOSIgdG8gIjB4NDExIgo+ICAgICAtIFRyYW5zbGF0ZSAiV2lyZUd1YXJkOiBGYXN0LCBN
b2Rlcm4sIFNlY3VyZSBWUE4gVHVubmVsIiBpbnRvIEphcGFuZXNlCj4KPiAgICAgSSBnb29nbGVk
IGFuZCBmb3VuZCB0aGF0ICIweDQxMSIgbWVhbnMgIkphcGFuZXNlIi4KPiAgICAgaHR0cHM6Ly9k
b2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy93aW4zMi9tZW51cmMvdmVyc2lvbmluZm8t
cmVzb3VyY2UKPgo+ICAgICBJcyB0aGlzIGNvcnJlY3Q/Cj4KPiAgICAgUmVnYXJkcywKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFp
bGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5j
b20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
