Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0523EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 16:26:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ce86d0f6;
	Fri, 22 Apr 2022 16:25:41 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 794e8a66
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 16:25:40 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 5C7ED18E87DC; Fri, 22 Apr 2022 18:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1650644740;
 bh=3dwio9Ktwa+Cf4xYcXz5k7ifr4fU9lA7zlLb2c4O86Q=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=elDF8AQnWk23Th6R8FBX8QjLaX8hPNaeY8Q241M/sMzkMnwXAQGEjjDi96ruSMfmo
 IAYl92y2Q/6or4aHVjKTzBNS9Z2DTtVW2+CTbinsfLP4epp5Pbs0NwZ6nzjykpjokC
 dGnXELChnF2gwKz4Pfrp3gjlo6Lqq2A6fSn13txc=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 0710918E8784;
 Fri, 22 Apr 2022 18:25:38 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 18:25:37 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0986.022;
 Fri, 22 Apr 2022 18:25:37 +0200
From: Simon Rozman <simon@rozman.si>
To: Dimitri Papadopoulos Orfanos <dimitri.papadopoulos@cea.fr>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: Wintun on Windows 11
Thread-Topic: Wintun on Windows 11
Thread-Index: AQHYVd0yZI4v9c/0vEO3PxQRWTHMraz8HstQ
Date: Fri, 22 Apr 2022 16:25:37 +0000
Message-ID: <0606b759a4ac40e2b3b791c4761d0d40@rozman.si>
References: <367df062-5c7c-2916-db4d-afdf6c7d92db@cea.fr>
In-Reply-To: <367df062-5c7c-2916-db4d-afdf6c7d92db@cea.fr>
Accept-Language: en-SI, en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:9556:65b5:a12a:25e7]
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

PiBUaGUgUkVBRE1FIHN0YXRlcyB0aGF0IFdpbnR1biAiaXMgYSBsYXllciAzIFRVTiBkcml2ZXIg
Zm9yIFdpbmRvd3MgNywgOCwNCj4gOC4xLCBhbmQgMTAiOg0KPiAJaHR0cHM6Ly9naXQuengyYzQu
Y29tL3dpbnR1bi90cmVlL1JFQURNRS5tZCNuNA0KPiANCj4gWW91IHNob3VsZCBhZGQgV2luZG93
cyAxMSB0byB0aGUgbGlzdC4NCg0KVGhhbmtzLiBBZGRlZC4NCg0KUmVnYXJkcywNClNpbW9uIA0K
