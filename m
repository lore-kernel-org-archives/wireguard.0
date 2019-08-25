Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1660C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFAB206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=jerde-org.20150623.gappssmtp.com header.i=@jerde-org.20150623.gappssmtp.com header.b="S+A9ycXu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EFAB206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jerde.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fb2a04e;
	Sun, 25 Aug 2019 19:23:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37b9bedf
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:17:31 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61d25a75
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:17:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id o9so32166032iom.3
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jerde-org.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=MitayfWb7qZxoWczyxpDQmmH5Sd4SzHjqfDD8jhMydk=;
 b=S+A9ycXuQuo2IqgDdQ324ryYg92wjpXVznDbeW4XGESd8koZZeSGSnqst3tQmMoTC4
 PNB9ys1npeX0Fj2xaQiCykGgckSywvUqDfS5T5kTBB1a+1dgK6eNmQmfLbwGcehxKG5Q
 Rba4PQKCtd6077/ymbFig7MNxuOru81oUGCA8m9pXhkWqadHuB5mj2SHA/YeQlrK58sg
 GtVoa0AiXnspmS9WdwvIG15zTuM+XEy2mLwObbY1x7gB9/0A7fgtXwFl6uszRxZNnHEI
 iuU4cMM3WwffYWQCSDeP4TQtXObHAk3HIAi2/nF55SxWGJoVnAb36/X2s7LhKHjAR4wM
 IQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=MitayfWb7qZxoWczyxpDQmmH5Sd4SzHjqfDD8jhMydk=;
 b=K4Qicvzk/Ecvfb7xkVxL6fJ2SUgbTV+XDevKsqH/p9tVrI/iOBWH1smpZTOBGr9y7f
 tEowSvJPWcCYp1BIWrdA6zEEhQzOLJE9HD9Stg2VmXdgdfIvLRjSeTy6G/TNKxJU9ClM
 vn/y588zzbr7szS2rCI0E8jcoDcU05XHH7BoY1W4jgs69qP4a0VSCCnPJ5Qb6Uk/yHxk
 HyDOSUIXau+I4pFFxzuCDIgvLTDZ/3LmwAAMBgkqnL1Gr2KYdCpwezrkIJaY07RDBo6V
 JE0WOj54AgdrT3fFkvtBQw9aJxO2FnGL9jmbY5VX/C58T2bS/0Xe6r9QbUM25wA87eYe
 ewRA==
X-Gm-Message-State: APjAAAUl2VkCS3dm92Xvjccnu3IfJ+jhwQaLEH9oUwlWpRjHAllEUoMN
 eHVl7m44rPMtPGwwIhlmrlPc9h0Q/S4=
X-Google-Smtp-Source: APXvYqy255D9FXP9lpnowIiYcdF2LjqOpHxmwcbT3tWf8JZ89oyfSLJzzkrmDHMgfv/HDw3PZhtwdA==
X-Received: by 2002:a02:942e:: with SMTP id a43mr14334506jai.56.1566760650635; 
 Sun, 25 Aug 2019 12:17:30 -0700 (PDT)
Received: from [10.0.1.102] ([207.153.4.66])
 by smtp.gmail.com with ESMTPSA id a21sm7922760ioe.27.2019.08.25.12.17.30
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 12:17:30 -0700 (PDT)
From: Erik Jerde <erik@jerde.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: Wireguard causes system to hang
Date: Sun, 25 Aug 2019 14:17:28 -0500
References: <CABPqyTY-KfjFenwKMWK7VHw_Kqv8ax8aW8tfjgJv8iHbX-vgYw@mail.gmail.com>
 <CAHmME9oqFzDF1YRuXiOybYFuG8mRZy7Wvy6dCQr+et5qqXfCJg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <CAHmME9oqFzDF1YRuXiOybYFuG8mRZy7Wvy6dCQr+et5qqXfCJg@mail.gmail.com>
Message-Id: <4B05D371-79C3-40A2-9A30-F1FE0989E604@jerde.org>
X-Mailer: Apple Mail (2.3445.104.8)
X-Mailman-Approved-At: Sun, 25 Aug 2019 21:23:11 +0200
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

SEkgSmFzb24sIHRoYW5rcyBmb3IgdGhlIGluZm8sIEnigJl2ZSBiZWVuIHRyb3VibGVzaG9vdGlu
ZyB0aGlzIHNhbWUgcHJvYmxlbSBvbiBteSBXaXJlR3VhcmQgVk0gd2hpY2ggaGFzIG1hZGUgaXQg
YSBiaXQgdHJpY2tpZXIuICBUaGUgaW5mbyB5b3UgcG9zdGVkIGNsZWFyZWQgdGhpbmdzIHVwIHJp
Z2h0IHF1aWNrIGZvciBtZS4gIERvIHlvdSBoYXBwZW4gdG8ga25vdyB3aGF0IG1pY3JvY29kZSB2
ZXJzaW9uIGZpeGVzIHRoaXMgaXNzdWU/ICBJ4oCZbSBvbiAweDEwMDAwNjUgcGVyIC9wcm9jL2Nw
dWluZm8gYnV0IEkgY2Fu4oCZdCBmaW5kIGFueSBpbmZvIG9uIGlmIHRoYXTigJlzIHRoZSDigJxm
aXhlZOKAnSB2ZXJzaW9uIG9yIG5vdC4gIEnigJltIHJ1bm5pbmcgbGF0ZXN0IEZXIGZvciBteSBt
b3RoZXJib2FyZCB3aGljaCBpcyBkYXRlZCA4LzcvMTkgKEFTUm9jayBSYWNrIFg0NzBENFUpLgoK
VGhhbmtzIQoKPiBPbiBBdWcgMjUsIDIwMTksIGF0IDEwOjUwIEFNLCBKYXNvbiBBLiBEb25lbmZl
bGQgPEphc29uQHp4MmM0LmNvbT4gd3JvdGU6Cj4gCj4gV2lyZUd1YXJkIHVzZXMgZ2V0X3JhbmRv
bV91MzIgd2hpY2ggdXNlcyByZHJhbmQuIEFNRCBzaGlwcGVkIHdpdGggYQo+IGJyb2tlbiByZHJh
bmQuIFVwZGF0ZSB5b3VyIENQVSdzIG1pY3JvY29kZSBvciB5b3VyIG1vdGhlcmJvYXJkJ3MgQklP
Uwo+IGFuZCBhbGwgc2hvdWxkIGJlIGdvb2QuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4gV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQo+IGh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGlu
Zm8vd2lyZWd1YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0
cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
