Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60BFC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:28:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2301208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2301208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=net.in.tum.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96012f05;
	Fri, 8 Mar 2019 15:16:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61a164cc
 for <wireguard@lists.zx2c4.com>; Tue, 5 Mar 2019 16:28:57 +0000 (UTC)
Received: from mail-out1.informatik.tu-muenchen.de (mail-out1.in.tum.de
 [131.159.0.8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21344087
 for <wireguard@lists.zx2c4.com>; Tue, 5 Mar 2019 16:28:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail.net.in.tum.de (Postfix) with ESMTPSA id 54BD728DF1D2
 for <wireguard@lists.zx2c4.com>; Tue,  5 Mar 2019 17:37:32 +0100 (CET)
From: Paul Emmerich <emmericp@net.in.tum.de>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Master's thesis about VPN performance featuring WireGuard 
Message-Id: <B00D5F62-9996-4A28-9DD3-28008C1B032A@net.in.tum.de>
Date: Tue, 5 Mar 2019 17:37:31 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:16:45 +0100
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

SGksICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKCm9uZSBvZiBteSBzdHVkZW50cyB3cm90ZSBoaXMgTWFz
dGVyJ3MgVGhlc2lzIGFib3V0IHBlcmZvcm1hbmNlIG9mIFZQTiBnYXRld2F5cy4KSXQncyBhdmFp
bGFibGUgaGVyZToKaHR0cHM6Ly93d3cubmV0LmluLnR1bS5kZS9maWxlYWRtaW4vYmlidGV4L3B1
YmxpY2F0aW9ucy90aGVzZXMvMjAxOC1wdWRlbGtvLXZwbi1wZXJmb3JtYW5jZS5wZGYKClRoZSB0
aGVzaXMgZmVhdHVyZXMgYSBwZXJmb3JtYW5jZSBjb21wYXJpc29uIGJldHdlZW4gV2lyZWd1YXJk
LCBPcGVuVlBOLCBhbmQgTGludXgKSVBzZWMuIEhlIGFsc28gaW1wbGVtZW50ZWQgc2V2ZXJhbCBk
aWZmZXJlbnQgcG9zc2libGUgYXJjaGl0ZWN0dXJlcyBmb3IgVlBOCmdhdGV3YXlzIGFuZCBkcmF3
cyBzb21lIGNvbmNsdXNpb25zIGFib3V0IHBvc3NpYmxlIGltcHJvdmVtZW50cyBpbiBXaXJlZ3Vh
cmQuCgpMaWtlIG1vc3QgZ29vZCB0aGVzZXMgaXQgd2FzIHdyaXR0ZW4gdW5kZXIgdGltZSBwcmVz
c3VyZSBjbG9zZSB0byB0aGUgZGVhZGxpbmUsCnNvIHRoZXJlIGFyZSBzb21lIHJvdWdoIGVkZ2Vz
LiBEZXNwaXRlIHRoaXMgSSB0aGluayBpdCdzIGEgcXVpdGUgZXhjZWxsZW50IHRoZXNpcyB0aGF0
CkknbGwgYmUgdHJhbnNmb3JtaW5nIGl0IGludG8gYSAoc2hvcnRlcikgam91cm5hbCBhcnRpY2xl
IGxhdGVyIHRoaXMgeWVhciwgYnV0IEkndmUgd2FudGVkCnRvIHNoYXJlIHRoZSB0aGVzaXMgd2l0
aCB5b3UgaG9waW5nIHRoYXQgaXQncyBoZWxwZnVsIG9yIGludGVyZXN0aW5nIGZvciBzb21lIG9m
IHlvdS4gICAgICAgICAgICAgICAKCgogUGF1bAoKCihSZS1zZW5kaW5nIGR1ZSB0byBtYWlsIHNl
cnZlciBpc3N1ZXMsIHNvcnJ5IGlmIHlvdSByZWNlaXZlIGR1cGxpY2F0ZXMpCgotLSAKQ2hhaXIg
b2YgTmV0d29yayBBcmNoaXRlY3R1cmVzIGFuZCBTZXJ2aWNlcwpEZXBhcnRtZW50IG9mIEluZm9y
bWF0aWNzClRlY2huaWNhbCBVbml2ZXJzaXR5IG9mIE11bmljaApCb2x0em1hbm5zdHIuIDMKODU3
NDggR2FyY2hpbmcgYmVpIE3DvG5jaGVuLCBHZXJtYW55IAoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJl
R3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlz
dGluZm8vd2lyZWd1YXJkCg==
