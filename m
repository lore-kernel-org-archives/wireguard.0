Return-Path: <SRS0=9Q1L=YL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A176CA9EA9
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Oct 2019 21:17:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF7E20659
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Oct 2019 21:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF7E20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a02729f;
	Fri, 18 Oct 2019 21:16:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b488c13e
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Oct 2019 21:16:53 +0000 (UTC)
Received: from dnvrco-cmomta01.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54db5741
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Oct 2019 21:16:53 +0000 (UTC)
Received: from [192.168.0.2] ([23.243.28.100]) by cmsmtp with ESMTP
 id LZc8iXOid7K91LZcAiXt2G; Fri, 18 Oct 2019 21:16:51 +0000
Subject: Re: Still No Connection from iPhone
From: Eddie <stunnel@attglobal.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <63b32dcd-ec67-6a71-8780-c7893d1b7cab@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <ddf59e13-effa-9001-d5dd-0cae17261970@attglobal.net>
Date: Fri, 18 Oct 2019 14:16:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <63b32dcd-ec67-6a71-8780-c7893d1b7cab@attglobal.net>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEuZgdG1/+uafCjS2VaqSKx4DKLvbGHJXWr3xX/DPsBA8jTgsLtf+vLo19gE3UsTekpKQqp/M0RSdOD4BUwUVNqD41C3OFOmmXxNY6nIER8wb++k1WHa
 LXkNP/PupR1iUSW3nrYYLemLj1MsgoSsmPt2UqFClgjObAB5kD9wil9tfJ9PuwOhp4rBfsr24BGKEA==
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

T24gMTAvMTQvMjAxOSAyOjUzIFBNLCBFZGRpZSB3cm90ZToKPiBUaXRsZSBzYXlzIGl0IGFsbC7C
oCBJJ20gc3RpbGwgdW5hYmxlIHRvIGNvbm5lY3QgdG8gbXkgaG9tZSBDZW50T1MgCj4gc2VydmVy
IGZyb20gbXkgaVBob25lLsKgIEEgY2hlY2sgb2YgdGhlIElQIHNob3dzIEknbSBzdGlsbCByb3V0
ZWQgdmlhIAo+IEFUJlQuCj4KPiBPbiB0aGUgc2VydmVyLCB3ZyBzaG93cyBubyBjb25uZWN0aXZp
dHkgZnJvbSB0aGUgY2xpZW50IGF0IGFsbCBhbmQgaWYgCj4gSSB0ZW1wb3JhcmlseSBibG9jayB0
aGUgcG9ydCBpbiBteSBmaXJld2FsbCBpdCBkb2Vzbid0IHNob3cgYW55IAo+IGF0dGVtcHQgdG8g
Y29ubmVjdC4KPgo+IEknbSBydW5uaW5nIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB3ZyBmb3IgaU9T
ICgwLjAuMjAxOTEwMTIgKDE0KSkgb24gCj4gdGhlIGxhdGVzdCBpUGhvbmUgaU9TICgxMy4xLjIp
LsKgIExvZ3MgZnJvbSBpUGhvbmUgYXR0YWNoZWQuCj4KCkFuc3dlcmluZyBteSBvd24gcG9zdCwg
YXMgSSBjYW4gbm93IGNvbm5lY3QuCgpGb3IgdGhlIFBlZXIgc2VjdGlvbiwgQWxsb3dlZCBJUHMg
aXMgbGlzdGVkIGFzIE9wdGlvbmFsLsKgIEEgdmFsdWUgb2YgCjAuMC4wLjAvMCBlbmFibGVkIHRo
ZSBjb25uZWN0aW9uLCBsZWF2aW5nIGl0IGFzIE9wdGlvbmFsIGRvZXNuJ3QuCgpBZnRlciBjb25u
ZWN0aW5nLCBJIGNvdWxkbid0IGJyb3dzZSB0aGUgaW50ZXJuZXQuwqAgRW50ZXJpbmcgYSB2YWx1
ZSBpbnRvIAphbm90aGVyIE9wdGlvbmFsIGZpZWxkIGFwcGVhcnMgdG8gZml4IHRoYXQ6wqAgdGhl
IEludGVyZmFjZSBETlMgc2VydmVycy4KCkd1ZXNzIE9wdGlvbmFsIGlzbid0IHJlYWxseSBvcHRp
b25hbC7CoCA6LSkKCkFzIGFuIGFzaWRlLCBmb3IgdGhlIEROUyBzZXJ2ZXJzLCBiZWZvcmUgeW91
IGVudGVyIGEgdmFsdWUgaXQgc2hvd3MgCk9wdGlvbmFsLsKgIElmIHlvdSBwdXQgaW4gYSB2YWx1
ZSBhbmQgdGhlbiBlcmFzZSB0aGF0LCB0aGUgdW5kZXJseWluZyAKdGV4dCBub3cgc2F5czrCoCBT
dHJvbmdseSByZWNvbW1lbmRlZC4KCkNoZWVycy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBs
aXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93
aXJlZ3VhcmQK
