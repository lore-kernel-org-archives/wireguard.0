Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA23C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 08:56:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9408820823
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 08:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="V80dZQM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9408820823
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad66fd53;
	Mon, 19 Nov 2018 08:50:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d664b82
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 08:50:03 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 477c7d98
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6eK1l4Tbn03uY+vLF5KrpdyaemGPwwbRdkWho4nENnM=; b=V80dZQM6bduRQYKcmfMpI36TaB
 t74798VBKGzeUBaTF6XsmDWMv4qvF1CoD7gkE+7+ZrfZo5fxFUxCe8PKvowadR8AlGFf0s5rWYWPw
 mWEti7updHzvGMhPJIwbolOr/tNSgp5vJjGZMRxghJR3QITTPXG9Xari+DleT6sz5l1TIrycCe15p
 T2O4ef/nJ3H0anEM47fmR5X2eRJrwXB1C1CAEZxqux5CbMidFrah+PqAtES+h0w71Z6X4TwZOvCzC
 WKG2yVUvgZFadz0MgyxEofRjCwf4e+wo6rKSzMX9q0ofQRh9EfEAftdcT2cPv6aiSjcvFpVIZgHww
 LPHzyIawQO7E7tefX/7wcP6B2vx+QiVGx8kscNLTLxDrmPS/uoBtFQ8PVbbut3nqjLc/JiuD8WJrN
 S6hRzfm2h36MzLZtkpcoEhPjzZEjaclyJzF1+3SvNduQMWM5/6D9xlnd0n9fDhSIv6P1bH42aGnDb
 JHBQTaBU/hKMWnELxtklvFwXIa1pdePbawGijzr49WaQOZ+dwt/nCKEWueAsryqKNpyc+X0v2KR3H
 hy+DyRzx4pWg/lns7a2MWDc9wLwHlbWBMUi611tn9EEtAybm3v8gK7h5O412IMy8yC7/mXk1DGQQs
 BjBdU3S2LgtT0XU6F09Ai62CYvyP6n4WPBnkaFfkc=;
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1gOfKJ-000MC6-Ax
 for wireguard@lists.zx2c4.com; Mon, 19 Nov 2018 09:54:39 +0100
Subject: Re: Traffic on port 53 fails on LTE but works on WiFi
To: wireguard@lists.zx2c4.com
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
 <1542611942.d09p50zvb2.astroid@morple.none>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <69b87340-f599-454a-3c46-7a153767e400@urlichs.de>
Date: Mon, 19 Nov 2018 09:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542611942.d09p50zvb2.astroid@morple.none>
Content-Language: de-CH
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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

T24gMTkuMTEuMTggMDg6MzIsIE0uIERpZXRyaWNoIHdyb3RlOgo+IFZvZGFmb25lIGJsb2NrcyBV
RFAgdHJhZmZpYyBvbiBwb3J0IDUzIGluIExURS4KVGhleSBkb24ndCBibG9jayBpdCDigJMgdGhl
eSByZWRpcmVjdCBpdCB0byB0aGVpciBETlMgcHJveHkuCj4gbm90IGV2ZW4gdGhlIGhhbmRzaGFr
ZSBnb2VzIHRocm91Z2guIE5vdCBzdXJlIGFib3V0IHRoZSBjYXVzZQo+IGZvciB0aGF0LCBtYXli
ZSB0aGV5IHdhbnQgdG8gY29udHJvbCB5b3VyIEROUyB0aGF0IHdheS4KClJlZGlyZWN0aW5nIHBv
cnQgNTMgdG8gdGhlaXIgRE5TIChwcmVzdW1hYmx5IG9uZSBjbG9zZSB0byB0aGVpciBMVEUKZW5k
cG9pbnQpIGlzIHJlYXNvbmFibGUsIHRoYXQgc2hvdWxkIGltcHJvdmUgc3BlZWQuCgpUaGUgcmVh
c29uIHRoZXNlIHByb3ZpZGVycyBibG9jayBVRFAgYWx0b2dldGhlciBpcyBzaW1wbGUg4oCTIFAy
UCBmaWxlCnNoYXJpbmcgYW5kIHNpbWlsYXIgc2hlbmFuaWdhbnMuCgpJcyB0aGF0IGNvbXBsZXRl
IGJsb2NrIGluIHRoZSB0ZXJtcytjb25kaXRpb25zPyBJZiBub3QsIGFubm95IHRoZWlyIHN1cHBv
cnQuCgotLSAKLS0gTWF0dGhpYXMgVXJsaWNocwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlz
dHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCg==
