Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E6DC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:22:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC06E2089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="KlMoyPs/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC06E2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6487e7ed;
	Tue, 8 Jan 2019 02:18:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78cb4caa
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jan 2019 19:28:40 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092065032.outbound.protection.outlook.com [40.92.65.32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04bf6ca2
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jan 2019 19:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LbRjIzXkNft4K0ERl0wkFL14riePN1g7kRsWRVZW9k=;
 b=KlMoyPs/hASQ9mJ/BNgG7NfztSPvBnf9CPHUasNleOqVcTyzik9ZBHf5b+0O5A48eFzlXn9IAoB+1tLbxRd/5pkHr2y0uHrjpBVP/8EozRpOZpm4welwxHuV/cR5o1g5/rBF7L5QprdWf3KHwShWxEB/1bLgBNzH3mcPvBXD3EszN1wXZsFlOrfMlQm+r9W0p/WB/fvsTFagYaUQv0LTRedKQtw7CPoqAC7Du+MUS4DoQl0kjDl/U9CfmRtPI7VwdFRye9uvwoDUSmLT3QMKbuEwZn8QJI0am0rIgPkjnhk2Zc/vCcyqO0yjnVYRo7AMRBLaDN7mztwDpc0DUePUaQ==
Received: from DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (10.152.4.60) by DB5EUR01HT136.eop-EUR01.prod.protection.outlook.com
 (10.152.5.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1471.13; Sun, 6 Jan
 2019 19:31:30 +0000
Received: from HE1P189MB0329.EURP189.PROD.OUTLOOK.COM (10.152.4.55) by
 DB5EUR01FT054.mail.protection.outlook.com (10.152.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1471.13 via Frontend Transport; Sun, 6 Jan 2019 19:31:29 +0000
Received: from HE1P189MB0329.EURP189.PROD.OUTLOOK.COM
 ([fe80::294f:53e:7121:6586]) by HE1P189MB0329.EURP189.PROD.OUTLOOK.COM
 ([fe80::294f:53e:7121:6586%2]) with mapi id 15.20.1495.011; Sun, 6 Jan 2019
 19:31:29 +0000
From: George Philippou <george-marie@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Internet Sharing on macOS
Thread-Topic: Internet Sharing on macOS
Thread-Index: AQHUpfIkNgr32pa2GkuYygzI2szPbQ==
Date: Sun, 6 Jan 2019 19:31:29 +0000
Message-ID: <HE1P189MB032959BA22692C843131BB028D880@HE1P189MB0329.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C8A6C04681178AD2D667B3044E6B5895C77FF428CBFA074A8BA7C15D171907E1;
 UpperCasedChecksum:4A81EEC49D71A5C7A9CE040CCFFED6FD1B60BC632E07358AAAEB1772ABC2C151;
 SizeAsReceived:6805; Count:43
x-tmn: [bboPPFv2vvM0W8rCq/iAikL7eEWxEiKS]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5EUR01HT136;
 6:xXTRYinjLkg5cVtSVzbrlrTndCCSN1aBtCH0h5NKqDNJNjLl+RW+/BArogT0Kx+5JwQ7l0JlEx5e8091D6qvHaO8Tbcbt+ECH+Yb45r8WiVLt8jPtt41cXCrPIDro9cau4SF2ofgDMYo0OTwhuaKK05gfBkKR4ECV6WfOmQM9JmbvUJN6eAcVm//SPtdMKvQ+bbpm8V7i/c1cFsnZSlL/yub3GsMpXCtyNbhHES5lSsiSAhTxUulrHQm50JdGvr1cv1+IWeBTQZpAV/Yj0TUeyWkDwWsAQpjEhFbSFXdLsiRsZ+vyA70jnjnhL4owW4cV46beyr5KK46UARncTe1KGaVSQjdLck2n0a1EM30uXsg02E3adHYfKBEM1j25VFHuFzeHX54LfENeOIGHk7OsJsaRA5cSI+0tuRZXfhZ18mkvxyAaHWzaxGdZYpWX5JPU2kRJZ3D6M2mwGkhvdNodg==;
 5:W7XBYKOD+QlRT2mek89zf62mrPddnm35RTxJC5poAL4kdySTrQEXjOrzpYB5RiVxM2B5BsPzyo0T2egQrmT6eVeIYvOY7IYzlOI1NG1NNcofpRizDC3uj1YytJYMVsgvkt6DN1SB6LHqgw2H3T6VyVMdZxj3zUIqK+Jv2rGBJZE=;
 7:rland/rj/Eyq9HZNtbxhNleBzzgcP8iXR9YxZpb0c2f1/TWYvJOBuF6QlKuSHZifNOn9rSUe6OhyfXsSweSUB5UmY4KKVWOqScrOnIvMo4tLUkssijKtluvegcMk3iGWFKx7XqXif61+4gpYkaJvPQ==
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:DB5EUR01HT136; 
x-ms-traffictypediagnostic: DB5EUR01HT136:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
 SRVR:DB5EUR01HT136; BCL:0; PCL:0; RULEID:; SRVR:DB5EUR01HT136; 
x-microsoft-antispam-message-info: Wo4IALQx4uOcJvam7csuq4Jt37PCAid2PLfS3jnOGT11dB/u7OnYR876YJcVYNxZ
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 5dab7a8a-ebdc-4bd9-9cfd-67cde50b170b
X-MS-Exchange-CrossTenant-Network-Message-Id: d9277585-557b-43b3-d80f-08d6740d8eb2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 5dab7a8a-ebdc-4bd9-9cfd-67cde50b170b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2019 19:31:29.6185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT136
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:18:47 +0100
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
Content-Type: multipart/mixed; boundary="===============1125516125261482634=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1125516125261482634==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1P189MB032959BA22692C843131BB028D880HE1P189MB0329EURP_"

--_000_HE1P189MB032959BA22692C843131BB028D880HE1P189MB0329EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am a user of the Internet Sharing option in macOS, however I cannot use t=
his feature in conjunction with wireguard. I do not know if this is a known=
 problem, or if it's easily circumvented by some basic knowledge of the way=
 the system and wireguard handle network interfaces. I am sharing a descrip=
tion of my set-up for your consideration.

Since the area I want to cover is too big for just the ISP-provided access =
point, I connect my laptop (MacBook) to that access point via an ethernet c=
onnection through the wall, and I am then able to use my MacBook's WiFi ada=
pter as a secondary access point (this is achieved through System Preferenc=
es > Sharing).

However, when I do that, none of the connected devices are able to connect =
to the internet, unless I disconnect from my VPN on the MacBook first. My i=
ntention is to have only one instance of wireguard running on my laptop so =
that any devices that connect to it as an access point will automatically b=
e covered by the wireguard instance already running.

Note than I am still able to use wireguard on my iPhone in this case, when =
I connect to the MacBook access point, but this can only be done when I'm n=
ot using wireguard on the MacBook itself.

Some tinkering around with ifconfig using various combinations of wireguard=
 and internet sharing can be found here, since it probably includes some hi=
nts I'm not seeing: http://ix.io/1xGj

Thanks for your time,
George

--_000_HE1P189MB032959BA22692C843131BB028D880HE1P189MB0329EURP_
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
Hello,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I am a user of the Internet Sharing option in macOS, however I cannot use t=
his feature in conjunction with wireguard. I do not know if this is a known=
 problem, or if it's easily circumvented by some basic knowledge of the way=
 the system and wireguard handle
 network interfaces. I am sharing a description of my set-up for your consi=
deration.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Since the area I want to cover is too big for just the ISP-provided access =
point, I connect my laptop (MacBook) to that access point via an ethernet c=
onnection through the wall, and I am then able to use my MacBook's WiFi ada=
pter as a secondary access point
 (this is achieved through System Preferences &gt; Sharing).</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
However, when I do that, none of the connected devices are able to connect =
to the internet, unless I disconnect from my VPN on the MacBook first. My i=
ntention is to have only one instance of wireguard running on my laptop so =
that any devices that connect to
 it as an access point will automatically be covered by the wireguard insta=
nce already running.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Note than I am still able to use wireguard on my iPhone in this case, when =
I connect to the MacBook access point, but this can only be done when I'm n=
ot using wireguard on the MacBook itself.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Some tinkering around with ifconfig using various combinations of wireguard=
 and internet sharing can be found here, since it probably includes some hi=
nts I'm not seeing:&nbsp;<a href=3D"http://ix.io/1xGj" id=3D"LPlnk851563">h=
ttp://ix.io/1xGj</a></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thanks for your time,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
George</div>
</body>
</html>

--_000_HE1P189MB032959BA22692C843131BB028D880HE1P189MB0329EURP_--

--===============1125516125261482634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1125516125261482634==--
