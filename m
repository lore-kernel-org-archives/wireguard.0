Return-Path: <SRS0=2ayY=FJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67464C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Dec 2020 14:23:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F722312A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Dec 2020 14:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F722312A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fourpeakslandscape.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 496bb002;
	Sat, 5 Dec 2020 14:16:03 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2100.outbound.protection.outlook.com [40.107.223.100])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fe81e4fa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Dec 2020 22:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcFnucjtCv5l3GhCAMAiyejTGadanO2Hiclm1OlSaEb+RrzhqsC73VDcCfMBhCiaYnXIQYSI9fZT95pwnSqrFKNjiOCTCQIkeKO3v1XqOT2yMaSyadacey7PccJDnA1qCkwKJHjqtUq5rMz/wSSJyTvDM+4Xgx7YYIJFKnbjSomI4wR7a1KCZ5Eq60dRilHdmlKGSP7jyHslNpFxm8F2Qy3P3vUlXNlNkBqXMuMHZY9JKfhtT/VrmGKmgbmJ0siSByIcSK1NinirHmnZrepNi8tSVyQHUK9BpAOXwp1JZ239nxLSIGnMiBlPlYx1ND82fw7vPR58sfsqEYWMHOhPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVzFSnZkDW6rii2jl3yDwF9IVONg8wohtrAZlIxiwOU=;
 b=hV3Ah0EbmgKKwl1R/CgBcnWeorwI5dsx/BUkkriBQflxHwXe/+DEWnL7afCyZ8rYeYwiLR5WMPPSvscR3QVVOLfYpuxUJZ5fpnGDR1yZzfhO1k9mlnEb8NMidloWyYOrb1WSM4IaJ4I+bNoslUgLrsudTPvh0f9fobt3sgTJ8/HAmpoKwQol3YJI42nIJ3HUU3AP9AqII70wcso2fjcs2p2C+cAGnz1Cbt9R1K1NORuHY76Gi4mk83iGrU2FSkSLpVBlBKe6Tz4kmCLfk/t2fenNhhzUCks/Q64OYcU4DWSFBkWQIWayUG3KwnflqFiKt8YhnMZe7D1//EtTPhj1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fourpeakslandscape.com; dmarc=pass action=none
 header.from=fourpeakslandscape.com; dkim=pass
 header.d=fourpeakslandscape.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FourPeaksLandscape.onmicrosoft.com;
 s=selector2-FourPeaksLandscape-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVzFSnZkDW6rii2jl3yDwF9IVONg8wohtrAZlIxiwOU=;
 b=t/jqRWL4itlAoiHPU3IXk/mPb4p0PBz5uDKM0s3R3eclPxVuMJNa0PsazAz7nuZQ54Oy9yDXsAQrZz/uqjURFJoSOZTbnZoROty6qJGTzVIQfwxoi95Mu4TmBUaA/dGhl6hgwzvChAeaThgmPesYff+OdzBRNPRzt6Eh2hKR9gg=
