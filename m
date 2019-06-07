Return-Path: <SRS0=ogfi=UG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03931C2BCA1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jun 2019 22:20:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A2120840
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jun 2019 22:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="pDoNSPdH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A2120840
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ca8ae4c;
	Fri, 7 Jun 2019 22:20:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91ac02fe
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 22:20:33 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18dc1830
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 22:20:33 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1559946031; bh=ecpLwzyq2ccRfMJsia7sSewzTfSZuB95muqYYIfQfmc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pDoNSPdHzTHJQ54QISD86AgHudiYDMs9ElYfXqJ7f5p8bWM9C8we3Ai2yfJvzCADl
 6zWt5mfFKCtcZyI1v6/kxKlnjTqqdWwMEBuqqt+diduNgPjUilc5pUs2VVpEYfAI1u
 YJfT+i3QGCtB1SSLmWUoVRhrEkgGyxfU7wGDMcUcmbNQ/OcsK1WMxDvlQ3ZQjSchO+
 pyHZMR0m9sGtE68tuijAnZ7vLKtIbhSdcqYeyC5q/ZrGEfp979T7RYrIqmnnu2vuDn
 t/tDDbOYDe1yKtYi6zWJKFccQmLKQH8YvA7vLpveI/rbbQyK5X0vKrhCLLrKLJ0dOg
 SecudsyF/ILww==
To: Ondrej Zajicek <santiago@crfreenet.org>, Janne =?utf-8?Q?He=C3=9F?=
 <janne@hess.ooo>
Subject: Re: Introduce Wireguard support to bird
In-Reply-To: <20190607215759.GC20970@feanor.crfreenet.org>
References: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
 <20190607215759.GC20970@feanor.crfreenet.org>
Date: Sat, 08 Jun 2019 00:20:31 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87muit5974.fsf@toke.dk>
MIME-Version: 1.0
Cc: bird-users@network.cz, wireguard@lists.zx2c4.com
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

T25kcmVqIFphamljZWsgPHNhbnRpYWdvQGNyZnJlZW5ldC5vcmc+IHdyaXRlczoKCj4gT24gRnJp
LCBKdW4gMDcsIDIwMTkgYXQgMDY6MjE6NDJQTSArMDAwMCwgSmFubmUgSGXDnyB3cm90ZToKPj4g
SGV5IGV2ZXJ5b25lLAo+PiAKPj4gYXMgYWR2ZXJ0aXNlZCwgSSBoYXZlIGNvbXBsZXRlZCB0aGUg
V2lyZWd1YXJkIHN1cHBvcnQuCj4+IFlvdSBtaWdodCBzZWUgdGhhdCBJIGFtIG5vdCByZWFsbHkg
YSBDIGV4cGVydCwgYnV0IEkgaG9wZSB0aGUgY29kZSBpcyBnb29kIGVub3VnaC4KPj4gSWYgeW91
IG5lZWQgbWUgdG8gY2hhbmdlIGFueXRoaW5nIG9yIGhhdmUgYWRkaXRpb25hbCBxdWVzdGlvbnMs
IGp1c3QgbGV0IG1lIGtub3cuCj4KPiBIaQo+Cj4gQ291bGQgeW91IGV4cGxhaW4gd2hhdCB0aGUg
V2lyZWd1YXJkIHN1cHBvcnQgYnJvYWRseSBkb2VzIChjb21wYXJlZCB0bwo+IHJlZ3VsYXIgcm91
dGUgdXBkYXRlKT8KCldpcmVndWFyZCB0aWVzIHByZWZpeGVzIHRvIHB1YmxpYyBrZXlzIHRvIGZp
Z3VyZSBvdXQgd2hpY2ggcGVlciB0byBzZW5kCmEgcGFja2V0IHRvLiBUaGlzIHN1cGVyc2VkZXMg
YW55IHJlZ3VsYXIgcm91dGluZyBvbiB0aGF0IGludGVyZmFjZSwgc28KaXQgbmVlZHMgdG8gYmUg
ZG9uZSBpbiBhZGRpdGlvbiB0byBpbnN0YWxsaW5nIHRoZSByb3V0ZSBvbiB0aGUKaW50ZXJmYWNl
LiBTZWUgaHR0cHM6Ly93d3cud2lyZWd1YXJkLmNvbS8jY3J5cHRva2V5LXJvdXRpbmcKCi1Ub2tl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFy
ZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
