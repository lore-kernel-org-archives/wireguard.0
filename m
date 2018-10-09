Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6944C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 22:29:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8F021479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 22:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="huI00vvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8F021479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7672045b;
	Tue, 9 Oct 2018 22:28:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c32d2033
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 22:28:31 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f9d2033
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=jrLKDBLNoUrI6b7WFXrWK27mHLHnb0ta0G1tssYBruQ=; 
 b=huI00vvsl+QDxYmfUZNB0eYygplDytCwlm8mtD2tjJwFmYZ6sNAr2iGkSbiLWZRB2h8s0rnbgHZPSjpYkfGocN2HegYbMnFjVqLc8SMOAyu2ZJMkSsTZ5Syc7+s8MXQ8Bw850cgrCiLTQvd5HQNKYihvL3VXhFItEmbyjJVP1tE=;
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Kricker <logcabin@fastmail.net>
References: <6b314daa5d672a51@frisell.zx2c4.com>
 <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
 <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
 <1538952235.1510043.1533890536.493A745F@webmail.messagingengine.com>
 <CAHmME9pbcPFghexTJnZz0kqJvTwa_bxpnox1vho8rMTQWd_pCQ@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <a276382e-b6c7-bd7d-2e70-23f81177876c@newmedia-net.de>
Date: Wed, 10 Oct 2018 00:29:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9pbcPFghexTJnZz0kqJvTwa_bxpnox1vho8rMTQWd_pCQ@mail.gmail.com>
X-Received: from [2003:c9:3f4e:a100:7435:9154:a523:7781]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1gA0VJ-0001HM-TN; Wed, 10 Oct 2018 00:29:26 +0200
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

aSBkbyBub3QgdXNlIHRoZSBkZWZpbmVkIG1hc3Rlci4gaSBqdXN0IGNoZWNrb3V0IHRoZSBnaXQg
cmV2aXNpb25zIApkZWZpbmVkIGJ5IHlvdXIgc25hcHNob3RzLiBidXQgc2luY2UgeW91IHJlbGVh
c2Ugc25hcHNob3RzwqAgMiB0aW1lcyBwZXIgCndlZWsgc29tZXRpbWVzIGl0cyBzdGlsbCBlbmRz
IHVwIG9uIGEgaGVhdnkgY2hhbmdpbmcgbW9kdWxlCmJ1dCB0aGF0IHNob3VsZCBub3QgYmUgdGhl
IHRvcGljIGhlcmUuIHRoZSB0b3BpYyBpcyB3aGF0IGxlYWRzIHdpcmVndWFyZCAKdG8gZmFpbCBv
biBoaXMgc3lzdGVtLiBzbyB3ZSBuZWVkIHRvIHRyYWNrIGRvd24gZmlyc3Qgd2hpY2ggaGFyZHdh
cmUgaGUgCmlzIHVzaW5nIHNpbmNlIGkgZG8gc3VwcG9ydCBhbG90IG9mIGRldmljZXMgd2l0aCBh
bG90IG9mIGRpZmZlcmVudCBjcHUgCnBsYXRmb3Jtcy4gc28gcGxlYXNlIHN0YXkgb24gdG9waWMg
YW5kIGRvIG5vdCBzcGVjdWxhdGUgdG9vIG11Y2gKCgpBbSAwOS4xMC4yMDE4IHVtIDIxOjE4IHNj
aHJpZWIgSmFzb24gQS4gRG9uZW5mZWxkOgo+IE9uIFR1ZSwgT2N0IDksIDIwMTggYXQgNjozMCBQ
TSBTZWJhc3RpYW4gR290dHNjaGFsbAo+IDxzLmdvdHRzY2hhbGxAbmV3bWVkaWEtbmV0LmRlPiB3
cm90ZToKPj4ganVzdCB0byBtYWtlIHN1cmUuIHNpbmNlIGknbSB1cGRhdGluZyB3aXJlZ3VhcmQg
aW4gZGQtd3J0IHZlcnkgb2Z0ZW4gdG8gdGhlIGxhdGVzdCBzdGF0ZSBvZiBhcnQgY29kZSBmcm9t
IGdpdC4KPiBEbyBub3QgZG8gdGhpcy4gUmF0aGVyLCB1c2Ugc25hcHNob3RzLiBJZiB5b3UncmUg
ZGlzdHJpYnV0aW5nIGJ1aWxkcwo+IGJhc2VkIG9uIGdpdCBtYXN0ZXIsIHlvdSdyZSBwdXR0aW5n
IHlvdXIgdXNlcnMgYXQgdW5uZWNlc3Nhcnkgcmlzay4KPiBUaGUgb25seSBzYWZlIGFuZCBhY2Nl
cHRhYmxlIGRpc3RyaWJ1dGlvbiBvZiBXaXJlR3VhcmQgaXMgdXNpbmcgdGhlCj4gbGF0ZXN0IHNu
YXBzaG90IHRhcmJhbGwuIFdoZW4geW91IHVzZSBnaXQgbWFzdGVyLCB5b3UncmUgbm90IGdldHRp
bmcKPiB0aGUgImxhdGVzdCBzdGF0ZSBvZiBhcnQgY29kZSIsIHlvdSdyZSBnZXR0aW5nICJqYXNv
bidzIDVhbQo+IGZvcmNlLXB1c2hlcyBhbmQgd2Fja3kgaWRlYXMgcHJlLWNvZGVyZXZpZXcuIiBP
biB0aGUgb3RoZXIgaGFuZCwgd2hlbgo+IHlvdSB1c2Ugc25hcHNob3RzLCB5b3UncmUgZ2V0dGlu
ZyBjb2RlIHRoYXQgSSd2ZSBzcGVudCBzb21lIHRpbWUKPiByZXZpZXdpbmcgYW5kIGRvdWJsZSBj
aGVja2luZyB0byBtYWtlIHN1cmUgaXQgd29uJ3QgbXVyZGVyIGtpdHRlbnMgYW5kCj4gcmVsYXRl
ZCBhdHJvY2l0aWVzLgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpo
dHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
