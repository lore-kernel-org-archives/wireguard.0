Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6F3C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 07:25:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B750F2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 07:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=glemt.net header.i=@glemt.net header.b="Tepgv4hh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B750F2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=glemt.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 289b1d9f;
	Mon, 10 Dec 2018 07:16:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f4268ae
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 07:16:35 +0000 (UTC)
Received: from gjen.glemt.net (2001:ba8:1f1:f2fe::2
 [IPv6:2001:ba8:1f1:f2fe::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7484215
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=glemt.net; 
 s=2018-06-01;
 h=Message-ID:References:In-Reply-To:Subject:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G5K2loaCgTSR6t5WKJG6v8oYG47VXg64SH0tOidziL8=; b=Tepgv4hhDf0bJ8pebt//sZuy0o
 sBRse9CI46jClwZ22Dx1UW6GNc2RD6y62I0JT1jezHwayGwIfrlFPVlYKs5fdaRSg61kuTt8cu8lB
 6F5IksBSX/bfzLUx0inkWyBIM8bfqz+gcRUQ7fIwns5rKPdqgbrnvEOPOObwEYEv3VtXtJQxPuZqI
 niM/IzNHYuuCVG8bRg7tSuQhhA+vwfpkET9/PiBRRRQ9zm3af9YY8d4HL9ygDfU5PkP4J5BwJj4GB
 WQZkSnLcF3McTLvZ4mBp/Ptemwke9RdATfzcbYd9+2AEUDo7g/tcIxGtJR0ANw6HNyWQqyXpwNUKb
 YTowuniA==;
Received: from localhost ([::1] helo=gjen.glemt.net)
 by gjen.glemt.net with esmtp (Exim 4.91)
 (envelope-from <olemd@glemt.net>) id 1gWFwD-0007RE-F3
 for wireguard@lists.zx2c4.com; Mon, 10 Dec 2018 08:25:09 +0100
MIME-Version: 1.0
Date: Mon, 10 Dec 2018 08:25:04 +0100
From: Ole-Morten Duesund <olemd@glemt.net>
To: wireguard@lists.zx2c4.com
Subject: Re: "bus error" when generating public key
In-Reply-To: <2DE53C12-A1B1-4E06-9391-7F64BC7328A2@gmail.com>
References: <2DE53C12-A1B1-4E06-9391-7F64BC7328A2@gmail.com>
Message-ID: <454afe3cf69164bb945571f9eceaf1bd@glemt.net>
X-Sender: olemd@glemt.net
User-Agent: Roundcube Webmail/1.3.8
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

T24gMjAxOC0xMi0wNyAxMjo0NiwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiBJ4oCZbSB3b3Jr
aW5nIHRvIGFkZCBXaXJlR3VhcmQgc3VwcG9ydCB0byBhbiBlbWJlZGRlZCBkaXN0cm8gdGhhdCBy
dW5zCj4gb24gYSBtaXggb2YgeDg2IGFuZCBBUk0gaGFyZHdhcmUuIEnigJltIHVzaW5nIDQuMTku
NyBhcyB0aGUga2VybmVsIGJhc2UsCj4gY3Jvc3MgY29tcGlsaW5nIHVzaW5nIGEgd2VsbCBwcm92
ZW4gdG9vbGNoYWluIGFuZCBidWlsZC1zeXN0ZW0uIFRoZQo+IGtlcm5lbCBkZWZjb25maWcgY2Fu
IGJlIHNlZW4gaGVyZToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9MaWJyZUVMRUMu
dHYvYmxvYi9hbWxvZ2ljL3Byb2plY3RzL0FtbG9naWMvbGludXgvbGludXguYWFyY2g2NC5jb25m
Cj4gCj4gSSBzZWUgbm8gY29tcGlsZSBlcnJvcnMgd2hlbiBidWlsZGluZyB0aGUga2VybmVsIG1v
ZHVsZSBvciB3aXJlZ3VhcmQKPiB0b29scy4gVGhlIGtlcm5lbCBtb2R1bGUgbG9hZHMgd2l0aG91
dCBlcnJvcnMgYW5kIOKAmHdn4oCZIGNhbiBnZW5lcmF0ZQo+IHByaXZhdGUgYW5kIHByZXNoYXJl
ZCBrZXlzLCBidXQgd2hlbiBjcmVhdGluZyBhIHB1YmxpYyBrZXkgZnJvbSB0aGUKPiBwcml2YXRl
IGtleSDigJh3ZyBwdWJrZXkgPCAvcGF0aC90by9wcml2YXRla2V5JyBmYWlscyB3aXRoIOKAnEJ1
cyBlcnJvcuKAnQo+IGFuZCBubyBrZXkgaXMgZ2VuZXJhdGVkLgoKIkJ1cyBlcnJvciIgZnJvbSB0
aGUgd2cgdG9vbCBkb2Vzbid0IGhhdmUgYW55IHRoaW5nIHRvIGRvIHdpdGggdGhlIAprZXJuZWwt
bW9kdWxlLiBJZiBJIHNob3VsZCBndWVzcyBJJ2QgZ28gZm9yIHNvbWUgaW5jb21wYXRpYmlsaXR5
IGJldHdlZW4gCnRoZSBpbnN0YWxsZWQgd2lyZWd1YXJkLXRvb2xzIHBhY2thZ2UgYW5kIHRoZSBy
ZXN0IG9mIHlvdXIgc3lzdGVtLgoKQWxzbywgbXkgL3Vzci9iaW4vd2cgaXMgbGlua2VkIHdpdGgg
bGlibW5sMCBhcyB3ZWxsLgoKLSBPTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJj
NC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
