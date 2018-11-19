Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA520C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:16:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9630E20989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9630E20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eisfunke.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13548479;
	Thu, 6 Dec 2018 23:06:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8f38130
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 19:58:53 +0000 (UTC)
Received: from mx2.mailbox.org (mx2a.mailbox.org
 [IPv6:2001:67c:2050:104:0:2:25:2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8c6e0e2
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 19:58:52 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id ACBB3A1EA1;
 Mon, 19 Nov 2018 21:04:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id IlRby2PbZ8u6; Mon, 19 Nov 2018 21:04:52 +0100 (CET)
Date: Mon, 19 Nov 2018 21:04:52 +0100 (CET)
From: nicolas@eisfunke.com
To: Robert Walli <rwalli@gmx.net>, wireguard@lists.zx2c4.com
Message-ID: <362749885.10996.1542657892449@office.mailbox.org>
In-Reply-To: <8365521A-0DE2-44B0-BFDF-5AAB82054756@gmx.net>
References: <8365521A-0DE2-44B0-BFDF-5AAB82054756@gmx.net>
Subject: Re: Android key-icon in statusbar
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:06:42 +0100
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

SGVsbG8sCgo+IEnigJl2IGluc3RhbGxlZCB3aXJlZ3VhcmQtYXBwIGZyb20gcGxheSBzdG9yZSBv
biBhbmRyb2lkIDguMS4KPiBJZiB1c2luZyB0aGUgdXNlcnNwYWNlIHZlcnNpb24gaSBnZXQgYSAi
a2V5LWljb24iIGluIHRoZSBzdGF0dXMtYmFyIHdoZW4gYSB0dW5uZWwgaXMgYWN0aXZlLgo+IFN3
aXRjaGluZyB0byB0aGUga2VybmVsIHZlcnNpb24gdGhlIGljb24gaXMgbm90IHdvcmtpbmcgYW55
IG1vcmUuCgp0aGUgdXNlcnNwYWNlIHZlcnNpb24gdXNlcyB0aGUgbmF0aXZlIEFuZHJvaWQgVlBO
LUFQSSwgd2hpY2ggYWx3YXlzIHNob3dzIHRoZSBrZXkgaWNvbiBmb3Igc2VjdXJpdHkgcmVhc29u
cy4KClRoZSBrZXJuZWwgdmVyc2lvbiBkb2Vzbid0IHVzZSB0aGlzIEFQSSBiZWNhdXNlLCB3ZWxs
LCBpdCB1c2VzIHRoZSBrZXJuZWwgbW9kdWxlLiBUaGF0J3Mgd2h5IHRoZSBrZXkgaWNvbiBpc24n
dCBzaG93bi4KCgpHcmVldGluZ3MKTmljb2xhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
