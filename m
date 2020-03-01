Return-Path: <SRS0=jj7n=4S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE66C3F2D1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 07:09:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C359020866
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 07:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luXSXJYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C359020866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e0ca668;
	Sun, 1 Mar 2020 07:04:17 +0000 (UTC)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 154400fa
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 07:04:14 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id p6so4568995vsj.11
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 23:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n08MS/RCb/55jBkuFI3RFauP8dH1i7J2ckglEs9PAYw=;
 b=luXSXJYkx7H52t0VVLjNVU6/tA22r1HWl+u1F+/2Wc1l6FbL2iEGv5r/VKHjYNpH5/
 orm+HBhg/tNRx1P41P+L0QfV7BSANyhQLfaXy4gneSgItaYXQK9WgHjtHUOgB/sgtdmi
 UtcefWhvq7lF3tWR0/pzRDQEHJblLCAmaMX+M3tQez+8CKOC7bjCO53LX6VVle4k7cOa
 56nLN8kfMj33mF7cQvBk0hvpkd/XnIxOQFJ1G2pYI8muNDOB3u31v4bMvJVhIUGfe737
 M4fajjvO6h2SxDiVXwASTUmTwnW6DRFvT9syq41fiiP3QLwELKhLysacFXe52uC/InsA
 F0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n08MS/RCb/55jBkuFI3RFauP8dH1i7J2ckglEs9PAYw=;
 b=C1S8hz16dILlCMl+tR8qttwWPzjhRWM4jWA1AOIdqDYIIFQct+EyNd4KkNcCdL56jq
 aUxZspUrMmRHnpebY+2qpLv6D7P09NV8l0DG8huCsXyRfkrbjN93RV77uu0byI14jSGt
 JjuLe5U6UhwUwrP9O7NAMjflvT8UyhMm4+bkT0xmq4ZCDki05pc+4hPh2TZyLDW2iryg
 l23YzTNEZ0ZELu9AoSYUraCbE/Le+vnabkyk0Wu145w//mYrVcGbzBif5KdHmNi2F4Bp
 RSljL1ZLAF4y0rrdZ1nTmSKwA+RQxuSzLeDiRmbswAACAAMIsH0lbpdiLMYT4wxENpTO
 EHkA==
X-Gm-Message-State: ANhLgQ3IbjR8hrcPRJ0izwnj92c6xz8IhX58Q/M0tNxrcFb17QsWq6I+
 ybSxEO3A46Xx8gNBYTbfWGys6IIa/M2R79DiYtbv6fh3d7g=
X-Google-Smtp-Source: ADFU+vsUSkXH0G0xDuxY23Nym5d8kr3zhyNEShOOGx/ELAOG7RsJn8V1k/1k5t3zFCws1HI/kCNshUoL1KXtn5x1b08=
X-Received: by 2002:a67:2701:: with SMTP id n1mr6437851vsn.103.1583046502111; 
 Sat, 29 Feb 2020 23:08:22 -0800 (PST)
MIME-Version: 1.0
References: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
In-Reply-To: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 1 Mar 2020 16:08:11 +0900
Message-ID: <CAA2ss9HshmLU7u5_t1nGq5BCxpk7qmYVtX_F-rLBBUz6e7boLg@mail.gmail.com>
Subject: Re: macOS Catalina failing https
To: Sean Baildon <sean@baildon.co>
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

