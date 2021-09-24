Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58C0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:19:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73AF61107
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E73AF61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=StarcubeDesign.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b4d7612;
	Fri, 24 Sep 2021 20:18:57 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2101.outbound.protection.outlook.com [40.107.220.101])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8e03215d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 20:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZE+CheK8WdojcUGB/+sbKbWw3D2uGuc5gMfwsvldUzXLn9oEhQuHODag7m0E8URLHbTq4O3UpNYnFDM1U8IEacJCKdyJFgDpXMwl8zBVZF3u8fSkNp23rcq0GKFhlGgg1FLGGbY3p1A9iZh7TgO8BazyIXZzg9MwikiogtIC3SlHueRe8mi3CrcM+0R9qQliiAP5HNxB+OwE28PP8xTG49Pk0jpgXlEcoNjRmSwtBijm70R8mcS7KK1/WtmPSyDpC1poiGzDNQTgI1jd4Gue+J4HDvIaCrGbSCAzWp95G7xvNMBVbRRiuCL/tDHvMBqaWIjeQOcdXLTs5OvbYLeiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=j8Coby9xv9D3acADsWxqCg6DUyT0vlgxLniyijtibtw=;
 b=hmAZr1BIp5Tfg6EMno5hTIHM+fYMyUsluErJexZhW8JcadalIkA4D2Q9OsWLpnacx5Luoa/pPGljPNhyUUUssn3cZ6gPhqvKXnB458V01Ky07RxF6rS2MargZXMlTflGOWhLLZ0nLU7SXAgtdWJM7/mrzYODnGj2sIB7jwyA4ocfmQ0eUcWTcgxWJUZsDe9yQyxuqidVv0z/65ImCKGHPvYwb0el55NqnH9wYL2uZZg5h07pVqnHi9MFQvj448MDg7mcdadjoi6CJcaUFveUKG5QfIXogS3X09Mzut5Jbvd1E1dw9iS3vdlP0+ZsbNCqdytLnIzaO2AhGs9QrcfmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starcubedesign.com; dmarc=pass action=none
 header.from=starcubedesign.com; dkim=pass header.d=starcubedesign.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starcubedesign.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8Coby9xv9D3acADsWxqCg6DUyT0vlgxLniyijtibtw=;
 b=RmXKmEEW/0jwqwNWEMnjIHLiGsA/uz5Nu42hERDN+WyQ7qOkcAf9spxfgaS2keOKqMkEbp0qboG5EGoCbo5Zdu4aS7y8OosxIJHHxfbU2PneVagDOGcPlih3KzMWupXbF9np5Zip/+PvnmvKOkM+AzPc86wyiv3CKQeWw/WGvCk=
