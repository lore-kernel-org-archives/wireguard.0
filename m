Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F3FC32792
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Aug 2022 23:40:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 68e3e288;
	Mon, 22 Aug 2022 23:40:33 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02olkn2065.outbound.protection.outlook.com [40.92.44.65])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d3eb29b0
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Aug 2022 23:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZg77k2hIG6Nh8MCMHA8tiFxKI0cVLC/1PTVj4aQhb5/oLQj8/y/wASo3GKs4oXqGNy8rFLB4qgcn1PA3VWByUhRuqdha1oDTQLDkgub1Ap+Gw8BK2HvqcZed08NwbqcBjQQ6qDd5Z7eic1bUWlrhi0W38ncXIBKCrU2XVZ60G/StbBQ5ysryGX+rjEB7uYZu0tuW3kSigBQcPnd3nD2dCKya8hvJ9xEtqSwHpkFKkfw8+3S8Iv7w1A/aQi1UiMXq0twQNr9IiCMrzcrAQVoApO8z767KjpQz8R/msH+Kxf65QfxnfFFExeeFxCu1/w1d8qn9qf/FaMeVM9VNrUwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifNwRMeq6ids55E3eE6t07hZqXx9KyrJKZkO3k9PPp8=;
 b=CQQjzTibgpU/R6FL9anEf5Cfz7e70DzgneVzKR0eFbKKdUqEBp0Pd/R9eCzuXQkDWBMjNqRtvaxoKGm7Li2/wMkKKC+t78/992obzd7R0ezEkJAaAuE5HkC4APrWNniqhIeP0duu16kyhomsBez8vqX1VCZG2mXs0uK1jKDyA0YOFH7q15/xxcX5yPnWe1FpgXsMGTRU30MVw16Ets8PC5BUm6qgBjH7P40Vyx+EGwXKTc1k/21QbgToJeehLH6M/GiIHshWY1IHC+Sg8dYuYoCP7Na6YHeaY66ehg4dpT6yD2A158EU9Kc+SX2OAeD2I8eNF/+hXXxfOBUU3hC2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifNwRMeq6ids55E3eE6t07hZqXx9KyrJKZkO3k9PPp8=;
 b=gj+Yo89LyOFb0owaZCA5DQ2PSxJ2sPgHKzZSFmMT9tMMaTrN+ynJ+YXygmsYSoXwsfSit9d6fDYP4DeThXMKOlKyKTTMz7wt6lqu31bbhcK/YUPp/NBBO1vq0BUewfiqpfcP6yTFHOlTMbB0lIwQp+GlBJFVN/tnUEQdRM5b42MuI4lFHzKjKrgCWCKU7Z/Tb++IPIcUvfaWy/+7DEOfZiu9jHR9ijJ6iczjvEHEPZLncEHhGWoaSnieiMTGeWndAUrV9R+wnB2uc2KPBa14dhlO8CRm9WudgukGZrfLZJ+WAVVWg1ZcvI75zP2qGsZodvlSwRx6dpZ97Lmnh2pgUg==