SGksCgpJJ20gdXNpbmcgd2lyZWd1YXJkIG9uIG1hY09TIENhdGFsaW5hIDEwLjE1LjMgb24gTWFj
Qm9vayBBaXIgMjAxMy4KTXkgZW52aXJvbm1lbnQgaXMgbm90IHZhbmlsbGEoIGxhdGVzdCBjbGVh
biBpbnN0YWxsIGlzIEhpZ2ggU2llcnJhICksCmJ1dCBJIGNhbiBhY2Nlc3MgSFRUUFMgc2l0ZXMg
b3ZlciBXaXJlR3VhcmQgVlBOIHR1bm5lbCB1c2luZyBDaHJvbWUsClNhZmFyaSwgY3VybC4KCk15
IGNsaWVudCBjb25maWcgaXMgdmVyeSBzaW1wbGU6Ci0gW0ludGVyZmFjZV0gc2VjdGlvbiBoYXZl
IFByaXZhdGVLZXksIExpc3RlblBvcnQsIEFkZHJlc3MsIEROUywgTVRVLgotIExpc3RlblBvcnQg
aXMgIjUxODIwIiwgZGVmYXVsdCB2YWx1ZS4KLSBbUGVlcl0gc2VjdGlvbiBoYXZlIFB1YmxpY0tl
eSwgQWxsb3dlZElQcywgRW5kcG9pbnQsIFBlcnNpc3RlbnRLZWVwYWxpdmUuCi0gQWxsb3dlZElQ
cyBpcyAiMC4wLjAuMC8wIiBvbmx5LgotIEVuZHBvaW50IGlzICJ7U2VydmVyJ3MgSVB9OjUxODIw
Ii4KLSBQZXJzaXN0ZW50S2VlcGFsaXZlIGlzICIwIi4KCj4gUmVxdWVzdHMgdG8gaHR0cHMgZW5h
YmxlZCBzaXRlcyBvdmVyIHRoZSBWUE4gbm8gbG9uZ2VyIHdvcmssCldoZW4gYWNjZXNzIHRvIGh0
dHBzIHNpdGUgb3ZlciBWUE4gdHVubmVsLCB3aGF0IGlzIGhhcHBlbmluZz8KQ29ubmVjdGlvbiBm
YWlsZWQ/CgpUaGFua3MsCgoyMDIw5bm0MuaciDI55pelKOWcnykgMjA6MzkgU2VhbiBCYWlsZG9u
IDxzZWFuQGJhaWxkb24uY28+Ogo+Cj4gSGV5LAo+Cj4gUmVjZW50bHkgcHVyY2hhc2VkIGFuZCB1
cGdyYWRlZCBhIG5ldyBNQlAgdG8gQ2F0YWxpbmEuCj4KPiBSZXF1ZXN0cyB0byBodHRwcyBlbmFi
bGVkIHNpdGVzIG92ZXIgdGhlIFZQTiBubyBsb25nZXIgd29yaywgZXZlbgo+IHVzaW5nIG15IG9s
ZCBjb25maWd1cmF0aW9uLiBSZXF1ZXN0cyB0byBpbnNlY3VyZSBzaXRlc+KAlGV4Lgo+IGh0dHA6
Ly9leGFtcGxlLmNvbeKAlHdvcmsganVzdCBmaW5lLgo+Cj4gTXkgaU9TIGRldmljZXMgd29yayBh
cyBleHBlY3RlZC4gSSd2ZSB0cmllZCB1c2luZyB0aGUgaU9TCj4gY29uZmlndXJhdGlvbnMgb24g
dGhlIGxhcHRvcCwgYnV0IGl0J3MgdGhlIHNhbWUgYmVoYXZpb3VyOyBoYW5naW5nLgo+Cj4gSSdt
IHVzaW5nIHRoZSBNYWMgQXBwIFN0b3JlIHZlcnNpb24gb2Ygd2lyZWd1YXJkIG9uIGEgdmFuaWxs
YSBpbnN0YWxsCj4gb2YgbWFjT1MgQ2F0YWxpbmEuIEFyZSB0aGVyZSBhbnkga25vd24gaXNzdWVz
PyBIYXBweSB0byBwcm92aWRlIGFueQo+IHVzZWZ1bCBkZWJ1Zwo+Cj4gVGhhbmtzLAo+IFNlYW4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFdpcmVH
dWFyZCBtYWlsaW5nIGxpc3QKPiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCj4gaHR0cHM6Ly9s
aXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApX
aXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4v
bGlzdGluZm8vd2lyZWd1YXJkCg==
