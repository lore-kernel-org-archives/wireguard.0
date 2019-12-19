Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F789C2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:36:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7A0206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lenstra-fr.20150623.gappssmtp.com header.i=@lenstra-fr.20150623.gappssmtp.com header.b="0duAQIwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7A0206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lenstra.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bcb4721;
	Thu, 26 Dec 2019 15:36:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 128a9581
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 10:37:57 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4a387bc
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 10:37:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z3so5463229wru.3
 for <wireguard@lists.zx2c4.com>; Thu, 19 Dec 2019 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lenstra-fr.20150623.gappssmtp.com; s=20150623;
 h=from:in-reply-to:references:mime-version:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IluKs4F0HK2WzY2plwHQBiiYLxirmBIwjrHa1+K13z0=;
 b=0duAQIwXJHHjMSCmJl6vgdpMDide4FE+KroMdr0h80vMVixCtFaqEAPs8geKnlsbti
 lXOrLYmGIvL61IDL389wimo4YTXZ95iUZHFobqlBSOwTjzg8f8xi0zmFGLNB4Y/6mTdZ
 xReHkRU7kYtXWRZBKWMNK3TPMHtqSS1TTNaLJoVKskXu4Hd0tqoT262Bcimqe+tbuwcW
 H4FLfcwIKyBXtFzWnRSx5FaOKUw0BYcSltX1XGL0SABDCBy5TtDNuEDVtJPf5Lqm6o38
 Lql97xEjmc7lPONedjBpdQlaIa1GUjafTQBNKKQ0Gk+hGYi2Tbb2GHfWXzLWUQ5S/Lg6
 Y+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:in-reply-to:references:mime-version:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IluKs4F0HK2WzY2plwHQBiiYLxirmBIwjrHa1+K13z0=;
 b=G3DRRcZobA4I1L7OvHinSo4d5Ix2ee9GiKYxOpTMggyZVI/jdNfiOUueeMtZZhumoM
 HNhmVzMDlhs6g1p6HK1P89fGypy6CdHqQguAm7Z+87nZ9ZcObPYNPRxgy2eJKFaYGIpR
 uczRQJ8LvbUNO9Ct941y4Xxn9XxhKEoIIoTlUCInuMjkvVxTiZrTcCjV9Z+TtyBoS8Yj
 j8SLVWXX3IZgGapE25DWfXFkAzA3MjUagKGy/Ztoak+QX4TeIx4Ze16axfgTxZjYmwCH
 XQpOmVwprwaUGM+7tqdDQaGF40Jb9c1jrZHSUcbJt20tYj9zyoZ2+vgd+WtJImVrY1OP
 Lx6g==
X-Gm-Message-State: APjAAAVcDa4sVeA9cOIhtuW3HNoCbsUOyg2eefVM/Hfwtc0OkshrE2Z5
 3fY+C/P9zN/BXDA971lvPwvtDszWBV6+zeCeAmmAyg==
X-Google-Smtp-Source: APXvYqyHyxOucx9sbSDrEeMsXmkIwdflY6PjfNp0yGM2C6g+xfg8nlwSRZQm1+EtgGZlaAsuGYzIjCVcOQi5NxID43k=
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr8071650wrr.215.1576751875769; 
 Thu, 19 Dec 2019 02:37:55 -0800 (PST)
Received: from 1058052472880 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Dec 2019 02:37:55 -0800
From: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@lenstra.fr>
In-Reply-To: <CAHmME9rKOd1rLygTtbho-vo85wQBGo5tQXdBrDvE-Fdk+r=_aw@mail.gmail.com>
References: <CA+jiYFD1SD-FgjgkwSTmkog1CYJYrEY87MKwD3StzAmmCJkn3w@mail.gmail.com>
 <CAHmME9rKOd1rLygTtbho-vo85wQBGo5tQXdBrDvE-Fdk+r=_aw@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 19 Dec 2019 02:37:55 -0800
Message-ID: <CAFsReqQ6uPQVWvupBBZZd3Q766i=4HnNZGyK83gNvyLG12nw5w@mail.gmail.com>
Subject: Re: MTU on wireguard-apple for IPv6
To: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@henki.fr>, 
 "Jason A. Donenfeld" <jason@zx2c4.com>
X-Mailman-Approved-At: Thu, 26 Dec 2019 16:36:40 +0100
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

PiBQcm9iYWJseSB0aGUgcGhvbmUncyBkaGNwIHNlcnZlciBkb2Vzbid0IHBhc3MgdGhlIHJpZ2h0
IE1UVSBiYWNrIHRvCj4gdGhlIGNsaWVudCwgYnV0IHRoZW4gdGhlIHBob25lIGRvZXMgdGhlIG1z
cy1tdHUgaGFjayB0byBmaXggdXAgVENQCj4gY29ubmVjdGlvbnMuIFRoYXQgaGFjayBkb2Vzbid0
IHdvcmsgd2hlbiB0aGUgdHJhZmZpYyBpcyBlbmQtdG8tZW5kCj4gZW5jcnlwdGVkLCBhcyBpcyB0
aGUgY2FzZSB3aXRoIFdpcmVHdWFyZCwgc28gbm8gc21hbGxlciBNU1MgaXMgZXZlcgo+IG5lZ290
aWF0ZWQuCgpXb27igJl0IHRoaXMgc2l0dWF0aW9uIGhhcHBlbiBhIGxvdD8gU2hvdWxkIHdlIGZp
eCB0aGUgZGVmYXVsdCBNVFUgdG8gMTI4MAp0byBhdm9pZCB1c2VycyBoYXZpbmcgdGhlaXIgdHVu
bmVsIHJhbmRvbWx5IGZhaWwgb24gc29tZSBuZXR3b3JrPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
