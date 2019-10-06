Return-Path: <SRS0=fVBb=X7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FA0C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Oct 2019 18:13:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923012053B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Oct 2019 18:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923012053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76243001;
	Sun, 6 Oct 2019 18:13:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90d2feb1
 for <wireguard@lists.zx2c4.com>; Sun, 6 Oct 2019 18:13:30 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b7934c9
 for <wireguard@lists.zx2c4.com>; Sun, 6 Oct 2019 18:13:30 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 7E2D31E3038
 for <wireguard@lists.zx2c4.com>; Sun,  6 Oct 2019 14:13:30 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 644101E3037
 for <wireguard@lists.zx2c4.com>; Sun,  6 Oct 2019 14:13:30 -0400 (EDT)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: wg-quick systemd service doesn't work after boot
Date: Sun, 6 Oct 2019 13:13:29 -0500
References: <CA+Hw3ebFCOoc6N_sn9HsaGmLiFp68XY+jLV83NS5JqmtLZ=8-g@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <CA+Hw3ebFCOoc6N_sn9HsaGmLiFp68XY+jLV83NS5JqmtLZ=8-g@mail.gmail.com>
Message-Id: <C75B3908-3C57-403D-A306-C6B53AAAFFE4@lonnie.abelbeck.com>
X-Mailer: Apple Mail (2.3445.104.11)
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

Cgo+IE9uIE9jdCA2LCAyMDE5LCBhdCAxMTo1NCBBTSwgQWRyacOhbiBNaWjDoWxrbyA8YWRyaWFu
a29vb29AZ21haWwuY29tPiB3cm90ZToKPiAKPiBJIGhhdmUgMyB3ZyBpbnRlcmZhY2Ugb24gbXkg
c2VydmVyLCBidXQgSSBhbSB1bmFibGUgdG8gZW5hYmxlIHdnMCB3aXRoIHdnLXF1aWNrIGF0IGJv
b3Q6Cj4gCj4gQHVidW50dTp+JCBzdWRvIHN5c3RlbWN0bCBlbmFibGUgd2ctcXVpY2tAd2cwCj4g
QHVidW50dTp+JCAKPiAuLi4KCj4gT2N0IDA2IDEzOjIyOjUzIHVidW50dSB3Zy1xdWlja1sxNzM3
XTogWyNdIGlwdGFibGVzIC1BIEZPUldBUkQgLWkgd2cwIC1qIEFDQ0VQVDsgaXB0YWJsZXMgLUEg
Rk9SV0FSRCAtbyB3ZzAgLWogQUNDRVBUOyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcg
LW8gZQo+IE9jdCAwNiAxMzoyMjo1MyB1YnVudHUgd2ctcXVpY2tbMTczN106IEFub3RoZXIgYXBw
IGlzIGN1cnJlbnRseSBob2xkaW5nIHRoZSB4dGFibGVzIGxvY2suIFBlcmhhcHMgeW91IHdhbnQg
dG8gdXNlIHRoZSAtdyBvcHRpb24/CgoKSGkgQWRyacOhbiwKCkFzIGEgdGVzdCwgaG93IGFib3V0
IGFkZGluZyAtdyB0byB0aGUgaXB0YWJsZXMgY2FsbDoKLS0KaXB0YWJsZXMgLXcgLUEgRk9SV0FS
RCAtaSB3ZzAgLi4uCi0tCmFuZCBzZWUgaXQgdGhhdCBmaXhlcyBpdC4KCldpdGggLXcsIGlwdGFi
bGVzIHdpbGwgd2FpdCB1bnRpbCB0aGUgbG9jayBpcyByZWxlYXNlZC4KCkxvbm5pZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxp
bmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29t
L21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
