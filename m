Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E19FC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:33:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8DC2073B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lenstra-fr.20150623.gappssmtp.com header.i=@lenstra-fr.20150623.gappssmtp.com header.b="xEtEkOrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8DC2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lenstra.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd6c3743;
	Tue, 10 Dec 2019 16:33:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02aff5a5
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 15:46:31 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d3f325
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 15:46:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id b11so16008251wmj.4
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 07:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lenstra-fr.20150623.gappssmtp.com; s=20150623;
 h=from:in-reply-to:references:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=iYDz/DMghrwB8u6LaJPDj+viIPgooUlZml+9pJm5Me8=;
 b=xEtEkOrT2n/KMvMRiszRAm2tFLnwCq/tBmcLBSyDeTiQXkCJRum3AYJQKyDuietqgC
 RSXg1SNpGTO88LHrXMy3E56nmDh3En0hpMpCkzk6Qa5P1Nf4TNW+oQ5DgEziH/eD6ySN
 NCQrbrIiXvUKnDT6N7m3QAqu6U7v5TkZzUWC5VEN+lFzH/tF3ySVLQC40NuaL2WTHVVR
 EP9YXzksuUfLQEcjjrg7dvsLesHflOx5NxjhXYD8Ly6jSljgIJvUiXM+oH3QqH3xvkT0
 F2Z8Nw/0ts8DFecCdT+syPc3ag7My0ETdegXNvuGWTi6lPrrhLSTfjFO2QcOp0Bg6kwX
 qHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:in-reply-to:references:mime-version:date
 :message-id:subject:to:content-transfer-encoding;
 bh=iYDz/DMghrwB8u6LaJPDj+viIPgooUlZml+9pJm5Me8=;
 b=f4vQaEwlhFf1wFle6nAATHtyWBoantXp+68kGYfLRUF8f2Ma7bNMk5/BPo325DZZpw
 Uio79o8EJuftdU59ZVTxlA740UN0YU0wyWk6iFSmedWknZkRBrKO/xQ8ISb7M+UXmmVf
 VYO/l5Pl329n7ewyzl5yK7Kphfgbs/c33zDYUO2GF0vbT1RsRVx9Luj30qxPX14XYjJC
 8xTnm8sbNXaxobC14cRfou4x2OSuvp3/qSRD7+I1bF8XTBTPt8JlzrV+RUVYQEDs6BoN
 yXtREf120FfTDAiBmIwedx3meNp+xl4KfS8wTTXfOcUiZ3SjGyQ2T2uIHhwD3W60//Jr
 k4ZQ==
X-Gm-Message-State: APjAAAUSgrxJGC5lrPAOtUw55ebZEwq9gPkgoZ/Snm2zBvQSXBox0gb/
 fkwGLZNNeVHVfZ3/8/ie15sIkmxTWnBYQaJx1MAqdDzjb3k=
X-Google-Smtp-Source: APXvYqzaX2E8clQn1ng2xtZKBNfbnOHFyj+bC6tnktUeLAo/a1ldw0x/BFs0NnVpRe/Sc0lorWuEwxdwzQIaWGmyAIw=
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr25393476wml.40.1575906390696; 
 Mon, 09 Dec 2019 07:46:30 -0800 (PST)
Received: from 1058052472880 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Dec 2019 10:46:30 -0500
From: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@lenstra.fr>
In-Reply-To: <04a38f45-1043-0db5-6c76-2ee573fd71cf@malte-wetz.de>
References: <04a38f45-1043-0db5-6c76-2ee573fd71cf@malte-wetz.de>
MIME-Version: 1.0
Date: Mon, 9 Dec 2019 10:46:30 -0500
Message-ID: <CAFsReqRHg-+e0JocFyYBgvSGwbXDhEv=30iu-=eaN_AN2wC5RA@mail.gmail.com>
Subject: Re: Windows client: PostUp/PreDown possible?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 10 Dec 2019 17:33:26 +0100
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

TGUgOSBkw6ljZW1icmUgMjAxOSDDoCAxMjoxNTo0NSwgTWFyayBTY2htaWR0CihrbnVwcHNAZ214
LmRlKG1haWx0bzprbnVwcHNAZ214LmRlKSkgYSDDqWNyaXQ6Cgo+IEhlbGxvIQo+Cj4gSSBob3Bl
IEknbSBpbiB0aGUgcmlnaHQgcGxhY2UgdG8gYXNrIHRoaXMuCj4KPiBJJ20gdHJ5aW5nIHRvIGZh
bWlsaWFyaXNlIG15c2VsZiB3aXRoIFdpcmVndWFyZCwgYW5kIEkgbGlrZSBpdCBzbyBmYXIuCj4g
T25lIGlzc3VlIHRob3VnaDogVGhlIExpbnV4IHZlcnNpb24gaGFzIFBvc3RVcCBhbmQgUHJlRG93
biBvcHRpb25zIGluCj4gaXRzIGNvbmZpZ3VyYXRpb24gZmlsZXMuCj4KPiBJcyB0aGVyZSBzb21l
dGhpbmcgc2ltaWxhciBhdmFpbGFibGUgZm9yIHRoZSBXaW5kb3dzIGNsaWVudD8KCkhpLCB0aGlz
IGlzIHNvbWV0aGluZyB0aGF0IHdlIGhhdmUgYmVlbiBsb29raW5nIGZvciBpbiB0aGUgTWFjT1Mg
Y2xpZW50CnRvbywgd2Ugd291bGQgbGlrZSB0byBhZGQgMkZBIG9uIG91ciB0dW5uZWwgYW5kIGhh
dmluZyBhIHNjcmlwdCBzdGFydGVkCmluIFBvc3RVcCBhbmQga2lsbGVkIGluIFByZURvd24gd291
bGQgYmUgcGVyZmVjdCB0byBoYW5kbGUgdGhlIGV4dHJhCmF1dGhlbnRpY2F0aW9uLgoKUsOpbWkK
Cj4KPiBQUzogTm8gbmVlZCB0byBDQyBtZSwgSSBzdWJzY3JpYmVkIHRvIHRoZSBsaXN0Lgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gV2lyZUd1YXJk
IG1haWxpbmcgbGlzdAo+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPiBodHRwczovL2xpc3Rz
Lnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVH
dWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQK
