Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275A6C04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D1720872
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D1720872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nikhef.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c9b355f;
	Sat, 18 May 2019 16:48:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36e2ffc4
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 10:14:40 +0000 (UTC)
Received: from out62-ams.mf.surf.net (out62-ams.mf.surf.net [145.0.1.62])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46c12f83
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 10:14:40 +0000 (UTC)
Received: from velino.nikhef.nl (velino.nikhef.nl [192.16.199.156])
 by outgoing3-ams.mf.surf.net (8.14.4/8.14.4/Debian-4+deb7u1) with ESMTP id
 x4GADxLL012069; Thu, 16 May 2019 12:13:59 +0200
Received: from localhost (localhost [127.0.0.1])
 by velino.nikhef.nl (Postfix) with ESMTP id F04B4100E0D7;
 Thu, 16 May 2019 12:14:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at nikhef.nl
Received: from velino.nikhef.nl ([127.0.0.1])
 by localhost (tardes.nikhef.nl [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id AzM0_xS2GPx4; Thu, 16 May 2019 12:14:11 +0200 (CEST)
Received: from [127.0.0.1] (tevere.nikhef.nl [IPv6:2001:610:120:1001::185:188])
 by velino.nikhef.nl (Postfix) with ESMTP id D04C1100E0BF;
 Thu, 16 May 2019 12:14:10 +0200 (CEST)
Subject: Re: [Openvpn-devel] Wintun performance results
To: David Sommerseth <openvpn@sf.lists.topphemmelig.net>,
 =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>,
 Lev Stipakov <lstipakov@gmail.com>
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
 <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
From: Jan Just Keijser <janjust@nikhef.nl>
Message-ID: <bfead88f-3e91-6d49-ea70-e73f626468f1@nikhef.nl>
Date: Thu, 16 May 2019 12:14:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
Content-Language: nl-NL
X-Bayes-Prob: 0.0001 (Score 0, tokens from: nikhef-out:default, nikhef:default,
 base:default, @@RPTN)
X-CanIt-Geo: ip=192.16.199.156; country=NL; latitude=52.3824; longitude=4.8995;
 http://maps.google.com/maps?q=52.3824,4.8995&z=6
X-CanItPRO-Stream: nikhef-out:default (inherits from nikhef:default,
 base:default)
X-Canit-Stats-ID: 0b0cWdXA9 - c56c92b2b5fb - 20190516 (trained as not-spam)
X-Scanned-By: CanIt (www . roaringpenguin . com)
X-Mailman-Approved-At: Sat, 18 May 2019 18:48:32 +0200
Cc: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGkgRGF2aWQsICoKCk9uIDE1LzA1LzE5IDE5OjMyLCBEYXZpZCBTb21tZXJzZXRoIHdyb3RlOgo+
IE9uIDE1LzA1LzIwMTkgMTY6NDksINCY0LvRjNGPINCo0LjQv9C40YbQuNC9IHdyb3RlOgo+PiBp
dCB3aWxsIG1vc3QgcHJvYmFibHkgZ2V0IGxvc3QgaW4gbWFpbGluZyBsaXN0Lgo+PiBjYW4gd2Ug
YWRkIGl0IHRvIGh0dHBzOi8vb3BlbnZwbi5uZXQgd2Vic2l0ZSA/IHNvbWV0aGluZyBsaWtlICJw
ZXJmb3JtYW5jZQo+PiB0ZXN0aW5nIiB3aXRoIGZ1bGwgY29uZmlncyBwcm92aWRlZCA/Cj4gR29v
ZCBpZGVhLCBidXQgbWF5YmUgbm90IHRoZSBvZmZpY2lhbCBjb3JwIHdlYiBwYWdlcyBqdXN0IHll
dC4gIEJ1dCB3ZSBzaG91bGQKPiBkZWZpbml0ZWx5IGhhdmUgc29tZSB3aWtpIHBhZ2VzIHVuZGVy
IGh0dHBzOi8vY29tbXVuaXR5Lm9wZW52cG4ubmV0LyByZWxhdGVkCj4gdG8gaG93IHRvIHByZXBh
cmUgYSBnb29kIHNldHVwIGZvciBwZXJmb3JtYW5jZSB0ZXN0aW5nLgo+Cj4KYSBjb21tdW5pdHkg
d2lraSBwYWdlIG9uIGhvdyB0byBwcmVwYXIgYSBnb29kIHNldHVwIGZvciBwZXJmb3JtYW5jZSAK
dGVzdGluZyBzb3VuZHMgbGlrZSBhIGdvb2QgcGxhbi4KSG93ZXZlciwgaWYgSSBhbSBub3QgbWlz
dGFrZW4gdGhlIHZlcnNpb24gb2YgT3BlblZQTiB1c2VkIGluIHRoZSB0ZXN0IAp3YXMgYSAqV2lu
ZG93cyogYnVpbGQgb2YgT3BlblZQTjMgd2l0aCBhIHdpbnR1biBwYXRjaCBpbmNsdWRlZC4gVGhh
dCBpcyAKbm90IG9wZW4gc291cmNlLCBpcyBpdD/CoCBJJ2QgKm5vdCogYmUgaW4gZmF2b3VyIG9m
IHdyaXRpbmcgY29tbXVuaXR5IAp3aWtpIHBhZ2VzIG9uIHRoZSBub24tb3BlbiBzb3VyY2UgdmVy
c2lvbiBvZiBPcGVuVlBOLgoKSk0yQ1csCgpKSksKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxp
c3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dp
cmVndWFyZAo=
