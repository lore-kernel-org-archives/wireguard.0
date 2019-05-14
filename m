Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C859BC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 04:05:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E0B2086A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 04:05:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxlFg1FY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E0B2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cb9e3fe;
	Tue, 14 May 2019 04:05:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a12cec9
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 04:05:29 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84ae0bac
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 04:05:28 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id t22so7870387pgi.10
 for <wireguard@lists.zx2c4.com>; Mon, 13 May 2019 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fDiEddyK0A+EnkKQfc+Cs8mwnFgdjqfBs3i/Zaf1bJo=;
 b=IxlFg1FYpJFTKZHaqDWxp6xi6P+/iJiVA1GC5oPIBtEpdfEAid2MjkfJELphxlwABf
 M87uvrJdzYxqNWJpIo5REYVMHKKo498dpHWSP/rMp5fpaZRkamnqf9s6ki/oEGDWDeWM
 pVcClp90crLoRNeEG8H4MEGC+jELx6N9sKPWAiOoFb2J8H0PXEU70LyIPtChMZbpoaJ1
 oMrQHaphTxY7GS+FpMZ1cc8/LFapAWam74tOrNnsohPKKWwdD+zYGhAp4XZqeqnE7Qxr
 sPMuOomoO2SoXcwmVdA8Mr9UJikpiqi8QNzKzsJgtBA3NmkN0xk89ERtTYJKu/rRNmXP
 Bj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fDiEddyK0A+EnkKQfc+Cs8mwnFgdjqfBs3i/Zaf1bJo=;
 b=REOU7ILQ0IBnV0haf2Xbg+XASIKoXzN6S6VHqsEAX9o1iSc1AvkvbQaBVM9utQqX53
 xnB20igGu4sxXdqsT4kDQAyG6aD7qorBwV6b9pFUyG9f61T7naDsmP5YtlmavYuOxwov
 i6Zy+3C4YdHe0MHFqZp9DSj9kJcvFE1P3hOjxuR+7LVWNvuFJ+ziCuo7zipLm1Ncd5QT
 jT+Lo5kZZFIhrMFN0Hk4U9VFxIN6KxnynXZUzYSEhNWdCSgrf6oIGFAV19/ZWZLFknzV
 lEu4OehOte5s8KHfmCH9QgWsCAvs7/LpSTThSRNf/YUFVGLUg0iaJb9KW0uR1XFxA8UK
 nyWw==
X-Gm-Message-State: APjAAAXUdpUsrUS8hE8F3BSD+8JLka0Cmb0lApR+QRBuK0TFEcEAR47A
 lRgI0HxBXWoX1fPS5kzM6vNMVRLhMc4=
X-Google-Smtp-Source: APXvYqyu3RLzaxbVE6wwdKDnJwYdS/IRwQ9bT7vgmpYgaKkeVN40T9hXD+29Zx0sidO+6+GkJSx5qg==
X-Received: by 2002:a65:6449:: with SMTP id s9mr34708729pgv.90.1557806727721; 
 Mon, 13 May 2019 21:05:27 -0700 (PDT)
Received: from sita-lt.atc.tcs.com (atcmail.atc.tcs.com. [203.200.212.145])
 by smtp.gmail.com with ESMTPSA id f7sm16722554pga.56.2019.05.13.21.05.24
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 21:05:25 -0700 (PDT)
Subject: Re: Fwd: bypassing wireguard using firejail
To: Steve Dodd <steved424@gmail.com>
References: <20190510115445.GA29887@sita-dell>
 <CAJ6XMjFxfm=0L2URLzn8pkZY1y4zU+mskgd7ykRKOjXSza4tSA@mail.gmail.com>
 <CAJ6XMjH23+k+hu0AighRFX4352O1r332mhd28p=+tw3n0T4+ZQ@mail.gmail.com>
 <20190511010857.GA15995@sita-dell>
 <CAJ6XMjFeO6uZRPts7w20qvkHoN7kZC6R4cH8s9BwF0nTU6rpCg@mail.gmail.com>
From: Sitaram Chamarty <sitaramc@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sitaramc@gmail.com; prefer-encrypt=mutual; keydata=
 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
 ZNJ7wKEHInRBmycqkB/ksby8tHy6yfE6
Message-ID: <a5a37bec-38cc-aa28-4f67-ce6c54e4221c@gmail.com>
Date: Tue, 14 May 2019 09:35:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ6XMjFeO6uZRPts7w20qvkHoN7kZC6R4cH8s9BwF0nTU6rpCg@mail.gmail.com>
Content-Language: en-US
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

CgpPbiAxMS8wNS8yMDE5IDE3LjA0LCBTdGV2ZSBEb2RkIHdyb3RlOgo+IE9uIFNhdCwgMTEgTWF5
IDIwMTkgYXQgMDI6MDksIFNpdGFyYW0gQ2hhbWFydHkgPHNpdGFyYW1jQGdtYWlsLmNvbQo+IDxt
YWlsdG86c2l0YXJhbWNAZ21haWwuY29tPj4gd3JvdGU6Cgo+ICAgICBTb21lIG90aGVyIHRvb2ws
IGlmIGl0J3MgcnVubmluZyBhcyByb290IG9yIGlzIHN1aWQgcm9vdCwgY2FuCj4gICAgIHN0aWxs
IGJ5cGFzcyB3aXJlZ3VhcmQsIHJlZ2FyZGxlc3Mgb2YgaG93IGl0IGlzIHNldHVwLgo+IAo+IAo+
IEkgc3VzcGVjdCB0aGF0IGNhbiBiZSBwcmV2ZW50ZWQgLSBvbiBtb2Rlcm4gc3lzdGVtcyBiZWlu
ZyByb290IGlzbid0Cj4gbmVjZXNzYXJpbHkgdGhlIGJlLWFsbCBhbmQgZW5kLWFsbC4gQ2FwYWJp
bGl0aWVzIGFuZCBuYW1lc3BhY2VzIGNhbgo+IHN0aWxsIGJlIHVzZWQgdG/CoCBjb25zdHJhaW4g
YXBwbGljYXRpb25zIGluIGxvdHMgb2Ygd2F5cy4KClRoYW5rcyBmb3IgdGhlIGxpbmtzLiAgSSBo
YWQgbm90IHJlYWQgdGhlIG5ldG5zIHBhZ2Ugb24gd2lyZWd1YXJkLmNvbQp0aWxsIG5vdy4KClRo
ZSBsYXN0IHNlY3Rpb24gb2YgdGhhdCBwYWdlLCAidGhlIG5ldyBuYW1lc3BhY2Ugc29sdXRpb24i
LCBhcHBlYXJzIHRvCmRvIGV4YWN0bHkgdGhpczsgSSdtIGdvaW5nIHRvIHRyeSB0aGF0IG91dCB3
aGVuIEkgZ2V0IHNvbWUgdGltZS4KCnRoYW5rcyBhZ2FpbgpzaXRhcmFtCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QK
V2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3dpcmVndWFyZAo=
