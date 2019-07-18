Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B049C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888242080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888242080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6962ef8e;
	Sun, 25 Aug 2019 15:38:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02db24e4
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 12:04:50 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 983d8ee8
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 12:04:50 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id 13BD07AA
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jul 2019 14:04:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id 049E628B847
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jul 2019 14:04:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ph6o93dpapEd for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 14:04:47 +0200 (CEST)
Received: from [81.24.66.132] (unknown [81.24.66.132])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id B072F28A03A
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jul 2019 14:04:47 +0200 (CEST)
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Subject: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: wireguard@lists.zx2c4.com
Message-ID: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
Date: Thu, 18 Jul 2019 14:05:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:38:23 +0200
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

SGksCgoKQWZ0ZXIgb3ZlciA4IG1vbnRocyBvZiBkZXZlbG9wbWVudCBhbmQgdHJvdWJsZXNob290
aW5nIFdpcmVHdWFyZCAKaW5zdGFiaWxpdGllcyBjYXVzZSBvZiBGcmVlQlNEIGtlcm5lbCBsYWNr
cywgT1BOc2Vuc2UgZmluYWxseSByZWxlYXNlZCAKaXQncyBXaXJlR3VhcmQgcGx1Z2luIHRvIHN0
YWJsZSBicmFuY2guCgpNYW55IHRoYW5rcyB0byBKYXNvbiBhbmQgQmVybmhhcmQgRnLDtmhsaWNo
IGZyb20gRnJlZUJTRCBoZWxwaW5nIHRvIG1ha2UgCnRoZSBwb3J0IHN0YWJsZS4KCgpOb3cgaXQn
cyBwb3NzaWJsZSB0byBjb25maWd1cmUgV2lyZUd1YXJkIGFzIHNpdGUyc2l0ZVsxXSBvciBjbGll
bnRbMl0gCnZpYSBXZWJVSSBhbHNvIHN1cHBvcnRpbmcgTXVsbHZhZFszXSBvciBBemlyZVs0XS4K
CgpIb3BlIHlvdSBlbmpveSBpdCA6KQoKCk1pY2hhZWwKClsxXSBodHRwczovL2RvY3Mub3Buc2Vu
c2Uub3JnL21hbnVhbC9ob3ctdG9zL3dpcmVndWFyZC1zMnMuaHRtbAoKWzJdIGh0dHBzOi8vZG9j
cy5vcG5zZW5zZS5vcmcvbWFudWFsL2hvdy10b3Mvd2lyZWd1YXJkLWNsaWVudC5odG1sCgpbM10g
aHR0cHM6Ly9kb2NzLm9wbnNlbnNlLm9yZy9tYW51YWwvaG93LXRvcy93aXJlZ3VhcmQtY2xpZW50
LW11bGx2YWQuaHRtbAoKWzRdIGh0dHBzOi8vZG9jcy5vcG5zZW5zZS5vcmcvbWFudWFsL2hvdy10
b3Mvd2lyZWd1YXJkLWNsaWVudC1hemlyZS5odG1sCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBs
aXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93
aXJlZ3VhcmQK
