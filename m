Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173C8C282CE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 17:48:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92B52146F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 17:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ajs124.de header.i=@ajs124.de header.b="GoL0EjOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D92B52146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ajs124.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97eda8e9;
	Fri, 5 Apr 2019 17:45:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4a28196
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2019 17:45:52 +0000 (UTC)
Received: from mail.radical-dreamers.de (mail.radical-dreamers.de
 [IPv6:2a01:4f8:1c1c:5814::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2eef0e5
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2019 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ajs124.de; 
 s=alpha;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JzGmjvm6kXFGbu/i+kYQz0vtGMxBlEBp/mjTax0X2dc=; b=GoL0EjOhK10l1psHyItBxftqoi
 thPc+PMfpKeROaW1/dlMMCBHIrVTc/etPwM/GLdSb/DitE8HsCivCuGrbsi8KfshmZ3UWVu449Trc
 ZItOgBDkl+HDLn/uOGlRXQpUBT0eu1GX2+Vz8rojASoU09YEFbpwtCBu49iXcg91a7R0tfnnAPEOz
 P4qg1Gy2cf+IkZ8BtFpzANGYfAP8cb1uo+8giIdYO9UyDonY4iAbJnw1HVeeweGr/3Pe/DMGTBdi4
 nR4koJjWg6QBCwQFmJCHZTqwt8DY9V6h7GMjjszHaUSuMPlFOUc+P9gqPIDp2x4N4/b9BF/56fBtQ
 0jOg1h3g==;
Received: from p200300cddf2041016060c4f0a3f26c1a.dip0.t-ipconnect.de
 ([2003:cd:df20:4101:6060:c4f0:a3f2:6c1a] helo=desk)
 by mail.radical-dreamers.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (envelope-from <wireguard@ajs124.de>)
 ; Fri, 05 Apr 2019 17:48:12 +0000
Date: Fri, 5 Apr 2019 19:48:05 +0200
From: ajs124 <wireguard@ajs124.de>
To: wireguard@lists.zx2c4.com
Subject: Re: How ca I use two peers with 0.0.0.0?
Message-ID: <20190405194805.7fa9fa09@desk>
In-Reply-To: <1554113120.148180037@f500.i.mail.ru>
References: <1554113120.148180037@f500.i.mail.ru>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

SGV5IQoKVGhlcmUncyBtdWx0aXBsZSB3YXlzIHRvIGFjaGlldmUgdGhpcywgZWFjaCB3aXRoIGl0
cyBvd24gc2V0IG9mIGRyYXdiYWNrcy4KRmlyc3RseSB0aG91Z2gsIHRoZSByZWFzb24gd2h5IHRo
aXMgaXMgaW1wb3NzaWJsZSB0aGUgd2F5IHlvdSB0cmllZCBpdCwgY2FuIGJlIHNlZW4gaW4gc2Vj
dGlvbiB0d28gKENyeXB0b2tleSBSb3V0aW5nKSBvZiB0aGUgcGFwZXJbMV0uCgpOb3cgb250byBo
b3cgeW91IGNhbiBkbyB0aGlzIGFueWhvdzoKMS4gTXVsdGlwbGUgd2lyZWd1YXJkIGludGVyZmFj
ZXMKCVRoZSBwcm9ibGVtIGJlaW5nIHRoYXQgeW91IG5lZWQgbW9yZSBwb3J0cywgYmVjYXVzZSB5
b3UgY2FuJ3QgbGlzdGVuIHR3aWNlIG9uIHRoZSBzYW1lIGlwIG9uIHRoZSBzYW1lIHBvcnQuIChX
ZWxsLCB5b3Uga2luZCBvZiBjYW4sIGJ1dCBsZXQncyBqdXN0IHNheSB5b3UgY2FuJ3QpLgoyLiBU
dW5uZWwgb3ZlciB3aXJlZ3VhcmQsIGUuZy4gSVBJUCwgR1JFLCBWWExBTiwgZXRjCglUaGUgbWFp
biBkcmF3YmFjayBpcyB0aGF0IGV2ZXJ5IHR1bm5lbGluZyBsYXllciBjb21lcyB3aXRoIG1vcmUg
b3ZlcmhlYWQgYW5kIGl0J3MganVzdCBub3QgYSBwcmV0dHkgc29sdXRpb24sIGJ1dCBpdCBzaG91
bGQgd29yay4KCkkgaG9wZSB0aGlzIGhlbHBzIHlvdSBpbiBzb2x2aW5nIHlvdXIgcHJvYmxlbS4K
CkJlc3QgUmVnYXJkcwphanMxMjQKCgpbMV06IGh0dHBzOi8vd3d3LndpcmVndWFyZC5jb20vcGFw
ZXJzL3dpcmVndWFyZC5wZGYKCk9uIE1vbiwgMDEgQXByIDIwMTkgMTM6MDU6MjAgKzAzMDAK0JTQ
vNC40YLRgNC40Lkg0JzQsNGA0LrQvtCyIDxkbWl0cmlfXzEzQG1haWwucnU+IHdyb3RlOgoKPiBI
ZWxsbyEKPiAKPiBSZWNlbnRseSBJIHRyaWVkIHRvIGluc3RhbGwgd2lyZWd1YXJkLsKgCj4gCj4g
SSBoYXZlIDQgY29tcHV0ZXJzLiAyIG9mIHRoZW0gaGF2ZSBwdWJsaWMgaXAuIDIgb2YgdGhlbSBi
ZWhpbmQgTkFULgo+IAo+IEkgd2FudCB0byB1c2UgMiBwdWJsaWMgUEMgYXMgZW5kcG9pdHMsIGJ1
dCBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRvIHNldCB1cCAwLjAuMC4wIGZvciBib3RoIG9mIHRo
ZW0gb24gY2xpZW50IHNpZGUuCj4gCj4gU28gdGhpcyBteSBjb25maWd1cmF0aW9uIG9uIGNsaWVu
dHNpZGUgYmVoaW5kIE5BVAo+IFtJbnRlcmZhY2VdCj4gTGlzdGVuUG9ydCA9IDUxODIwCj4gUHJp
dmF0ZUtleSA9IEtFWQo+IFtQZWVyXQo+IFB1YmxpY0tleSA9IEtFWTEKPiBBbGxvd2VkSVBzID0g
MC4wLjAuMC8wCj4gRW5kcG9pbnQgPSBYLlguWC5YOjUxODIwCj4gW1BlZXJdCj4gUHVibGljS2V5
ID0gS0VZMgo+IEFsbG93ZWRJUHMgPSAwLjAuMC4wLzAKPiBFbmRwb2ludCA9IFguWC5YLlg6NTE4
MjAKPiBXaXJlZ3VhcmQgZG9uJ3QgYWxsb3cgbWUgdG8gdXNlIDAuMC4wLjAgb24gYm90aCBvZiB0
aGVtLiBIb3cgY2FuIEkgdXNlIHR3byBwZWVycyBhdCB0aGlzIHNpdHVhdGlvbj8KPiAKPiAKPiAt
LSAKPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBEbWl0cnkgTWFya292Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2ly
ZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3dpcmVndWFyZAo=
