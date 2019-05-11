Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13E1C04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:36:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B304216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B304216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b53451cf;
	Sat, 11 May 2019 13:35:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 129b7f72
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 13:35:57 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db4a44cd
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 13:35:57 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id F33F81E3052;
 Sat, 11 May 2019 09:35:56 -0400 (EDT)
Received: from [IPv6:fda6:66b2:b74a:fe::148] (unknown
 [IPv6:2001:579:7150:2fe::148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id B51361E3029;
 Sat, 11 May 2019 09:35:56 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: WireGuard Digest, Vol 38, Issue 5
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <F17F1F63-59B9-4996-8983-18F39F90660F@gmail.com>
Date: Sat, 11 May 2019 08:35:55 -0500
Message-Id: <AF018754-13C0-4E62-AC4F-D495DE9E2D00@lonnie.abelbeck.com>
References: <mailman.1563.1557175147.19426.wireguard@lists.zx2c4.com>
 <F17F1F63-59B9-4996-8983-18F39F90660F@gmail.com>
To: Thomas Dickomeit <thomas.dickomeit@gmail.com>
X-Mailer: Apple Mail (2.3445.104.8)
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

Cj4gT24gTWF5IDYsIDIwMTksIGF0IDEwOjQyIFBNLCBUaG9tYXMgRGlja29tZWl0IDx0aG9tYXMu
ZGlja29tZWl0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gSGVsbG8gV2lyZWd1YXJkLAo+IAo+IElt
IHVzaW5nIG9uIG15TWFjUHJvIDIwMTMgIFdpcmVndWFyZCBzaW5jZSBtb3JlIHRoZW4gYSBoYWxm
IHllYXIsIHZpYSBNYWNQb3J0cywgbXkgV2lyZWd1YXJkU2VydmVyIGlzIG15IFJvdXRlciB3aXRo
IE9wZW5XUlQgb24gaXQsIG1hZGUgbWUgYSBTaGVsbHNjcmlwdC5zaCB0aGF0IGZpcmVzIHdpcmVn
dWFyZCB1cCBvciBkb3duIHNvIHUgY2FuIGxhdW5jaCBpdCB3aXRob3V0IG9wZW5pbmcgdGhlIFRl
cm1pbmFsIHNpbXBseSBvdmVyIG15IFNoZWxsU2NyaXB0LnNoIGluZGVyIE1hY09TIEZpbmRlciDi
gKZpdHMgd29ya2luZyB3b25kZXJmdWxsIHVuZGVyIE9TWCBTaWVycmEsCj4gCj4gTm93IG15IHF1
ZXN0aW9uLCBJIGp1c3Qgc2F5LCBpbiB0aGUgQXBwU3RvcmUsIHRoYXQgdGhlcmUgaXMgYSBXaXJn
dWFyZCBjbGllbnQgbm93IEFWQUlBQkxFLCBUaGFua3MgZm9yIHRoYXQhISEgSSBMb3ZlIFdpcmVn
dWFyZCEKPiAKPiBzYWRseSwgdGhlIEFwcGxlU3RvcmUgZG9lc250IGFsbG93IG1lIHRvIGRsIGl0
LCBhcyBJIGFtIHN0aWxsIHVuZGVyIE9TWCBTaWVycmEsIGlzIHRoZXJlIGEgbGluayBJIGNhbiBk
bCBpdCBmcm9tIGFub3RoZXIgc291cmNlIHRoZW4gdGhlIEFwcGxlU3RvcmU/CgpUaG9tYXMsCgpU
aGUgbWFjT1MgQXBwU3RvcmUgdmVyc2lvbiBvZiBXaXJlR3VhcmQgdXNlcyBjYWxscyBvbmx5IHN1
cHBvcnRlZCBpbiBtYWNPUyAxMC4xNCsgLiAgSmFzb24gaGFzIHN0YXRlZCBoaXMgd2lsbGluZ25l
c3MgdG8gYWNjZXB0IHF1YWxpdHkgYmFja3BvcnRzIG9mIHRob3NlIGNhbGxzIHRvIHN1cHBvcnQg
MTAuMTMsIDEwLjEyLCBidXQgSSdtIG5vdCBhd2FyZSBvZiBhbnkgYWN0aXZpdHkgb24gdGhhdCBm
cm9udC4KCkxvbm5pZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0
dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
