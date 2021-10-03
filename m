Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5E1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Oct 2021 05:39:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D411C61244
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Oct 2021 05:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D411C61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c59b9a9a;
	Mon, 4 Oct 2021 05:37:15 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2021.outbound.protection.outlook.com [40.92.23.21])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42249cec
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Oct 2021 22:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/xNFoH4KkHCh0q2XlxOzPBRhRHxGs9jBua7TVWXx+KbmvVSyj3YX1Q1JaCcK42vKvQAHzuIISLXjEtUnZc84YrR/10PR0z57rueDU8qEEFmXHfsaNHvM9T4bMtaQUNLUTTaA2NvBRhSapOPfptQzws5cJXNZaO4Fo/VKBeHru/+WuDErKXi+erPYC6raSZKqQqD3T8q8kETOsiijNHi2qg+nkzm6gMXUY0qwh1TLNxJpMEsnD9YMg19eb/5zSL6zLyPC+FzOMosVQtjgtqHGmOjGjlkRJIt5Nr6H/wxYldCAnu10tXDv5pNEZ91JqLV3WSCaGfI+S4T7UklQjc2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M13WsbYVEFAA5JJ0ick3XSCca9f1aPYkH7y8/TdYU4=;
 b=n5kowxTzEDA8B3t1E0jMpGUj/P9VA+r8QNdbPo8cFIgELVscP0GS1iiEEvT88OZEkjLRfCe9rrLyY29bC5yqpAnARF5XI8P4ef0gBy90fQ990mZFrxn8GzAQcQUixZQ/iGx1pypByLkvNEDu4FhBZg8vD/VXuwP8EqkDy09RhivLkF2Ih27sC0jooFjFihVoPUBO8cGI+4BMfjSm8dNkBofwGz2VC3B2TY7AySCOisOXHlwswCBe2gPIdOO5TyiSD/zuopuhe0CWbOSEgJ2cEwXG3RG8EJDnIBFe0PJEVFJIoaAYX0HHx78oMHkASuYbYH4peb+NUy1B8ZJ/PX5ueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M13WsbYVEFAA5JJ0ick3XSCca9f1aPYkH7y8/TdYU4=;
 b=A+d/2eXJio4iL2kUwxBWAMJ6RdUqyCYYvuq+R91TI0gj9CvF3HBhUQWqod7GG4uCh+uaJg2oIDzHYrX0lhJ7ZU266oRsNVGNIHnxhJkicDh3k9w1FE3gcx1nuvETViTgfTIOebjlpUgUo9jT8IoCHIK8+szjAxEZXTQjKCBnSbZoJ9Ee5qGMLkWWyyq78YWWAJv5Zm5Ab+PFWh/nPyKf5dGrq9m+oekrABvV888vWzs+2g9/ZnjDzRt/+jFI8ppStNj6q0GSD3SrnvkWnCGhRKXC131IyfPQT/A8NyOSI3XsckynnhFvN9/YYanUWaHklvDH61FKfmWtN/Wpxhi2cQ==
Received: from BY5PR04MB6833.namprd04.prod.outlook.com (2603:10b6:a03:224::13)
 by SJ0PR04MB7312.namprd04.prod.outlook.com (2603:10b6:a03:297::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Sun, 3 Oct
 2021 22:15:25 +0000
Received: from BY5PR04MB6833.namprd04.prod.outlook.com
 ([fe80::41ff:2234:ad47:3ad2]) by BY5PR04MB6833.namprd04.prod.outlook.com
 ([fe80::41ff:2234:ad47:3ad2%6]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 22:15:25 +0000
From: Kristof Mattei <kristofmattei@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [wireguard-apple] [iOS] 464xlat networks and On-demand roaming issue
Thread-Topic: [wireguard-apple] [iOS] 464xlat networks and On-demand roaming
 issue
Thread-Index: Ade4pAphBzI5OOvASlaqSUgwTzNTFw==
Date: Sun, 3 Oct 2021 22:15:25 +0000
Message-ID: <BY5PR04MB6833078C93B5AE04028574EEA2AD9@BY5PR04MB6833.namprd04.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [FKSPwhuxWp2s8Z3jc9Nu/zhSywk8JWWqANGUm3GnA5QLD0WhTanhtOpQEFfxqU8OtDFRCTQ2vx0=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf0c8db2-a7a4-4277-5122-08d986bb4cc1
x-ms-traffictypediagnostic: SJ0PR04MB7312:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wmaTRRncpkrKKtmcRec/p4WoxM7dozDkyqacDID5wcfFU0Yaf1qd6TJzzXaXNU20bWHIPlaEN9D9oiW7azUfoRhnlX2RF90SOGqejfz98fNihneYXgIGutrpxtTP4jTlP92jzakfnXDUIkxVIYKXnxknDWCpIUnjNX7y/jAo1Ay3TE+EqiZaqcgiqbPiqhzGz8hcG1D2umCwi7i2wchn8cjQLIgnXLKsmvnsSYscBncEEG/RX9kPz9Aaj/SCbAsp+QsdroCOe3+gaRktYyylaFJNjZ8TEuobaqdEK5A0qHIKlkuFW0CfGYLv2GstRHzboUnsvmb/Juug9EPE4WDB5CTyveMt4wQm04ObVQAvqNkdkLs4PL5W+HIBqkA7v1D+YOW/j5AniuWh6P9+iEfKetKDaprP3423q0/LQy95eKVoL0jo4pGg4H38qG4j0mWfE7s1hhuoBHPTwPt/r8NflDgaEmNouh9uraKbfiO+Ems=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: t/FI5IhDKzKqNGl/Qjz05QQahij5AOThz/x2LvJflABn5V8UQkGIVyntk94xuBQ780e8/MSsYPvic9joYri6E+bdOVWv5JgT9++4gfbLA6nkZiW+aw8jKVmlKRi2PBrXUrRdCVejdXjTSorPb9MN8PhFxmbuXFE2Pb8sgpzMflLTPllCZhGNvZx5ETjpAiRM6rX4RM3Y0hWniT6HIc79Bg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6833.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0c8db2-a7a4-4277-5122-08d986bb4cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 22:15:25.3702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7312
X-Mailman-Approved-At: Mon, 04 Oct 2021 05:37:13 +0000
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

I have an issue with the wireguard-apple on 464xlat connecting to a DNS end=
point with both an A and an AAAA record.

The following line: https://git.zx2c4.com/wireguard-apple/tree/Sources/Wire=
GuardKit/DNSResolver.swift#n81 causes WireGuard to prefer the IPv4 address.

Is there any reason why WireGuard prefers the IPv4 address?=20

Why is this causing trouble? But this is what happens:=20

When connecting to IPv6 the IPv4 address gets mapped to an IPv6 address whi=
ch then acts as an IPv6->IPv4 proxy. The IP looks like [2607:7700:0:1a::17f=
3:f750]:51820.

This causes issues when roaming from my home WiFi (on which WireGuard is di=
sabled) to cellular (on which WireGuard is set to on-Demand).

The initial connection that is set up for some reason does not work. There =
are reports about this on Reddit, e.g. https://www.reddit.com/r/WireGuard/c=
omments/nk2o7m/anyone_got_it_working_with_tmobile_lte/

I can fix it by setting the endpoint to the actual IPv6 address, and then i=
t works like a charm, but that fails when I connect to a non-IPv6 network.

Thanks,
Kristof

