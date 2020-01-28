Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E01C35240
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ADE6206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry0kv8id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ADE6206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 609a5a40;
	Thu, 30 Jan 2020 01:53:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f3fe16f
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 21:40:01 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47e6de4a
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 21:40:01 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id f25so3391015ljg.12
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 13:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=MfHdyF/0aK7ILXppObrwu+fKB6byMzqoShu/mGa3kHU=;
 b=Ry0kv8idpQMlEDoJfPMGP3O9aONI8kzZclUW7hU7i94XF/iJcHI2fP6dFUaIGef9MH
 20GOyj/ONz0tOBXVKZ4/vLfiufz3upSJDCQA1vOd7iXK62ABplsai3bZr7gwHnNVdrEp
 3venQsTtEMth6Uta0DRyPXLf6o+0dLWYHYJMf8T+blmKP8y8LSuL/ynbfUHP0yMmoXGd
 6HyQDNsyE7v+F+iFRkM23O3l/BCKGbpdnF9ifta2mDvW05Z8PN9DZ8G2giSQ/n0CSSeP
 vQh/PFUmdwkl6LCPF8IUKHmNs847HWfdG2AcsEbtBln5r/CvJrJ9ahLzNFEV/ZlJN5gU
 EmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MfHdyF/0aK7ILXppObrwu+fKB6byMzqoShu/mGa3kHU=;
 b=JwydE2adn+ZNqVn8qITW7wEv0U5amzbfDYDnljb3bUptpZ8//wz5LXzTS9LHe3tUZo
 bV18P6OD8u3dWhiYGy2NkYx8obaFka4Y0o05f1JOBut2TEblgRpAeBWT5Kifd7jHaiSh
 KultwrraBKoMhC3FiVNiveAo2om75+F0gd7tloL3j2aAIOF6JM0TnFfgvg3k75dinaSF
 JvChQjmGDCcL33/efSVvujB1yNqWe4Q2IWc7YYAzdsh7yUSRAW5PjCv3NesRdVgaypMv
 31LbGOLys8hQ7XBrg8byWfqFu/r4nCq2HVJDdxVOM1ho/BtiUeBrLMYlt/u/vj+/yThI
 X+XA==
X-Gm-Message-State: APjAAAW3XeMwGZv6pGa20x+nC27tGrPi1eo1t8Aai6vOiuJa2yPRTnRO
 Z4uAAb+g/6OkerHVRWTN3GDCnqxY
X-Google-Smtp-Source: APXvYqy04+3uUNZ33FBAFbLidkKg1IDLQz6DOyQUQGHtV7dfImMwp/rQ2/3S3b1IEsjIOVtKfxtDVA==
X-Received: by 2002:a2e:9a01:: with SMTP id o1mr14706464lji.247.1580247599394; 
 Tue, 28 Jan 2020 13:39:59 -0800 (PST)
Received: from [10.0.0.11] (user-5-173-247-41.play-internet.pl. [5.173.247.41])
 by smtp.googlemail.com with ESMTPSA id k23sm10254000ljj.85.2020.01.28.13.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 13:39:58 -0800 (PST)
Subject: Re: [PATCH] wg-quick: Linux and FreeBSD: Add support to search domain
 in wg-quick
To: Nico Schottelius <nico.schottelius@ungleich.ch>, wireguard@lists.zx2c4.com
References: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
 <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
 <CAPWNY8W4oXesE53MMDNZC092xN8nK9iyKV-pcNpvMxcH1y4LuQ@mail.gmail.com>
 <878slreo9y.fsf@ungleich.ch>
From: Lech Perczak <lech.perczak@gmail.com>
Message-ID: <de0cf28a-861e-7291-bb58-82ee8f67b7f9@gmail.com>
Date: Tue, 28 Jan 2020 22:39:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <878slreo9y.fsf@ungleich.ch>
Content-Language: pl
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:14 +0100
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

