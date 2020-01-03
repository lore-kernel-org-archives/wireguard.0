Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4B0C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 20:31:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 292CD222C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 20:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 292CD222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa2c1808;
	Fri, 3 Jan 2020 20:31:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9e962c5
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 20:31:47 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout005aa.msg.pkvw.co.charter.net [47.43.26.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbcf6aa1
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 20:31:47 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id nTbmi5c0ilLVdnTbmiQRWp; Fri, 03 Jan 2020 20:31:47 +0000
X-Authority-Analysis: v=2.3 cv=bI1o382Z c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=9cW_t1CCXrUA:10 a=IkcTkHD0fZMA:10
 a=jK4f0YRpEqe5PQrhusMA:9 a=QEXdDO2ut3YA:10
Subject: Re: wg-quick: syntax error, unexpected saddr
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
 <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
 <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
 <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <14330289-5d26-22b4-434f-08a6a2cd3ecc@attglobal.net>
Date: Fri, 3 Jan 2020 12:31:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfP3umy5L+NT8QQ50RKM+sj6allyE2Je/M8ydeHzzgOro5IYZTipT86W+M2DQD3X1HgfL16Ko5+1uF+1Ak+H75+1Zi7k4KsOy8ooagorWzt9cuKULH40A
 /XvBb18h3er22s75fIxkJVMAiDRv4vLxPHtyRIHZCE85dzNLwKy7B+Nsicf5EuwL9FLmPLlntH4zcg==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: stunnel@attglobal.net
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

TGV0IG1lIHNlZSBpZiBJIGNhbiBpbnN0YWxsIDAuNyB3aXRob3V0IHRvbyBtYW55IGRlcGVuZGVu
Y2llcyBjcmVlcGluZyAKaW4uwqAgSSB0cmllZCB0aGUgbGF0ZXN0IFNsYWNrd2FyZSBjdXJyZW50
IGJ1aWxkIG9mIDAuOSwgYnV0IHRoZSAKZGVwZW5kZW5jaWVzIHdlcmUgZ2V0dGluZyBvdXQgb2Yg
aGFuZC4KCkNoZWVycy4KCgpPbiAxLzMvMjAyMCA4OjA3IEFNLCBKYXNvbiBBLiBEb25lbmZlbGQg
d3JvdGU6Cj4gSSB0b29rIGEgY2xvc2VyIGxvb2suIEluZGVlZCB0aGUgaXNzdWUgaXMgdGhhdCBu
ZnQgMC42IGlzIHRvbyBvbGQuIFVzZSAwLjcrLgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3dpcmVndWFyZAo=
