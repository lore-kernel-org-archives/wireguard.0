Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B91C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Nov 2018 03:40:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7341620870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Nov 2018 03:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7341620870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dkisselev.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0669faf;
	Tue, 20 Nov 2018 03:34:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6f11c02
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Nov 2018 03:34:39 +0000 (UTC)
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092013088.outbound.protection.outlook.com [40.92.13.88])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 388ae075
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Nov 2018 03:34:39 +0000 (UTC)
Received: from DM3NAM05FT054.eop-nam05.prod.protection.outlook.com
 (10.152.98.56) by DM3NAM05HT095.eop-nam05.prod.protection.outlook.com
 (10.152.99.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.3; Tue, 20 Nov
 2018 03:40:38 +0000
Received: from CY4PR14MB1141.namprd14.prod.outlook.com (10.152.98.58) by
 DM3NAM05FT054.mail.protection.outlook.com (10.152.98.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.3 via Frontend Transport; Tue, 20 Nov 2018 03:40:38 +0000
Received: from CY4PR14MB1141.namprd14.prod.outlook.com
 ([fe80::f02b:6744:6edc:27dc]) by CY4PR14MB1141.namprd14.prod.outlook.com
 ([fe80::f02b:6744:6edc:27dc%5]) with mapi id 15.20.1294.048; Tue, 20 Nov 2018
 03:40:38 +0000
From: Denis Kisselev <denis@dkisselev.net>
To: John Smith <johnsmith1@riseup.net>, WireGuard List
 <wireguard@lists.zx2c4.com>
Subject: RE: WireGuard server and multiple clients
Thread-Topic: WireGuard server and multiple clients
Thread-Index: AQHUgDsbitRaQIO0tEizvs7iiZkoQaVYAytr
Date: Tue, 20 Nov 2018 03:40:38 +0000
Message-ID: <CY4PR14MB1141B76AC8CD7C2944938FA2A2D90@CY4PR14MB1141.namprd14.prod.outlook.com>
References: <09ef4c2c-a445-1183-d4c6-1a6ca0e0cb41@riseup.net>
In-Reply-To: <09ef4c2c-a445-1183-d4c6-1a6ca0e0cb41@riseup.net>
Accept-Language: en-US, en-CA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:38DDC5F54E4F196EEC8C6BD0CEB072926FF95617DC694D00B2F37529AA20015E;
 UpperCasedChecksum:B41F3694404A6FFDF5AF775011CE8010F2EC55512BA09C6F817729939060E136;
 SizeAsReceived:7043; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [ZNMeK7JTKVSbhSKfGM1KE0b8TGxe/bf4]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM3NAM05HT095;
 6:THQsOjipueaQBkQBPHFSXBqjG+tnbPdQiG3lKG1yp3K3FXyhq9n+xJPw2ww6wPs4HycxFtA8Y3QplxvhRgPTHrSKtEmL6kJ5jxcJkuc4rn3PQEjlgrA0TJp7Elk/Ok6yavuCMQC7JxXeuUmbal9eYQ5Fixzv2LsmfJEIq9DPqczHKYUnB/lRfrkgdhRoidMxmfpMO6du5hXIaR2wzm41PayfPPJIPTQHWjyZRegwpODACHJnGg5v2gLqzAg/q9AI5pJSPvINkVQyRVslYiY+gISgLvw1m1p6OiPtG3aYhqT/XYKwj7JKopGOUcal+5OwsFGtMxVcwGN+AolOEjcBBTzhncCOxqnXtUOeBa0P16cjAYOSWB7cZPErlnUSwehHIRvxXbjUj4usXO7GtV3DsDaMwhDmaK+WYswk1t9X7oGijkmGQZc9r7od/c5QcctVRmGFJdYUm3UBfoOlNSmeFg==;
 5:zWp/WUG80lrSFgxNq8lzWnuWBAIDDPr7fVudwWZtVlf3tQZEdq0+WtDUHTafcHYxN6Eb/gAIt4k/Ys/3ada7Lxs1DFQU/ncamYsBo3EEMT3ul+t+kl7TG42keqcrn3LZLZ7JU7FbQPwvsc2W5nJEVjQSqFcSzDXLUHN9wmIZdME=;
 7:tVcqG+TMckCQQ0C4RSNERjeOcl7IY4ypS1D2AqgfdhbLYrHV4e843grFVm81JPv1a+iSoM7eJ3cpzJNmFQmxCC9EqlDyyWy5w8PvP/q9/1Qhs/uiX2AhHD5rYRvsWI/Sxzwqn20S0PDHxE4hd0+8jQ==
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101475)(1601125500)(1701031045);
 SRVR:DM3NAM05HT095; 
x-ms-traffictypediagnostic: DM3NAM05HT095:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
 SRVR:DM3NAM05HT095; BCL:0; PCL:0; RULEID:; SRVR:DM3NAM05HT095; 
x-microsoft-antispam-message-info: ZvT1cBeH5DgXf+uggrgq0S8xeRbiWuYizskXPAkTrh1VO17zkniRH9PCx0xqxens
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 5dab7a8a-ebdc-4bd9-9cfd-67cde50b170b
X-MS-Exchange-CrossTenant-Network-Message-Id: bddd57a9-2ed5-4b2e-ff22-08d64e99f02d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 5dab7a8a-ebdc-4bd9-9cfd-67cde50b170b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 03:40:38.5392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3NAM05HT095
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
Content-Type: multipart/mixed; boundary="===============4095776477170618245=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4095776477170618245==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR14MB1141B76AC8CD7C2944938FA2A2D90CY4PR14MB1141namp_"

--_000_CY4PR14MB1141B76AC8CD7C2944938FA2A2D90CY4PR14MB1141namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Nope,



Wireguard should work with multiple clients by default. You just have to ma=
nually add the public key and assign an IP for each one.



Whether any specific configuration is =93recommended=94 really depends on y=
our exact use-case and assessment of the other options that are available t=
o you.

Wireguard can be a great VPN to let friends and family connect to you, but =
so can OpenVPN or even Hamachi.



Commercial WG VPN=92s are still sparse primarily because the project is sti=
ll relatively young. The providers need to write custom integrations to tie=
 wireguard servers into their billing and client key generation systems, an=
d many may not trust it yet because the codebase is evolving so much.









________________________________
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of John Smith=
 <johnsmith1@riseup.net>
Sent: Monday, November 19, 2018 9:30:00 AM
To: WireGuard List
Subject: WireGuard server and multiple clients

Hello,

If I were to set up a WireGuard server and have multiple clients
connecting to it, is there anything I need to be aware of? Specifically,
I am looking to understand if this is recommended as I already see
commercial offering of WireGuard - but not by all providers - so I was
wondering if there are any caveats to this approach.

For added context, I was managing a VPN server for my family and friends
but now I am considering switching to WireGuard.

Thanks.

- J Smith
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.z=
x2c4.com%2Fmailman%2Flistinfo%2Fwireguard&amp;data=3D02%7C01%7C%7C682833c00=
bdb4550ea6008d64e523de3%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C636782=
512459091879&amp;sdata=3DKARAdd2N0g93ovqzUe8adi3ek%2FOWBZRTWQHllLVO8qs%3D&a=
mp;reserved=3D0

--_000_CY4PR14MB1141B76AC8CD7C2944938FA2A2D90CY4PR14MB1141namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:x_link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:x_visited, span.x_MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
p.x_MsoListParagraph, li.x_MsoListParagraph, div.x_MsoListParagraph
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
.x_MsoChpDefault
	{}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Nope,</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Wireguard should work with multiple clients by def=
ault. You just have to manually add the public key and assign an IP for eac=
h one.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Whether any specific configuration is =93recommend=
ed=94 really depends on your exact use-case and assessment of the other opt=
ions that are available to you.</p>
<p class=3D"x_MsoNormal">Wireguard can be a great VPN to let friends and fa=
mily connect to you, but so can OpenVPN or even Hamachi.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Commercial WG VPN=92s are still sparse primarily b=
ecause the project is still relatively young. The providers need to write c=
ustom integrations to tie wireguard servers into their billing and client k=
ey generation systems, and many may
 not trust it yet because the codebase is evolving so much.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> WireGuard &lt;wireg=
uard-bounces@lists.zx2c4.com&gt; on behalf of John Smith &lt;johnsmith1@ris=
eup.net&gt;<br>
<b>Sent:</b> Monday, November 19, 2018 9:30:00 AM<br>
<b>To:</b> WireGuard List<br>
<b>Subject:</b> WireGuard server and multiple clients</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hello,<br>
<br>
If I were to set up a WireGuard server and have multiple clients<br>
connecting to it, is there anything I need to be aware of? Specifically,<br=
>
I am looking to understand if this is recommended as I already see<br>
commercial offering of WireGuard - but not by all providers - so I was<br>
wondering if there are any caveats to this approach.<br>
<br>
For added context, I was managing a VPN server for my family and friends<br=
>
but now I am considering switching to WireGuard.<br>
<br>
Thanks.<br>
<br>
- J Smith<br>
_______________________________________________<br>
WireGuard mailing list<br>
WireGuard@lists.zx2c4.com<br>
<a href=3D"https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwireguard&amp;amp;data=3D02%7C01=
%7C%7C682833c00bdb4550ea6008d64e523de3%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7=
C1%7C0%7C636782512459091879&amp;amp;sdata=3DKARAdd2N0g93ovqzUe8adi3ek%2FOWB=
ZRTWQHllLVO8qs%3D&amp;amp;reserved=3D0">https://nam03.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwir=
eguard&amp;amp;data=3D02%7C01%7C%7C682833c00bdb4550ea6008d64e523de3%7C84df9=
e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C636782512459091879&amp;amp;sdata=3DKA=
RAdd2N0g93ovqzUe8adi3ek%2FOWBZRTWQHllLVO8qs%3D&amp;amp;reserved=3D0</a><br>
</div>
</span></font>
</body>
</html>

--_000_CY4PR14MB1141B76AC8CD7C2944938FA2A2D90CY4PR14MB1141namp_--

--===============4095776477170618245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4095776477170618245==--
