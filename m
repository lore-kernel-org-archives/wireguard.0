Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D885C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC74D21734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC74D21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03d4dc29;
	Fri, 3 Jan 2020 15:39:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 989e710a
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 22:58:09 +0000 (UTC)
Received: from claranet-outbound-smtp04.uk.clara.net
 (claranet-outbound-smtp04.uk.clara.net [195.8.89.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecb6197d
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 22:58:09 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:64887 helo=[172.16.2.196])
 by relay04.mail.eu.clara.net (relay.clara.net [81.171.239.34]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:RSA_AES_256_CBC_SHA256:256) id 1in9Pq-00043s-Fb 
 (return-path <barry@barrys-emacs.org>); Thu, 02 Jan 2020 22:58:07 +0000
Mime-Version: 1.0 (1.0)
Subject: Re: wireguard broke with recent update on fedora 31
From: Barry <barry@barrys-emacs.org>
In-Reply-To: <6c155e17-eb7a-c267-ee10-6cbb8a56857f@zx2c4.com>
Date: Thu, 2 Jan 2020 22:58:04 +0000
Message-Id: <6A278F71-FC48-497B-9948-D65A85004F57@barrys-emacs.org>
References: <6c155e17-eb7a-c267-ee10-6cbb8a56857f@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: iPad Mail (17C54)
X-Mailman-Approved-At: Fri, 03 Jan 2020 16:39:00 +0100
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

Cgo+IE9uIDIgSmFuIDIwMjAsIGF0IDIwOjExLCBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4
MmM0LmNvbT4gd3JvdGU6Cj4gCj4g77u/T24gMTIvMzEvMTkgMTowMyBQTSwgQmFycnkgU2NvdHQg
d3JvdGU6Cj4+IEkgaGFkIHdpcmVndWFyZCB3b3JraW5nIGJ1dCB0aGUgcmVjZW50IHVwZGF0ZSBv
ZiBzb21ldGhuZyBoYXMgYnJva2VuIGl0Lgo+IAo+IERvZXMgZG93bmdyYWRpbmcgZml4IGl0PyBJ
ZiBub3QsIHNvbWV0aGluZyBlbHNlIGlzIGJyb2tlbi4gQ2FuIHlvdSB0ZXN0IHRoYXQgZmlyc3Q/
CgpJIGFscmVhZHkgdHJpZWQgdGhhdC4gRG5mIHNheXMgdGhlIGZpbGVzIG5lZWRlZCB0byBkb3du
Z3JhZGUgYXJlIG5vIGxvbmdlciBhdmFpbGFibGUuCkkgZGlkIG5vdCBkb3VibGUgY2hlY2sgdGhl
IGZpbGVzIGluIHRoZSBjb3ByIHJlcG8gZm9sZGVyIHRvIHNlZSBpZiB0aGV5IGNhbiBiZSBjdXJs
4oCZZWQuCkkgZG8gdGhhdCBjaGVjayB0b21vcnJvdy4KCkJhcnJ5Cgo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlz
dApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxt
YW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