Received: from BY5PR04MB6833.namprd04.prod.outlook.com (2603:10b6:a03:224::13)
 by BN7PR04MB4193.namprd04.prod.outlook.com (2603:10b6:406:ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 23:40:28 +0000
Received: from BY5PR04MB6833.namprd04.prod.outlook.com
 ([fe80::b5c8:d4c1:a97b:b3a3]) by BY5PR04MB6833.namprd04.prod.outlook.com
 ([fe80::b5c8:d4c1:a97b:b3a3%3]) with mapi id 15.20.5546.024; Mon, 22 Aug 2022
 23:40:28 +0000
From: Kristof Mattei <kristofmattei@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [iOS] IPv4 -> IPv6 transition
Thread-Topic: [iOS] IPv4 -> IPv6 transition
Thread-Index: AQHYtn3x81Ou2MSp+kKNZQJlg1kORa27k6iC
Date: Mon, 22 Aug 2022 23:40:28 +0000
Message-ID: <BY5PR04MB68330EBD7FBB80A11907EDA9A2719@BY5PR04MB6833.namprd04.prod.outlook.com>
References: <DM6PR04MB6844F2C8516FF0607FF9F783A2719@DM6PR04MB6844.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB6844F2C8516FF0607FF9F783A2719@DM6PR04MB6844.namprd04.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [nnbG+u5RFFd2kjoaNBRQrBm7Pct+s+KD]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01fd7eb1-daf9-41fe-48d0-08da8497b1d4
x-ms-traffictypediagnostic: BN7PR04MB4193:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vpDAQlmk2/E9fg9KHCjACFXsVICYF2XT+YF6UQW/yMGtOQraBbFlsXqB4pCqWytBVybe72NNuxHemtsLhF6+8fhxYsPtCg4CHS7fGSI026onuHEbwZ8zzfhXZ9R5dP8RnqTyGB88oupWlv+LgyHH5ZVRUAoZ/eU/HQvAeLKpFo3QqFRgui6LObo/wgpNLCQsXIpyoJFISWrvDM+OwaUb/7iaOGWuihxDDLSSV4LWyjcc7Oa0PpqGVastkkCW0AHcPPJQ6PIWNJVhVBdyGUYF1NwCRuGBc6ocCIRKIPiTBvotOs31IRzbWnRRrYLz7w29BX4xKxRh6BtNY67pZ8ADeFBqVixk/Yyu+KKHiHhWlerJHgr6xI7CLKNn8pS3W1v/ZXStOil5ldmgpI8es8WMxqMLvxcuCXn+vb1CzoJkhrb+RAjMtctbGre5ZWd16fvE9y3ZFPZ39/UqaRMN13NoJuhAdJi/SHzp/Sjhtqq3541nabEv/p8h6NQ4mLWqJp6kaBU78tAS478YK8Al2JAYUnqigyoKyU3L1b5JAnNNXD96LRZfrkmV47mwSvR9R90RvdLQUlHR49lIKDRXn3Oa3zsDiZ8ZVTbWNMqSyvoAhIzr2Ujwy7F/517pJ9u00/S
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Oshurc6H+0Mqd5uKgP7DRJ4IMH4OtYxlpOW1zfRdYkw2ZRtqybWGZPoD?=
 =?Windows-1252?Q?8ZfHHVBW25rbxO2FhCYfHG/mYPXlkJ0mmkb3stlDdKea561YptNFN58N?=
 =?Windows-1252?Q?455YWQWhfnmuWuUcLQrxJxZMMxsIqWT4AGx4SXoxavCnOS3nSV+e5ooL?=
 =?Windows-1252?Q?KNW8V9WqZItoNwIhT5a7QV6L4G00lB1GmTYAo4aIAsLkNVRzL/RISsIS?=
 =?Windows-1252?Q?8JldLZNxRsX7dFNHBf61CMR4ptAR0T4osfSXYbHnQWqpC6i0mGLryffq?=
 =?Windows-1252?Q?XmGo2au6kgCk3s81Irzka18HpIV29nZ1PCjuqeHcqLVyFcBURpDDzKCb?=
 =?Windows-1252?Q?11uoD7PnwbeIqLfvqF2qG2BbaukM9pAyIu0H/RiSZc0pI+q33qR/kViw?=
 =?Windows-1252?Q?nEYLX1E/aUY8o5R0QQSX7ZrY1iyNyv3bZqj/knG6jbmJu+ugZRIj5Fnh?=
 =?Windows-1252?Q?EleNh5mkJk5ifmRQUW5DbRhw8fg396JockqUVfVaNl5tS2ms019rO9Bz?=
 =?Windows-1252?Q?dEA2y1GGdC9nE5BA1h0O39ERZClSer49R1buD2GvLEW0R6R6nLcx3RDa?=
 =?Windows-1252?Q?mWvDw7aIZ+Ozmw1AsPxBo0Y8cKH8VGg4wYUfjlTG+iztkLotCrs+UGAH?=
 =?Windows-1252?Q?HBvbkos94ZjSmxoSwFz0ds3sMDqwD2njQRhZdo2fEz4cXDsaEe4McOeY?=
 =?Windows-1252?Q?13eyqMLizBu7Ko2ULe0653H1B4Rgb0LjYqkRxpb2u8tK3hIiXpUtIp84?=
 =?Windows-1252?Q?LV0Tn6dA8AmCmTXbpGj0gtFrUGzoesDvFf+jriSKuH937ELBz/s+aLiu?=
 =?Windows-1252?Q?QveYyQR3vyn6DsPveh6jthpWX8rdF4/HkztLdLqE9Zred0ghZGkN32Tj?=
 =?Windows-1252?Q?lDuIjO1JLwbd7nNPRk6cu2mMTdbdIblHCwcYSNBTAVeop7LBFFEkpYTE?=
 =?Windows-1252?Q?4U/oNFeBbYpi6qe/rTpyP8ZnPnlsmUoD48L/u7mF6NyzdunAL2TlA0qI?=
 =?Windows-1252?Q?mnkX/LGX7aw3oE7zjUrz9ggY9EI9BFu7TbL6PDQDIDC6gJHCmSUeRRUI?=
 =?Windows-1252?Q?lG7CLYCI9o214anhR3BWlugcdA7LMJyYR7RewMVWFoPzH2ZJcROFeWRX?=
 =?Windows-1252?Q?wy+Q+HPuv06p45pM2ShgFGfAAvaoXfVcR0Y3FZffIiU6XTmBN6fHWXhG?=
 =?Windows-1252?Q?9L2E2ACg7+Y9HFyaQtNrRVSZlLrDqrIz7DJEK2G2w1AHhcYGEEVBVLZW?=
 =?Windows-1252?Q?oTqXU5Ah8L0TI8N98xsyGpwUXmUGQ1BBAIhSZQWEX6/Rt5Lbc0u9D5Dy?=
 =?Windows-1252?Q?sUWEee9+tkga8GhNii4EfhSbfoQETfNMoqn3Ocy757OMRyDWYzazzQIf?=
 =?Windows-1252?Q?fRBmr8x7Fwx3YA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6833.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fd7eb1-daf9-41fe-48d0-08da8497b1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 23:40:28.4597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4193
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

=0A=
Hi,=0A=
=A0=0A=
I=92ve had a bug for the longest while when using Wireguard on T-Mobile USA=
 (IPv6 only).=0A=
=A0=0A=
I have a VPN server listening to both IPv4 & IPv6. I have a DNS A and AAAA =
set on the same domain.=0A=
=A0=0A=
When making a connection from an IPv4-only WiFi network with Wireguard enab=
led and then walking away from the Wifi where we transition to a IPv6 netwo=
rk with 464XLAT we have the issue that Wireguard does not select the AAAA o=
n the domain. =0A=
=A0=0A=
It prefers IPv4, as shown here: https://git.zx2c4.com/wireguard-apple/tree/=
Sources/WireGuardKit/DNSResolver.swift#n46 and here: https://git.zx2c4.com/=
wireguard-apple/tree/Sources/WireGuardKit/DNSResolver.swift#n73=0A=
=A0=0A=
=A0=0A=
Would it be possible to get this change to prefer to use IPv6?=0A=
=A0=0A=
=A0=0A=
That said, if Wireguard has iOS development licenses, I=92d be happy to sub=
mit a patch (my personal license doesn=92t allow me to test VPNs=85)=0A=
=0A=
KM=
