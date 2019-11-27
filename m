Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CA6C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:39:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BE620678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=azureaxinom.onmicrosoft.com header.i=@azureaxinom.onmicrosoft.com header.b="fNF0qEmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BE620678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axinom.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f532abfb;
	Wed, 27 Nov 2019 09:38:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f96268d6
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 07:55:46 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130135.outbound.protection.outlook.com [40.107.13.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de452cd0
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 07:55:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9PDYkrOU6WjB1lYodzDVb8cWzAy7WcK7cKj27Ho1+IXKOGaqBGhpdpYcqFsIZHBv5r0OcZlk6AG2MmFBHp2eDbto5wgVmPKe/036M9mcAVHaYl3S1OpomS9QgNr7o+HK3soquPL+nSa6Nwa9KPDyT9eyThGiX4xny77bpGOhrRUvlATGbqenNMP7bsQuqY8moMTPqrZdiHuJ5eKDZMr0UMMyVHMVIOn7gPoirfn0xNef8ZUnNnb1jcZNHjWN1LOrbInrdQT+8MoptjHLw4FHrvmUhhagS7/ZkNyJtNIHsWt0b5dVI7iInlx0xB1COhKJDeOTjemXJFreJQivQUyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/H2sVKoMEIzBf+dNcsTwHMj4Q2bpNT9ZpRjXB9er9M=;
 b=FFSu1LG15HXMgZ/diEYYsfd86+2q1X5cyZmEMXhB0R4JwMOLHTLMC/Z0ReVgccJIaPUdNDeTUiWXpAUPgulhxjn6s1OSfisgKbihX3QevEyCsZlLW69pLa94V7R+qgEZtOOZftSKrh9oY1JCTBemogOROOuerCeTb+lAanhQQIVxu7SepKA1EfkLahXHPyUUl4wPxY5ebA3jzBKRN2jGZyMd9PHVI4jOGAND4PfsBU2dJVGpmk9PNK7zH9G09QLFpChfGKJw/eU1TVrkxACjh5XiZAxruSZivQb8rFYGT7iKttu7ZTYl5UW3JP97SLcm36io5yOQrhJiI29uLNneIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axinom.com; dmarc=pass action=none header.from=axinom.com;
 dkim=pass header.d=axinom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureaxinom.onmicrosoft.com; s=selector2-azureaxinom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/H2sVKoMEIzBf+dNcsTwHMj4Q2bpNT9ZpRjXB9er9M=;
 b=fNF0qEmAFXrbJY1kdvtt16qkx0gwTM86JY9XEaoVdSX8bEXO4jviKT89BOotfGkpxHb+F1ad5VBDP2qy8offNtx0nCdLIJHX+fBrgjmAkewZW2nfOvsiwjA+ABY4G0wx2V/0HV8JewRghF07HWXiwBx0iG0oCzSCJj118bpg7PU=
Received: from AM0PR05MB4769.eurprd05.prod.outlook.com (52.133.58.151) by
 AM0PR05MB6468.eurprd05.prod.outlook.com (20.179.32.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Wed, 27 Nov 2019 07:55:43 +0000
Received: from AM0PR05MB4769.eurprd05.prod.outlook.com
 ([fe80::b4fa:643a:b4c7:59e1]) by AM0PR05MB4769.eurprd05.prod.outlook.com
 ([fe80::b4fa:643a:b4c7:59e1%5]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 07:55:42 +0000
From: Sander Saares <saares@axinom.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: What would cause Ubuntu 18.04 to perform different fragmentation when
 forwarding to WireGuard tunnel, depending on packet source?
Thread-Topic: What would cause Ubuntu 18.04 to perform different fragmentation
 when forwarding to WireGuard tunnel, depending on packet source?
Thread-Index: AdWk96s42YmLttv7TpKQOJzHMMOYaw==
Date: Wed, 27 Nov 2019 07:55:42 +0000
Message-ID: <AM0PR05MB4769312437C5D8AF355ECA17BE440@AM0PR05MB4769.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saares@axinom.com; 
x-originating-ip: [89.219.153.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5c2820d-ce58-4735-9cd6-08d7730f33f5
x-ms-traffictypediagnostic: AM0PR05MB6468:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR05MB6468588BEEDA810FC4F3E8EEBE440@AM0PR05MB6468.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39830400003)(366004)(136003)(346002)(376002)(199004)(189003)(66476007)(74316002)(66574012)(256004)(5660300002)(14444005)(6306002)(6506007)(102836004)(7696005)(7736002)(52536014)(3846002)(6436002)(54896002)(14454004)(9686003)(236005)(71200400001)(8936002)(2501003)(71190400001)(1730700003)(2351001)(2906002)(790700001)(8676002)(6116002)(316002)(81166006)(25786009)(33656002)(5640700003)(66946007)(64756008)(86362001)(76116006)(186003)(66446008)(26005)(66556008)(6916009)(508600001)(81156014)(606006)(66066001)(99286004)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR05MB6468;
 H:AM0PR05MB4769.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axinom.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1mBVauo61ZhEIpJXJ7lxN7YaEKeo6oRvIF9F9z66ccT0SD4gdeHUNS5sqn7ssXThkeR1+n6XUT4f+qwPjigoADj4tNQuBjQ7HFfINUONQYwxCYHzo83k1DH3v2Z+P0FFUAj1Rql+qy9eDgc4ncnaocE81ILxunnEUZGb8F4/R82CdK0dLgxfHRHQeXYAlTsz0k0faJJ3+vRJv/WJFLf8I4XBrA2S/GU19Q6Nt+Uhuh+NwH/IhjyOwD51uCQgOJqf9uj2ZKcZdNUHcZwF7XeuvHTZi9xzsBaeFhqxu4YJD3YSAaaQ+CXYzquuWrllyv6fWCCrQgYGpqEWLcoMgUSNf6lscoUx6gp2aXMgZhLLLQWa1XD82co93PDPcfslvk4iNd7UAIKGpWrstKcsTHIZTht0cJDBlI0tgU+oT8ttwwMKNfe3v54xYNFI/WGOeWvUWlNqB1rAr21pTONUE0rGZc8mzwAbOQQLPlxIwLCNt7U=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: axinom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c2820d-ce58-4735-9cd6-08d7730f33f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 07:55:42.8453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: db0b4725-608f-4d84-b2e3-7fc15b0cb2d4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cM20ccRkrP6kGah23+es5lDphuLki09HQ/tuZ+WnuQbhqXC2Zlphp7uJzMbbx8HQJEAi7/F84PXOfyfGTfbHaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB6468
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:38:25 +0100
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
Content-Type: multipart/mixed; boundary="===============8009771154789657624=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8009771154789657624==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB4769312437C5D8AF355ECA17BE440AM0PR05MB4769eurp_"

--_000_AM0PR05MB4769312437C5D8AF355ECA17BE440AM0PR05MB4769eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi!

I am troubleshooting some odd behavior and noticed that when my Ubuntu 18.0=
4 server is routing packets between the internet and a WireGuard tunnel, th=
ere exist some odd differences between how different connections are handle=
d that I cannot account for.

In both cases, I have a client (192.168.147.14) from the other side of the =
tunnel making an HTTPS connection. The IPv4 packets received from the inter=
net have the "don't fragment" flag set, as is common. What I find is:


  *   When processing large packets from server A (159.148.147.196), Ubuntu=
 responds with "needs fragmentation" and correctly gives the WireGuard MTU =
of 1420 as the next hop MTU.
  *   When processing large packets from server B (40.68.232.16), Ubuntu ju=
st does the fragmentation itself and forwards the packets no questions aske=
d. Despite "don't fragment" bit being set.

I am unable to explain the difference in behavior. What am I missing here? =
Why might the two cases be handled differently by the operating system? I d=
o not even know if this is WireGuard related - maybe it also occurs with no=
n-WireGuard adapters.

My forwarding-relevant WireGuard configuration is simply the following:

PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROU=
TING -o eth0 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTR=
OUTING -o eth0 -j MASQUERADE

I have not adjusted any relevant operating system settings from defaults ot=
her than allowing IP forwarding.

The initial packets of the connection that do not exceed the WireGuard MTU =
are correctly routed through the WireGuard tunnel in both cases.

Response from server A
Internet Protocol Version 4, Src: 159.148.147.196, Dst: 172.16.21.250
    0100 .... =3D Version: 4
    .... 0101 =3D Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
    Total Length: 3042
    Identification: 0x2839 (10297)
    Flags: 0x4000, Don't fragment
    ...0 0000 0000 0000 =3D Fragment offset: 0
    Time to live: 46
    Protocol: TCP (6)
    Header checksum: 0x237a [validation disabled]
    [Header checksum status: Unverified]
    Source: 159.148.147.196
    Destination: 172.16.21.250

In response, "fragmentation needed" is sent
Internet Protocol Version 4, Src: 172.16.21.250, Dst: 159.148.147.196
Internet Control Message Protocol
    Type: 3 (Destination unreachable)
    Code: 4 (Fragmentation needed)
    Checksum: 0x99ba [correct]
    [Checksum Status: Good]
    Unused: a8
    Length: 246
    [Length of original datagram: 984]
    MTU of next hop: 1420
    Internet Protocol Version 4, Src: 159.148.147.196, Dst: 172.16.21.250
    Transmission Control Protocol, Src Port: 443, Dst Port: 43254, Seq: 204=
1044714, Ack: 1154907605
    Transport Layer Security

Response from server B
Internet Protocol Version 4, Src: 40.68.232.16, Dst: 172.16.21.250
    0100 .... =3D Version: 4
    .... 0101 =3D Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
    Total Length: 5716
    Identification: 0x22e1 (8929)
    Flags: 0x4000, Don't fragment
    ...0 0000 0000 0000 =3D Fragment offset: 0
    Time to live: 119
    Protocol: TCP (6)
    Header checksum: 0xf863 [validation disabled]
    [Header checksum status: Unverified]
    Source: 40.68.232.16
    Destination: 172.16.21.250

In response, Ubuntu just fragments the packet anyway and pushes through the=
 WG tunnel
22           0.081525663       172.16.21.250     192.168.147.14  WireGuard =
         1482       Transport Data, receiver=3D0xD8778C02, counter=3D11, da=
talen=3D1408
23           0.081532164       172.16.21.250     192.168.147.14  WireGuard =
         1482       Transport Data, receiver=3D0xD8778C02, counter=3D12, da=
talen=3D1408
24           0.081535164       172.16.21.250     192.168.147.14  WireGuard =
         1482       Transport Data, receiver=3D0xD8778C02, counter=3D13, da=
talen=3D1408
25           0.081538164       172.16.21.250     192.168.147.14  WireGuard =
         1482       Transport Data, receiver=3D0xD8778C02, counter=3D14, da=
talen=3D1408
26           0.081541064       172.16.21.250     192.168.147.14  WireGuard =
         410         Transport Data, receiver=3D0xD8778C02, counter=3D15, d=
atalen=3D336

Cheers,

Sander Saares
Advisor

Axinom | Soola 8 | 51004 Tartu | Estonia
phone: +49 911 80109-54
saares@axinom.com<mailto:saares@axinom.com> | www.axinom.com<http://www.axi=
nom.com/>

Managing Directors: Sergei Gussev, Oleg Knut
Tartu Circuit Court, Reg. 11046287


--_000_AM0PR05MB4769312437C5D8AF355ECA17BE440AM0PR05MB4769eurp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1170170703;
	mso-list-type:hybrid;
	mso-list-template-ids:-1522905622 1350069654 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:Arial;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am troubleshooting some odd behavior and noticed t=
hat when my Ubuntu 18.04 server is routing packets between the internet and=
 a WireGuard tunnel, there exist some odd differences between how different=
 connections are handled that I cannot
 account for.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In both cases, I have a client (192.168.147.14) from=
 the other side of the tunnel making an HTTPS connection. The IPv4 packets =
received from the internet have the &#8220;don&#8217;t fragment&#8221; flag=
 set, as is common. What I find is:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">When processing large packets from server A (159.148.147.196), Ubuntu=
 responds with &#8220;needs fragmentation&#8221; and correctly gives the Wi=
reGuard MTU of 1420 as the next hop MTU.<o:p></o:p></li><li class=3D"MsoLis=
tParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1">When processi=
ng large packets from server B (40.68.232.16), Ubuntu just does the fragmen=
tation itself and forwards the packets no questions asked. Despite &#8220;d=
on&#8217;t fragment&#8221; bit being
 set.<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am unable to explain the difference in behavior. W=
hat am I missing here? Why might the two cases be handled differently by th=
e operating system? I do not even know if this is WireGuard related &#8211;=
 maybe it also occurs with non-WireGuard
 adapters.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My forwarding-relevant WireGuard configuration is si=
mply the following:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; ipt=
ables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<o:p></o:p></p>
<p class=3D"MsoNormal">PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; i=
ptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have not adjusted any relevant operating system se=
ttings from defaults other than allowing IP forwarding.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The initial packets of the connection that do not ex=
ceed the WireGuard MTU are correctly routed through the WireGuard tunnel in=
 both cases.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Response from server A<o:p></o:p></b></p>
<p class=3D"MsoNormal">Internet Protocol Version 4, Src: 159.148.147.196, D=
st: 172.16.21.250<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; 0100 .... =3D Version: 4<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; .... 0101 =3D Header Length: 20 b=
ytes (5)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Differentiated Services Field: 0x=
00 (DSCP: CS0, ECN: Not-ECT)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Total Length: 3042<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Identification: 0x2839 (10297)<o:=
p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp;&nbsp; Flags: 0x4000, Don't fragment<=
o:p></o:p></b></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ...0 0000 0000 0000 =3D Fragment =
offset: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Time to live: 46<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Protocol: TCP (6)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Header checksum: 0x237a [validati=
on disabled]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; [Header checksum status: Unverifi=
ed]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Source: 159.148.147.196<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Destination: 172.16.21.250<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>In response, &#8220;fragmentation needed&#8221; i=
s sent<o:p></o:p></b></p>
<p class=3D"MsoNormal">Internet Protocol Version 4, Src: 172.16.21.250, Dst=
: 159.148.147.196<o:p></o:p></p>
<p class=3D"MsoNormal">Internet Control Message Protocol<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Type: 3 (Destination unreachable)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Code: 4 (Fragmentation needed)<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Checksum: 0x99ba [correct]<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; [Checksum Status: Good]<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Unused: a8<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Length: 246<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; [Length of original datagram: 984=
]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; MTU of next hop: 1420<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Internet Protocol Version 4, Src:=
 159.148.147.196, Dst: 172.16.21.250<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Transmission Control Protocol, Sr=
c Port: 443, Dst Port: 43254, Seq: 2041044714, Ack: 1154907605<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Transport Layer Security<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Response from server B</b><o:p></o:p></p>
<p class=3D"MsoNormal">Internet Protocol Version 4, Src: 40.68.232.16, Dst:=
 172.16.21.250<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; 0100 .... =3D Version: 4<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; .... 0101 =3D Header Length: 20 b=
ytes (5)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Differentiated Services Field: 0x=
00 (DSCP: CS0, ECN: Not-ECT)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Total Length: 5716<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Identification: 0x22e1 (8929)<o:p=
></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp;&nbsp; Flags: 0x4000, Don't fragment<=
o:p></o:p></b></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ...0 0000 0000 0000 =3D Fragment =
offset: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Time to live: 119<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Protocol: TCP (6)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Header checksum: 0xf863 [validati=
on disabled]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; [Header checksum status: Unverifi=
ed]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Source: 40.68.232.16<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Destination: 172.16.21.250<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>In response, Ubuntu just fragments the packet any=
way and pushes through the WG tunnel<o:p></o:p></b></p>
<p class=3D"MsoNormal">22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0.081525663&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.21.250&nb=
sp;&nbsp;&nbsp;&nbsp; 192.168.147.14&nbsp; WireGuard&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1482&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tr=
ansport Data, receiver=3D0xD8778C02, counter=3D11, datalen=3D1408<o:p></o:p=
></p>
<p class=3D"MsoNormal">23&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0.081532164&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.21.250&nb=
sp;&nbsp;&nbsp;&nbsp; 192.168.147.14&nbsp; WireGuard&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1482&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tr=
ansport Data, receiver=3D0xD8778C02, counter=3D12, datalen=3D1408<o:p></o:p=
></p>
<p class=3D"MsoNormal">24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0.081535164&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.21.250&nb=
sp;&nbsp;&nbsp;&nbsp; 192.168.147.14&nbsp; WireGuard&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1482&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tr=
ansport Data, receiver=3D0xD8778C02, counter=3D13, datalen=3D1408<o:p></o:p=
></p>
<p class=3D"MsoNormal">25&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0.081538164&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.21.250&nb=
sp;&nbsp;&nbsp;&nbsp; 192.168.147.14&nbsp; WireGuard&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1482&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tr=
ansport Data, receiver=3D0xD8778C02, counter=3D14, datalen=3D1408<o:p></o:p=
></p>
<p class=3D"MsoNormal">26&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0.081541064&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.21.250&nb=
sp;&nbsp;&nbsp;&nbsp; 192.168.147.14&nbsp; WireGuard&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 410&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; Transport Data, receiver=3D0xD8778C02, counter=3D15, datalen=3D336=
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"ET" style=
=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"ET" style=
=3D"color:#1F497D">Cheers,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-GB" st=
yle=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><b><span lang=3D"EN-GB"=
 style=3D"color:#002060">Sander Saares</span></b><span lang=3D"EN-GB" style=
=3D"font-size:14.0pt;color:#002060"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span style=3D"font-siz=
e:10.0pt;color:#002060">Advisor
</span><span lang=3D"EN-GB" style=3D"font-size:14.0pt;color:#002060"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span style=3D"font-siz=
e:14.0pt;color:#595959">&nbsp;</span><span lang=3D"EN-GB" style=3D"font-siz=
e:14.0pt;color:#595959"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;color:#7F7F7F">Ax=
inom&nbsp;</span></b><span style=3D"font-size:10.0pt;color:#7F7F7F">| Soola=
 8 | 51004 Tartu | Estonia</span><span lang=3D"EN-GB" style=3D"font-size:14=
.0pt;color:#7F7F7F"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#7F7F7F">phone=
: &#43;49 911 80109-54<o:p></o:p></span></p>
<p class=3D"MsoNormal"><a href=3D"mailto:saares@axinom.com"><span style=3D"=
font-size:10.0pt;color:#0563C1">saares@axinom.com</span></a><span style=3D"=
font-size:10.0pt;color:black">
</span><span style=3D"font-size:10.0pt;color:#7F7F7F">|&nbsp;</span><a href=
=3D"http://www.axinom.com/"><span style=3D"font-size:10.0pt;color:#0563C1">=
www.axinom.com</span></a><span style=3D"font-size:10.0pt;color:black">
</span><span lang=3D"EN-GB" style=3D"font-size:10.0pt;color:#7F7F7F"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#7F7F7F">&nbsp=
;</span><span lang=3D"EN-GB" style=3D"font-size:14.0pt;color:#7F7F7F"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:#7F7F7F">Managi=
ng Directors: Sergei Gussev, Oleg Knut<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:#7F7F7F">Tartu =
Circuit Court, Reg. 11046287</span><span lang=3D"EN-GB" style=3D"color:blac=
k"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AM0PR05MB4769312437C5D8AF355ECA17BE440AM0PR05MB4769eurp_--

--===============8009771154789657624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8009771154789657624==--
