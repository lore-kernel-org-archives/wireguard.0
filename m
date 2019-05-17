Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC51BC04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5491320872
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="hxuVGQon"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5491320872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6142fd2;
	Sat, 18 May 2019 16:49:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed3938ee
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 06:34:29 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092070033.outbound.protection.outlook.com [40.92.70.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ca79bc1
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92gdoJtHOTwlOhkep7563NRFaj2RhzFj3JVw1cC7OfE=;
 b=hxuVGQon6jV1nEXQ25+hYQNEmx8yIK7nmTPq0UISuxfWEuK19XtMAJR+Vpom8h4ZLk0nyBl0xlIaVJpUr0Ycvg64gaJIzhIEuI6BEm97lJN7mO+sLDVBHA/kpZ0826rdVDM24e2Nb0V29IUD39eNAp1a5hFQL2JTnjMMmLEsCrI4z61iyJQnVppL5cQyOxu/bd3ZHqns6nqHWjHusz/RFNr4E1bQV8GW8rTTCnne3MpXerKLQTSiQPhvQwLDa6DLBh96O5sAm0e5rdJKMd2GDfo6edIGXmGrIN8j1CNZJpGLbij1uGKtiUPIXSTW5JWG8acvgnIEfW0Cg6udd2PrPg==
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (10.152.16.60) by AM5EUR03HT212.eop-EUR03.prod.protection.outlook.com
 (10.152.17.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11; Fri, 17 May
 2019 06:34:28 +0000
Received: from VI1PR08MB4301.eurprd08.prod.outlook.com (10.152.16.54) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 17 May 2019 06:34:28 +0000
Received: from VI1PR08MB4301.eurprd08.prod.outlook.com
 ([fe80::5de1:40dc:77d5:8fd4]) by VI1PR08MB4301.eurprd08.prod.outlook.com
 ([fe80::5de1:40dc:77d5:8fd4%5]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 06:34:28 +0000
From: ". ." <warlock0@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: WireGuard Bug?
Thread-Topic: WireGuard Bug?
Thread-Index: AQHVDHpI8LpyNQ82AUeRTEl+Zzi6Pg==
Date: Fri, 17 May 2019 06:34:28 +0000
Message-ID: <VI1PR08MB430161EDE2737ABEF683CDC7900B0@VI1PR08MB4301.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D2A82D7A5A4B923B1376FA4BDFE6DA21038A4CB439A2328912B52017FB0C6C2A;
 UpperCasedChecksum:26944481F23293682AB389DF59B8DE867254D00AD8E886D104CFF74F54CBC243;
 SizeAsReceived:6512; Count:41
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [f7FRWQvyvUQoDkFf2fYlAAkKymJpuUWL]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT212; 
x-ms-traffictypediagnostic: AM5EUR03HT212:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: COlZZgvd4ajlEo/89SCtqVS4a+s+e1wXeBUsrzO+OFOTHtyQIq15Mr2dmHO1RrKoWCHW6TxoIqiGLDqHRd3GwBRWrWqBRl9c07mbqwve4VjF04zIbW8y/4s7Vc/QwBTION4W++BZAtX72KedpK4k8apOz5WHitaThoe41rhFhQHZojpWvEDDLWpvO38KXJ0f
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6b7e4c-e48d-486d-5d8d-08d6da91b642
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 06:34:28.1849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT212
X-Mailman-Approved-At: Sat, 18 May 2019 18:49:56 +0200
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
Content-Type: multipart/mixed; boundary="===============1072911361345384073=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1072911361345384073==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB430161EDE2737ABEF683CDC7900B0VI1PR08MB4301eurp_"

--_000_VI1PR08MB430161EDE2737ABEF683CDC7900B0VI1PR08MB4301eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using WireGuard on a Raspberry Pi 3 B+ with Raspbian Stretch and 4.14.=
98-v7+ kernel.
Now this works great for me and is very efficient, however I tried to add a=
 lot of routes on one of the "spoke/client" nodes, 517 routes to be exact.
If I do this, WireGuard stops working, tcpdump shows the traffic being sent=
 out the wg0 interface but never actually being processed by wireguard, mea=
ning the encapsulated packet to the "hub" never leaves.

So I tried doing this with wg instead of wg-quick and this works fine until=
 I actually add a lot of the routes to the routing table, the sweet spot se=
ems to be 384. If 383 routes are present in the routing table, wg will stil=
l work but if I add one more, all previously working ones dont anymore, if =
I reduce it again to <=3D383 then it starts working again. wg itself doesnt=
 mind having all those routes (wg show) but I wonder if it tries to read th=
e routing table as well for some reason?

Appreciate any insight/help on this, thanks.
Chris

<http://aka.ms/weboutlook>

--_000_VI1PR08MB430161EDE2737ABEF683CDC7900B0VI1PR08MB4301eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
</div>
<span>Hi,<br>
</span>
<div><br>
</div>
<div>I am using WireGuard on a Raspberry Pi 3 B&#43; with Raspbian Stretch =
and 4.14.98-v7&#43; kernel.<br>
</div>
<div>Now this works great for me and is very efficient, however I tried to =
add a lot of routes on one of the &quot;spoke/client&quot; nodes, 517 route=
s to be exact.<br>
</div>
<div>If I do this, WireGuard stops working, tcpdump shows the traffic being=
 sent out the wg0 interface but never actually being processed by wireguard=
, meaning the encapsulated packet to the &quot;hub&quot; never leaves.<br>
</div>
<div><br>
</div>
<div>So I tried doing this with wg instead of wg-quick and this works fine =
until I actually add a lot of the routes to the routing table, the sweet sp=
ot seems to be 384. If 383 routes are present in the routing table, wg will=
 still work but if I add one more,
 all previously working ones dont anymore, if I reduce it again to &lt;=3D3=
83 then it starts working again. wg itself doesnt mind having all those rou=
tes (wg show) but I wonder if it tries to read the routing table as well fo=
r some reason?<br>
</div>
<div><br>
</div>
<div>Appreciate any insight/help on this, thanks.<br>
</div>
<span>Chris</span>
<div id=3D"Signature">
<p><a href=3D"http://aka.ms/weboutlook"></a><br>
</p>
</div>
</body>
</html>

--_000_VI1PR08MB430161EDE2737ABEF683CDC7900B0VI1PR08MB4301eurp_--

--===============1072911361345384073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1072911361345384073==--
