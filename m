Return-Path: <SRS0=7KPu=RF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CDEC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Mar 2019 07:29:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7C320836
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Mar 2019 07:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="tIghy2Ak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7C320836
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 737b0d25;
	Sat, 2 Mar 2019 07:19:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b977491b
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 07:19:16 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc4054c9
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 07:19:16 +0000 (UTC)
Date: Sat, 02 Mar 2019 07:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1551511750;
 bh=vrlHi+y/Hm05Ty95rK4kBNX5e3cHogIxUniYVv6labc=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:Feedback-ID:
 From;
 b=tIghy2AkS2GJyjcVOxWRVoofWXSDQzS/qbD+L/AMFnQ0Y9E4wJxU+7k2xqF3+1fhs
 la6cNgcHKcab+TzlnpBNPQ2IjAFZkQcF8jAQG3FTK0B8ifWHwJbB0BEpct+93Vjbwu
 D8tgMk4iFiL2gt+yh0tsUxMCYdJuHd0k5U9c808Q=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: kolargol <kolargol@protonmail.com>
Subject: Re: iOS WG Battery Life
Message-ID: <1cY0xL4k2A_qU-I2aF2Oz5uEt2LP_i6oCVA5H5rAsRet4lY1MU8GkCQWOXy8OYSZKGtprlH3lZorUozIOKChzb201YR8fdcMDsp5OS9zT1E=@protonmail.com>
In-Reply-To: <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
Feedback-ID: BeuBiSQcqsr-Krwtcv9IekhH3G8BPby93wz9So6BEG3RLXEAsJdmMzmwNOSrHC8ToF3fQqLPAjlqXY7tyhxFEQ==:Ext:ProtonMail
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kolargol <kolargol@protonmail.com>
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

SSBhbSBjb21wYXJpbmcgYmF0dGVyeSB0byBPcGVuVlBOICh0eXBpY2FsIGRyb3AgZG8gbm90IHBh
c3MgMTAlIGluIHNhbWUgY29uZGl0aW9ucyksIG9yIHdpdGhvdXQgVlBOIGF0IGFsbCAtIG1heCA3
JQoKRHVyaW5nIG5pZ2h0dGltZSB0aGVyZSBpcyBubyBhY3Rpdml0eSwgYWxzbyBpIGhhdmUgZGlz
YWJsZWQga2VlcC1hbGl2ZXMgKFBlcnNpc3RlbnRLZWVwYWxpdmUpIC0gdHJpZWQgd2l0aCBhbmQg
d2l0aG91dCAtIG5vIGJpZyBkaWZmZXJlbmNlLgoKClNlbnQgd2l0aCBQcm90b25NYWlsIFNlY3Vy
ZSBFbWFpbC4KCuKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKA
kOKAkOKAkOKAkOKAkApPbiBGcmlkYXksIE1hcmNoIDEsIDIwMTkgMTE6MDggQU0sIEthbGluIEtP
WkhVSEFST1YgPG1lLmthbGluQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIEZyaSwgTWFyIDEsIDIw
MTkgYXQgMTE6MDMgQU0ga29sYXJnb2wga29sYXJnb2xAcHJvdG9ubWFpbC5jb20gd3JvdGU6Cj4K
PiA+IEkgYW0gdGVzdGluZyBXRyBvbiB2YXJpdXMgT1NlcyBhbmQgZGV2aWNlcyBhbmQgSSBoYXZl
IG5vdGVkIHNldmVyZSBiYXR0ZXJ5IGRyYWluIG9uIGlPUyAoMTIuMiwgaVBob25lIDgpLiBUeXBp
Y2FsbHkgYmF0dGVyeSBkcm9wcyA0MCUgZHVyaW5nIG5pZ2h0LXRpbWUgKHRoYXQgaXMgNyBob3Vy
cyBvZiBpbmFjdGl2aXR5IG9uIHRoZSBwaG9uZSkgd2hlbiBXaXJlR3VhcmQgaXMgZW5nYWdlZC4K
Pgo+IENvbXBhcmVkIHRvIGhvdyBtdWNoIGR1cmluZyBuaWdodCB3aXRob3V0IGFjdGl2YXRlZCBX
aXJlR3VhcmQ/Cj4KPiA+IElzIHRoaXMgc29tZSBraW5kIG9mIGtub3duIGlzc3VlPyBJIGRpZCBu
b3QgaGFkIGNoYW5jZSB0byB0ZXN0IHByZXZpb3VzIGlPUyB2ZXJzaW9uIHdpdGhvdXQgU0lNRCBD
aGFDaGEyMCBzdXBwb3J0IHNvIGkgY2Fubm90IHRlbGwgaWYgaXQgaXMgYmVjb3VzZSBvZiB0aGUg
bGFzdCB1cGRhdGUuCj4gPiBBbnl0aGluZyBpIGNhbiBkbyB0byB0cmFjayBpc3N1ZSBoZXJlPwo+
Cj4gSXMgdGhlcmUgYW55dGhpbmcgdXNpbmcgdGhlIGludGVyZmFjZSwgb3IganVzdCB3ZyBrZWVw
LWFsaXZlPwo+IE1heSBiZSB0cnkgdG8gY2hhbmdlIHRoZSBrZWVwLWFsaXZlIHRvIGEgbG9uZ2Vy
IHBlcmlvZC4KPiBBbHNvIChhbmQgSSBoYXZlIDAgZXhwZXJpZW5jZSB3aXRoIGlPUyksIGEga2Vl
cC1hbGl2ZSBwYWNrZXQgbXkgd2FrZQo+IHVwIHRoZSBwaG9uZSwgYW5kIGxldCBpdCBzdGF5IGF3
YWtlIGZvciBzb21lIGxvbmdlci10aGFuLW5lZWRlZAo+IGludGVydmFsIChlLmcuIDUgbWludXRl
cykuCj4gVHJ5IHRvIGhhdmUgYSBsb29rIGF0IHdoYXQgYWN0dWFsbHkgZWF0cyB0aGUgYmF0dGVy
eTogQ1BVLCByYWRpbywgc2NyZWVuPwo+Cj4gQ2hlZXJzLAo+IEthbGluLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxp
c3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
