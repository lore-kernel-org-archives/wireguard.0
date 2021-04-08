Return-Path: <SRS0=g8VQ=JF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1A2C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 14:24:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F586101B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 14:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F586101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c347cb73;
	Thu, 8 Apr 2021 14:24:26 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cd8d2757
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 14:24:24 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 4914718E8787; Thu,  8 Apr 2021 16:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1617891863;
 bh=yg/AlWsJNt023raX/0G3h/U+BpogxWAfA7oimEX1SpE=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=AZ1wKR6kOIMcdJiUg8xbM0tuEVAMHuKnqFTpOtC7Y6r0a2XLVvAZ/qNn6pIsboAT7
 +Xy+vmTDp1ExqE+dJV6IfqmYhvXmZEFqrDZJMMABNNEtnezbkOqttk9zbm2UuMbxfz
 Hi8GuCSqS85y7cy3FrHgTIrd1T04vFkO8s95I9YM=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 0E32B18E8787;
 Thu,  8 Apr 2021 16:24:21 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Thu, 8 Apr 2021
 16:24:08 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0792.010;
 Thu, 8 Apr 2021 16:24:08 +0200
From: Simon Rozman <simon@rozman.si>
To: zhengfish <zhengfish@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: [Wintun] Does wintun.dll support IOCP API?
Thread-Topic: [Wintun] Does wintun.dll support IOCP API?
Thread-Index: AQHXKy9qj9PhTNuXAUWWwPTToUttTaqqrrWQ
Date: Thu, 8 Apr 2021 14:24:08 +0000
Message-ID: <285a276b35a241a78216bded4e064ee9@rozman.si>
References: <CAJ4StijaLgSfQ+3q5k_bSmRDYo-Voayj529DqyOV0X4OR3qzaw@mail.gmail.com>
In-Reply-To: <CAJ4StijaLgSfQ+3q5k_bSmRDYo-Voayj529DqyOV0X4OR3qzaw@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:a0ac:f0bf:88ad:c6ad]
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

PiBEb2VzIHdpbnR1bi5kbGwgc3VwcG9ydCBJT0NQIEFQST8NCj4gSWYgeWVzLCBob3cgdG8gZG8g
aXQ/DQoNCk5vLiBXaW50dW4gZG9lcyBub3QgY29tbXVuaWNhdGUgd2l0aCB1c2VyIHNwYWNlIHVz
aW5nIEkvTyBhdCBhbGwuDQoNClBsZWFzZSwgdXNlIHdpbnR1bi5kbGwgQVBJIGRlc2NyaWJlZCBo
ZXJlIGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aW50dW4vYWJvdXQvDQoNClJlZ2FyZHMsDQpTaW1v
bg0KDQo=
