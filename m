Return-Path: <SRS0=yhX4=LL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5D2C2B9F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 03:59:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6508F6117A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 03:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6508F6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eagleeyet.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7b7c9bc;
	Thu, 17 Jun 2021 03:59:41 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 92755772
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jun 2021 03:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd9y5pjzQirXUsHy0tWedyjV7VcrbI0URNkMmFWsm8VLzw8Qg+C74ElZuq3DVjAYPiMEej0+RQqlkwEA8WQBbl5BdDp2L64nk8UYzW3s0ylw4wLpfAZUdpp2j0vUJhlSxpxpbJjkAMlPFUXv17v6oGCzuAr9JU2E/6BKa9Py/2A4ZKG1ZlomNsJTxcY8q9lpjuZtg8qE6MFMaZltrxVhOUv1QKaFIDw3kJOwykBBiVOCPnWHHIvf1WJ8uxNpdR3/pvlKRoWBhmyinzzDGikh5bJsr3Ip9Q+/jaiQa7S2oHl3fo/+Sz2+2tcjB0YEnks2UoK+AZc4/Nzj38v5OkvK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSyyNALd1D6yhh50c5ra+nkbrVJBVesFudmUGoiAhB8=;
 b=RO0fxQwD2c0uRt6ZsihfvD9ODw8D9bMvasLTnjjla7BvTULsbi+9Hv3+CgRe4lc1NGaq0kStgPhugLOjxiVQYYwakovxJh7ibFhUHjD9jOc5GDfCQt0jvNEeDFoSQUMoWRTKBVl7ej9DwJODWXlaYxgragMj0E8V6npUYrxZt5VO5mTdFltxG9dsW+MjyP4rfLhJR/5w8iI+zHNGU78ZeIx51jH+uceuKaXgKSBWfQHqyvquZlLN8oZMeWHObhwVi2IhImGbia+2RjxiDYwynTNA328ZQgXgOhWOG25w8qs3dHbAt0o6FLiJCQdHpY76huhJ8zlEw1T+yRxPgM/U2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eagleeyet.net; dmarc=pass action=none
 header.from=eagleeyet.net; dkim=pass header.d=eagleeyet.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eagleeyet.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSyyNALd1D6yhh50c5ra+nkbrVJBVesFudmUGoiAhB8=;
 b=d7MVK3wqixn4fgN8nbkeLTJyeFdZxZs5dPkoWp+Kuqsbr48eVehf+JYCIx+uHkWcmWK/z2uuXxNwJUryZTtO4J8V63jlj0uF0uRPLYzqlcrs8C+reljbiYk88mnuofBgQfeQiT958hUW/JWDOrmmtnqJll88ggwQiqpwwZMcYsdzP5f/COesfYfF9/nIlL9W2qtGEJjXrRlISVl2iAkkbx/rnFC/xuSuYCSpR40S9tro8Gj90X12UzrpK388HeyUnKET/LzGucssMTqWOirMRmRXrRYf6BF1AcoL9laFhswiz31TWOGXu862Nfnm/rUrcaTkjh8wnXHp4mFLmyK/Og==
