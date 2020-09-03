Return-Path: <SRS0=KboK=CM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60483C433E9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Sep 2020 13:35:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586152072A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Sep 2020 13:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="ndjHkpRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 586152072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b726af40;
	Thu, 3 Sep 2020 13:06:57 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [2a00:ee2:209:164::f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96431cae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Sep 2020 13:06:53 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id A12BF1002F9B; Thu,  3 Sep 2020 15:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1599140104;
 bh=i7z+Z/ya3ANoUaF/MZAPpaTbzfSPkJq0NF74V1pSvos=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ndjHkpRy5e6Hp9m58xCu9pW6XqNP5p1zkZBv4uZYcvXRJiGFb4uRg7BTt/h6XqBl/
 y6uHRHjMILIDbiMvaZrh9/lGQn3JXpqomu7clpeQlnJPwOQSYSI4pCHS3Y2cFuZBDG
 hAWXUrprWx4rOpsjTXpScv3U689kpBa+WhcuqVYk=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a00:ee2:209:164::4])
 by pub5.amebis.si (Postfix) with ESMTPS id 6A6191002F90;
 Thu,  3 Sep 2020 15:35:02 +0200 (CEST)
Received: from Konj.amebis.doma (2a00:ee2:209:164::4) by Konj.amebis.doma
 (2a00:ee2:209:164::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4; Thu, 3 Sep 2020
 15:35:02 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0659.004;
 Thu, 3 Sep 2020 15:35:02 +0200
From: Simon Rozman <simon@rozman.si>
To: Peter Whisker <peter.whisker@gmail.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Problems with Windows client
Thread-Topic: Problems with Windows client
Thread-Index: AQHWfHcY30qW2sv0QEamh4GfXYIJI6lMM+SAgAcl4wCAA5rGwA==
Date: Thu, 3 Sep 2020 13:35:02 +0000
Message-ID: <74df5880ee38427a86019f7a36788a34@rozman.si>
References: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
 <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
 <b556392b-fb2c-7a40-e6a9-c36610237fd6@gmail.com>
In-Reply-To: <b556392b-fb2c-7a40-e6a9-c36610237fd6@gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:ee2:209:164:3073:2d10:a4ae:e432]
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

SGkgUGV0ZXIhDQoNCj4gW0ludGVyZmFjZV0NCj4gUHJpdmF0ZUtleSA9IFhYWFhYWFhYWFhYWFhY
WFhYWFhYWFhYWFhYWFhYWFhYWFhYPQ0KPiBBZGRyZXNzID0gMTAuMi44MC4yMjYvMzINCg0KPiAy
MDIwLTA5LTAxIDA5OjIwOjIxLjM3NDY3MzogW1RVTl0gW2xoaXJpc3NlY2NvbTAxXSBTZXR0aW5n
IGRldmljZSB2NA0KPiBhZGRyZXNzZXMNCj4gMjAyMC0wOS0wMSAwOToyMDoyMS40NDU0NzE6IFtU
VU5dIFtsaGlyaXNzZWNjb20wMV0gTGlzdGVuaW5nIGZvciBVQVBJDQo+IHJlcXVlc3RzDQo+IDIw
MjAtMDktMDEgMDk6MjA6MjEuNDUyNDUxOiBbVFVOXSBbbGhpcmlzc2VjY29tMDFdIFN0YXJ0dXAg
Y29tcGxldGUNCj4gMjAyMC0wOS0wMSAwOToyMDoyMS40NjE0Mjc6IFtUVU5dIFtsaGlyaXNzZWNj
b20wMV0gVW5hYmxlIHRvIHNldA0KPiBpbnRlcmZhY2UgYWRkcmVzc2VzLCByb3V0ZXMsIGRucywg
YW5kL29yIGludGVyZmFjZSBzZXR0aW5nczogVGhlIG9iamVjdA0KPiBhbHJlYWR5IGV4aXN0cy4N
Cg0KWW91IGRvbid0IGhhcHBlbiB0byBoYXZlIGEgVHVuU2FmZSBjcmVhdGVkIFRVTi1XaW5kb3dz
NiBhZGFwdGVyIGFyb3VuZCB3aXRoIDEwLjIuODAuMjI2IElQIGFscmVhZHkgdGFrZW4sIGRvIHlv
dT8NCg0KUmVnYXJkcywgU2ltb24NCg==
