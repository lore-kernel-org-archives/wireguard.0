Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D6C32792
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 13:35:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bc1a69e6;
	Tue, 23 Aug 2022 13:35:56 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2115.outbound.protection.outlook.com [40.107.94.115])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a338e6fb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Jul 2022 21:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrdRv2mWDYNiFU6uT7pao2EJchET9RScVF16Fmvb67iZdOYLAdX35NmPIhbhXlvRu7clNpxBDe92BNTjVrGBOlED29MNoIknrRpHwSfyfReQb/Mo9EbEsdUJ/BrWy/o+HreuV7bQOFIcuWg/Yt3hDjwLCt54XJtI9SJvVNX4DQ1LK0JpPQb0p26s5dheP19srvQXS6DyeKL56zi+Oe12jK2yzuNtTOrEoNNcfCqd+74f1lHN9Ont9nrpxhhMPV16iRZjVmZ1/tw3u+xeAcEZe00tf8lIjIeWhw7Se1tbVTWb8RkKJX60IDTVf7uSxvUitlyCMwKTDd1L5VMCXgO4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dDpeZGk4idCRQsWrlkm81f+XTDldDn+ldrP6z8Nri8=;
 b=oVcwl/nKHztK2mAr6q7OnjLb23uj7tQeX4+jfGpMaNCOcxmU0Xy+w/4LHFvYmRnhOCGCnj97tkIejb/XdYEYinYrcl9PoQz+YDDatnyazheLePbFQ5ZOOv8MyLgc0KrVUdZGU9frbCHaiuC17pE+fFyYDjI3g9Z19NpcTUVMPXUne8KVZsuu2AGRfjCABJxVi9WCKjRVnIYPgUlpDCSg00KUdxoq9Dbj7ce1gd6Np2+E5rjk1XuUszTYMWoMx0xFb2rFrQAn/dqJAs+BRnk9SkiwDVTwiVzRSZBJba+0zKlDMwQvgV6cWFtpApEMRgJb2DGMWpeJOGn/SFmI1hoOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=anuvu.com; dmarc=pass action=none header.from=anuvu.com;
 dkim=pass header.d=anuvu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globaleagle.onmicrosoft.com; s=selector2-globaleagle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dDpeZGk4idCRQsWrlkm81f+XTDldDn+ldrP6z8Nri8=;
 b=hzUW1mIdn7EuIXM1tBmQ6pPbbKx+olG/7ZCaNRJtz9G9jj+YPOdjZA8Untl8mgs8EXjWx0lIRubBStxMsZJT8VqJ+7nkwna0+v7Is/1CLZpyDTglPpqX3h5Wp6FOQjdzuRz+38xbxFZqqvZOhWEFHv05T1y6HhN5FMKyUoPKtZ8=
Received: from MN2PR10MB4189.namprd10.prod.outlook.com (2603:10b6:208:1de::12)
 by BLAPR10MB5060.namprd10.prod.outlook.com (2603:10b6:208:333::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Tue, 19 Jul
 2022 21:36:57 +0000
Received: from MN2PR10MB4189.namprd10.prod.outlook.com
 ([fe80::69f3:d14e:f2e:d5ec]) by MN2PR10MB4189.namprd10.prod.outlook.com
 ([fe80::69f3:d14e:f2e:d5ec%7]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 21:36:57 +0000
From: Quentin Vallin <Quentin.Vallin@anuvu.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [Question or feature request] Support multiple peer config file using
 something like /etc/wireguard/conf.d
Thread-Topic: [Question or feature request] Support multiple peer config file
 using something like /etc/wireguard/conf.d
Thread-Index: AQHYm7eTTOeM+lrm9kSJ75wlB0GdHQ==
Date: Tue, 19 Jul 2022 21:36:57 +0000
Message-ID: <MN2PR10MB418992D0FB239AC2D3DC8B298E8F9@MN2PR10MB4189.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=anuvu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6d2d5c5-bd4b-42ad-fa60-08da69cece95
x-ms-traffictypediagnostic: BLAPR10MB5060:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NVbNO+USo6ZipePdQ6xdxu1dIZNYDLzSwDtfWpKk6p+NpMHKf1G4yWD1tFbrw844rb4Q9XcXxgtAIPWpLDV2Crd7QETp6v4E+rk0te0OLa6f9TwXI/Ycv5CoOXuXrt281ziLV6CeU3afK8ZF5UVKOTiTbIENHosiJpuJkD8KgYd8LSpWRuJcJ2EaFJzTIknInOgXpV0tEQ4HuCjSWeIKYFtjWpHwWmfJs4hKMgFaBAY5rOgmK3JGYyINF3SUR9ogBludZkgnwXyff5/rYz0idfq3YMgaEVPoOblEAtmOMa0qRsm+s87yHibOXIqX4bbw4vcSxaEQttIBUaQVj1sB3lVV1c7GK9aDO5b7q+V9WDXAqShSx1Jg4Ew7e+Y7NJblX9IOiSZkCTWXKgP9/zEILFuWMeD4xPHGakqmxILajK6k51D1oLY/duxBZtfBpVFyeTP6XDBGiB+sPuAHBmg0ZUU6d+Q7FbwJFTwWXrVLBPYGWmuT1vME/sevvEVPT3JdHbRYZTv+pdevhBq5F6dhrVWKkXAte5m3LO3L8qQHAedx1kLGRtOrbg5xZmpRfVPWa9rOOnoSjNwuP0BCT4sp5IOYXQBSJa9bIEgYc5AeiaSrqZYtZzNXElO6nylH8QHcfDrYNYXwdPPiQZ3cdbl2tuubSgBRmD5VW3LSZsZYXQyGhh5dkQipXUc3MGgpc5PQ894bARTfe+LluOVwFgEBRgMcapInNqU7R7Lf1Yjo4INWgKrTqXZXfdef/iTZ0ahmjQPAbJqVG2sdNHlEIOE+N3ZC+ykAvDO5ajMiH7uFRiv7YIZEGeefO0EMN50kwZcVI3oSM9t5XI/dcnAXTdz1Zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4189.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(366004)(39850400004)(186003)(66476007)(55016003)(66446008)(6916009)(64756008)(71200400001)(76116006)(66946007)(8676002)(91956017)(26005)(9686003)(66556008)(83380400001)(7696005)(2906002)(6506007)(38070700005)(38100700002)(33656002)(478600001)(122000001)(41300700001)(4744005)(52536014)(316002)(5660300002)(86362001)(8936002)(554374003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Mr7tNoaVkHFkXXQnU7IcuZk5tI5p1Hs0MabZYJLkazAQ/qn7JL2pboziox?=
 =?iso-8859-1?Q?s2DoeOb6KL7ZIzEJ/0D3HBM0fdPx6CH3i4gDnHGdtmSxvHlpIgUeMsXp+5?=
 =?iso-8859-1?Q?OYzAd3Dom4lqlJSMKHpMTWG9Yl+4jSddJAZIkQ43UC6hoLexN8hAe4QWNb?=
 =?iso-8859-1?Q?XnmuVDg5QuP07TVC+/WbJia2pP/VxqTo6jHDsg3IU03B9lOeez3q1MZwNr?=
 =?iso-8859-1?Q?35i5GU8v1SNLNeR9SnogqKHwnQ2GdP8L4PvPkw5Dwvcg1r2hr/baDxSD4Y?=
 =?iso-8859-1?Q?BGlJYPOoart7IKy3dKsCOrfSG0gGu5YXYecGM+Dihu2QPGj99f2LeeBfMq?=
 =?iso-8859-1?Q?sYwNegWl2qJklB/VO8RO/r32U1f1YlMOI2FFEhztee68BFjbnOVznGFywA?=
 =?iso-8859-1?Q?HNiKnz3mbZM2HeSQ3T1ZfjkOeefaO+uOuocc1BIyUiMu30uUpzOssiyB7r?=
 =?iso-8859-1?Q?cyovw8xJvRI07bnwGZ5HdUbkBuAvBSisy4Ryjdi+rnCUnAEBajsKo952tI?=
 =?iso-8859-1?Q?SmjZa5Jc01qkbniMCHJuNxI/w7cgbCEkZhI7bUx2f7zgKY/RKysR/FqsZW?=
 =?iso-8859-1?Q?iudqaKe5inb+0seq5x0IMs/w2TvHHfA5C5GM2HXIOZWjEY+m9xeQpt9EJ7?=
 =?iso-8859-1?Q?aBzRQ70Ey0J4WBr3mejuenKzuGyNARe8h4iLDjqPOl3beqBDAeg1/sWHtd?=
 =?iso-8859-1?Q?cxcOPemxs4IcYXOnxNNph1WcR/CNNbR+uqd1gASmPGjHfRMhZbVrV6zKns?=
 =?iso-8859-1?Q?mrrCgmQEFobHmdTLIhX7hFzD1vgrvkD6sUA6o3kJJs4AMRxrgW8CAYEpiU?=
 =?iso-8859-1?Q?ScrTi1ceEiInP3mKHQ9N+YcSDvgBCGzeDHcCUi7vldpvRg5VX+/nOAmpAt?=
 =?iso-8859-1?Q?YyX4xmWOk7+nHx8i4485/kdCP/JjUME3kgrcsb3V1dvnS95jlbL8+9aVvS?=
 =?iso-8859-1?Q?q6OUNJiOVnb1cHGPBZA67/ZgGwxs5GPrarx7TAsAIPA4GIxBYQCMFubanr?=
 =?iso-8859-1?Q?R+GJBzqSv5T1S6joNfDCF3uEm5qPPHqo+reKHaWTBvSdExK6fEUcFcd1Fz?=
 =?iso-8859-1?Q?FaKMi3F9NFo4MYSRrTqa3xjuzUMUDd8YqNUU84lXV2Ve/4dpy+48F15GOK?=
 =?iso-8859-1?Q?pfUzwylxhbwQ6MgoS3VwW3VRQ3uAMNThaofb0v35KpTcV1DvkHvV38iIy/?=
 =?iso-8859-1?Q?M27S4vxlD6SEQcLuMQ3Y7Xkka+kO6CRwovlWl1oDwzea/5zq19yt3C9a4a?=
 =?iso-8859-1?Q?1n2Vs2jsuv7M1BIzNB+Ey605QW6m6o41MO4oHFCsiSloo9dGx7N5eCVRHh?=
 =?iso-8859-1?Q?NOiOB2fK6LAH4V2Ii1UsWuZWjhUZAGLQVEcNpV0TOF6zcSiGwznfyC/rbo?=
 =?iso-8859-1?Q?IbwVUAUmPf9/zKNbtPzpFO4mjiYMczRSZ1NInXiHF7SbF+PdIJJALU5GI8?=
 =?iso-8859-1?Q?swLY0q2YDhA6sG4Mt+muzYeRwd+4yZfPzKb1oMQwhCoXPcCM1BLlHnSrVM?=
 =?iso-8859-1?Q?x3xl+FC3vKLP31FFdbnIeRMrLJthKjxGjipIdfnQEGJo59+VzcNdykaXdv?=
 =?iso-8859-1?Q?1JDEcRLhiz/2DbjWpch4AfmFc7Rb6YT6N0t514F5sLF1OPQ1bmITOzEKMW?=
 =?iso-8859-1?Q?qEIwphwU9rs5CRN5ScQbCLRlnc46ZPAUKmqsNhfcHUkprq0R1PY7YN1A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: anuvu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4189.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d2d5c5-bd4b-42ad-fa60-08da69cece95
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 21:36:57.5836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f4e3b4e5-412b-477c-9698-13c92c5a9a1e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85HEVZBNsWENZz2ZBpv26Ez61KcLx0m/fK4Sa3rgMpq4OFIT4faIEXtZgVyEAf4Xs8ukgKTBdnD1t/IrAQ2/JfabDUrD0wG+rJDZr7Umo5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5060
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:35:50 +0000
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

Hi,=A0=0A=
=0A=
I'm trying to separate=A0my peer configuration and automate it.=A0=0A=
=0A=
I know that I can use the post hook PostUp =3D wg addconf /path/to/my/file=
=0A=
=0A=
It would be easier to have a special path were wireguard can merge the conf=
ig file together, like /etc/wireguard/conf.d/<interface_name>/<files>.conf.=
=A0=0A=
=0A=
I don't find anything in the doc. Do you have a clue if that feature exists=
? Or if that feature is on the backlog?=0A=
=0A=
Thank you for your amazing tool !=0A=
=0A=
Quentin.=
