Return-Path: <SRS0=Pzr+=4M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE6AC35671
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Feb 2020 14:03:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDDF205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Feb 2020 14:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnloZJFG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEDDF205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 168fadb6;
	Mon, 24 Feb 2020 13:59:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c0ef363
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:59:52 +0000 (UTC)
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a32b4612
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:59:52 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id o187so2510227vka.2
 for <wireguard@lists.zx2c4.com>; Mon, 24 Feb 2020 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qcFFrcHCYVbgC1frDmkLziG0BStYVK2ULKsyLnzEiig=;
 b=YnloZJFG8rc0CiABz7Hql/VnxkxD5ViMe7ShfOByQoP7UT1qJPyJmxI2yy6ILFXnp7
 8d+1IgAAH1+HqXcMDRqvmH86s1o4zTIWirVqQeuhlBVsHE6Ccb4yq2VeCJUc1m1K863N
 F9cYvGk+yD9OUpRaWhYVW6Huesz3BXbbBDuwVeyjFswDSHcFaKaCgY8jXMSrd+j+9PWU
 CJkqcrylQ/WzEtBkgyQ229pcJY6YdCEQQBvJ49XuRWdjF8Z0QaTjpxn3keGfvu0/w0IW
 QbT1pdZ1xYeKGU6x8Ia2hDrYUvLoI0I95o1oq3f0z/c1OZlO6xeTu70XngmeDPoJEJW+
 whcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qcFFrcHCYVbgC1frDmkLziG0BStYVK2ULKsyLnzEiig=;
 b=qVWT6W8g3gc+3/U/c+vwN+x7gSu07ObQ3mOLcglnMreYVjsWp2JN2n4hRnKhblugU6
 orDp1N18k3vpULtlRUjgEY97ZR8gBzvfwqmoSaa7fC3FW8wZXPjEh/lCPzdHDuaxpmIU
 6bz5f4tzLSBYHf777doJ/u/Y29c7sP4s7O+zhSfnVPkC2tsl22pdsLAafJM592h/S2+B
 aes34iI7hgdKlWg63L51qjZofh4ReM1082o+lvi4s6xzM29RUv6aqQwFzja8whHn4xuG
 1EPhtxglh7yiEee1sM3dnD2oQrlAs7pX3+UhyV5ZR1q20+3Dnb2psZcq3sM26Pjzx0B0
 IuQw==
X-Gm-Message-State: APjAAAWB5B2If0lENZ21WFVNW/eBpayDYHypwT2QcjT7q+v1F2smMvA8
 v3u5vHai3chcbSpySt8jzuj6oBS2uFUOsnqmfewcoS6Wwoj7MQ==
X-Google-Smtp-Source: APXvYqy5PciXX+iY5e5IHF8Q2MI55ZonUND9SIeflyc9Wye+eeqeox1vfvWDkva6wj3/VhlWTFzScWMXecYnSMF+HvE=
X-Received: by 2002:a1f:aa90:: with SMTP id t138mr22793094vke.83.1582552994965; 
 Mon, 24 Feb 2020 06:03:14 -0800 (PST)
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
 <CAA2ss9FaHPH7achZkZ2i+RazeVjPW=SSCfe3DBj3NP-v-vcB2Q@mail.gmail.com>
 <CAHmME9pX8Puz0WUHyK6gcNJDK7j09t7RpzsN+z43EgrObmSREQ@mail.gmail.com>
In-Reply-To: <CAHmME9pX8Puz0WUHyK6gcNJDK7j09t7RpzsN+z43EgrObmSREQ@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Mon, 24 Feb 2020 23:03:04 +0900
Message-ID: <CAA2ss9HAHOQ0QFWxzBB9f0xgN_b7cs8PzpEvcco5_4wjUXwjzQ@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

T0ssCkkgd2lsbCB1c2UgYGdpdCBmb3JtYXQtcGF0Y2hgIGFuZCBgZ2l0IHNlbmQtZW1haWxgLgoK
MjAyMOW5tDLmnIgyNOaXpSjmnIgpIDIyOjU5IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25Aengy
YzQuY29tPjoKPgo+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDk6NTcgUE0gRWlqaSBUYW5pb2th
IDx0YW5pb2thNDA0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gVGhhbmsg
eW91IGZvciB0aGUgaW5zdHJ1Y3Rpb24uCj4gPiBZZXMsIEphcGFuZXNlIGRvZXNuJ3QgaGF2ZSBw
bHVyYWwuIEkgd2lsbCB1c2UgdGhpcyBmaWxlLgo+ID4KPiA+IFdoZW4gZmluaXNoZWQsIEkgd2ls
bCBzZW5kICJyZXNvdXJjZXMucmMiIGFuZCAibWVzc2FnZXMuZ290ZXh0Lmpzb24iIHRvIHlvdS4K
PiA+IFdoaWNoIHN0eWxlIGRvIHlvdSBwcmVmZXI/ICJnaXQgZm9ybWF0LXBhdGNoIiBvciAiYXR0
YWNobWVudCI/Cj4KPiBQbGVhc2UgYXZvaWQgc2VuZGluZyBhdHRhY2htZW50cyB0byB0aGUgbWFp
bGluZyBsaXN0LCBhbmQgcmF0aGVyIHVzZQo+IGBnaXQgZm9ybWF0LXBhdGNoYCBhbmQgYGdpdCBz
ZW5kLWVtYWlsYC4KPgo+IFRoYW5rcyBhIGJ1bmNoIGZvciBkb2luZyB0aGlzLiBJdCdzIHZlcnkg
YXBwcmVjaWF0ZWQgd29yay4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29t
Cmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
