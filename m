Return-Path: <SRS0=5LHB=JY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D849C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 09:56:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38CD661040
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38CD661040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70fcf4a8;
	Tue, 27 Apr 2021 09:54:31 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0c2e11b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Apr 2021 09:54:30 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 35C3F18E8786; Tue, 27 Apr 2021 11:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1619517270;
 bh=D/R2s8VWQtxKbrgPbzYB+GIRrxuuAEbRgGw9J9Jq/hc=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=m0kMksaEdffs0YNz/iKn2KMLQeuI7jKZ4FLxnwMwUg1GnUCNeiDQgjHQRBJHF5ZLL
 vFFeylvuPRTVYWwgzumC0wD74CU74b03ASdDyo9fmvia1OU8NgtUc0huV1m0oYAHIZ
 ppi0SANWBNF5pOcxY5wz9txFdnqGHIjszeG0DsDg=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id CCE5418E8786;
 Tue, 27 Apr 2021 11:54:27 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 27 Apr 2021
 11:54:15 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0792.013;
 Tue, 27 Apr 2021 11:54:15 +0200
From: Simon Rozman <simon@rozman.si>
To: Johnathan Clarke <johnathanclarke@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Error when connecting from windows client
Thread-Topic: Error when connecting from windows client
Thread-Index: AQHXOs7qioRnYCdJr0CIN6Od3eBiQarIG2vQ
Date: Tue, 27 Apr 2021 09:54:15 +0000
Message-ID: <8720b8df1b0d4226a4c93d056c9b0b97@rozman.si>
References: <CAOSAzkKgZS_-tRkbo10gZ3CrTfNPfBUuBUwY4bMY+W0Ynj_pNg@mail.gmail.com>
 <CAOSAzkJJiv6uqVgdPqCYpGqabti3bmDrBU1gAX8Oy7ZqikuYNw@mail.gmail.com>
In-Reply-To: <CAOSAzkJJiv6uqVgdPqCYpGqabti3bmDrBU1gAX8Oy7ZqikuYNw@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:44:379a:544a:de84]
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

SGksDQoNCj4gMjAyMS0wNC0yNiAxNDo0NTozMy4zODIzOTg6IFtUVU5dIFtIb21lXSBDcmVhdGlu
ZyBXaW50dW4gaW50ZXJmYWNlDQo+IDIwMjEtMDQtMjYgMTQ6NDU6MzMuNTE5OTI4OiBbVFVOXSBb
SG9tZV0gW1dpbnR1bl0gQ3JlYXRlQWRhcHRlcjoNCj4gQ3JlYXRpbmcgYWRhcHRlcg0KPiAyMDIx
LTA0LTI2IDE0OjQ1OjMzLjgyODMyODogW1RVTl0gW0hvbWVdIFtXaW50dW5dIFNlbGVjdERyaXZl
cjogVXNpbmcNCj4gZXhpc3RpbmcgZHJpdmVyIDAuMTANCj4gMjAyMS0wNC0yNiAxNDo0NTozNC4y
ODkxNTk6IFtUVU5dIFtIb21lXSBbV2ludHVuXSBDcmVhdGVBZGFwdGVyOg0KPiBGYWlsZWQgdG8g
c2V0dXAgYWRhcHRlciAoc3RhdHVzOiAweDApOiBUaGUgb3BlcmF0aW9uIGNvbXBsZXRlZA0KPiBz
dWNjZXNzZnVsbHkuIChDb2RlIDB4MDAwMDAwMDApDQoNCllvdXIgbG9nIGluZGljYXRlcyB0aGF0
IHRoZSBhZGFwdGVyIGRldmljZSB3YXMgY3JlYXRlZCwgYnV0IGhhcyBhIHByb2JsZW0gY29kZSB3
aXRoIGEgU1RBVFVTX1NVQ0NFU1MgcHJvYmxlbSBzdGF0dXMuIEkgaGF2ZSByZWludHJvZHVjZWQg
dGhlIHByb2JsZW0gY29kZSBjaGVjayBpbiBodHRwczovL2dpdC56eDJjNC5jb20vd2ludHVuL2Nv
bW1pdC8/aWQ9Mjg4MTE2NGJmZjBlODE5ZjZiMGI2ZDVmYzVkM2ExODVlY2I0NzQ1Ny4gVGhpcyBz
aG91bGQgZXZhbHVhdGUgdGhlIFdpbnR1biBhZGFwdGVyIHN0YXRlIHdpdGggYmV0dGVyIHByZWNp
c2lvbi4NCg0KTWVhbndoaWxlLCBjYW4geW91IHBsZWFzZSBleGFtaW5lIHlvdXIgQzpcV2luZG93
c1xJTkZcc2V0dXBhcGkuZGV2LmxvZyBmaWxlIGZvciBjbHVlcy4gKE5vdGUgdGhhdCBhIDB4MWYv
MHhjMDAwMDQ5NSBwcm9ibGVtIGNvZGUvc3RhdHVzIGlzIG5vcm1hbCB3aGVuIFdpbnR1biBhZGFw
dGVyIGlzIGNyZWF0ZWQgZWFybHkgYXQgYm9vdC4gSGVuY2UgdGhlIFNUQVRVU19QTlBfREVWSUNF
X0NPTkZJR1VSQVRJT05fUEVORElORyBjaGVjayBpbiB0aGUgY29kZS4pDQoNClJlZ2FyZHMsIFNp
bW9uDQo=
