Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8248DC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:07:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE71218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md20/EKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE71218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f69951ea;
	Sat, 23 Mar 2019 00:06:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a28845c
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 13:26:20 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d79d66be
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 13:26:20 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id a22so1780915pgg.13
 for <wireguard@lists.zx2c4.com>; Wed, 20 Mar 2019 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:content-transfer-encoding:mime-version:subject
 :message-id:date:to;
 bh=Dh1I7WvXPBTudgGZf2FnxLrQqD0bhaWJPk2RFktn1bA=;
 b=md20/EKfAoZ0cXC5FuPX2yQ0QVM1T2D6mlXC9BsmIbMfdl8oLry1kBux3VoUEHO1Y2
 TcB/nFIvwM1iKdXjjhCNl7Ny4dpweirCTHq1jPaQE09MYf4cb4xIBWN30azrugn1kcSf
 mCHuuyxCfXbCsM81ukBacO4TjLIlyzSLwB4FzKLmQA0wOVm243rP5ZwXYmqS+XtP/kn+
 LV6ZD5mEfiI/ynjwu3cxFMwwzPGpFpl0k3nOllWPNnq/FAcIy1I+M98813fyTmmBgkFB
 SkW3jVF32LvWbcSAGAKx3yOsW210c+SiMM7IlMxYrhFXvRaPQwTsZd6wfj0MYLdXVfcg
 wyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:content-transfer-encoding
 :mime-version:subject:message-id:date:to;
 bh=Dh1I7WvXPBTudgGZf2FnxLrQqD0bhaWJPk2RFktn1bA=;
 b=RFF42KuMZPTraPnsPfhKOuuov/+9m7Rvo0Ru5j8LW8Cb/fxTSPTqGxHYjj5GxlVLmn
 R5IQ0MMpZAdbYbWT+xAvXmTiG3qNJAEHbyyum4oc4B1AsuQ6QHda4tBWBh1Ntq4Y3iKe
 hz87IztCmpSVMqb9tJYf6kaBuEC5so4WJURO+tmdhEYY3xpuTg1Yc1zz1hN4IItcT3IW
 qJ73EL1rGJ6ERGvdlt+mge5BzmdjbTZFahkXiIgUMgBcAlWv+JGZtdyfWG/gvBcj9jTb
 Fa0OZkxdGjGoxcqTMFWuqrYUtNKEj8Wfa8UZv0uUsoVoa0LlO2TxDl1uNEA2rYeuXdHN
 sdQg==
X-Gm-Message-State: APjAAAUATGoTqSeWckRj/x8xissY1wB8p6qwKPoY2Oa0vkU9Xpy8BOkC
 6YsG22ORvBob54NEy6QyaeBgyTcKBpQ=
X-Google-Smtp-Source: APXvYqyQrgT1Z7HtFFER0U8+xa2V6W1037awSBfAXkf6Lzke9wPUmklu1yFN+qwWuKWLTAQh6qj8Cw==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr8463612plo.129.1553088397587; 
 Wed, 20 Mar 2019 06:26:37 -0700 (PDT)
Received: from [10.0.0.2] (97.64.24.221.16clouds.com. [97.64.24.221])
 by smtp.gmail.com with ESMTPSA id i5sm2591627pfd.16.2019.03.20.06.26.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 06:26:37 -0700 (PDT)
From: Glen Huang <heyhgl@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: iOS connection issue
Message-Id: <85F5D5B7-252B-431D-9B24-DDB30DD36A8B@gmail.com>
Date: Wed, 20 Mar 2019 21:26:33 +0800
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:06:29 +0100
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

SGksCgpJIGNhbiBjb25uZWN0IHRvIG15IHdnIHNlcnZlciBvbiBteSBNYWMgd2l0aCB0aGlzIGNv
bmZpZwoKW0ludGVyZmFjZV0KQWRkcmVzcyA9IDEwLjAuMC4yCkROUyA9IDguOC44LjgKUHJpdmF0
ZUtleSA9IDx2YWx1ZT4KCltQZWVyXQpFbmRwb2ludCA9IDxpcD46PHBvcnQ+ClB1YmxpY0tleSA9
IDx2YWx1ZT4KQWxsb3dlZElQcyA9IDAuMC4wLjAvMCwgOjovMAoKQnV0IG9uY2UgdXBsb2FkIGl0
IGFzIHFyIGNvZGUgdG8gbXkgaVBob25lLCBJIGNhbiBlc3RhYmxpc2ggdGhlIHZwbiBjb25uZWN0
aW9uLCBidXQgY2FuIG5vdCBhY2Nlc3MgYW55IHdlYnNpdGVzLgoKRnJvbSB0aGUgR2VuZXJhbCBW
UE4gaW5mbywgaXQgc2F5cyB0aGUgc2VydmVyIGFkZHJlc3MgaXMgMTI3LjAuMC4xLCB3aGljaCBk
b2VzbuKAmXQgc291bmQgcmlnaHQuCgpPbmUgc3RyYW5nZSB0aGluZyBpcyB0aGF0IGlmIEkgY2hh
bmdlIHRoZSBlbmRwb2ludOKAmXMgaXAgdG8gYSBjb3VwbGUgYXJiaXRyYXJ5IG9uZXMsIEkgY2Fu
IHN0aWxsIGVzdGFibGlzaCB2cG4gY29ubmVjdGlvbnMsIGJ1dCBjYW4gbm90IGFjY2VzcyBhbnkg
d2Vic2l0ZXMgYW5kIHNlcnZlciBhZGRyZXNzIGlzIDEyNy4wLjAuMSwgc2FtZSByZXN1bHQgYXMg
bXkgY29uZmlnLgoKQWxzbyBhZnRlciBJIHNjYW4gdGhlIHFyIGNvZGUgYW5kIHRoZSBWUE4gcHJv
ZmlsZSBpcyBhZGRlZCwgaVBob25lIHdpbGwgYWxlcnQgYW4gZXJyb3Igc2F5aW5nIHRoZSB2cG4g
c2VydmVyIGNvdWxkIG5vdCBiZSBmb3VuZCwgYnV0IGlmIEkgZGlzbWlzcyBJIGNhbiBlc3RhYmxp
c2ggdGhlIGNvbm5lY3Rpb24gKGFuZCBjb3VsZG7igJl0IGFjY2VzcyBhbnkgc2l0ZSkuCgpJIHdv
bmRlciB3aGF0IEkgbWlnaHQgaGF2ZSBkb25lIHdyb25nPwoKVGhhbmtzLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0
CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1h
bi9saXN0aW5mby93aXJlZ3VhcmQK
