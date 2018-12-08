Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186D6C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Dec 2018 06:15:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644522082D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Dec 2018 06:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2V1AkIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644522082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f659a62;
	Sat, 8 Dec 2018 06:06:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03f8ebd3
 for <wireguard@lists.zx2c4.com>; Sat, 8 Dec 2018 06:06:21 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04e31314
 for <wireguard@lists.zx2c4.com>; Sat, 8 Dec 2018 06:06:21 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p6so5423459eds.0
 for <wireguard@lists.zx2c4.com>; Fri, 07 Dec 2018 22:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=4wbroHUz6wklwgIcHDqbqREA/pF8mVOXn2i6+wy4YnY=;
 b=n2V1AkICAES1mbd2OUXwdYSVr6j/a1mEJuZKyLFq5Df5S5sKhNBMefj25GFinERiYi
 ABAnLlKOQHQSMzIil4utvGTj+ZL/+B3dqlOd6P2ovB4iXXLIPLlRPWRP/aE2ObGIxZCj
 +oxhBucjxZuWMvwoRs+6pAeSgdv05YLH1RgKMuE9Z8yO18DgLkvdsf5CYrutf8O9269o
 ao40jvznfwNsJjvdZ5qqe+GTuA8Jx8mrrwGB3jo8tsrBLaXTxtdCfu8+GKAxmQaI/1bm
 F//atG4A3doAKQ5HQQLwI9XrExoJ2HbCivwcqjyVsmhHXV8XTOwPz72I7vngr+3nwGNF
 gSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=4wbroHUz6wklwgIcHDqbqREA/pF8mVOXn2i6+wy4YnY=;
 b=uktM9mV573i5u8t9aFjJN/11Cj6sIOAuStpkq+IkY85tgsKR9xubHIdJoJSMCbfMKk
 bIrgJSoO1eRDJNIFQFkx40oI2RrmC3XxFgIkm0A0nLtZHa5hwonMsIF4dvVB1Tq++zA/
 WeufoUL1Pq+Zk2UZtW9b1f4HPCAS/1JyplNTneOIOfmtaz8nu/3T7HpkW3NwQOLkkI3S
 4mVx02B2tXQSKiXdWjjfxowAj02QvJBaBaMPJmFDm9c84LdS0C+Uwcm2/H9qk7b6iDHv
 lgjqqFqIn97yJLo+sWDLzJJ0uZO0t+z7fw4IuWFOaP4r/+yrMKjvShKNgZdBbqLOE9wC
 k8dg==
X-Gm-Message-State: AA+aEWYBDfngVwqdeNYPVpo6rvmhOceGH0lL2zY4SuJFnVbIc0qOeEkG
 0QGXEFLPbulxs+z0UFvjEAs4a85KHPA=
X-Google-Smtp-Source: AFSGD/X0YJFlHI5L7sild71+XpTLYhB2a/qLgLX9ipG9j5lt+K3ui4Z7y9wnvddIQdvTMz1Tqtd1ZA==
X-Received: by 2002:a50:cdd0:: with SMTP id h16mr4589441edj.151.1544249682173; 
 Fri, 07 Dec 2018 22:14:42 -0800 (PST)
Received: from [192.168.0.27] (188-141-65-102.dynamic.upc.ie. [188.141.65.102])
 by smtp.googlemail.com with ESMTPSA id
 s27-v6sm827141ejm.14.2018.12.07.22.14.40
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 22:14:41 -0800 (PST)
From: Graham Agnew <graham.agnew@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: wg troubles on ubuntu 14.04, MacOS and iOS
Date: Sat, 8 Dec 2018 06:14:39 +0000
References: <FFA4EA44-FDE2-4BC5-9C96-2A15277F0A20@gmail.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <FFA4EA44-FDE2-4BC5-9C96-2A15277F0A20@gmail.com>
Message-Id: <4B89377A-8DBE-4CBC-A2A2-B7D272FAEEFB@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
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

