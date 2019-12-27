Return-Path: <SRS0=Ew3a=2R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C20BC2D0C6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 16:39:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B8B20882
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 16:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=henki-fr.20150623.gappssmtp.com header.i=@henki-fr.20150623.gappssmtp.com header.b="TJ+jRVzM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B8B20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=henki.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2b217bd;
	Fri, 27 Dec 2019 16:39:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 373145a4
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 16:10:20 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0af4d66
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 16:10:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id f129so8592269wmf.2
 for <wireguard@lists.zx2c4.com>; Fri, 27 Dec 2019 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=henki-fr.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=ApICwPSJTY8gnVeS2ZlKGrXdv72XBKwTXD9Z9AQgsSQ=;
 b=TJ+jRVzMtPq5xOLcPu1JOSK7CLjY8nD5pQ+Pb5RDt2/WhLfFS9MZdq+xKQ5pit9ET5
 ie3leO41dylatVwp7wMi36XnHt0nMtW+kbg3EURP/DuL7ZUiA7tsUXCaz/8KM92gAnOJ
 shNf5/0DSpgl5RTl11PBQTSdzkPwMQyhwA871lqXU9txsK47sHK/X9r31qEEkyiaRyQZ
 ezi7G9TCfjH9J/TV7pp2+gKsKtMVemxBSmwKntXsQRBoGns9bepANpTkVTYu3SZR+VOt
 hR1UQURJ8ul2XNe2tCin0gI/OzqQBXteQ2Tzfkr+w3utFmYCDVkt9J1WJccvMTl9X83n
 t5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=ApICwPSJTY8gnVeS2ZlKGrXdv72XBKwTXD9Z9AQgsSQ=;
 b=PjzyW4aI3iPLXf1cjX21YC1JitTFm90PIfDVNl7wOGjZUqCHVd5eN/4dA0ZNHkQtIR
 kK+UYaQCZI7lPp2+5JrMan0j59JnTnZwIMzyDmxAPjitOimRghNkfE345mHqRQmbnXcH
 zWgKfueGdtpELDxHJers6mVaq/Fn/B0fl6HUR2mm135gf2Oys6YxKqYG2qJjBlpSHy9p
 6Qsz3c3TCRJn5e2N1tvQiRDPgq5pw1fIfpToTLYpL52eWXsICJHSXBelxcbi0IIy/lke
 LPOBoQ19DUTsNqZKQQ4YL3UxteBuDEb8IEoUxw30lweYaCx8NYeB0o1per0nw2fCmuaW
 Ix7w==
X-Gm-Message-State: APjAAAV0/lSeG4a+boKZ6gvnLxOAjZMH5v8ZqJgMQ0x/BsLbjhX7Ww6R
 Kp7q3088NjxMYj3knAs1JUwB0g==
X-Google-Smtp-Source: APXvYqxjST9h2VWf7Lqq1Ku0e0TCVPju9fbETRYc9W0nMSa/FeQRborHvmiUFdRgZQKOgqZnixMFFw==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr20353796wmm.143.1577463019086; 
 Fri, 27 Dec 2019 08:10:19 -0800 (PST)
Received: from mbp-de-remi.home.mail
 (lfbn-poi-1-174-144.w86-233.abo.wanadoo.fr. [86.233.139.144])
 by smtp.gmail.com with ESMTPSA id e6sm34362279wru.44.2019.12.27.08.10.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Dec 2019 08:10:18 -0800 (PST)
Date: Fri, 27 Dec 2019 17:10:16 +0100
From: =?utf-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@henki.fr>
To: =?utf-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@henki.fr>, 
 "Jason A. Donenfeld" <jason@zx2c4.com>
Message-ID: <etPan.5e062ce8.71f7768f.7096@henki.fr>
In-Reply-To: <CAHmME9rKOd1rLygTtbho-vo85wQBGo5tQXdBrDvE-Fdk+r=_aw@mail.gmail.com>
References: <CA+jiYFD1SD-FgjgkwSTmkog1CYJYrEY87MKwD3StzAmmCJkn3w@mail.gmail.com>
 <CAHmME9rKOd1rLygTtbho-vo85wQBGo5tQXdBrDvE-Fdk+r=_aw@mail.gmail.com>
Subject: Re: MTU on wireguard-apple for IPv6
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 27 Dec 2019 17:39:54 +0100
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

TXkgcHJldmlvdXMgbWVzc2FnZSBtYXkgaGF2ZSBiZWVuIGxvc3QuCgo+IFByb2JhYmx5IHRoZSBw
aG9uZSdzIGRoY3Agc2VydmVyIGRvZXNuJ3QgcGFzcyB0aGUgcmlnaHQgTVRVIGJhY2sgdG/CoAo+
IHRoZSBjbGllbnQsIGJ1dCB0aGVuIHRoZSBwaG9uZSBkb2VzIHRoZSBtc3MtbXR1IGhhY2sgdG8g
Zml4IHVwIFRDUMKgCj4gY29ubmVjdGlvbnMuIFRoYXQgaGFjayBkb2Vzbid0IHdvcmsgd2hlbiB0
aGUgdHJhZmZpYyBpcyBlbmQtdG8tZW5kwqAKPiBlbmNyeXB0ZWQsIGFzIGlzIHRoZSBjYXNlIHdp
dGggV2lyZUd1YXJkLCBzbyBubyBzbWFsbGVyIE1TUyBpcyBldmVywqAKPiBuZWdvdGlhdGVkLsKg
CgpXb27igJl0IHRoaXMgc2l0dWF0aW9uIGhhcHBlbiBhIGxvdD8gU2hvdWxkIHdlIGZpeCB0aGUg
ZGVmYXVsdCBNVFUgdG8gMTI4MMKgCnRvIGF2b2lkIHVzZXJzIGhhdmluZyB0aGVpciB0dW5uZWwg
cmFuZG9tbHkgZmFpbCBvbiBzb21lIG5ldHdvcms/Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxp
c3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dp
cmVndWFyZAo=
