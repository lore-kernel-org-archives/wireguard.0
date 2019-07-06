Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120AEC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:44:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC7421852
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=efcloud.co header.i=@efcloud.co header.b="GfRl3u0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC7421852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hess.ooo
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afb83ca5;
	Wed, 17 Jul 2019 20:43:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c56e270
 for <wireguard@lists.zx2c4.com>; Sat, 6 Jul 2019 21:05:17 +0000 (UTC)
Received: from mx1.efcloud.co (mango.efcloud.co [IPv6:2a03:4000:6:50dc::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76ab412c
 for <wireguard@lists.zx2c4.com>; Sat, 6 Jul 2019 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=efcloud.co; 
 s=mango;
 h=Sender:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2WgKZMSpAzRG6cot3ayo6pXAnXN9OGHjMFFI3MMktTs=; b=GfRl3u0joYxGbx9h2F791n2xzx
 BYwaRbMk8ND1Hb0pvwlM+eJmYZSAYHrIE4cNHhzFyIKwIQh6IO97+aRcRsimXWwJ37njMWzjeP9gi
 heApya3Y8RDx52GqYs70Hahd+lPNQ80DfmCqNe9cgDS/eEdCZPk1p9kMxpQYiKmO91lQAkBa8CkbL
 5gtQm3pl3IdRj8kF7TW1mXXdCirc1fKrJVSoO/ZG9ulN76r9fJis2NdlRNujav4bcYeXcUz5HLOZg
 z1e44EEz7oEi//+HbpukXwlQMuUFWQGUH0oBl66jZvWu0CkRqKGhFvrwSikcij9Xqe+zEEEsCb/oA
 MSweHzcw==;
Received: from tmo-097-163.customers.d1-online.com ([80.187.97.163]
 helo=[192.168.43.174])
 by mx1.efcloud.co with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (envelope-from <janne.hess@efcloud.co>)
 ; Sat, 06 Jul 2019 21:05:15 +0000
Subject: Re: Introduce Wireguard support to bird
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 bird-users@network.cz
References: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
 <87pnnp59a3.fsf@toke.dk>
From: =?UTF-8?Q?Janne_He=c3=9f?= <janne@hess.ooo>
Message-ID: <121dc434-986e-91a9-591d-47948289a34c@hess.ooo>
Date: Sat, 6 Jul 2019 23:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87pnnp59a3.fsf@toke.dk>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:43:38 +0200
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Ck9uIDYvOC8xOSAxMjoxOCBBTSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IEph
bm5lIEhlw58gPGphbm5lQGhlc3Mub29vPiB3cml0ZXM6Cj4gCj4+IEhleSBldmVyeW9uZSwKPj4K
Pj4gYXMgYWR2ZXJ0aXNlZCwgSSBoYXZlIGNvbXBsZXRlZCB0aGUgV2lyZWd1YXJkIHN1cHBvcnQu
Cj4+IFlvdSBtaWdodCBzZWUgdGhhdCBJIGFtIG5vdCByZWFsbHkgYSBDIGV4cGVydCwgYnV0IEkg
aG9wZSB0aGUgY29kZSBpcyBnb29kIGVub3VnaC4KPj4gSWYgeW91IG5lZWQgbWUgdG8gY2hhbmdl
IGFueXRoaW5nIG9yIGhhdmUgYWRkaXRpb25hbCBxdWVzdGlvbnMsIGp1c3QKPj4gbGV0IG1lIGtu
b3cuCj4gCj4gSGkgSmFubmUKPiAKPiBBd2Vzb21lIHRoYXQgeW91IGhhdmUgdGFrZW4gdGhlIHRp
bWUgdG8gaW1wbGVtZW50IHRoaXMhCj4gCj4gSSdsbCBsZXQgdGhlIEJpcmQgbWFpbnRhaW5lcnMg
Y29tbWVudCBvbiB0aGUgYXBwcm9hY2ggb2YgZW1iZWRkaW5nIHRoZQo+IHdpcmVndWFyZCBuZXRs
aW5rIGxpYnJhcnk7IGJ1dCBJIGhhdmUgdHdvIG90aGVyIGNvbmNlcm5zOgo+IAo+IC0gQXMgZmFy
IGFzIEkgY2FuIHRlbGwgdGhlcmUncyBub3RoaW5nIHByZXZlbnRpbmcgQmlyZCBmcm9tIHJlbW92
aW5nCj4gICAgQWxsb3dlZElQcyB0aGF0IGl0IGRpZCBub3QgaXRzZWxmIGluc3RhbGwgZnJvbSBh
biBpbnRlcmZhY2UsIHJpZ2h0Pwo+IAo+IC0gVGhlIGFsZ29yaXRobSBpcyBiYXNpY2FsbHkgTyhQ
Kk0qTikgZm9yIGluc2VydGluZyBOIHJvdXRlcyBvbiBhbgo+ICAgIGludGVyZmFjZSB3aXRoIFAg
cGVlcnMgdGhhdCBlYWNoIGhhdmUgTSBleGlzdGluZyBBbGxvd2VkSVBzLiBUaGF0IGlzCj4gICAg
bm90IGdvaW5nIHRvIHNjYWxlIHZlcnkgZmFyIDovCj4gCj4gLVRva2UKPiAKCkhpIFRva2UsCgp0
aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKWW91ciBmaXJzdCBvYnNlcnZhdGlvbiBpcyBjb3JyZWN0
LiBEdWUgdG8gZGlmZmVyZW5jZXMgaW4gc2VtYW50aWNzLCB0aGlzIApjYW5ub3QgYmUgaW1wbGVt
ZW50ZWQgaW4gdGhlIHNhbWUgd2F5IGl0IGlzIGltcGxlbWVudGVkIGluIHRoZSBLUlQgCnByb3Rv
Y29sIGJlY2F1c2UgQWxsb3dlZElQcyBkb24ndCBoYXZlIGEgbm90aW9uIG9mIHRoZSBwcm90byBm
aWVsZC4KCkFkZHJlc3NpbmcgeW91ciBzZWNvbmQgcG9pbnQsIHRoZSBXaXJlR3VhcmQgbmV0bGlu
ayBpbnRlcmZhY2UgYW5kIApsaWJyYXJ5IG9ubHkgb2ZmZXIgYW5kIHVuZGVyc3RhbmQgdGhlIHBl
ZXJzIGFuZCBhbGxvd2VkIElQcyBhcyBhIGxpbmtlZCAKbGlzdC4KQXMgd2Ugb25seSBnZXQgZWFj
aCByb3V0ZSBzZXBlcmF0ZWx5LCB3ZSBjYW5ub3QgcHJvY2VzcyBtdWx0aXBsZSByb3V0ZXMgCmlu
IG9uZSBydW4uIFdlJ3JlIG9wZW4gdG8gc3VnZ2VzdGlvbnMgYW5kIHBhdGNoZXMuCgpSZWdhcmRz
Ckphbm5lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldp
cmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xp
c3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