SGksCgpJIGZpZ3VyZWQgb3V0IG15IG11bHRpcGxlIHBlZXIgcHJvYmxlbSBhbmQgY2FuIG5vdyBj
b25uZWN0IGJvdGggbXkgTWFjIGFuZCBpUGhvbmUgdG8gdGhlIFVidW50dSBzZXJ2ZXIuICBJIGRp
ZG7igJl0IHJlYWQgdGhlIEFsbG93ZWRJUHMgZmllbGQgZGVzY3JpcHRpb24gcHJvcGVybHkgYW5k
IEkgd2FzIHRoaW5raW5nIGFib3V0IGl0IHRoZSB3cm9uZyB3YXkuICBJbiBteSBlbWFpbCBiZWxv
dywgSSB3YXMgbWFraW5nIHRoZSBtaXN0YWtlIG9mIHB1dHRpbmcgMC4wLjAuMC8wIGluIHRoZSBB
bGxvd2VkSVBzIF9vbiB0aGUgdGhlIHNlcnZlcl8gd2hpY2ggaXMgY2xlYXJseSB3cm9uZy4gIEkg
YWxzbyBoYWQgYSBsb29rIHRocm91Z2ggdGhlIHdnLXF1aWNrIGNvZGUgYW5kIG5vdyB1bmRlcnN0
YW5kIG1vcmUgb2Ygd2hhdCBpdOKAmXMgZG9pbmcuCgpJ4oCZbSBzdGlsbCBmaWd1cmluZyBvdXQg
aG93IHRvIHR1bm5lbCBhbGwgdHJhZmZpYyB0aHJvdWdoIHRoZSBzZXJ2ZXIuICBJZiBJIGhhdmUg
dGhlIE1hYyBvciBpUGhvbmUgd2l0aCBBbGxvd2VkSVBzPTAuMC4wLjAvMCBpdCBtYWtlcyBzZW5z
ZSB0byBtZSBub3csIGJ1dCBJIGNhbuKAmXQgY29ubmVjdCB0aHJvdWdoIHRvIGFueXdoZXJlIGJl
eW9uZCB0aGUgVWJ1bnR1IHNlcnZlci4gIEkgc3VzcGVjdCBpdOKAmXMgRE5TIHNldHVwIHN0dWZm
4oCmCgpDaGVlcnMsCkdyYQoKPiBPbiA2IERlYyAyMDE4LCBhdCAxMjoyMCBhbSwgR3JhaGFtIEFn
bmV3IDxncmFoYW0uYWduZXdAZ21haWwuY29tPiB3cm90ZToKPiAKPiBIaSwKPiAKPiBJIGluc3Rh
bGxlZCBXaXJlZ3VhcmQgb24gVWJ1bnR1IDE0LjA0IHVzaW5nIHRoZSBQUEEgb24gTGF1bmNocGFk
IGFuZCB0aGUgd2lyZWd1YXJkLXRvb2xzIG9uIG15IE1hYy4gIEkgY2FuIGdldCBpdCB0byB3b3Jr
IHdpdGggYSB2ZXJ5IHNpbXBsZSBzZXR1cCBhbmQgdXNpbmcgd2ctcXVpY2sgb3Ig4oCcd2cgc2V0
Y29uZuKAnS4gIEl04oCZcyByZWFsbHkgZ3JlYXQgaG93IHNpbXBsZSBpdCBpcy4KPiAKPiBJIGRv
buKAmXQgaGF2ZSBhcyBtdWNoIGx1Y2sgd2l0aCB0aGUgY29tbWFuZCBsaW5lIOKAnHdnIHNldOKA
nTsgaXQgZG9lc27igJl0IGxpa2UgcGFyYW1ldGVycyBsaWtlIGFsbG93ZWQtaXBzIGFuZCBzdWNo
LiAgSXMgdGhpcyBhIGtub3duIGlzc3VlPyAgQW5hbHlzaW5nIHdnLXF1aWNrLCBpdCBsb29rcyBs
aWtlIGl0IHBpcGVzIHRoZSBjb25maWd1cmF0aW9uIGludG8gdGhlICJ3ZyBzZXRjb25m4oCdIGNv
bW1hbmQuIAo+IAo+IEnigJltIGFsc28gaGF2aW5nIHByb2JsZW1zIHdoZW4gSSBoYXZlIHR3byBw
ZWVycy4gIEkgaGF2ZSAiQWxsb3dlZElQcyA9IDAuMC4wLjAvMCIgZm9yIGJvdGggaW4gdGhlIC5j
b25mIGZpbGUsIGJ1dCB0aGlzIGlzIG9ubHkgYXBwbGllZCB0byB0aGUgc2Vjb25kIHBlZXIuICBU
aGUgZmlyc3QgcGVlciBoYXMg4oCcKG5vbmUp4oCdIHNob3duIGFzIGl0cyBBbGxvd2VkSVBzIHdp
dGggb2J2aW91cyBjb25zZXF1ZW5jZXMuICBJcyB0aGlzIGFsc28gYSBrbm93biBpc3N1ZT8gIEkg
d2FzIHRyeWluZyB0byBhZGQgbXkgaVBob25lIGFzIGEgc2Vjb25kIHBlZXIgdXNpbmcgdGhlIFRl
c3RGbGlnaHQgYXBwLiAgSSBjb3VsZG7igJl0IGdldCB0aGlzIHRvIHdvcmssIGV2ZW4gd2hlbiBJ
IHRyaWVkIHRvIG1ha2UgYSBzZWNvbmQgaW50ZXJmYWNlIG9uIHRoZSBVYnVudHUgc2VydmVyIGFz
IGEgd29ya2Fyb3VuZC4gIElzIHRoZXJlIGEgd2F5IHRvIGRpYWdub3NlIHRoZSBpc3N1ZT8KPiAK
PiBJ4oCZbSBhbHNvIHVuc3VyZSBob3cgdGhlIEFsbG93ZWRJUHMgc2V0dGluZyBpcyBtZWFudCB0
byB3b3JrLiAgSW5pdGlhbGx5IEkgdGhvdWdodCBpdCB3YXMgYSBsaXN0IG9mIGFkZHJlc3NlcyB0
aGUgcGVlciB3YXMgYWxsb3dlZCB0byBjb25uZWN0IHRvLCBidXQgdGhlIGRvY3VtZW50YXRpb24g
c2VlbXMgdG8gc3VnZ2VzdCBpdOKAmXMgYSBsaXN0IHRoYXQgdGhlIHBlZXIgY2FuIGNvbm5lY3Qg
ZnJvbS4gIE9yIGlzIGl0IGEgcmFuZ2Ugb2Ygc291cmNlIElQcyB0aGF0IHRoZSByZWNlaXZlciB3
aWxsIGFjY2VwdCBwYWNrZXRzIGZyb20/ICBVc2luZyAwLjAuMC4wLzAgc2VlbXMgdG8gbWVzcyB1
cCBteSBuZXR3b3JrIGNvbmZpZ3VyYXRpb24sIHJvdXRpbmcgdGFibGVzIGV0YyBhbmQgSSB3b25k
ZXIgaWYgaXTigJlzIHNvbWUg4oCcc21hcnRz4oCdIGluIHdnLXF1aWNrIEkgaGF2ZW7igJl0IHVu
ZGVyc3Rvb2QuCj4gCj4gQXBvbG9naWVzIGlmIHRoZXNlIGFyZSBub29iIHF1ZXN0aW9ucyB0aGF0
IHN0ZW0gZnJvbSBhIGxhY2sgb2Yga25vd2xlZGdlLiAgSSBmZWVsIEkgbmVlZCB0byBnZXQgZGVl
cGVyIGludG8gaXB0YWJsZXMgZXRjIHRvIGZ1bGx5IHVuZGVyc3RhbmQgdGhpcy4KPiAKPiBDaGVl
cnMsCj4gR3JhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6
Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
