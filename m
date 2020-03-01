Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A1AC3F2D7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4C220870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lenstra-fr.20150623.gappssmtp.com header.i=@lenstra-fr.20150623.gappssmtp.com header.b="VfEruux4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC4C220870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lenstra.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 922f5724;
	Tue, 3 Mar 2020 23:08:48 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d58be7
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 12:07:06 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e10so7514684wrr.10
 for <wireguard@lists.zx2c4.com>; Sun, 01 Mar 2020 04:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lenstra-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sKVTY25LRuk4pZ9cKKA4XZwit/gdeD+YMKMDPsukWdM=;
 b=VfEruux4p1wlp3xuPu3ZL2qRO5pTDNFScvgvOSPfzCy0nmznYgEyuaIrRK+liccwKS
 xz//TqCcttJI56PwlOsOFw+DgcB+Qg6aPr9MOy8bHjmzB4Pv89YRV/3c6iX8D8a+sEsj
 mVBsYrRHRnf/qzA+c7mi9hf+i4AagjLlYO74Qsw4ZWcm8GNHd2jVzOLQufdBDUxOW2fo
 rvhXiKg2wRhV/zoydxNnKd7EitdHj6wjMITWuVXnKw5RswEjHKs5AUDrUAjHKUy9uoMI
 A6jlKhIRwabF1f8Wgnzq2K6ixe0YLF60RZrBtq2Ucra4BZMcmYeWKCVUMWP8DugEhvia
 A9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sKVTY25LRuk4pZ9cKKA4XZwit/gdeD+YMKMDPsukWdM=;
 b=JeG0zGGp8ConVZtZhm45/NGUg9riseMalKVgCO1cIkx6QX7+t/LF2P7RXfP8px/QfI
 kNS30S/ghx89c5tCi4TSAAQPbXB/DNQd8xQ4Iy4X2eRWaiGRjKYb4xMkp4Qn5n3zj3VK
 5kicfh/qQ0Ma+UJAmZZJ+1oB18eNa9RScX9hUPgLV05P6e/weAAf52nNBxbpGH7tZrwy
 bnzQmJZoitQG3nrCb6zjbDpPh+mlktBvOjq6zPXrEx7kGTR0rE6732KMSZ0MeYzJHO1F
 pf/c39LAo1K87bzl+ZxurJ9ISWz5rGqnbj56SpDJA6Iga5a5aZWTJZCWeskxs7DlBC8V
 GbRw==
X-Gm-Message-State: ANhLgQ0fUjGwY7pd/i+tDPeABlL/zJIQZ+HaMkECj0h8oQ2/vUwz6VH/
 UJesf6M+Kt1EnC1uUJptNbTSQg==
X-Google-Smtp-Source: ADFU+vvgDf59xrSjqRlx9qshBSckXWo6m59fjFi9Xty33mnKPxFaqDTnGMacdRCoafjjPFexSUOHrw==
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr823032wrr.394.1583064673515;
 Sun, 01 Mar 2020 04:11:13 -0800 (PST)
Received: from [192.168.1.27] (62.190.24.109.rev.sfr.net. [109.24.190.62])
 by smtp.gmail.com with ESMTPSA id x15sm9015593wmc.20.2020.03.01.04.11.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Mar 2020 04:11:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: macOS Catalina failing https
From: =?utf-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@lenstra.fr>
In-Reply-To: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
Date: Sun, 1 Mar 2020 13:11:12 +0100
Message-Id: <1229590D-91CE-4464-AA8F-B6320D159AF7@lenstra.fr>
References: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
To: Sean Baildon <sean@baildon.co>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:45 +0100
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

Cgo+IExlIDI3IGbDqXZyLiAyMDIwIMOgIDE3OjQ2LCBTZWFuIEJhaWxkb24gPHNlYW5AYmFpbGRv
bi5jbz4gYSDDqWNyaXQgOgo+IAo+IEhleSwKPiAKPiBSZWNlbnRseSBwdXJjaGFzZWQgYW5kIHVw
Z3JhZGVkIGEgbmV3IE1CUCB0byBDYXRhbGluYS4KPiAKPiBSZXF1ZXN0cyB0byBodHRwcyBlbmFi
bGVkIHNpdGVzIG92ZXIgdGhlIFZQTiBubyBsb25nZXIgd29yaywgZXZlbgo+IHVzaW5nIG15IG9s
ZCBjb25maWd1cmF0aW9uLiBSZXF1ZXN0cyB0byBpbnNlY3VyZSBzaXRlc+KAlGV4Lgo+IGh0dHA6
Ly9leGFtcGxlLmNvbeKAlHdvcmsganVzdCBmaW5lLgo+IAo+IE15IGlPUyBkZXZpY2VzIHdvcmsg
YXMgZXhwZWN0ZWQuIEkndmUgdHJpZWQgdXNpbmcgdGhlIGlPUwo+IGNvbmZpZ3VyYXRpb25zIG9u
IHRoZSBsYXB0b3AsIGJ1dCBpdCdzIHRoZSBzYW1lIGJlaGF2aW91cjsgaGFuZ2luZy4KPiAKPiBJ
J20gdXNpbmcgdGhlIE1hYyBBcHAgU3RvcmUgdmVyc2lvbiBvZiB3aXJlZ3VhcmQgb24gYSB2YW5p
bGxhIGluc3RhbGwKPiBvZiBtYWNPUyBDYXRhbGluYS4gQXJlIHRoZXJlIGFueSBrbm93biBpc3N1
ZXM/IEhhcHB5IHRvIHByb3ZpZGUgYW55Cj4gdXNlZnVsIGRlYnVnCgpUaGlzIGxvb2tzIGxpa2Ug
d2hhdCBzb21lIG9mIG91ciB1c2VycyBzYXcgaW4gc29tZSBuZXR3b3JrLiBJdCBtYXkgYmUgdW5y
ZWxhdGVkIGJ1dCAKY2FuIHlvdSB0cnkgYWRkaW5nICJNVFUgPSAxMjAwIiAgaW4geW91ciBjb25m
aWd1cmF0aW9uPwoKPiBUaGFua3MsCj4gU2Vhbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gV2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+IFdpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KPiBodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3dpcmVndWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0
dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
