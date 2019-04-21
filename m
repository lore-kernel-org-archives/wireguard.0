Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FC9C28D1D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:38:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCF020868
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCF020868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=krasovsky.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fbb10c0;
	Thu, 6 Jun 2019 09:38:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65e214b2
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Apr 2019 21:03:43 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069032.outbound.protection.outlook.com [40.92.69.32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9ac3875
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Apr 2019 21:03:43 +0000 (UTC)
Received: from AM5EUR02FT021.eop-EUR02.prod.protection.outlook.com
 (10.152.8.55) by AM5EUR02HT217.eop-EUR02.prod.protection.outlook.com
 (10.152.9.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16; Sun, 21 Apr
 2019 21:03:42 +0000
Received: from HE1P18901MB0219.EURP189.PROD.OUTLOOK.COM (10.152.8.56) by
 AM5EUR02FT021.mail.protection.outlook.com (10.152.8.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1771.16 via Frontend Transport; Sun, 21 Apr 2019 21:03:42 +0000
Received: from HE1P18901MB0219.EURP189.PROD.OUTLOOK.COM
 ([fe80::5cb5:c4fc:d92e:d9d9]) by HE1P18901MB0219.EURP189.PROD.OUTLOOK.COM
 ([fe80::5cb5:c4fc:d92e:d9d9%4]) with mapi id 15.20.1792.023; Sun, 21 Apr 2019
 21:03:41 +0000
From: Krasovsky Savely <savely@krasovsky.me>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Android quick shortcut feature
Thread-Topic: Android quick shortcut feature
Thread-Index: AdT4gqh8/ZBmZ4HcS8CZndkI97UaYw==
Date: Sun, 21 Apr 2019 21:03:41 +0000
Message-ID: <HE1P18901MB02192EC50B66E8676A93A5F0BB210@HE1P18901MB0219.EURP189.PROD.OUTLOOK.COM>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A992F39EACCCBC538B8EB0E255CBBB3B3EA21009EF77AA9815C065C58A6C621C;
 UpperCasedChecksum:E4F0FA83B67E85525A2A7CE2BB5276D2BBFA27E67DC7EDD1F126D0D044E63CA3;
 SizeAsReceived:6568; Count:41
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [M3UGT4VQxQU7h4UcGUmUaOKWBUZMkuBT]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR02HT217; 
x-ms-traffictypediagnostic: AM5EUR02HT217:
x-microsoft-antispam-message-info: L5wg38HlxTMku88CG8/Rr5rnhDPyDuIi9XLHa23t0+ewidRkVh/kU+8Z9WHlrE/qeAcNmiGDJXpT+CaOKvegQr9ftqe5MoeCgvv9Y6RlnCXn9/s1jB8sAJjr6I7QHj599o3bWDIF6qRzTR1vq5/fyfKiDlPoiJ6ab3/nu9dZo11ja51p8QpotyuFXg0OTDVk
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7484bb7f-fcd9-4a8b-db4d-08d6c69cd58e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2019 21:03:41.9130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT217
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:38:05 +0200
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
Content-Type: multipart/mixed; boundary="===============7205881105879621789=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7205881105879621789==
Content-Language: ru-RU
Content-Type: multipart/alternative;
	boundary="_000_HE1P18901MB02192EC50B66E8676A93A5F0BB210HE1P18901MB0219_"

--_000_HE1P18901MB02192EC50B66E8676A93A5F0BB210HE1P18901MB0219_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello. Sorry if I do something wrong, because I didn't use mailing lists be=
fore (yeah, I am pretty young), also sorry for my English, it possibly bad.=
 I want to share feature request for Android app and it's quite simple I gu=
ess. Android has app shortcuts for some actions. For example StrongSwan (IK=
Ev2 client) Android app has ability to create shortcut that allows you to i=
nstantly connect to chosen connection. I can put it at my main screen (or b=
ind it physical button in my case) and easily connect to it by tapping it. =
I know that WireGuard Android app has Quick Setting Tile, but this is not A=
pp Shortcut, I hope you understand the difference. App Shortcuts extremely =
useful in case of my device - BlackBerry Key2. I can bind to any key any co=
nnection as I use it currently with StrongSwan, with extremely fast WireGua=
rd handshake speed it will be even more useful for me.

I would send you patch, but I am backend Golang programmer, don't have time=
 to learn Java and Android specific API's. Hope Android devs had some time =
to at read this feature request and take into account.

Thank you for your attention, with regards, Savely Krasovsky.

--_000_HE1P18901MB02192EC50B66E8676A93A5F0BB210HE1P18901MB0219_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:2.0cm 42.5pt 2.0cm 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"RU" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello. Sorry if I do something =
wrong, because I didn&#8217;t use mailing lists before (yeah, I am pretty y=
oung), also sorry for my English, it possibly bad. I want to share feature =
request for Android app and it&#8217;s quite simple
 I guess. Android has app shortcuts for some actions. For example StrongSwa=
n (IKEv2 client) Android app has ability to create shortcut that allows you=
 to instantly connect to chosen connection. I can put it at my main screen =
(or bind it physical button in my
 case) and easily connect to it by tapping it. I know that WireGuard Androi=
d app has Quick Setting Tile, but this is not App Shortcut, I hope you unde=
rstand the difference. App Shortcuts extremely useful in case of my device =
&#8211; BlackBerry Key2. I can bind to
 any key any connection as I use it currently with StrongSwan, with extreme=
ly fast WireGuard handshake speed it will be even more useful for me.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would send you patch, but I a=
m backend Golang programmer, don&#8217;t have time to learn Java and Androi=
d specific API&#8217;s. Hope Android devs had some time to at read this fea=
ture request and take into account.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you for your attention, w=
ith regards, Savely Krasovsky.
<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_HE1P18901MB02192EC50B66E8676A93A5F0BB210HE1P18901MB0219_--

--===============7205881105879621789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7205881105879621789==--
