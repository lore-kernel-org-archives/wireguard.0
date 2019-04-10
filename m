Return-Path: <SRS0=meay=SM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB78C10F11
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Apr 2019 18:20:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B648F2077C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Apr 2019 18:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B648F2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e2bd918;
	Wed, 10 Apr 2019 18:20:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41b4a0e1
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Apr 2019 18:20:49 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 602de426
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Apr 2019 18:20:49 +0000 (UTC)
Received: from [IPv6:2600:380:856c:f035:4c9a:db4f:136b:cab9]
 ([2600:380:856c:f035:4c9a:db4f:136b:cab9])
 (AUTH: LOGIN pallas, TLS: TLS1.2,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by telperion.info with ESMTPSA
 id 0000000000050381.000000005CAE3529.00006D66; Wed, 10 Apr 2019 11:25:44 -0700
Mime-Version: 1.0 (1.0)
Subject: Re: Revisiting the weird MTU issue
From: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <20190410203431.24b55c89@natsu>
Date: Wed, 10 Apr 2019 11:20:11 -0700
Message-Id: <A92609A1-27DC-4DBB-BE8C-BF740A63153B@pallas.us>
References: <20190410203431.24b55c89@natsu>
To: Roman Mamedov <rm@romanrm.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

TVRVIGRpc2NvdmVyeSBpc24ndCBzdXBwb3J0ZWQgd2lkZWx5IGluIG15IGV4cGVyaWVuY2UuIE15
IHJ1bGUgaGFzIGJlZW4gdG8gc2V0IHRoZSBpbnRlcmZhY2UgdG8gMTI4MCwgd2hpY2ggaXMgdGhl
IG1pbmltdW0gYWxsb3dlZC4KCn5EZXJyaWNrIOKAoiBpUGhvbmUKCj4gT24gQXByIDEwLCAyMDE5
LCBhdCA4OjM0IEFNLCBSb21hbiBNYW1lZG92IDxybUByb21hbnJtLm5ldD4gd3JvdGU6Cj4gCj4g
SGVsbG8sCj4gCj4gSSB1c2UgV2lyZUd1YXJkIG92ZXIgSVB2NiBvbiBhIFBQUG9FIGNvbm5lY3Rp
b24uIFRoZSBJbnRlcm5ldCBpbnRlcmZhY2UgTVRVIGlzCj4gMTQ5Mi4gQnkgbXkgY2FsY3VsYXRp
b25zIE1UVSAxNDEyIG9uIHRoZSBXRyBpbnRlcmZhY2Ugc2hvdWxkIGZpdC4KPiAKPiBIb3dldmVy
LCB0aGUgZm9sbG93aW5nIG9jY3VycyBvbiB2YXJpb3VzIE1UVSBjb21iaW5hdGlvbnMgYmV0d2Vl
biB0aGUgUmVtb3RlCj4gKGEgc2VydmVyIGluIGEgREMgd2l0aCBmdWxsIDE1MDAgd2lyZSBNVFUp
IGFuZCBMb2NhbCBXRyBpbnRlcmZhY2UgTVRVczoKPiAKPiBGYWlscyBvciBub3QsIGlzIHdoZXRo
ZXIgYSB3aXRoaW4tV0cgUmVtb3RlLT5Mb2NhbCBUQ1AgY29ubmVjdGlvbiAoaXBlcmYzKQo+IHdv
cmtzIGZpbmUgb3IgaGFuZ3MgdXAgYWZ0ZXIgdHJhbnNmZXJyaW5nIGEgZmV3IGluaXRpYWwgYml0
cyBvZiBkYXRhLgo+IAo+IFJlbW90ZSAgTG9jYWwgIFJlc3VsdAo+ID09PT09PT09PT09PT09PT09
PT09Cj4gIDE0MjAgICAxNDIwICBGYWlscyAoYXMgZXhwZWN0ZWQpCj4gCj4gIDE0MjAgICAxNDEy
ICBGYWlscyAod2VpcmQpCj4gCj4gIDE0MTIgICAxNDEyICBXb3JrcyAoZmFpciBlbm91Z2gpCj4g
Cj4gIDE0MjAgICAxNDA4ICBXb3JrcyAoc3VwZXIgd2VpcmQhISEpCj4gCj4gTm93IEkgaG9wZSBJ
IGRlc2NyaWJlZCB0aGUgc2l0dWF0aW9uIGNsZWFyZXIgdGhhbiB0aGUgbGFzdCB0aW1lIHBvc3Rp
bmcgYWJvdXQKPiB0aGlzLCBzbyBtYXliZSBzb21lb25lIGhhcyBhbiBpZGVhIHdoYXQgY291bGQg
YmUgdGhlIGN1bHByaXQ/Cj4gCj4gU28gZmFyIHRoaXMgZG9lc24ndCBjYXVzZSB0b28gbXVjaCBp
c3N1ZSwgYXMgSSdtIHVzaW5nIG9uIGRlc2lnbmF0ZWQgcDJwIGxpbmtzCj4gZm9yIHdoZW4gb25l
IG9mIHRoZSBwZWVycyBpcyBvbiB0aGlzIFBQUG9FLCBJIGp1c3QgdXNlIDE0MTIgb24gYm90aCBz
aWRlcy4gQnV0Cj4gc3RpbGwsIHN1cmVseSB0aGUgYWJvdmUgc2hvdWxkbid0IGhhcHBlbj8KPiAK
PiAtLSAKPiBXaXRoIHJlc3BlY3QsCj4gUm9tYW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPiBXaXJlR3Vh
cmRAbGlzdHMuengyYzQuY29tCj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpo
dHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
