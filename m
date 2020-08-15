Return-Path: <SRS0=FBn0=B4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C756CC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2EF205CB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A2EF205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eichmeier.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 170941fb;
	Tue, 18 Aug 2020 11:10:57 +0000 (UTC)
Received: from outgoing.selfhost.de (outgoing.selfhost.de [82.98.87.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7cbf066d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Aug 2020 05:02:25 +0000 (UTC)
Received: (qmail 32732 invoked from network); 15 Aug 2020 05:28:08 -0000
Received: from unknown (HELO remote.stwo.biz)
 (postmaster@stwo.biz@188.174.162.11)
 by mailout.selfhost.de with ESMTPA; 15 Aug 2020 05:28:08 -0000
Received: from SBS2011.STWO.local ([fe80::c3:a0ea:efdc:48f]) by
 SBS2011.STWO.local ([fe80::c3:a0ea:efdc:48f%10]) with mapi id 14.03.0224.002; 
 Sat, 15 Aug 2020 07:25:27 +0200
From: Stephan Eichmeier <stephan@eichmeier.eu>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Bug in WireGuard ios14?
Thread-Topic: Bug in WireGuard ios14?
Thread-Index: AdZyxHsJWylFeq/+Sa2/rVUnlIoV3Q==
Date: Sat, 15 Aug 2020 05:25:26 +0000
Message-ID: <04663CD6-2F41-4316-82A8-123FFC58FFE1@eichmeier.eu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <15ABA293BB734449A7A5F68033D467E2@stwo.biz>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Aug 2020 13:10:55 +0200
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

SGksDQoNCmlmIEkgdXNlIHdpcmVndWFyZCBvbiBpT1MgMTQgdGhlcmUgaXMgYSBwcm9ibGVtIHdp
dGgg4oCcYWxsb3dlZCBJUHPigJ0uDQpSb3V0aW5nIGFsbCB0cmFmZmljIHdpdGggMC4wLjAuMC8w
IHdvcmtzLiANCg0KQnV0IGlmIEkgd291bGQgbGlrZSBvbmx5IHRvIHJvdXRlIDE5Mi4xNjguMC4w
LzI0IHRocm91Z2ggV2lyZUd1YXJkLCBpdCB3b3JrcyBhbHNvLCBidXQgZXZlcnkgY29ubmVjdGlv
biBleGNlcHQgMTkyLjE2OC4wLjAvMjQgZG9lc27igJl0IHdvcmsuIFRoaXMgaGFwcGVucyBvbmx5
IG9uIGlPUyAxNC4gDQoNClRoYW5rcyANCg0KU3RlcGhhbiANCg0KVm9uIG1laW5lbSBpUGhvbmUg
Z2VzZW5kZXQ=
