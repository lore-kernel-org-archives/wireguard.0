Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F02C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:35:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7095C20830
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u3onNaG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7095C20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f7c670e;
	Wed, 20 Mar 2019 22:35:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db20d503
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 13:24:31 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52e3fcf8
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 13:24:31 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id p10so1944561pff.3
 for <wireguard@lists.zx2c4.com>; Wed, 20 Mar 2019 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=Dh1I7WvXPBTudgGZf2FnxLrQqD0bhaWJPk2RFktn1bA=;
 b=u3onNaG8W7T3IzXWzkpnKv5HpmHN/dbQFqwb7QA91Fg+f2y++APgVvpXPhQciOQNCT
 /dSmVz8xSShzrth61MskyW9sFhtkz0uP0FlnUokMsj8g60WCh+1AThSBCTnc2c2ZtGP2
 GE7B+1p3hVwn4IPiZSM42gfemfdJbZv1RDrnu/B5/WZDQHzflpL9LX9WbJ0P3vMleg5p
 Ls44H5m4EowyMt7FQB7EFYvjDMH7BGhBAQ3Pxus6C3rBIePTQWuu686EPB1SPT940wTt
 hgG3O/wRtvLqWVnYOz5hzRUBNxiFzJwv1D/tAtqBURiZwWAtiD01KWCucHgEMDb5ZKZo
 6bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=Dh1I7WvXPBTudgGZf2FnxLrQqD0bhaWJPk2RFktn1bA=;
 b=rJ7NK4z2brr9dWZyKcaW+ZK9NnUAgrHuy0LIKC6PCOskNAj6s30CpDlpqaIwvCbBw9
 JEsNR2UdJ7Uxmv5OGXcZ/uBtkLd5ppaUxrHJbzx4ILCyQNZay09MKMVKHuZP5wxSOqbP
 HHa4wDTB3VhF5v+S9c5fPV9yk54Bgeu96siwYrost7ybACeZeYX3nVB+vj4pOxPZO8A6
 rotEr5CYcnELi/IuXK2AmyVmr2V7AyltfSSw3orAmSUzPkiEAqr9oeyPnIpKz/igqNX5
 hmmqIFvWWc05Xj3xSd8t+hCm9y4ENzUwOwX5YP1iE3smdTZG8x7C4z26lL0YN4dnzsyC
 WhmA==
X-Gm-Message-State: APjAAAV+SehQ0vat4YiTuRuuXujWMdp6YDy/QfMYJvpqMtOFjKnOjF4v
 SoRMr23kT1vEQXtTZPdtl53kn5p+W1Q=
X-Google-Smtp-Source: APXvYqwYgRdrMwUrahFBdkba7Be/AAAQCKi0hhc/uXKSjx63cBIdqzHJU6FwP7QauchVis2Kmf39zg==
X-Received: by 2002:a63:66c1:: with SMTP id a184mr7500864pgc.60.1553088287938; 
 Wed, 20 Mar 2019 06:24:47 -0700 (PDT)
Received: from [10.0.0.2] (97.64.24.221.16clouds.com. [97.64.24.221])
 by smtp.gmail.com with ESMTPSA id o3sm2521631pgv.50.2019.03.20.06.24.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 06:24:47 -0700 (PDT)
From: Glen Huang <hey.hgl@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: iOS connection issue
Message-Id: <ACFCE3B4-A20B-410B-9C9B-C4DD384A997C@gmail.com>
Date: Wed, 20 Mar 2019 21:24:43 +0800
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:35:33 +0100
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
