Return-Path: <SRS0=babZ=G4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8EBC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Jan 2021 08:13:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A4322C9C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Jan 2021 08:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A4322C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10424a81;
	Mon, 25 Jan 2021 08:10:09 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6501764a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jan 2021 08:10:06 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id B919118F2669; Mon, 25 Jan 2021 09:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1611562205;
 bh=7cVcJCzxFCpMOu8cNqRt7zYKuXxdknDvXZ1sLY8yo+A=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=Nju5MIQf+5woIQLe92VmSf/6/5+CN9gj+L6GmMDKowS38AwVpE5hxPAVKzvVqdIsR
 lwfA9S48RSBhVZLPt/dDRLWEN04ytGLdnPWGAoIyuOr8WN4W/23O7v5PcosOwy8FXx
 9w2lylL6OaOZmS3iA3L3UnGaQndH8I8wgIltOeVs=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id CD8CC18F265A;
 Mon, 25 Jan 2021 09:10:03 +0100 (CET)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4; Mon, 25 Jan 2021
 09:10:03 +0100
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0659.011;
 Mon, 25 Jan 2021 09:10:03 +0100
From: Simon Rozman <simon@rozman.si>
To: Manikandan Thiagarajan <tmani@prosimo.io>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Windows Tunnl.dll fails to start as a service.
Thread-Topic: Windows Tunnl.dll fails to start as a service.
Thread-Index: AQHW8m+s3KsG9iuH1k+05J1WN8UD5qo3+a1A
Date: Mon, 25 Jan 2021 08:10:03 +0000
Message-ID: <42d43d1503f34b8c87acda5fdf50307c@rozman.si>
References: <CAJV1VRBLdBwD=bud-M7LmcFUiHfHdNa3iNbBFzJzj+4GNpPSRQ@mail.gmail.com>
In-Reply-To: <CAJV1VRBLdBwD=bud-M7LmcFUiHfHdNa3iNbBFzJzj+4GNpPSRQ@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:52d:b984:3c78:ab47]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGksDQoNCj4gTG9nIE5hbWU6ICAgICAgU3lzdGVtDQo+IFNvdXJjZTogICAgICAgIFNlcnZpY2Ug
Q29udHJvbCBNYW5hZ2VyDQo+IERhdGU6ICAgICAgICAgIDEvMjEvMjAyMSA5OjQxOjI1IEFNDQo+
IEV2ZW50IElEOiAgICAgIDcwMjQNCj4gVGFzayBDYXRlZ29yeTogTm9uZQ0KPiBMZXZlbDogICAg
ICAgICBFcnJvcg0KPiBLZXl3b3JkczogICAgICBDbGFzc2ljDQo+IFVzZXI6ICAgICAgICAgIE4v
QQ0KPiBDb21wdXRlcjogICAgICBNQU5JLVdJTjEwLVRFU1QNCj4gRGVzY3JpcHRpb246DQo+IFRo
ZSBQcm9zaW1vVHVubmVsX2lmX2NiYzJhMDU2ZGZkYzI1Zjcgc2VydmljZSB0ZXJtaW5hdGVkIHdp
dGggdGhlDQo+IGZvbGxvd2luZyBzZXJ2aWNlLXNwZWNpZmljIGVycm9yOg0KPiBUaGUgc3lzdGVt
IGNhbm5vdCBmaW5kIHRoZSBwYXRoIHNwZWNpZmllZC4NCg0KIlRoZSBzeXN0ZW0gY2Fubm90IGZp
bmQgdGhlIHBhdGggc3BlY2lmaWVkLiIgPD0gaXMgeW91ciBzZXJ2aWNlIHBhdGggY29ycmVjdD8g
RG91YmxlIGNoZWNrIGl0LiBNaW5kIHRoZSBwYXRoIGRlZmxlY3Rpb24gZm9yIFdvVzY0IHByb2Nl
c3Nlcy4gU0NNIGlzIGFsd2F5cyBuYXRpdmUgKHg2NCBvbiB4NjQgV2luZG93cywgeDg2IG9uIHg4
NiBXaW5kb3dzLi4uKS4gU28sIHRoZSBzZXJ2aWNlIHBhdGggbXVzdCBtYXRjaCB0aGUgcGF0aCBh
cyBhIG5hdGl2ZSBwcm9jZXNzIHdvdWxkIHNlZSBpdC4NCg0KT3IgaXMgaXQganVzdCB0aGUgZmFj
dCB0aGF0IHNvbWV0aGluZyByZXR1cm5zIHN0YXR1cyAyIHdoaWNoIGlzIGludGVycHJldGVkIGFz
IEVSUk9SX0ZJTEVfTk9UX0ZPVU5EIGJ5IHRoZSBFdmVudCBMb2c/DQoNCj4gMjAyMS0wMS0yMSAx
MDowNDoyMC4xODE4MzE6IFtUVU5dIFtpZl8xZWE3ZDAwYzIzYTYxNmIxXSBDcmVhdGluZyBXaW50
dW4NCj4gaW50ZXJmYWNlDQo+IDIwMjEtMDEtMjEgMTA6MDQ6MjAuODk2NDgwOiBbVFVOXSBbaWZf
MWVhN2QwMGMyM2E2MTZiMV0gVXNpbmcNCj4gV2ludHVuLzAuOCAoTkRJUyA2LjgzKQ0KPiAyMDIx
LTAxLTIxIDEwOjA0OjIwLjkwOTA2NTogW1RVTl0gW2lmXzFlYTdkMDBjMjNhNjE2YjFdIEVuYWJs
aW5nDQo+IGZpcmV3YWxsIHJ1bGVzDQo+IDIwMjEtMDEtMjEgMTA6MDQ6MjIuMTI2NTU2OiBbVFVO
XSBbaWZfMWVhN2QwMGMyM2E2MTZiMV0gU3RhcnRpbmcNCj4gV2lyZUd1YXJkLzAuMS4xIChXaW5k
b3dzIDEwLjAuMTkwNDE7IGFtZDY0KQ0KPiAyMDIxLTAxLTIxIDEwOjA0OjIyLjEyNzU4MDogW1RV
Tl0gW2lmXzFlYTdkMDBjMjNhNjE2YjFdIFdhdGNoaW5nIG5ldHdvcmsNCj4gaW50ZXJmYWNlcw0K
PiAyMDIxLTAxLTIxIDEwOjA0OjIyLjEyODYwNDogW1RVTl0gW2lmXzFlYTdkMDBjMjNhNjE2YjFd
IFJlc29sdmluZyBETlMNCj4gbmFtZXMNCj4gMjAyMS0wMS0yMSAxMDowNDoyMi4xMzUyMzQ6IFtU
VU5dIFtpZl8xZWE3ZDAwYzIzYTYxNmIxXSBDcmVhdGluZyBXaW50dW4NCj4gaW50ZXJmYWNlDQo+
IDIwMjEtMDEtMjEgMTA6MDQ6MjQuMTU2NjM4OiBbVFVOXSBbaWZfMWVhN2QwMGMyM2E2MTZiMV0g
U3RhcnRpbmcNCj4gV2lyZUd1YXJkLzAuMS4xIChXaW5kb3dzIDEwLjAuMTkwNDE7IGFtZDY0KQ0K
PiAyMDIxLTAxLTIxIDEwOjA0OjI0LjE1OTM2NTogW1RVTl0gW2lmXzFlYTdkMDBjMjNhNjE2YjFd
IFdhdGNoaW5nIG5ldHdvcmsNCj4gaW50ZXJmYWNlcw0KPiAyMDIxLTAxLTIxIDEwOjA0OjI0LjE1
OTM2NTogW1RVTl0gW2lmXzFlYTdkMDBjMjNhNjE2YjFdIFJlc29sdmluZyBETlMNCj4gbmFtZXMN
Cj4gMjAyMS0wMS0yMSAxMDowNDoyNC4xNjUzNzU6IFtUVU5dIFtpZl8xZWE3ZDAwYzIzYTYxNmIx
XSBDcmVhdGluZyBXaW50dW4NCj4gaW50ZXJmYWNlDQo+IDIwMjEtMDEtMjEgMTA6MDQ6MjQuNjE2
ODIwOiBbVFVOXSBbaWZfMWVhN2QwMGMyM2E2MTZiMV0gVW5hYmxlIHRvIGNyZWF0ZQ0KPiBXaW50
dW4gaW50ZXJmYWNlOiBFcnJvciByZWdpc3RlcmluZyByaW5nczogRXJyb3IgbGlzdGluZyBORElT
DQo+IGludGVyZmFjZXM6IG5vIGludGVyZmFjZXMgZm91bmQNCg0KV2ludHVuIDAuOCBpcyBvdXQg
b2Ygb3VyIHN1cHBvcnQuIFBsZWFzZSwgdXBncmFkZSB5b3VyIHdpcmVndWFyZC1nbyBhbmQgV2lu
dHVuIHRvIHRoZSBsYXRlc3QgdmVyc2lvbiBmaXJzdCBhbmQgc2VlIGlmIHRoZSBwcm9ibGVtIHBl
cnNpc3RzLg0KDQpXaHkgaXMgdGhhdCBpbXBvcnRhbnQ/IEJlY2F1c2UsIHdlIGNvbXBsZXRlbHkg
cmV3cm90ZSB0aGUgd2lyZWd1YXJkLWdvIDwtPiBXaW50dW4gY29tbXVuaWNhdGlvbiBpbiB2MC4w
LjIwMjAxMTE4IGFuZCB2MC4xMCByZXNwZWN0aXZlbHkuIFRoZSBpc3N1ZSB5b3UgYXJlIHNlZWlu
ZyBpcyB0cmlnZ2VyZWQgaW4gYSBwYXJ0IG9mIHRoZSBjb2RlIHRoYXQgaXMgbm93IGdvbmUgZnJv
bSB3aXJlZ3VhcmQtZ28gYW5kIGhhcyBiZWVuIHJld3JpdHRlbiBpbiB0aGUgbmV3IHdpbnR1bi5k
bGwuDQoNCihUaGUgbmV3IFdpbnR1biBubyBsb25nZXIgc2hpcHMgYXMgYSBkcml2ZXIgcGFja2Fn
ZSB5b3UgbmVlZCB0byBpbnN0YWxsLCBidXQgcmF0aGVyIGFzIGEgc2VsZi1jb250YWluZWQgZG8t
aXQtYWxsIERMTC4gRG9uJ3Qgd29ycnksIHRoZSBuZXcgd2lyZWd1YXJkLWdvIGtub3dzIGhvdyB0
byB1c2UgaXQuIEp1c3QgYWRkIHdpbnR1bi5kbGwgbmV4dCB0byBpdC4pDQoNClJlZ2FyZHMsDQpT
aW1vbg0K
