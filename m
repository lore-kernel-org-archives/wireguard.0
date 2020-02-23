Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123DFC35666
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 15:33:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC55206E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 15:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JObYnqel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC55206E2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d440ce51;
	Sun, 23 Feb 2020 15:29:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bf07b4d
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:29:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4863a308
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:29:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 694a5420
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=m/3R6vQHtpSv
 EVWmqpFLd1HuvPY=; b=JObYnqelDNQYAkQfwrthLUz4wDu12/4Eb+gAieq4XngN
 YkVfdpXVBU8UoavbOiqGM8gMYiUWmNrtI8FkcyZW5ub3XgtinEaViJ7QgCMYBJ1i
 lTan7e95DIAdCZwwe5e8xsK7Qm/dC0ptv2wQ7O615hoLbEPJZmqR67OaXLyx9Ojf
 lT1mKmlON+p6Q8nFA0aW3iGjvBhB3Jo7Jrm3ei8ULm1syQtL4f/kRwvKYWkBHbLl
 hRigaHunnupRWxDCr+5yBnLO6Bp9by0mZb8oinIUHu/zocPXDjEO/yYWZIi8xEpS
 d8ASzbUIdZNLOfaiIxNoN7pg2fWzbr6GpCbmw+5k8A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ed1b91f1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:29:48 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id a22so6598525oid.13
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 07:33:05 -0800 (PST)
X-Gm-Message-State: APjAAAVzqOcLCmJ5/nVw5iS+0vkI5RBuN9sxqGyC/bH+wc6j0bwU2QNu
 28Wz7Vdoy1pjussZlyHA2CPN1M1gxgd1pOzqolQ=
X-Google-Smtp-Source: APXvYqyoxkxg50uJ1QAtIW+Zm1vSG3LAsF5/gZ3wgz/p1yy2Ya9aBf69ijBDiKLNmoiOHKaJFrhPIxa6mI/MU3QPGk4=
X-Received: by 2002:aca:4b46:: with SMTP id y67mr8987213oia.122.1582471984412; 
 Sun, 23 Feb 2020 07:33:04 -0800 (PST)
MIME-Version: 1.0
References: <01F8520D-6F1E-4DFB-BC07-80D9838EF35D@libassi.se>
 <CAHmME9ozSn+f1s9+q4-L_PA+Q76YY81X8_P2i4jMhYM8Or-17Q@mail.gmail.com>
 <645AC0E3-6440-4ABF-9589-179F5AEDE00E@libassi.se>
In-Reply-To: <645AC0E3-6440-4ABF-9589-179F5AEDE00E@libassi.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 16:32:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9oh74nx_eZz19vn=n+U6gF0M6Dtu--EnGw8dVwSnvX9cg@mail.gmail.com>
Message-ID: <CAHmME9oh74nx_eZz19vn=n+U6gF0M6Dtu--EnGw8dVwSnvX9cg@mail.gmail.com>
Subject: Re: FreeBSD wireguard wg-quick remote IP address assignment is
 incorrect
To: Peter Libassi <peter@libassi.se>
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

T24gU3VuLCBGZWIgMjMsIDIwMjAgYXQgMjoyNSBQTSBQZXRlciBMaWJhc3NpIDxwZXRlckBsaWJh
c3NpLnNlPiB3cm90ZToKPgo+IE9rLCBXZWxsIGV2ZW4gaWYgdXNpbmcgYW5vdGhlciBsb2NhbCBJ
UCBpbiByYW5nZSAxMjcuMC4wLjAvOCB3ZSBjYW7igJl0IGJlIGNlcnRhaW4gd2Ugd2lsbCBjbGFz
aCB3aXRoIHNvbWV0aGluZyBlbHNlLgo+Cj4gSG93IGFib3V0IGFkZGluZyBhIGRpcmVjdGl2ZSBm
b3IgdGhlIHJlbW90ZSBpbnRlcmZhY2UgYWRkcmVzcyBpbiB3Zy5jb25mPyBMaWtlIHRoaXM6Cj4K
PiAjIGNhdCAvdXNyL2xvY2FsL2V0Yy93aXJlZ3VhcmQvd2cwLmNvbmYKPiBbSW50ZXJmYWNlXQo+
IFByaXZhdGVLZXkgPSA8LT4KPiBMaXN0ZW5Qb3J0ID0gNzc3Nwo+IEFkZHJlc3MgPSAxOTIuMTY4
LjIuMS8zMgo+IFJlbW90ZUFkZHJlc3MgPSAxOTIuMTY4LjIuMgo+Cj4gW1BlZXJdCj4gUHVibGlj
S2V5ID0gPC0+Cj4gQWxsb3dlZElQcyA9IDE5Mi4xNjguMi4wLzI0Cj4gRW5kcG9pbnQgPSAxNzIu
MTYuMC4yMzo3Nzc3Cj4KPiAjIGRpZmYgL3Vzci9sb2NhbC9iaW4vd2ctcXVpY2sub3JnIC4vd2ct
cXVpY2sKPiAxN2ExOAo+ID4gUkVNT1RFX0FERFJFU1M9IiIKPiA4NmE4OAo+ID4gUmVtb3RlQWRk
cmVzcykgUkVNT1RFQUREUkVTUz0iJHZhbHVlIjsgY29udGludWUgOzsKPiAxNzVjMTc3LDE4MQo+
IDwgY21kIGlmY29uZmlnICIkSU5URVJGQUNFIiBpbmV0ICIkMSIgIiR7MSUlLyp9IiBhbGlhcwo+
IC0tLQo+ID4gICAgIGlmIFtbIC1uICRSRU1PVEVBRERSRVNTIF1dOyB0aGVuCj4gPiBjbWQgaWZj
b25maWcgIiRJTlRFUkZBQ0UiIGluZXQgIiQxIiAiJFJFTU9URUFERFJFU1MiIGFsaWFzCj4gPiAg
ICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgIGNtZCBpZmNvbmZpZyAiJElOVEVSRkFDRSIgaW5l
dCAiJDEiICIkezElJS8qfSIgYWxpYXMKPiA+ICAgICBmaQoKVGhpcyBpcyBub3QgYSBjb3JyZWN0
IGZpeDsgd2UncmUgbm90IGdvaW5nIHRvIGFkZCBhIGNvbmZpZ3VyYXRpb24gbm9iCnRvIHdvcmsg
YXJvdW5kIEZyZWVCU0QgbmV0d29yayBzdGFjayBnb3RjaGFzLgoKUmF0aGVyLCBJJ2QgcHJlZmVy
IHRvIHNlZSBhbGwgdGhlIEZyZWVCU0Qgd2ctcXVpY2sgc2VtYW50aWNzIHJlZG9uZQphcm91bmQg
bXVsdGlwbGUgcm91dGluZyB0YWJsZXMgYW5kIG1hcmtzLCBtdWNoIGxpa2Ugb24gTGludXgsIHRo
b3VnaCBJCmRvbid0IGtub3cgaWYgdGhhdCdzIHBvc3NpYmxlLiBCYXJyaW5nIHRoYXQsIGEgcHJv
cGVyIHNvbHV0aW9uCnByb2JhYmx5IGludm9sdmVzIHJlLXJlYWRpbmcgdGhlIGlmY29uZmlnIG1h
biBwYWdlIGEgZmV3IGRvemVuIHRpbWVzCnRvIGZpbmQgb3V0IGhvdyB0byBoYXZlIGludGVyZmFj
ZSBhZGRyZXNzZXMgYXMgd2UgbmVlZCB0aGVtLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