Received: from VE1PR08MB5837.eurprd08.prod.outlook.com (2603:10a6:800:1a9::23)
 by VE1PR08MB5792.eurprd08.prod.outlook.com (2603:10a6:800:1a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 03:59:37 +0000
Received: from VE1PR08MB5837.eurprd08.prod.outlook.com
 ([fe80::28d2:a931:af4c:85b7]) by VE1PR08MB5837.eurprd08.prod.outlook.com
 ([fe80::28d2:a931:af4c:85b7%8]) with mapi id 15.20.4219.025; Thu, 17 Jun 2021
 03:59:37 +0000
From: Jonathan Aquilina <jaquilina@eagleeyet.net>
To: Harald Dunkel <harri@afaics.de>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: running wireguard company-wide?
Thread-Topic: running wireguard company-wide?
Thread-Index: AQHXYrxVELstAK5hbE+nOTm7ZuSlMqsXlDBQ
Date: Thu, 17 Jun 2021 03:59:16 +0000
Deferred-Delivery: Thu, 17 Jun 2021 03:59:00 +0000
Message-ID: <VE1PR08MB5837FD84EE88B521E94A6F21A00E9@VE1PR08MB5837.eurprd08.prod.outlook.com>
References: <87tulyos23.fsf@sylvester.afaics.de>
In-Reply-To: <87tulyos23.fsf@sylvester.afaics.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: afaics.de; dkim=none (message not signed)
 header.d=none;afaics.de; dmarc=none action=none header.from=eagleeyet.net;
x-originating-ip: [195.158.94.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e79a3edc-da18-47c3-52cf-08d93144536e
x-ms-traffictypediagnostic: VE1PR08MB5792:
x-microsoft-antispam-prvs: <VE1PR08MB57924402C47A11CA550D9DA1A00E9@VE1PR08MB5792.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2CVOmcN8QkBA8CMIWFyG78XzR28jwoe9U0DIx6nojP00A4r9/ziTtK8M+CwB75wdgL81eSDJ0bXelqDyBra1vzXOa5nKY9UBx0UWi9g8I9zFxbpvNwNwQ7gnS6/7nAgXNBtkeg/PUZbdcz1KpHHzb4U8jP8VhMIcmEF+yLb/AoMv31eiyBHjRYxVe40BoY8iTpWsbZruiQlOAmYyhvtBpfrPrlV+j4+02YVDLa0Zwykj8D1ntm83g/0eoLI5Xi3CfMNYmZ7EPEbdV5Ywi2hh8wUKLO69cwCDq+KAFOiQxSn802UbR7t1OmZnqzzGalIHy37IO5odLM9rdQawQBs+ZVQVjQPoWQnwg37sZ2RJM+ncXiyAvrZGPM1dSKle2p4AnPxJJbp1fOPmrsrhePdYxk31dRohnC0/8fAiIy7M0G9KyUjTEJ3Vw4eamD2Fdk4wMPo1ZT9X5p+cZsqNJi34K/L+mJOwEEMPaMPegjEt7b3WWt/o3CRfL9uYN03gEdZgP0c0IF9JyHLefv4YKyQxnxexkkf07fyqptPEwsEzbmzGr46kUvdVBjERULXyPlv86YWi8devc/7mKQpVrkG8icWla7XvjPF3/ZXm3Bt+9A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB5837.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(346002)(136003)(376002)(366004)(8676002)(83380400001)(33656002)(71200400001)(66946007)(86362001)(2906002)(8936002)(55016002)(122000001)(76116006)(38100700002)(9686003)(4744005)(66476007)(186003)(6666004)(316002)(110136005)(66556008)(66446008)(64756008)(5660300002)(7696005)(6506007)(53546011)(52536014)(26005)(478600001)(3480700007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hyGAYgVE2UZU3ISQ7gfGjTFTGfi4WFF4UY8uk3S1AeHq2bDsTIOUIxZplBXf?=
 =?us-ascii?Q?TFRoj81Lt0FVltqKxzg+5yTewcACwjU4H+y6Bv1h/PFJ7dj71RAPGvhDVI23?=
 =?us-ascii?Q?HBEeUjmpiNT7ASPGGWIC3BVTQsnpGrSsuh5+NBaDKxl5X1nWDYNl09D+w6XG?=
 =?us-ascii?Q?nT1DOgVxIIoVxZ4HHzZ+o160xS4jYvJt5Qmh2mj6vZZZd+5v+Svjw9YsbtH3?=
 =?us-ascii?Q?rL/h2sI80DfYt7eCJsK05tjl57k4iSSmqXuNIQNjLhst2t0ziUPd2J2DfKbK?=
 =?us-ascii?Q?5UNj3VY8/6lnZ3JVN09tNewRiMbUBA4Hkeh6Kba3GRv7gqBboucJi8RzATR3?=
 =?us-ascii?Q?8YWs35z+izvbVYkrhiNpXJ4B+tmvqcT/Ypik2TNhYwyUQaGVDzkNRCmkZb0z?=
 =?us-ascii?Q?OL9UdyQSTUVxfkY02zP0/BQskybbWSsghy3YqJmfWjO/jr5/85lCrucx7XKx?=
 =?us-ascii?Q?SY4TUHzn/o8uzfHb+TKgMFScvt48hm3EV0mjP0jXCuVXNAac15sMEsjgfWe4?=
 =?us-ascii?Q?BSqSweyW75S504TbF34izNuROKosFhI2fsJXM3zmr/oGFNuu5E4jfofET4vL?=
 =?us-ascii?Q?k5IoZw87chbMUYczwdXNtcsAMO+LAV+vpGcqxvps0nCMmr+IqqeVhQvm59iA?=
 =?us-ascii?Q?jhIMAP4T8uJDXED0EbuEQEtIHoEHr6CwtOBhkmzw2hDJR16Lmu0TzZL3FByZ?=
 =?us-ascii?Q?GZmsPgX6pMMhUQs8+jTmOw7wUoCC6TgKFX3QvpHkX8tKpkafo5SdpPIcW8Jg?=
 =?us-ascii?Q?93qkRDckIhcEUjrEfFXfYqf07ICAjBBOcWjEDsK2vHXVtzfSiw/Hz+Qo6/ld?=
 =?us-ascii?Q?uylyHtUc9mEcGyyhRnuOSC+nhZXMBqdFW0FMEroMpz0JEK1sZeBxHF3ZZp9P?=
 =?us-ascii?Q?0kXXiJ4FdgWsNSFx5kqHEKZ0bBykkXISnNko5cg0Qhs9qcWghqq8nmjrmDIW?=
 =?us-ascii?Q?gRdhOlsbGylIcTKZYD3tFRXj6NI6SGVRkzJMOn3IfHSv/gdDukNaSqR8rjJe?=
 =?us-ascii?Q?hc3aYzNIylPiHTFGCAcgAbLfVMxVYEn1JQmTDkhmM+xV+yx3yBkfsAaign4M?=
 =?us-ascii?Q?sooiu5iH1D3q/Yzg0JQC5pm+RrRV+1LfjDqKGK3F493VloS/i7IqEuH3iN0m?=
 =?us-ascii?Q?U+OHEzwoNnwHmULbYmvPQ+FIOCzrHZJoqW53WxrjSBE2RTV0BRiAc2+IHU2p?=
 =?us-ascii?Q?pmLrPijBNs/ZXB8+jaBXXIkBro6Gwq0eBPKQ+31YF5X4AXNgWjmy8el9MARJ?=
 =?us-ascii?Q?xyuK3bilUidASP1q+bGcE5WbKZy6gtPCw8+3EgUrHkURkc68gyJiNAEaOW0S?=
 =?us-ascii?Q?Xttc+hAwBTcmTDrRLYSeaxkj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eagleeyet.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5837.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79a3edc-da18-47c3-52cf-08d93144536e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 03:59:37.5329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 689fcbc3-edb4-45aa-9f50-cf9ecb3e505a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6Yc879Dgir7Lb8jpGYsxxII8JMh2ZBSSzn8e3OUV9yJLcfKEdgyn+pw/rjoPtFGqBBd2/FpKVVEuej/e8FbXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5792
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

Hi all,

Just a long time follower of this list and very curious to try wireguard wh=
en I get the chance.

On a Mac you have a keychain where you can store keys passwords certs, is t=
here a reason why wireguard cannot take advantage of the keychain functiona=
lity?

Regards,
Jonathan

-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Harald Dun=
kel
Sent: 16 June 2021 15:30
To: wireguard@lists.zx2c4.com
Subject: running wireguard company-wide?

Hi folks,

how can I bind the private key to a specific host, eg. an office Macbook? E=
sp on MacOS the private key is in plain sight in the wireguard GUI, making =
it easy to reuse it for other, unintended purposes.

For private installations this might be OK, but for a company-wide deployme=
nt this is a major headache.

Every helpful hint is highly appreciated Harri
