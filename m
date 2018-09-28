Return-Path: <SRS0=QupR=MK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278DFC43382
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Sep 2018 10:09:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B662172C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Sep 2018 10:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="LJ/v47Bd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B662172C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e01c087;
	Fri, 28 Sep 2018 10:06:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2896367
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 10:06:17 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 168a1d27
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 10:06:17 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 70B5410DB2E
 for <wireguard@lists.zx2c4.com>; Fri, 28 Sep 2018 06:09:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=sasl; bh=MYdXdVnt/xoq
 Lv1i209i5Tq+oac=; b=LJ/v47BdIyQZXzSFrE0rhrj2qLrkHYtjF0X7wwh9lnUQ
 m7LGuVnYNcl1VQ2kczF2YHe+gfqT0Ro/WLdEijJLFXC6KQbaqiiOlP5z5GRKtsBP
 rSoEZXkedlU5ZGFUK/zWXIA4esD7qpX9cK76Z48sltaZUxyieLaL6yVQrbQPCSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=sasl; b=YxiUqC
 FNphdzQcWiv7mv1b52cB/UTRJkoRsImTAdNUFVMtUlybxlCbEPm9wr706z76co75
 3KWRTi63/MJChFXpA4B0k/n9ZNGtIIQvME7/PY3bQsDpNGgwfv/uUf81f6LAFSHE
 s3H8J+ptP4+rfF9cp6YM9PX7q2hK887lL6Hxc=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 699B810DB2D
 for <wireguard@lists.zx2c4.com>; Fri, 28 Sep 2018 06:09:14 -0400 (EDT)
Received: from MacBook-Pro-3.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id D679610DB2C
 for <wireguard@lists.zx2c4.com>; Fri, 28 Sep 2018 06:09:13 -0400 (EDT)
Subject: Re: Connection issues with Google Fi
To: wireguard@lists.zx2c4.com
References: <mailman.1.1538128801.16643.wireguard@lists.zx2c4.com>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <c621b802-3a73-3dff-022b-96b4bc91d050@pobox.com>
Date: Fri, 28 Sep 2018 11:09:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.1.1538128801.16643.wireguard@lists.zx2c4.com>
Content-Language: en-US
X-Pobox-Relay-ID: 8D2066CE-C306-11E8-A07B-063AD72159A7-28021239!pb-smtp1.pobox.com
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

T24gMjgvMDkvMjAxOCAxMTowMCwgd2lyZWd1YXJkLXJlcXVlc3RAbGlzdHMuengyYzQuY29tIHdy
b3RlOgo+IEZhaWxlZCB0byBzZW5kIGRhdGEgcGFja2V0IHdyaXRlIHVkcDYgWzo6XTo0OTg5Ni0+
WzI2MDc6NzcwMDowOjg6OjQ4Y2E6ODYwZl06NTE4MjAKPgo+IFRoaXMgaXMgaW50ZXJlc3Rpbmcg
YmVjYXVzZSB0aGUgRE5TIG5hbWUgbXkgY2xpZW50IGludGVyZmFjZSBpcyBwb2ludGVkIGF0IGRv
ZXMgbm90IGhhdmUgYSBBQUFBIHJlY29yZC4KCkJ1dCBkb2VzIGl0IGhhdmUgSVB2NCBhZGRyZXNz
IDcyLjIwMi4xMzQuMTU/ICg0OGNhOjg2MGYgY29udmVydGVkIGZyb20gCmhleCkuwqAgSWYgc28s
IHRoYXQncyBETlM2NCBpbiBhY3Rpb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56
eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3Vh
cmQK
