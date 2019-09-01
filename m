Return-Path: <SRS0=IF4l=W4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40999C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Sep 2019 08:10:54 +0000 (UTC)
Received: from krantz.zx2c4.com (unknown [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A852173E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Sep 2019 08:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g654hs/o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A852173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b72d831;
	Sun, 1 Sep 2019 08:10:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27a4e5b8
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 08:10:31 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba030ff6
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 08:10:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p13so11567853wmh.1
 for <wireguard@lists.zx2c4.com>; Sun, 01 Sep 2019 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BBwbHMq2m13BHFNL83RVFxQ52y29MvrMC6HMeVEdyqY=;
 b=g654hs/odhjSV49WxaxfPPqSvcG+nM69U3ON6q8GusFzm+FGeiS2U4/dIE9Zun+FbA
 kfVSCbehHrHKTf+CFxQC3pnqxWY08e9uEnQBKr+SRpL8l6J38ODv0tT7HZtaWkpxd3g0
 0nrUOvwvSdW89flSNa9JtSU6w1qTpQtmhFv5VOiGeJ+2DOWK514zPsnhkfG2/GiaG652
 4GxgcexTX/w862aZr3bpHyu2aomr03Pr/u2UoTkB4FhAoeAONRcitsOf+lkCT/dEIQvs
 Fm5DyUo/FDrS5M2NfYD7WSYu8rgc1e9kF9luOXYARZwaw70co2618fsSL59N6pX0QOkc
 BzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BBwbHMq2m13BHFNL83RVFxQ52y29MvrMC6HMeVEdyqY=;
 b=TWR48Osjf1d2XGcPaVoxy6/3mqDaQnBbx7iVufdMdavmzxWKyQyxrvTyuwV4nS8z06
 mElenPfkfCkmA5F2mt4f4uhD8Vpd1KADXVw2qOgxI28nB1rK02Wts7KOxeggviMk4viG
 70uOLXli01KzfEVhQ14H19sDUb3aFdpIj0bgaEYpUwVVOF45HNelhH5UlIZ/6S9WM0t4
 t1JCG2hTT5GEwNWEQ7MRTp+irCEucWZgcKV4Z9H0kIQXMDkjZCLWlkHg8Gc6YrfABv/7
 MhlcymGtXYSE6pKdYRFDpTcBeMFltL+++lnNxJPqTiNTjAP/1Zp5eAj6pHjiFiKr3aDn
 iTKA==
X-Gm-Message-State: APjAAAUlIQMhm1MshCFq/DFKUyKsTDGzGxDZ7u7u4AJS1NgdKWV1gSgq
 1dKd+MtvaPS2wbQJSdrdf/M=
X-Google-Smtp-Source: APXvYqyBzQOPU/92zNTswQpf6aowJXLDp3hcVAZwl/lXCHu50xQDFOTQNpZh0J/fuR6koQ3u+KFxOQ==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr29919857wmh.116.1567325429483; 
 Sun, 01 Sep 2019 01:10:29 -0700 (PDT)
Received: from [127.0.0.1] (158-58-217-180.dbr.ddns.bulsat.com.
 [158.58.217.180])
 by smtp.gmail.com with ESMTPSA id l9sm8831349wmi.29.2019.09.01.01.10.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Sep 2019 01:10:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Nonce in out-of-order messages
From: Hristo Georgiev <hristo.metal@gmail.com>
In-Reply-To: <CAHmME9rPiyV73jUF9p=nQ+_8JswON1usWbOKpaT6SavsOokpdA@mail.gmail.com>
Date: Sun, 1 Sep 2019 11:10:27 +0300
Message-Id: <A87199A2-CE44-4B4A-8843-ABD0085D77BE@gmail.com>
References: <E6BE60A6-0A9F-4A45-9FCE-155410ECDC6F@gmail.com>
 <CAHmME9rPiyV73jUF9p=nQ+_8JswON1usWbOKpaT6SavsOokpdA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
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

VGhhbmsgeW91IGZvciB0aGUgYW5zd2VyIEphc29uLCBJIGFwcHJlY2lhdGUgeW91ciB0aW1lIGFu
ZCBleGNlbGxlbnQgd29yay4KQWZ0ZXIgZGVlcCBkaXZlIEnigJl2ZSBmb3VuZCB0cmFuc3BvcnQg
bWVzc2FnZXMgYW5kIFJGQzY0NzkgcmVwbGF5IGRldGVjdGlvbiBpbXBsZW1lbnRhdGlvbi4KCkNo
ZWVycywKSHJpc3RvCgo+IE9uIDI1IEF1ZyAyMDE5LCBhdCAxODo1NiwgSmFzb24gQS4gRG9uZW5m
ZWxkIDxKYXNvbkB6eDJjNC5jb20+IHdyb3RlOgo+IAo+IE9uIFN1biwgQXVnIDI1LCAyMDE5IGF0
IDk6MzYgQU0gSHJpc3RvIEdlb3JnaWV2IDxocmlzdG8ubWV0YWxAZ21haWwuY29tPiB3cm90ZToK
Pj4gCj4+IEhlbGxvCj4+IEnigJltIHdvcmtpbmcgb24gZmlsZSB0cmFuc2ZlciBwcm90b2NvbCBp
bnNwaXJlZCBieSBOb2lzZSBhbmQgV2lyZWd1YXJkIG92ZXIgVURQICB3aXRoIHN0YXRpYyBrZXlz
IHNvIHRoZSBoYW5kc2hha2UgcGF0dGVybiBpcyBnb2luZyB0byBiZSBOb2lzZV9JS18yNTUxOV9D
aGFDaGFQb2x5X0JMQUtFMnMgIG9yIEtLLiBJbiBnZW5lcmFsIGnigJltIHRyeWluZyB0byBmb2xs
b3cgTm9pc2VTb2NrZXQgc3BlYyBidXQgYWRhcHRlZCB0byBVRFAgYW5kIGkgd2FzIHdvbmRlcmlu
ZyB3aGVyZSB0byBwbGFjZSB0aGUg4oCYbm9uY2XigJkgaW50byBwYWNrZXQgdG8gZXh0ZW5kIHRo
ZSBwcm90b2NvbCBhcyBkZXNjcmliZWQgaW50byBwLjExLjQgaW4gTm9pc2VQcm90b2NvbCBzcGVj
IGh0dHA6Ly93d3cubm9pc2Vwcm90b2NvbC5vcmcvbm9pc2UuaHRtbCNvdXQtb2Ytb3JkZXItdHJh
bnNwb3J0LW1lc3NhZ2VzIC4gIFNvIEkgaGFkIGEgbG9vayBpbnRvIFdpcmVHdWFyZCBpbXBsZW1l
bnRhdGlvbiAod2hpY2ggSSB1c2UgYSBsb3QgaW4gbXVsdGlwbGUgc2l0ZXMsIG1vc3RseSBvbiBF
ZGdlUm91dGVycykKPj4gc28gd2hhdCBpIGZvdW5kIGluIG5vaXNlLmMgbGluZSA0NDUgbWVzc2Fn
ZV9kZWNyeXB0Ogo+PiAKPj4gY2hhY2hhMjBwb2x5MTMwNV9kZWNyeXB0KGRzdF9wbGFpbnRleHQs
IHNyY19jaXBoZXJ0ZXh0LCBzcmNfbGVuLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaGFzaCwgTk9JU0VfSEFTSF9MRU4sCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwIC8qIEFsd2F5cyB6ZXJvIGZvciBOb2lzZV9JSyAqLywga2V5KSkKPj4g
Cj4+IENvcnJlY3QgbWUgaWYgSeKAmW0gbWlzdGFrZW4sIEnigJltIG5vdCBDIHByb2dyYW1lciBu
b3IgY3J5cHRvZ3JhcGhlciwgSSB0aGluayB0aGlzIHplcm8gaGVyZSBpcyB0aGUgTm9uY2UuIElm
IHRoYXTigJlzIHRoZSBjYXNlIHdoYXQgc2VjdXJpdHkgc2FjcmlmaWNlcyBhbmQgdGhlIGNoYW5j
ZSBmb3IgcmVwbGF5IGF0dGFja3MgYXJlPwo+PiBXb3VsZCBpdCBiZSBPayBpZiBJIGFsc28gaGFy
ZGNvZGUgdGhlIE5vbmNlIHRvIDAgaW4gbXkgaW1wbGVtZW50YXRpb24/Cj4gCj4gVGhpcyBpc24n
dCB0aGUgbm9uY2UgdXNlZCBhcyBwYXJ0IG9mIHRoZSB0cmFuc3BvcnQgb2JqZWN0LCBidXQgcmF0
aGVyCj4gYSBzaW5nbGUgZW5jcnlwdGlvbi9kZWNyeXB0aW9uIHRoYXQgaGFwcGVucyB3aXRoIGEg
dW5pcXVlIGtleSBhcyBwYXJ0Cj4gb2YgdGhlIGhhbmRzaGFrZS4gSXQgYmVpbmcgemVybyBpcyBh
IG5hdHVyYWwgY29uc2VxdWVuY2Ugb2YgdGhlCj4gcHJvdG9jb2wgZmxvdy4KPiAKPiBEb24ndCBo
YXJkY29kZSBhIHplcm8gbm9uY2UgaW4gdHJhbnNwb3J0IG1lc3NhZ2VzLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlz
dApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxt
YW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
