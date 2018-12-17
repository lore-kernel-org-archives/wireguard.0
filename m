Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE489C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:49:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C322084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="XuTathT6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49C322084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c578761e;
	Mon, 17 Dec 2018 08:48:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bf8de3d
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:48:45 +0000 (UTC)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec4773a5
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:48:45 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id h78so7207731vsi.6
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dpjpy7aCgOsfcOrrsratOvZeXrwtTRFftBQTtUpK9mg=;
 b=XuTathT6wud36koaYPnYw75ONAPrHxFG2pc7T6mgF0WvAWo0YX7iunGpc9xUHTKiRA
 CRoCgTB10IVI7qbsfkPZut2wjFWjrMiLacbO3JXpn7rYy7CPSQrkpBPnUItv9/C1EFAG
 lzcAn45ARk3gJBsBDznpoT03DhDWOE0+ux5Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dpjpy7aCgOsfcOrrsratOvZeXrwtTRFftBQTtUpK9mg=;
 b=HDeiuDLp5GZxlWqD87NfnKnB0RJR8NyRAIkJsn9eWZtsfoTogFA2rVxuYqdXRKFkXq
 4q0pNHJlPaK6xHRiVtttYpymifBOxL1LFVuMDQDv708yBBLWrMLNR/v+zlX0KRIDTYyM
 L+7Vymh0Y3s+r2bdRxV7NURuZOsifIMIrxCGfzIh5TqYdfspv+ZLPe+rnQTmTWZ/LMbu
 YRpMcKj7OXBzyAQFzBRNwkFVoR3wOrQyrTi4VuNMChGC7VOi9YPy9xEdSINbOUD16sZN
 ugVRnoDa289qPQgjrLxTfUMMLcJuek/VKku7rWHEc+iE+9ZM+/URHpBor/SWL5bwex6O
 IGjw==
X-Gm-Message-State: AA+aEWY8zb55RQBlyH73E5Br8zgaWTUQ5o3IPhwxS1wnrEDdPVuDG/hC
 bnr5+3JWgxFZeeGMcUlINC1+/JIb0GJu9zwK5PRdQkXnIbG4zKVd
X-Google-Smtp-Source: AFSGD/XIreOCdif1ngApPHdsreC5kwCyFVK9xBdOlh6NLUV0s2gRp26o8j2tLK8TtjEJw9JYL0S1BjsWyVgJCsMjcSM=
X-Received: by 2002:a67:4a48:: with SMTP id x69mr5662035vsa.93.1545036542766; 
 Mon, 17 Dec 2018 00:49:02 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
 <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
 <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
In-Reply-To: <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Mon, 17 Dec 2018 16:49:24 +0800
Message-ID: <CAKVinOX5fnvdv1sBvxq=aV3+UpM-g9CnAU9rMu7zrx-WQ9rzVg@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: Jason@zx2c4.com
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