VyBkbml1IDIwMjAtMDEtMjggb8KgMTM6NTIsIE5pY28gU2Nob3R0ZWxpdXMgcGlzemU6Cj4gSSBz
ZWNvbmQgTWFudGFzIGluIHRoaXMgcmVnYXJkIC0gZG9uJ3QgYmxvYXQgd2ctcXVpY2ssIGJ1dCBh
IEROUwo+IHNlYXJjaCBwYXRoIGlzIHByZXR0eSBzdGFuZGFyZCB0byBiZSBzdWJtaXR0ZWQgYnkg
ImEgbmV0d29yayIuCj4KPiBXZSBhcmUgbm90IHRhbGtpbmcgZGhjcCBib290IG9wdGlvbnMsIGV2
ZW4gdGhvdWdoIE5UUCBzZXJ2ZXJzIHdvdWxkCj4gcHJvYmFibHkgYWxzbyBtYWtlIHNlbnNlLCBp
ZiB5b3Ugc2VlIHdpcmVndWFyZCBhcyBwcm92aWRpbmcgYSBuZXR3b3JrLgo+Cj4gQmVzdCwKPgo+
IE5pY28KPgo+Cj4KPiBNYW50YXMgTWlrdWzEl25hcyA8Z3Jhd2l0eUBnbWFpbC5jb20+IHdyaXRl
czoKPgo+PiBUaGF0IG1pZ2h0IGJlIHRydWUsIGJ1dCBJTUhPIHRoZSBsaXN0IG9mIHNlYXJjaCBk
b21haW5zIGRvZXNuJ3QgZmFsbAo+PiB1bmRlciAic3BlY2lhbGl6ZWQgb3B0aW9ucyIg4oCTIGl0
IGlzIGV2ZW4gZGVwbG95ZWQgdmlhIERIQ1AgYW5kIHNpbWlsYXIKPj4gbWVjaGFuaXNtcyBhbG1v
c3QgYXMgY29tbW9ubHkgYXMgdGhlIGxpc3Qgb2YgRE5TIHJlc29sdmVycyB0aGVtc2VsdmVzLAo+
PiBzbyBpZiBhIFZQTiBjbGllbnQgc3VwcG9ydHMgdGhlIGxhdHRlciB0aGVuIGl0IG1ha2VzIHNl
bnNlIHRvIHN1cHBvcnQKPj4gYm90aC4KPj4KPj4KPj4gT24gVHVlLCBKYW4gMjgsIDIwMjAgYXQg
MTI6MzcgUE0gSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+IHdyb3RlOgo+Pj4g
SSdtIG5vdCBzbyBzdXJlIHRoYXQgd2Ugd2FudCB0byBmaWxsIHdnLXF1aWNrKDgpIHVwIHdpdGgg
ZXZlcnkgZG5zCj4+PiBub2IuLi4gSWYgeW91IGhhdmUgc3BlY2lhbGl6ZWQgbmV0d29ya2luZyBy
ZXF1aXJlbWVudHMsIHdnLXF1aWNrKDgpIGlzCj4+PiBwcm9iYWJseSBub3QgZm9yIHlvdSBhbnl3
YXkuCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4gV2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+Pj4gV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQo+
Pj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKPgo+
IC0tCj4gTW9kZXJuLCBhZmZvcmRhYmxlLCBTd2lzcyBWaXJ0dWFsIE1hY2hpbmVzLiBWaXNpdCB3
d3cuZGF0YWNlbnRlcmxpZ2h0LmNoCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4gV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQo+IGh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCgpDb3VsZG4ndCBhZ3JlZSBtb3JlIHdpdGggdGhpcy4gQWRkaW5nIHNlYXJjaCBkb21h
aW5zIHdpdGggd2ctcXVpY2sgd291bGQKYmUgcmVhbGx5IGJlbmVmaWNpYWwgZm9yIG15IGh1bWJs
ZSByb2Fkd2Fycmlvci10by1PcGVuV3J0IHNldHVwLCB0bwpyZXNvbHZlIGludGVybmFsIEROUyBo
b3N0bmFtZXMgb25jZSBjb25uZWN0ZWQuCgotLSAKUG96ZHJhd2lhbSwKTGVjaCBQZXJjemFrCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
