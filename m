Return-Path: <SRS0=zozX=E2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F7FC56202
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 13:14:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2719822253
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 13:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=su.se header.i=@su.se header.b="GDzDssuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2719822253
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=su.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53d196c5;
	Fri, 20 Nov 2020 13:09:29 +0000 (UTC)
Received: from mail-prod-route02.it.su.se (mail-prod-route02.it.su.se
 [77.238.35.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id badc1338
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 13:09:27 +0000 (UTC)
Received: from e-mailfilter02.sunet.se (e-mailfilter02.sunet.se
 [IPv6:2001:6b0:8:2::202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail-prod-route02.it.su.se (Postfix) with ESMTPS id 4CcxpT3sQBzyGk;
 Fri, 20 Nov 2020 14:14:25 +0100 (CET)
Received: from smtp.su.se (mail-prod-smtp04.it.su.se [130.237.181.99])
 by e-mailfilter02.sunet.se (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id
 0AKDEOfx157115
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 20 Nov 2020 14:14:24 +0100
Received: from EBOX-PROD-SRV15.win.su.se (ebox-prod-srv15.win.su.se
 [IPv6:2001:6b0:5:1162:85f3:6da2:459d:88c7])
 by smtp.su.se (Postfix) with ESMTPS id 4CcxpS1Kqyz2ttY;
 Fri, 20 Nov 2020 14:14:24 +0100 (CET)
Received: from EBOX-PROD-SRV15.win.su.se (2001:6b0:5:1162:85f3:6da2:459d:88c7)
 by EBOX-PROD-SRV15.win.su.se (2001:6b0:5:1162:85f3:6da2:459d:88c7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 20 Nov
 2020 14:14:23 +0100
Received: from EBOX-PROD-SRV15.win.su.se ([fe80::85f3:6da2:459d:88c7]) by
 EBOX-PROD-SRV15.win.su.se ([fe80::85f3:6da2:459d:88c7%2]) with mapi id
 15.01.2106.002; Fri, 20 Nov 2020 14:14:23 +0100
From: Patrik Holmqvist <patrik.holmqvist@su.se>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: "vh217@werehub.org" <vh217@werehub.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: RE: Using WireGuard on Windows as non-admin - proper solution?
Thread-Topic: Using WireGuard on Windows as non-admin - proper solution?
Thread-Index: AQHWuUytyfF/TNfZ4UmGDpBws/KDu6nFQogAgAQILDCABlu7AIABTKXQgAABfwCAABFOcA==
Date: Fri, 20 Nov 2020 13:14:23 +0000
Message-ID: <a6bf6365545642889fc3af22c3d5ad03@su.se>
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
 <665e0a8610984d938ab013ec2aac8517@su.se>
 <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
 <6c0c1208b52848bea8b1d0f1ac0dfa3a@su.se>
 <CAHmME9o7K3DsKS1p3uKV0K9_btRHtMJWAGQD1ZT0=YXiF0Zysw@mail.gmail.com>
In-Reply-To: <CAHmME9o7K3DsKS1p3uKV0K9_btRHtMJWAGQD1ZT0=YXiF0Zysw@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.237.154.251]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Bayes-Prob: 0.005 (Score 0, tokens from: outbound, outbound-su-se:default,
 su-se:default, base:default, @@RPTN)
X-CanIt-Geo: ip=130.237.181.99; country=SE; region=Stockholm County;
 city=Lidingoe; latitude=59.3667; longitude=18.1333;
 http://maps.google.com/maps?q=59.3667,18.1333&z=6
X-CanItPRO-Stream: outbound-su-se:outbound (inherits from
 outbound-su-se:default, su-se:default, base:default)
X-Canit-Stats-ID: 0a3SBeoCM - 51242c17d2c0 - 20201120
X-CanIt-Archive-Cluster: PfMRe/vJWMiXwM2YIH5BVExnUnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=su.se; h=from:to:cc
 :subject:date:message-id:references:in-reply-to:content-type
 :content-transfer-encoding:mime-version; s=canit-v2; bh=VIyMiEFp
 cAXEjv/ep3uv6hh9+98+5WhxJtp3Cotuk6k=; b=GDzDssuDRBx/EmeevB17rSBf
 Iux54KjlVMAnPkjLaV0Xn1PtAMM8LByQjP2oZI7oRaRSCmczuJgPlb08UYo8tO8+
 BBGFi7O3nCC4MgILOZblGE0E2MTvaCza0DRGBjt8a6RJBsAj520dseQUD4wy2Sq6
 Kzxt2LQNfn0naoNfLRZLANriKQZSsN0avyZFmdnaoEF0gtFk+7x8nbPzxiVU3iCf
 Io9w/bi1/E9LhzjFTWVrD4nmgu+zzFSd6FuQPoyBRsJJsEadyxrvlVS4d6Pe64os
 UTxLmTPsjmV0rTf97HRXfGxm/A4JhdYAqz8r1p6YCw4Qzy795NbRdcBRqXWaxg==
X-Scanned-By: CanIt (www . roaringpenguin . com)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGkgSmFzb24NCg0KSW4gdGhlIFVuaXZlcnNpdHkgd29ybGQgdGhlcmUgaXMgYSBsb3Qgb2YgImFj
YWRlbWljIGZyZWVkb20iIGFuZCB3ZSAodGhlIGNlbnRyYWwgSVQtZGVwYXJ0bWVudCkgZG9u4oCZ
dCBtYW5hZ2UgYWxsIGNvbXB1dGVyIGF0IHRoZSB1bml2ZXJzaXR5Lg0KV2UgYWxzbyBkb27igJl0
IGhhdmUgYW55IGNlbnRyYWwgbWFuYWdlbWVudCBvZiBwaG9uZXMgZm9yIGV4YW1wbGUuDQoNClNv
IHdlIGJ1aWx0IHRoaXMgc29sdXRpb24gc28gdGhhdCBpdCB3b3VsZCB3b3JrIHRoZSBzYW1lIHdh
eSBmb3IgYWxsIHVzZSBjYXNlcyBhbmQgZGV2aWNlIHR5cGVzLCBub3QganVzdCB0aG9zZSBkZXZp
Y2VzIG1hbmFnZWQgYnkgY2VudHJhbCBJVC4NCg0KQnV0IG1heWJlIHdlIG5lZWQgdG8gcmUtdGhp
bmsgaG93IHdlIGRvIHRoaXMgYW5kIGRvd25sb2FkIHRoZSBjb25maWcgZHluYW1pY2FsbHkgZm9y
IHRoZSB1c2VyIHdoZW4gdGhleSBpbnN0YWxsIHRoZSBjbGllbnQgb3Igc29tZXRoaW5nLg0KDQov
QmVzdCBSZWdhcmRzDQpQYXRyaWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPiANClNlbnQ6IGRlbiAyMCBub3Zl
bWJlciAyMDIwIDEzOjUyDQpUbzogUGF0cmlrIEhvbG1xdmlzdCA8cGF0cmlrLmhvbG1xdmlzdEBz
dS5zZT4NCkNjOiB2aDIxN0B3ZXJlaHViLm9yZzsgV2lyZUd1YXJkIG1haWxpbmcgbGlzdCA8d2ly
ZWd1YXJkQGxpc3RzLnp4MmM0LmNvbT4NClN1YmplY3Q6IFJlOiBVc2luZyBXaXJlR3VhcmQgb24g
V2luZG93cyBhcyBub24tYWRtaW4gLSBwcm9wZXIgc29sdXRpb24/DQoNCkhpIFBhdHJpaywNCg0K
V2h5IG5vdCBwcm92aXNpb24gdGhlIGNvbmZpZyBmb3IgdGhlIHVzZXJzIHdoZW4geW91J3JlIHBy
b3Zpc2lvbmluZyB0aGUgcmVzdCBvZiB0aGUgbWFjaGluZSBmb3IgdGhlaXIgb3duZXJzaGlwPw0K
DQpKYXNvbg0K