U29ycnksCgpJIGZvdW5kIHRoZSBkZWZpbml0aW9uIGluIG1hbnVhbDoKQWxsb3dlZElQcyDigJQg
YSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBJUCAodjQgb3IgdjYpIGFkZHJlc3NlcyB3aXRoIENJ
RFIgbWFza3MKZnJvbSB3aGljaCBpbmNvbWluZyB0cmFmZmljIGZvciB0aGlzIHBlZXIgaXMgYWxs
b3dlZCBhbmQgdG8gd2hpY2gKb3V0Z29pbmcgdHJhZmZpYyBmb3IgdGhpcyBwZWVyIGlzIGRpcmVj
dGVkCgpmcm9tOiBodHRwczovL21hbnBhZ2VzLmRlYmlhbi5vcmcvdW5zdGFibGUvd2lyZWd1YXJk
LXRvb2xzL3dnLjguZW4uaHRtbAoKT24gTW9uLCBEZWMgMTcsIDIwMTggYXQgNDoxMCBQTSBLZVhp
YW5iaW4oaHR0cDovL2RpeWlzbS5jb20pCjxrZXhpYW5iaW5AZGl5aXNtLmNvbT4gd3JvdGU6Cj4K
PiBJdCBzZWVtcyB0aGF0ICJBbGxvd2VkSVBzIiBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCByZWZ1
c2luZyB1bndhbnR0ZWQgcGVlcidzIElQLgo+IEl0IG9ubHkgc3BlY2lmZXMgdGhlIG91dGdvaW5n
IHRhcmdldCBJUHMsCj4gRm9yIGV4YW1wbGUsICBJIHNvbWV0aW1lcyBzZXQgIkFsbG93ZWRJUHM9
MjE2LjU4LjAuMC8xOCIgdG8gZW5hYmxlIG1lCj4gdG8gdmlzaXQgaHR0cHM6Ly93d3cuZ29vZ2xl
LmNvbSB0aHJvdWdoIHRoZSBpbnRlcm5ldCBvZiB0aGUgcGVlcgo+ICIxMC4xLjAuMyIuCj4gT24g
TW9uLCBEZWMgMTcsIDIwMTggYXQgMzo1MyBQTSBLZVhpYW5iaW4oaHR0cDovL2RpeWlzbS5jb20p
Cj4gPGtleGlhbmJpbkBkaXlpc20uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBteSBtYWNoaW5lKDEw
LjEuMC4xKSwgZG9lcyB0aGUgb3B0aW9uICJBbGxvd2VkSVBzID0gMTAuMS4wLjMvMzIiIGluCj4g
PiB3ZzEuY29uZiB0YWtlIGVmZmVjdHMgaW4gYm90aCBpbnB1dCBhbmQgb3VwdXQgZGlyZWN0aW9u
cz8KPiA+IEl0IHNlZW1zIHRoYXQgIkFsbG93ZWRJUHMgPSAxMC4xLjAuMy8zMiIgb25seSBhZGRl
ZCBpcCByb3V0ZSBydWxlCj4gPiAiMTAuMS4wLjMgZGV2IHdnMSAgc2NvcGUgbGluayIgb24gbXkg
c2lkZSwKPiA+IGNhbiBpdCBwcmV2ZW50IHRoZSBwZWVyIHRvIHNlbmQgcGFja2V0cyB0byBteSAx
MC4xLjAuMTo4MCBmcm9tIDEwLjEuMC40Pwo+ID4gT24gTW9uLCBEZWMgMTcsIDIwMTggYXQgMzo0
MCBQTSBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIE1vbiwgRGVjIDE3LCAyMDE4IGF0IDI6NDIgQU0gS2VYaWFuYmluKGh0dHA6Ly9kaXlp
c20uY29tKQo+ID4gPiA8a2V4aWFuYmluQGRpeWlzbS5jb20+IHdyb3RlOgo+ID4gPiA+IEFsbG93
ZWRJUHMgPSAxMC4xLjAuMy8zMgo+ID4gPiA+IFsuLi5dCj4gPiA+ID4gSWYgSSB3YW50IHRvIGxp
bWl0IHRoZSBwZWVyIHRvIGEgZml4ZWQgSVAgMTAuMS4wLjMsIGFueSB3ZzEuY29uZgo+ID4gPiA+
IE9QVElPTiB0byBjb25maWcgaXQ/Cj4gPiA+ID4KPiA+ID4gPiBDdXJyZW50bHksICB0aGUgcGVl
ciBjYW4gc2V0IGFueSBJUCwgZm9yIGV4YW1wbGUgMTAuMS4wLjQsIGFuZCBjYW4KPiA+ID4gPiBz
ZW5kIHBhY2tldHMgdG8gbXkgaHR0cDovLzEwLjEuMC4xOjgwIGZyb20gMTAuMS4wLjQuCj4gPiA+
Cj4gPiA+IFNldHRpbmcgdGhhdCBwZWVyJ3MgYWxsb3dlZGlwcyB0byAxMC4xLjAuMy8zMiBzaG91
bGQgYWNjb21wbGlzaAo+ID4gPiBleGFjdGx5IHdoYXQgeW91IHdhbnQ7IHRoYXQgcGVlciBpcyBf
b25seV8gYWxsb3dlZCB0byBzZW5kIHBhY2tldHMgYXMKPiA+ID4gdGhhdCBJUC4gSWYgdGhlIHBl
ZXIgYXR0ZW1wdHMgdG8gc2VuZCBwYWNrZXRzIGFzIDEwLjEuMC40LCBXaXJlR3VhcmQKPiA+ID4g
c2hvdWxkIHJlamVjdCB0aG9zZSBwYWNrZXRzLiBJZiBpdCBkb2Vzbid0LCB0aGF0IHNvdW5kcyBs
aWtlIGEgbWFqb3IKPiA+ID4gYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJj
NC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
