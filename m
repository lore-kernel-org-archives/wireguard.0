Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C518C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:01:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3280E2176F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3280E2176F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ironai.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bb7c2e8;
	Mon, 18 Feb 2019 22:52:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 988a2ea8
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 18:18:06 +0000 (UTC)
Received: from achernar.uberspace.de (achernar.uberspace.de [95.143.172.237])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6991f2d
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 18:18:06 +0000 (UTC)
Received: (qmail 23113 invoked from network); 17 Feb 2019 18:26:23 -0000
Received: from localhost (HELO ?IPv6:2a02:790:ff:1021:e6f8:9cff:feb4:b5e0?)
 (127.0.0.1)
 by achernar.uberspace.de with SMTP; 17 Feb 2019 18:26:23 -0000
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: wireguard@lists.zx2c4.com
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
From: Vincent Wiemann <vincent.wiemann@ironai.com>
Message-ID: <f8b55fa4-225b-b91b-8193-626be7b8d349@ironai.com>
Date: Sun, 17 Feb 2019 19:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 18 Feb 2019 23:52:56 +0100
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

SXQgd291bGQgYmUgZ3JlYXQgaWYgV2lyZUd1YXJkIGNvdWxkIHJlc29sdmUgRE5TIHdpdGhvdXQg
b25lIGhhdmluZyB0bwpjYWxsIHRoZSB1c2Vyc3BhY2UgY29uZmlndXJhdGlvbiB0b29sIG1hbnVh
bGx5IChlLmcuIHRvIHN1cHBvcnQgRHluRE5TKS4KT25lIGNvdWxkIGJ1aWxkIHVwIG9uCmh0dHBz
Oi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kbnNfcmVzb2x2
ZXIudHh0ICwKYnV0IGl0J3MgYSBsb3Qgb2Ygd29yayBhbmQgc2hvdWxkbid0IGJlIGEgZ29hbCBi
ZWZvcmUgV2lyZUd1YXJkIGJlY29tZXMKYW4gdXBzdHJlYW0ga2VybmVsIG1vZHVsZS4KClJlZ2Fy
ZHMsCgpWaW5jZW50IFdpZW1hbm4KCk9uIDE3LjAyLjIwMTkgMDQ6MDMsIERhdmlkIEtlcnIgd3Jv
dGU6Cj4gRXJpaywgc2VlIGhlcmUgZm9yIGEgcHJvcG9zZWQgZml4LsKgIE5vIHJlc3BvbnNlIGZy
b20gdGhlIFdpcmVHdWFyZCB0ZWFtCj4geWV0LsKgCj4gCj4gaHR0cHM6Ly9saXN0cy56eDJjNC5j
b20vcGlwZXJtYWlsL3dpcmVndWFyZC8yMDE5LUphbnVhcnkvMDAzODQyLmh0bWwKPiAKPiBSZWNl
bnRseSBJIGhhZCBhIHBvd2VyIG91dGFnZSBhbmQgYm90aCBteSBnYXRld2F5IGFuZCBjYWJsZSBt
b2RlbSB3ZW50Cj4gb2ZmbGluZS4gT24gcG93ZXIgcmVjb3ZlcnkgYm90aCBkZXZpY2VzIHN0YXJ0
IHVwLCBidXQgdGhlIGdhdGV3YXkKPiBjb21wbGV0ZXMgc3RhcnR1cCBiZWZvcmUgdGhlIGNhYmxl
IG1vZGVtIGNvbXBsZXRlcyBpdHMgcHJvdG9jb2wKPiBuZWdvdGlhdGlvbnMsIHNvIGluaXRpYWxs
eSB0aGUgZXh0ZXJuYWwgbmV0d29yayAoZXRoMCkgaXMgbm90Cj4gZnVuY3Rpb25hbC7CoCBUaGF0
IGNvbWVzIG9ubGluZSBzYXkgb25lIG1pbnV0ZSBsYXRlciBhbmQgYWxsIGlzIHdlbGwuCj4gCj4g
RXhjZXB0IHRoYXQgYWxsIGlzIG5vdCB3ZWxsLsKgIFdpcmVndWFyZCBmYWlsZWQgdG8gc3RhcnQg
dXAgYmVjYXVzZSBJCj4gaGF2ZSBFbmRwb2ludD08YSBVUkw+IGluc3RlYWQgb2YgYSBJUCBhZGRy
ZXNzLsKgIEFuZCBiZWNhdXNlIGV4dGVybmFsCj4gaW50ZXJmYWNlIGlzIG5vdCBsaXZlIHlldCwg
RE5TIGxvb2t1cCBmYWlscyBhbmQgV2lyZWd1YXJkIGRvZXMgbm90Cj4gZ3JhY2VmdWxseSBoYW5k
bGUgaXQuwqAgVGhpcyBpcyByZWFsbHkgaW1wb3J0YW50IGJlY2F1c2UgV2lyZWd1YXJkIG1heSBi
ZQo+IG15IG9ubHkgd2F5IGludG8gbXkgbG9jYWwgbmV0d29yay4KPiAKPiBBcyB3b3JrLWFyb3Vu
ZCBJIHJlcGxhY2VkIHRoZSBVUkwgd2l0aCB0aGUgSVAgYWRkcmVzcy4uLiBidXQgdGhhdCBpcyBu
b3QKPiBhIGxvbmcgdGVybSBzb2x1dGlvbiBpZiB0aGUgZW5kcG9pbnQgaXMgbm90IGEgc3RhdGlj
wqBJUCBhZGRyZXNzLgo+IAo+IFdpcmVndWFyZCBuZWVkcyB0byBoYW5kbGUgdGhlIHNpdHVhdGlv
biB3aGVyZSBleHRlcm5hbCBuZXR3b3JrIG1heSBub3QKPiBoYXZlIHN0YWJpbGl6ZWQgYXQgdGhl
IHRpbWUgaXQgc3RhcnRzIHVwLsKgIFRoZSBhYm92ZSBsaW5rIHByb3Bvc2VkIGEgZml4LsKgCj4g
Cj4gRGF2aWQKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29t
Cj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJk
IG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengy
YzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
