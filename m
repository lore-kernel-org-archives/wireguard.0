Return-Path: <SRS0=xsnz=MW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D54C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Oct 2018 15:52:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B732086E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Oct 2018 15:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="p1AoUvpb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B732086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f9aa4f5;
	Wed, 10 Oct 2018 15:50:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff4db8e8
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 15:50:39 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93dbc6a1
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 15:50:38 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 5D380213B8
 for <wireguard@lists.zx2c4.com>; Wed, 10 Oct 2018 17:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1539186700; bh=dY6q+ipVA8SxUtnkOrDTLDQPOXtDEWUsq+mil0uijic=;
 h=Subject:To:From:Date:From;
 b=p1AoUvpbgc2bNgIyz7tLEa8b+2yvF+Ei0tZQrDgCXk9KHOnGpBPjPxK2gVrxGMkFU
 W55nY7Trsb4GVPEVsjqPEmMEYgSyuTQnpf47l5tBpzTkdXpQYe68QZ+b6g679GPNVm
 k9h02FDE0QmqJs+I6KL9RhYMm27cXH4QIASbZG6P/X+ljw4A+FB58dRs4cOsNNxNdR
 F1p4VDOxWL7YxCxcoETElFTr5Sr2Yaw7/1g0pIz+ozEhpV9YtkHfGCOzt8fYTvztTt
 APsWG2VVCQ/AdRqTDtxJtuCqNZ0LxarW6k5gQ9iwqpumvHj0YLzK06k4C7ZXEH8PVM
 67xaVV0OhQ1vQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 42VdrC47Pdz6tm8
 for <wireguard@lists.zx2c4.com>; Wed, 10 Oct 2018 17:51:39 +0200 (CEST)
Subject: route_allowed_ips on on openwrt
To: wireguard@lists.zx2c4.com
References: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
 <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
From: Emanuele Bernardi <e.berna@posteo.net>
Message-ID: <e60ee23a-6622-85da-0def-17d7d3183ef3@posteo.net>
Date: Wed, 10 Oct 2018 17:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
Content-Language: en-US
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

SGkgYWxsLCBJJ20gbm90IHN1cmUgaWYgaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGFzayBhYm91dCB0
aGlzLi4KSSdtIENvbmZpZ3VyaW5nIHdpcmVndWFyZCBvbiBvcGVud3J0IGFuZCBpbiB0aGUgcGVl
ciBjb25maWd1cmF0aW9uIGkgCmNhbWUgYWNyb3NzIHRoZXNlIHNwZWNzCihodHRwczovL29wZW53
cnQub3JnL2RvY3MvZ3VpZGUtdXNlci9uZXR3b3JrL3R1bm5lbGluZ19pbnRlcmZhY2VfcHJvdG9j
b2xzI3Byb3RvY29sX3dpcmVndWFyZF93aXJlZ3VhcmRfdnBuKQphbmQgdGhlwqAgInJvdXRlX2Fs
bG93ZWRfaXBzIiBvcHRpb24sIGJ1dCBlbmFibGluZyBpdCBkb2VzIG5vdCBjcmVhdGUgYSAKcm91
dGUgYW5kIGkgbXVzdCBhZGQgaXQgbWFudWFsbHkuCkNvdWxkIGl0IGJlIGFuIGlzc3VlIHdpdGgg
dGhlIG9wZW53cnQgb3Igd2lyZWd1YXJkPwoKVGhhbmsgeW91CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVH
dWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQK
