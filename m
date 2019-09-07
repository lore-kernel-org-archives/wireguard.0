Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5465ECDE20
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C2D206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lamendola.me header.i=@lamendola.me header.b="Zp2gIaIu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C2D206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lamendola.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be55fb99;
	Wed, 11 Sep 2019 16:40:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdc27997
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 12:36:26 +0000 (UTC)
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710070.outbound.protection.outlook.com [40.107.71.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6fc85ec
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 12:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu3OBtuCUao8CuiKu2lKpCU/ke/2dSmEtJnd4vVOkZrCXIUeazJ6jOvvbTC3cGW7tBNwkHcnbQmN6zlfmxhfafLQamrPjppOGKTVomRYVqgEhjvHk0gkMTs/M24A1AP9Eh5n39uAAV7WjGbYoa4jt9uiF/qDghDGexa+iPda9Nm5AE4OEeJwrIGJc2tE9cg7B3ZNeR0psB0a8xtz+0ZstCn4AxQBRsdxeACjBYm3yjClSZE7ErnFB0dyShEy+SYo+nt2KGQiaT1U93zhkcORtEQCMOQ07IgNQlQ6c+8LeB0/uPKLAzxHLgtLfKuyPjbmBE/Zbyv9CoJqwAFb3YvnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXoLmY2okNdWyvPKjowqQv5oty2jYzEZN06wRF9PluE=;
 b=BiDsEItIMMUgExzl35x8Gpc/KNvxyNvzBfjwBh61Enwgp8EJynFtd4tS67+oYUrrYis07Bh/zSUXSaNC2jkL0zUpXgEuiGwwndvnhCD4GdhbSlt+G3yGRGAKNCga1BvkthfXo2beaHvD/HzAstY9tOnCiWPzIFIjd8M0Q2RyC/lxUMNYetHLdAPo59U+Ml+w6EGHkIk/dbuBltPu/xsohmwswRR0BhZ4B+XRtGO8TWLWVp52rC7kIvxdj6zOEZ//mEC9JdNyBIk2CFHuJ1HYyLLqegAHk71XF3xxBVY7oK4swM7O/3TskVnzCtEJ9AIyG127yZX81hGK6vwTvEi8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lamendola.me; dmarc=pass action=none header.from=lamendola.me;
 dkim=pass header.d=lamendola.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lamendola.me;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXoLmY2okNdWyvPKjowqQv5oty2jYzEZN06wRF9PluE=;
 b=Zp2gIaIutpDSBRblu4Q+EwqLHFUNj2Xn0AjTKFCN0q2bp0Bf31qkdhu48JT0FEnuIZEUs4+JrF1RPD9Dbni9GZy/x2GuJKJ26TFgk69Yr7e+Sgqs93O1rxFk+2X7HwV8Vc+2Jo2xsnWYORmRFUPHTnaPdFfpb+Yhi5Z5hBpKDbA=
Received: from BN7PR04MB5300.namprd04.prod.outlook.com (20.176.29.93) by
 BN7PR04MB5393.namprd04.prod.outlook.com (20.176.179.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sat, 7 Sep 2019 12:36:22 +0000
Received: from BN7PR04MB5300.namprd04.prod.outlook.com
 ([fe80::4842:116d:de1b:6d54]) by BN7PR04MB5300.namprd04.prod.outlook.com
 ([fe80::4842:116d:de1b:6d54%7]) with mapi id 15.20.2241.018; Sat, 7 Sep 2019
 12:36:21 +0000
From: Salvatore LaMendola <salvatore@lamendola.me>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: wireguard-android broken after update to Android 10
Thread-Topic: wireguard-android broken after update to Android 10
Thread-Index: AQHVZXgS53rengScO0qtAAudvI0sIw==
Date: Sat, 7 Sep 2019 12:36:21 +0000
Message-ID: <BN7PR04MB5300FA016101FDA1BE7A27C5D4B50@BN7PR04MB5300.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=salvatore@lamendola.me; 
x-originating-ip: [173.70.107.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06242f62-cda1-4df0-05b1-08d7338ffd45
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN7PR04MB5393; 
x-ms-traffictypediagnostic: BN7PR04MB5393:
x-microsoft-antispam-prvs: <BN7PR04MB5393F61F622C95D7F76B17D2D4B50@BN7PR04MB5393.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0153A8321A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39830400003)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(5640700003)(66946007)(3846002)(55016002)(54896002)(9686003)(7696005)(2501003)(316002)(6916009)(6246003)(53936002)(66066001)(6116002)(229853002)(99286004)(476003)(64756008)(66556008)(66476007)(66446008)(2906002)(486006)(6436002)(52536014)(508600001)(74316002)(256004)(86362001)(186003)(5660300002)(71200400001)(2351001)(7736002)(26005)(14444005)(8936002)(33656002)(14454004)(6506007)(558084003)(1730700003)(71190400001)(25786009)(8676002)(102836004)(81156014)(76116006)(91956017)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR04MB5393;
 H:BN7PR04MB5300.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: lamendola.me does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gfTEut4kXfVH4QSwm/YAGbQsdm09L3remMQDzMYFraOAN4MxcvsejmJzLDybsMSzPehSvfft7fFGMheVQai4gGiFIWWQijcWzdrVyxhTIb+mOxQWBO6V6Cqyd932U6kn2kTQaLuO6QNX7p4rwVaJwSj73nX9hKmJfENVp4Md8GEiDumRmi8+sbIIQEeNayeW35loHsqqSW/KdYi2jewWthoSi3V1+/hJc8NokaL5E7yo01QKMMiwx7vL9BGwpL8zIGYoQPojASmoa/jsxOEscgQ7UJUuI2//p9G1SMx4cFWPz6O4Xlx8Mt9DasVH1OBHaf97UGjlM7h5reftUllK/6OhvqJen2KS+XJbu8wwE4GnXOYyu5c6oCMmgLRa7n7gkv9+elBpNPayiQhi0tuOwbNkGWh+/q9lVaVJcTTeZM0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: lamendola.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 06242f62-cda1-4df0-05b1-08d7338ffd45
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2019 12:36:21.5965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 95fb7574-ac23-41db-ae8e-1bf46bad575b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rahcNm8PZ6wuVPryK+bR5hB0YskJ46IHWR/QzEbV8FGPbSNICp3f3TLY0zcMbD4+Eq8y8ebfoJ00b3XemjLl6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5393
X-Mailman-Approved-At: Wed, 11 Sep 2019 18:40:39 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8860788124055044180=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8860788124055044180==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR04MB5300FA016101FDA1BE7A27C5D4B50BN7PR04MB5300namp_"

--_000_BN7PR04MB5300FA016101FDA1BE7A27C5D4B50BN7PR04MB5300namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just wanted to confirm I'm also using Wireguard on Android 10 on a Pixel 3 =
XL without issue, and I had no trouble using it on any of the Q beta previe=
ws.

--
Salvatore LaMendola


--_000_BN7PR04MB5300FA016101FDA1BE7A27C5D4B50BN7PR04MB5300namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Just wanted to confirm I'm also using Wireguard on Android 10 on a Pixel 3 =
XL without issue, and I had no trouble using it on any of the Q beta previe=
ws.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
<span id=3D"OutlookSignature">
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
-- <br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Salvatore LaMendola</div>
</span><br>
</div>
</body>
</html>

--_000_BN7PR04MB5300FA016101FDA1BE7A27C5D4B50BN7PR04MB5300namp_--

--===============8860788124055044180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8860788124055044180==--
