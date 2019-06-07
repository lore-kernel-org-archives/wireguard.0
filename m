Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CBFC31E5D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:18:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279E921479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zil.li header.i=@zil.li header.b="iklDV573"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279E921479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=zil.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c693f52d;
	Tue, 18 Jun 2019 15:18:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd83a052
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 23:57:30 +0000 (UTC)
Received: from epsilon.h6g-server.net (epsilon.h6g-server.net [185.207.104.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32732484
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 23:57:30 +0000 (UTC)
Subject: Re: Overlapping AllowedIPs Configuration
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zil.li; s=key2018;
 t=1559951849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r629E9ElFIIsB78RrFBHwMTFThw/Reys42rWphcd6XI=;
 b=iklDV573T/87l5L4LSvT7m9HB9uaEeoLmYocnT7qUfamflnVd9YeJA7eGYsDiKmWKKuVdg
 NfCJ/0/vw9RgGQCRta5xKeb+AKXaTJ86DLraE+c0+RAAydXBFdGQgsJFmRPHy0lSgqj4iO
 mmyIzAdaD/Zl5h86X3wEBmLwslysExAIJrmR9qcCDAN7gVUI0EVPjvpmEWUL7jceeRLBAZ
 DqwD60UrHjOpSvhENrlU2xuWDBi2rm+VfpSMhbRtgd/H4ipTBdC0HXj0fpCuYSKXjJU3YP
 m6DACngG6+9Py6SrsYzHHrkWt0sQU86ZGHbgpshtbtc2Teixb+AsVYbLtu08jA==
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 wireguard@lists.zx2c4.com
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
 <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li> <87lfyfdnyu.fsf@toke.dk>
From: Paul Zillmann <paul@zil.li>
Message-ID: <787e4ff3-0a96-4351-2971-195db61a461d@zil.li>
Date: Sat, 8 Jun 2019 01:58:12 +0200
MIME-Version: 1.0
In-Reply-To: <87lfyfdnyu.fsf@toke.dk>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:18:07 +0200
Cc: henningreich@gmail.com
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

SGVsbG8gVG9rZSwKCnRoYW5rcyBmb3IgeW91ciBpbmZvcm1hdGlvbi4KSSd2ZSBzZWVuIGEgdG9w
aWMgY2FtZSB1cCBvbiB0aGUgYmlyZCB1c2VyIG1haWxpbmcgbGlzdCB3aGljaCB5b3UgaGF2ZSAK
aGFkIGNyb3NzbGlua2VkIGhlcmUuCgpJbiB0aGUgbWVhbiB0aW1lIEkndmUgY3JlYXRlZCB0aGlz
IGxpdHRsZSBweXRob24gc2NyaXB0OiAKaHR0cHM6Ly9naXRodWIuY29tL3B6aWxsbWFubi93aXJl
Z3VhcmQtZHluYW1pYy1yb3V0aW5nCgpBdCBsZWFzdCBpdCBkb2VzIHRoZSBqb2IgZm9yIG1lLiBJ
IHRoaW5rIEphbm5lJ3MgY29kZSBuZWVkcyBzb21lIHRpbWUgZ28gCmdldCBpbnRlZ3JhdGVkIGlu
dG8gdXBzdHJlYW0gcGx1cyBhIGZldyBkYXlzIHVudGlsIGl0IGlzIHNoaXBwZWQgd2l0aCAKdGhl
IGRpc3RyaWJ1dGlvbnMuIChNYXliZSB3ZSBzZWUgaXQgaW4gRGViaWFuIDEwPykKClVudGlsIHRo
ZW4gdGhlcmUgaXMgdGhpcyBzY3JpcHQuIEZlZWwgZnJlZSB0byBnaXZlIG1lIHNvbWUgZmVlZGJh
Y2suCgotIFBhdWwKCkFtIDA2LjA2LjE5IHVtIDEyOjA5IHNjaHJpZWIgVG9rZSBIw7hpbGFuZC1K
w7hyZ2Vuc2VuOgo+IFBhdWwgWmlsbG1hbm4gPHBhdWxAemlsLmxpPiB3cml0ZXM6Cj4KPj4gSGVs
bG8sCj4+Cj4+IHdlIGhhdmUgdGhlIHNhbWUgcHJvYmxlbSBoZXJlLCBhbHRob3VnaCBvdXIgYWxs
b3dlZCBJUCByYW5nZXMgc2hvdWxkIGJlCj4+IDAuMC4wLjAvMCBmb3IgYWxsIHBlZXJzLgo+PiBX
ZSBoYXZlIE9TUEYgdHJhZmZpYyBvbiB0aGUgd2lyZWd1YXJkIGxpbmtzIHNvIGl0IHNob3VsZCBi
ZSB0YXNrIG9mIHRoZQo+PiBLZXJuZWwncyByb3V0aW5nIHRhYmxlIHRvIGRlY2lkZSB3aGVyZSB0
byBzZW5kIHdoYXQuCj4+Cj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGFsbG93ZWQtaXBzIGNv
bmZpZ3VyYXRpb24gaGFzIG11bHRpcGxlIHB1cnBvc2VzOgo+PiByb3V0aW5nIHRhYmxlIGFuZCBm
aXJld2FsbC9wYWNrZXQgZmlsdGVyLiBUaGlzIGludHJvZHVjZXMgdGhlc2UKPj4gcHJvYmxlbXMu
IEl0IHdvdWxkIGJlIGhlbHBmdWxsIHRvIGdldCBhIGNvbXBpbGUgZmxhZyBvciBzb21ldGhpbmcg
ZWxzZQo+PiB0byBtYWtlIHRoaXMgYmVoYXZpb3Igb3B0aW9uYWwuCj4gVGhhdCBpcyBwcm9iYWJs
eSBub3QgZ29pbmcgdG8gaGFwcGVuOyB0aGUgY3J5cHRvLXJvdXRpbmcgaXMgcXVpdGUKPiBpbnRl
Z3JhbCB0byBXaXJlZ3VhcmQsIGFuZCBpcyBhbiBpbXBvcnRhbnQgc2VjdXJpdHkgZmVhdHVyZS4K
Pgo+PiBSaWdodCBub3cgV2lyZWd1YXJkIGlzbid0IHZlcnkgZnJpZW5kbHkgdG8gZHluYW1pYyBy
b3V0aW5nLgo+Pgo+PiBJIGNhbWUgdXAgd2l0aCBtdWx0aXBsZSBzb2x1dGlvbnM6Cj4+IC0gY3Jl
YXRlIG11bHRpcGxlIGludGVyZmFjZXMgKyB0dW5uZWxzLgo+PiBvcgo+PiAtIGNyZWF0ZSBhIGJh
c2ggc2NyaXB0IHRoYXQgaW5qZWN0cyB0aGUgS2VybmVsJ3Mgcm91dGluZyB0YWJsZSBpbnRvIHRo
ZQo+PiB3ZyB0b29sIGV2ZXJ5IG90aGVyIG1pbnV0ZS4KPj4KPj4gRG8geW91IGd1eXMgaGF2ZSBh
IGJldHRlciBpZGVhPyBJZiBub3QgSSB3b3VsZCBjcmVhdGUgdGhlIGJhc2ggc2NyaXB0Lgo+IElN
TywgdGhlICJyaWdodCIgd2F5IHRvIGZpeCB0aGlzIGlzIHRvIG1ha2UgeW91ciByb3V0aW5nIGRh
ZW1vbiBhd2FyZSBvZgo+IHdpcmVndWFyZCBhbmQgaGF2ZSBpdCBjb25maWd1cmUgdGhlIHJvdXRl
cyBkaXJlY3RseSBpbnRvIHRoZSB3aXJlZ3VhcmQKPiB0YWJsZS4gVGhhdCBhbHNvIGdpdmVzIHlv
dSBzZWN1cml0eSBmb3IgeW91ciByb3V0aW5nIHByb3RvY29sCj4gYXV0b21hdGljYWxseSAoc2lu
Y2Ugb25seSBhdXRoZW50aWNhdGVkIHNvdXJjZXMvZGVzdGluYXRpb25zIHdpbGwgYmUKPiBhbGxv
d2VkKSwgYXMgbG9uZyBhcyB5b3UgaGF2ZSBhIHNlY3VyZSB3YXkgb2YgYm9vdHN0cmFwcGluZyB0
aGUKPiB3aXJlZ3VhcmQga2V5aW5nLgo+Cj4gLVRva2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3dpcmVndWFyZAo=
