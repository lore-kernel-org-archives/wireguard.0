Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AED4C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 09:02:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2C620672
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 09:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="XNolJ+v+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2C620672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 236f4e9a;
	Mon, 17 Dec 2018 09:02:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87178c70
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 09:02:06 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d00af6f1
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 09:02:06 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id n10so7202827vso.13
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nXU4YAXKKr6FKg5H7aON8LfqsaAhbaowofCw20wpxOs=;
 b=XNolJ+v+3AP18Bcu2ZHsuhUpmE2n14Swd39WcmndX/h7XlZ0qzH5jzNRKIbh9MBEqv
 RIt/0G4hmglJjhjiT7QpaYd1UFFuR+8zXK3RUnTdKA69GQ/Tv0xLBpFe84fTq3nmgKpS
 opRknQBjId1axcJBkMlgUqlnRW9socgSefBZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nXU4YAXKKr6FKg5H7aON8LfqsaAhbaowofCw20wpxOs=;
 b=miEzbaMw98iSJC3WSYmqZHA6Od0mq3DP+vfdisIqoNsSHmFps0CMswZLABGlvntwzk
 lVoTwBFHGZ2iJ2yEeVIwqQz2iB88EKw9oz3J7f/MMP2xhZpNhRE7y/s2uQu/a3KFQyb+
 3gbYeMwBrxau8f4N6aCBiTnVwh1QGKNYxwqq/EXZhCHqpGYai6fJDiR37elBWmb+RJjm
 qZqjae12Jp9kSKxrxDlw3aymS/oZYNt0Ju353oVcF2G+ED1dz0qzf9Ww/E2JymsQIBra
 jJnGajBvCyLwFXmxugXyNiVCiCKxrOGAPSk5+eYwAc/GYzm8l7u0DIzxJVn6zuzObuAS
 wNUw==
X-Gm-Message-State: AA+aEWZY69dLnA/yZ736y0NeCbzXi1c9NcVu5MTnvPsKIZYP/E5y5cba
 zQoesIACaUFI5QAmGPD5yAQeg4v4q4RV7eBejvfqllCtjLFg81Sg
X-Google-Smtp-Source: AFSGD/UJwm00fXDSg7sAXOOitwTiZaA6SUTBAzxAzyai7Wxy2P/Yt4WXUNxH3OA9gVUovCmFLaGRcE3Szcz14V8XBd4=
X-Received: by 2002:a67:4a48:: with SMTP id x69mr5676915vsa.93.1545037344472; 
 Mon, 17 Dec 2018 01:02:24 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
 <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
 <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
 <CAKVinOX5fnvdv1sBvxq=aV3+UpM-g9CnAU9rMu7zrx-WQ9rzVg@mail.gmail.com>
 <CAHmME9ou8Tt8GAxjw6qcPdmRmVyKShLVrBCJiFRC1KYVZ+KSeQ@mail.gmail.com>
In-Reply-To: <CAHmME9ou8Tt8GAxjw6qcPdmRmVyKShLVrBCJiFRC1KYVZ+KSeQ@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Mon, 17 Dec 2018 17:02:46 +0800
Message-ID: <CAKVinOV6A3-YsWh+f+rrvO7U2js9tscCwTs2Z=dOREjXGXGsxA@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
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

SXQncyBteSBmYXVsdCwgc29ycnkuCkkgZGlkbid0IHVzZSB0aGUgQWxsb3dlZElQcyBvcHRpb24s
IGknbSB1c2luZyAiaXAgcm91dGUgYWRkIiBpbiBteSBzY3JpcHQuCgpPbiBNb24sIERlYyAxNywg
MjAxOCBhdCA0OjU0IFBNIEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPiB3cm90
ZToKPgo+IE9uIE1vbiwgRGVjIDE3LCAyMDE4IGF0IDk6NDkgQU0gS2VYaWFuYmluKGh0dHA6Ly9k
aXlpc20uY29tKQo+IDxrZXhpYW5iaW5AZGl5aXNtLmNvbT4gd3JvdGU6Cj4gPiBJIGZvdW5kIHRo
ZSBkZWZpbml0aW9uIGluIG1hbnVhbDoKPiA+IEFsbG93ZWRJUHMg4oCUIGEgY29tbWEtc2VwYXJh
dGVkIGxpc3Qgb2YgSVAgKHY0IG9yIHY2KSBhZGRyZXNzZXMgd2l0aCBDSURSIG1hc2tzCj4gPiBm
cm9tIHdoaWNoIGluY29taW5nIHRyYWZmaWMgZm9yIHRoaXMgcGVlciBpcyBhbGxvd2VkIGFuZCB0
byB3aGljaAo+ID4gb3V0Z29pbmcgdHJhZmZpYyBmb3IgdGhpcyBwZWVyIGlzIGRpcmVjdGVkCj4g
Pgo+ID4gZnJvbTogaHR0cHM6Ly9tYW5wYWdlcy5kZWJpYW4ub3JnL3Vuc3RhYmxlL3dpcmVndWFy
ZC10b29scy93Zy44LmVuLmh0bWwKPgo+IFllcywgdGhhdCBpcyBpbmRlZWQgd2hhdCB0aGUgbWFu
IHBhZ2Ugc2F5cyBhbmQgaXQgaXMgdGhlIGV4cGVjdGVkCj4gYmVoYXZpb3IuIFlvdSd2ZSByZXBv
cnRlZCBoZXJlLCBob3dldmVyLCAiQ3VycmVudGx5LCAgdGhlIHBlZXIgY2FuIHNldAo+IGFueSBJ
UCwgZm9yIGV4YW1wbGUgMTAuMS4wLjQsIGFuZCBjYW4gc2VuZCBwYWNrZXRzIHRvIG15Cj4gaHR0
cDovLzEwLjEuMC4xOjgwIGZyb20gMTAuMS4wLjQsIiB3aGljaCBzb3VuZHMgYmFkIGFuZCBsaWtl
IHNvbWV0aGluZwo+IHdvcnRoIHRha2luZyBzZXJpb3VzbHksIGlmIEknbSBpbnRlcnByZXRpbmcg
dGhhdCBjb3JyZWN0bHkuIFdvdWxkIHlvdQo+IHRha2UgdGhlIHRpbWUgdG8gY3JlYXRlIGEgcmVw
cm9kdWNlciBzaW1pbGFyIHRvIHdoYXQgSSBwb3N0ZWQgaW4gbXkKPiBsYXN0IGVtYWlsPwo+Cj4g
VGhhbmtzLAo+IEphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpo
dHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