Received: from BN7PR08MB6049.namprd08.prod.outlook.com (2603:10b6:408:9::29)
 by BN7PR08MB3858.namprd08.prod.outlook.com (2603:10b6:406:8f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 20:15:44 +0000
Received: from BN7PR08MB6049.namprd08.prod.outlook.com
 ([fe80::6c50:9ee3:3869:9a4f]) by BN7PR08MB6049.namprd08.prod.outlook.com
 ([fe80::6c50:9ee3:3869:9a4f%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 20:15:44 +0000
From: Arlo Clauser <Arlo@StarcubeDesign.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>, Joshua Sjoding
 <joshua.sjoding@scjalliance.com>, John-Paul Andreini
 <jandreini@geonerco.com>, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
Thread-Topic: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
Thread-Index: AQHXsWx+RTrF1H3VJU2uiqpiVXGhyauzmnSAgAAEmwA=
Date: Fri, 24 Sep 2021 20:15:44 +0000
Message-ID: <3A98C85E-26A7-4A7B-84E3-2A512DE1C3BA@StarcubeDesign.com>
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
 <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
In-Reply-To: <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zx2c4.com; dkim=none (message not signed)
 header.d=none;zx2c4.com; dmarc=none action=none
 header.from=StarcubeDesign.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83f61539-855d-40a3-c509-08d97f9816fc
x-ms-traffictypediagnostic: BN7PR08MB3858:
x-microsoft-antispam-prvs: <BN7PR08MB3858C3DB4BFE7F729F422056B2A49@BN7PR08MB3858.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wuXy21H+Al6T1PgYKQ3jAOH81SwmSs+36Cyu+a5HnzVTjOAetLH9rFhy9l++CvbyqWhFZbB20R5uGgzQc1w3/6nS9FjSl1dsKZonZTk9Ji421gfvYo1rinjiJ/11QMnxD3hDC73mwogqXfP23FCfZSZXrloydsWVzWv2ddKQhqcV5fFnweB7ne3etb0nB9SnB4vWZ2eGIDdWI8hxijHEP2hyxYp92yo7tuNsMmYhDcF8nUrcVtT3TfUrjjMRQNHuwGVs035JpAobiIY2lu9g3RXJfCtmshKAmIyg8itfGYsaAXpCrV4qKKyx/h8aLpG7YwWXCMPGUYlpCMQsQZc2DbiUc3snSc9n1Boxlw8HNgZVzxHW2ol8nfNzsR8Lm2yQ8vjNvNVGo7Wq6dj9EWlibNbiqXz+fLLRr0iG3SDqwPLTYYoqPFqPMl3iZ0fUxglMNykFTD6MTxVnrQKemIlHTgZNtyYP0OwdE9Vwjdw4KFV8F94hVAtu+1lji2TqNU0cZ31JMonQeJYuaogV7i199Keg5O9OEMOy306EURpJZaG39gxEorZlb2p4+GFmRMZRomMf8HFF4IWHnD8jAsYaiO3pyWV2phdZd5KsYpaXlZT2YoIhgObbU6BLgQ5uHIZyFEr7973XiuppyklwEKFAFGJ0Ew/nKEYBKudVG2OGOnKHKP+CN+kjG1ISzmPA4h4AsTaMyi7TurRHtbDawfyrLigdaKHtjGXWimKz5Ep5q+02sB9NJCaLZ8FxamXT1L93
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB6049.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(39830400003)(136003)(396003)(8936002)(6916009)(54906003)(5660300002)(86362001)(8676002)(6512007)(558084003)(4326008)(508600001)(316002)(33656002)(91956017)(36756003)(76116006)(38070700005)(53546011)(6506007)(66946007)(2906002)(64756008)(66476007)(66446008)(66556008)(186003)(2616005)(26005)(122000001)(38100700002)(71200400001)(6486002)(45980500001)(85282002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fj1wdNaucz1NUnvJQbH4ArhQUYUs5HCzFciG6UKPTVjdEiJqRI1n/21DlWEa?=
 =?us-ascii?Q?dQcQ9UOlFAPXO34ueJ6yZwSON+LdTO48+0IXCSjzOH64wr3H3HX04xAGUcCN?=
 =?us-ascii?Q?UCJM+PVFaWEwnpw56QC07bWH33MvSEsUsEfQiZdWMFteb4O10gJ6nucjLUPy?=
 =?us-ascii?Q?8o32/DWYx77GzWqNCtbokP3peR3oyAAuxm8R8fCgc13RhvuJNHSOuCUMc2ra?=
 =?us-ascii?Q?aqkLhaP9uRF7Dk50yZB+EoJOKCQlifftizT55dtAVU8pbKHzhEpiYq8BOcEc?=
 =?us-ascii?Q?8EWsVs1cDOMs+w5cu19El5+O/GN3MWDTys+/gad4fL6z4QA9sDeR1uJKIDJy?=
 =?us-ascii?Q?2bSmBQTUqxqSHkpj4lhpYiXbLoJ6sQcf/FMffC4EKuIXp+elIvY63IGhEfbB?=
 =?us-ascii?Q?bLDU+BBK20p+oALivfMjWHYCs0HXKHish4hu9oyuaAA/O2lSoaBu14m5zkHO?=
 =?us-ascii?Q?aQg7HrMD+r0lvKOcocBZ2TAAFn5rVjleTW6r/JS6YpbFReHD33cvZa7L1npM?=
 =?us-ascii?Q?/U45taS4RN4G4iPetugfjNJmkssRw8aii8kQ3V1U+ETMtfJjSQtrLSgJEEzl?=
 =?us-ascii?Q?aCtCIf7dNkuWfdGxI68pVsZX8mgouvUneDuFtjAEyDw7X8YipUwb+rmQBNZn?=
 =?us-ascii?Q?BjBVpZwYcWEH485gNQfNsWIFLnqlLrMvxkxBQGHSP5+6lP8fYW4Wi8HbuMEc?=
 =?us-ascii?Q?Ga9u+8unjpFADXgSNOgsSxq3VgBtqN133YKKblEdTIUk/fZmoqXlbyk4g/fO?=
 =?us-ascii?Q?O5vKJJibOjVxptxxOVXmeOXkiEgxu/Z+Lil+I5DZu/OVBN5BwxtHVHKKX+8I?=
 =?us-ascii?Q?MziKjbzkp9WQZf/bez8PFh1FSiJISDpYnarZ6ytqbrrC5Wl3SGWTyB3YoZUa?=
 =?us-ascii?Q?Iqph9wZxW9IB7ktWdWwhbfA87lmLx7J0jw1konA4nwqdlZZEGdDT81IO7BEr?=
 =?us-ascii?Q?sRivxqtvatGC/VuZbRMzawn8zbcdK99dU5RqcHTxuarzALGYgxg7kfNhwSEo?=
 =?us-ascii?Q?/+4GDU/FhmwfPr65BL77SoR5veuMptmo5x7ax0vSxW/x7bjh30hfCp4Iqseu?=
 =?us-ascii?Q?MKUOoeUfCeb4mRwkxtXrJSuJC9W5zqeTu+1yIpn12HtdyKs1HmSZZ3NHrKIb?=
 =?us-ascii?Q?XJYAgpxX+RdFrzNlJyrh3zmkKde8+CCWFp6lvfdmUfQs8ZSjCOQuii6BLoWE?=
 =?us-ascii?Q?J7ASqoV23Lc2Ly73QNsdhPOY2WWK6x82uiLhCNT0RL+mXw44o8xzyCTChyMz?=
 =?us-ascii?Q?gmRmh1j0BsWev/f2+DqLoGSjDZA0XjQU9j5A4AhXZ9bpl/0mjn8X+y42e5Ue?=
 =?us-ascii?Q?M6iOPS0cUepeJI6EHKzDsNPB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F87C19815F26F4B938ADA9A3D53CC3B@namprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: StarcubeDesign.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB6049.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f61539-855d-40a3-c509-08d97f9816fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 20:15:44.5417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b653ea0-b708-43cd-845e-5e6743ef1c92
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcV08qLfB90sja6Q7LjayS29Zzi5TPzk4LGfJH+iU+B8HNUpnf04RHCmWe1vrzZ/oIAGuksqHozfwVTFPHn4oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB3858
X-Mailman-Approved-At: Fri, 24 Sep 2021 20:18:51 +0000
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

My trouble cases are installing it now. Thanks!

> On Sep 24, 2021, at 3:59 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> On Fri, Sep 24, 2021 at 11:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>> I'm going to cut a new release in the next few hours here. When that's
>> released
>=20
> v0.4.10 is now released.