Received: from BY5PR17MB3617.namprd17.prod.outlook.com (2603:10b6:a03:1c0::27)
 by BY5PR17MB3080.namprd17.prod.outlook.com (2603:10b6:a03:185::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 4 Dec
 2020 22:28:17 +0000
Received: from BY5PR17MB3617.namprd17.prod.outlook.com
 ([fe80::bcb1:a8df:cbb6:ab6d]) by BY5PR17MB3617.namprd17.prod.outlook.com
 ([fe80::bcb1:a8df:cbb6:ab6d%4]) with mapi id 15.20.3632.017; Fri, 4 Dec 2020
 22:28:17 +0000
From: Dennis IT SysAdmin <it@fourpeakslandscape.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Question about DNS and WG_HIDE_KEYS for windows client
Thread-Topic: Question about DNS and WG_HIDE_KEYS for windows client
Thread-Index: AQHWyowNIiAe9h/XV0GFZLeg0rm4OqnnhBKd
Date: Fri, 4 Dec 2020 22:28:17 +0000
Message-ID: <BY5PR17MB36172CC94C8D80971EAAFA85A9F10@BY5PR17MB3617.namprd17.prod.outlook.com>
References: <BY5PR17MB3617E2806946E927CC767252A9F10@BY5PR17MB3617.namprd17.prod.outlook.com>
In-Reply-To: <BY5PR17MB3617E2806946E927CC767252A9F10@BY5PR17MB3617.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=fourpeakslandscape.com;
x-originating-ip: [184.101.179.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e2b34f1-2def-4477-c2c4-08d898a3e5c4
x-ms-traffictypediagnostic: BY5PR17MB3080:
x-microsoft-antispam-prvs: <BY5PR17MB3080BBE1A2D954F91C43FFD6A9F10@BY5PR17MB3080.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NAbhmhLrYow6byJUENPnvRZ8qYs4Bc0okIcfm6wAUvl0BRsiLAAp9juujtL7JV4q2xk21ZhKOFuQwkIXrXdba1UymqDvui/bHaBgOyewZkBBXZO1ESSqcabbOh3ZWXOfPO3FQX67sf8rDeedz5h9gNN7UzwigJNf2fMZK3bvwbq+GNWgvQZlCX7GTt28l1E54zYBW5ws0Vj2Eh0ul7bNAJp9QVcYwd+jfJr8iwRgLkx+K3RfILFiTEsBoLUmYsBjujGnCld3MbUOXwDd9maKziwh5COJZnzTMSj7mMX4QsNnBaIRURgKu2NtRaET8iqXB/xQXZf93ocv1DtXg1FaDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR17MB3617.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(396003)(376002)(136003)(346002)(5660300002)(26005)(66476007)(8936002)(66556008)(52536014)(66446008)(66946007)(64756008)(6916009)(86362001)(4744005)(71200400001)(2940100002)(2906002)(33656002)(8676002)(478600001)(83380400001)(7696005)(316002)(6506007)(76116006)(186003)(9686003)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?GhcU+4si5KPOnWkegB/y4Atc737EB6M+bP8czEEzRTxObmv9kLEQSCMVJH?=
 =?iso-8859-1?Q?nLZKhoILiD8uuqYr4PILtPouAnYAP7gWFRonI2q/wAakBjba3BnHJ+yNJH?=
 =?iso-8859-1?Q?A+sL8/XZgYo1nmN+7tNr1u+H746m6MZRpcaozI8Jue9tq6nZdIRIpP3Mej?=
 =?iso-8859-1?Q?lbsh/taim3fuh8fTq4faVMWPO4kxOLg8VL5GiyBzg6BiJyXjHvqZqBBVn5?=
 =?iso-8859-1?Q?qJFB4Rg/Brrk3nRtBtDOyPsEtvbtYCPztoZq+tRm1YELDJyjQwwgXzv+po?=
 =?iso-8859-1?Q?tLUoiioSxCVHmIE8OxIPvNoLpekYVL4ekYCO+Qt+OGevRrKoiqvedCY2n1?=
 =?iso-8859-1?Q?//QWlMwfeLAfIgcTFUHmkQ2x2MYH1KLKILT2KPCK2lZKLBkYHqlEa9bSBU?=
 =?iso-8859-1?Q?vTv7mkhvC0lxVjrobfhXZ03Y0MBzlvHGNi7BBBCRthykwg9I4xCP6JpcZu?=
 =?iso-8859-1?Q?FUffcUC9gKISC97YabkSaw1xd9zdxIcwhfk0QBFvQBiZnwhM/fW3bxEAc7?=
 =?iso-8859-1?Q?cuhNQsweyvPOIo28vgusB9BkXl9ZWx49Ag1lHFsJ5UMNOflGViQ0MKTqN4?=
 =?iso-8859-1?Q?ir5QJPfiKa12YUCXnckwp+xOvad5yJxVuaB2S1u/TKjT341WVWL6dGRUpX?=
 =?iso-8859-1?Q?LSqykeRm+s+pk9g5WUUv8RA/Ke5cBuCNfBKtnoJ+a7sdlPSEwJLbAA5Gfr?=
 =?iso-8859-1?Q?/isTRc2wgyCf89xuBKh12QKvXB2hE7x32vNr69xgWSqM5C/aGQ5BsidwHa?=
 =?iso-8859-1?Q?QZeZEt4MdIMwa7x59WKl8UeCPk9Z8ZZ1klAPwQcRT8y45u7WugUresrrvc?=
 =?iso-8859-1?Q?XMsAHVyjz7/wJQfjZZ8dnERY7APVGwrCJNaP0fZ82dz2ZC6araMAu0Kb6f?=
 =?iso-8859-1?Q?JOnzSC6XM4Bbl4tS1OptlD08uZxwNslMjVivUjPI42hCTHEJCpKR+tPIOO?=
 =?iso-8859-1?Q?QJe2xrEAvBY6jeVUKkDzmmTdP2CrnmizseuHqBBlP5Fk/zLrWFR/Gp4Ufm?=
 =?iso-8859-1?Q?cknSHAkh5SIShyCsA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fourpeakslandscape.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR17MB3617.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2b34f1-2def-4477-c2c4-08d898a3e5c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 22:28:17.4194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f86d598a-53c7-4611-9718-2bbe7841079b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdc7AMsSBlUv89VZ2vexZGq1j4sNPI3coCn7PGc6p6cU5lu7g86wAo0yawFitc4kuMFVbjKAIbsDag2QNB5Zxy1WScDtD1KJOSPAFNL0Qn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR17MB3080
X-Mailman-Approved-At: Sat, 05 Dec 2020 15:16:02 +0100
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

Is there a command with wg on windows that will show the DNS entries for th=
e wireguard conf with the wg showconf command? I can gather the rest of the=
 information except that entry.=0A=
=0A=
Also, do the environmental variables like WG_HIDE_KEYS not work in windows =
currently?=0A=
=0A=
=0A=
=0A=
Thanks!=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
Thanks,=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
Dennis Fair=A0=A0|=A0=A0I.T Systems Admin=0A=
=0A=
Four Peaks Landscape Management=0A=
=0A=
p:=A0480-967-0376=A0=A0|=A0=A0f:=A0480-967-0406=0A=
=0A=
m:=A0480-319-5345=0A=
=0A=
e:=A0it@fourpeakslandscape.com=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
