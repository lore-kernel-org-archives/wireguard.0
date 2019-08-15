Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DBCC3A5A5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671982080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fieldeffectsoftware.onmicrosoft.com header.i=@fieldeffectsoftware.onmicrosoft.com header.b="cIMZk5yc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671982080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fieldeffect.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96f1af58;
	Sun, 25 Aug 2019 15:43:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0041c5cf
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Aug 2019 01:36:51 +0000 (UTC)
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d948f1b3
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Aug 2019 01:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGK4CbvMJofbhIi6J8wfjebNVgwKgUb4+SFu6sqNOmYoUotM9EvjMwQJyJAJGCrJwhu6kmH6CZo8iJPOouQQSarTT0JpC6ZF5l5smO2lkSlX+5TR+LDbMSBfBGYe/tA016WRmtWYCbKsbmqeMEkF8HwrQ4kFQgsDG+UlQ2M21a/pYUTsluvF83AC1ML6vJV8hxIP/CSk6LxFxKsL5caCmfMqgvAIWZqNSEv2RSuJUVsmDHFZd0URsItWqvjVu5AWgOSrRNF0mUc+NPzHvT2T9Ir5oymZe0qKqlthVq2MO6Qa0IUHP+yMcW8uIXBRvtF5QY81TZIkFJOjFT4Xi2mZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6o/7TjzySg6mL4m5X74Tx+2xl1r/y+vedXXLCJKDnk=;
 b=DPXIRRmOzTUknrDkQGT00EEjKta9tUddKxma38xOwAoDnhI8IXEfOuPzTgNAyFpjnLJ5baraF3CPig3S4SVkxRScc4nUqAOKapPAxP7tC8/97jtJ547WG4+i9B6wShrmOpuVFGYdXcfXFF0ZZbWBDuxvqTQH+aduk4wRd+cvQSHa8/Lh1D2Ti5mnblCEyBhSeFPQWGpQ3mvSdnQTXT8H2RDW262huLKRWMOk6iwECd6QePeO47/dwUCD7Oy98VovAcoS1WLc4HnoByRetOKudw1FVH5e0lZgSdQtent9JozLcpf7hrJ5/m+uNcVtsEAWiXPcmCuczxQn5Fg3tQbE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fieldeffect.com; dmarc=pass action=none
 header.from=fieldeffect.com; dkim=pass header.d=fieldeffect.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fieldeffectsoftware.onmicrosoft.com;
 s=selector2-fieldeffectsoftware-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6o/7TjzySg6mL4m5X74Tx+2xl1r/y+vedXXLCJKDnk=;
 b=cIMZk5ycXxYalJdTuyohF2G0BtMHEmyUPlSUqiLFQRIet1jGwOJ4zhm1EAnkZNQBkG+QRCFDC4oPq6US8Yo1M0ZirCBTF4CtxTKDLhn5n8DstpeMNlHHuwzHCPTEBLoBC+z9h4BEpbFOI/ss5xww6e/cMffFbFwq5eUfBqKnabk=
Received: from CH2PR12MB4230.namprd12.prod.outlook.com (20.180.7.23) by
 CH2PR12MB4118.namprd12.prod.outlook.com (20.180.5.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 01:36:49 +0000
Received: from CH2PR12MB4230.namprd12.prod.outlook.com
 ([fe80::2cdf:d5df:8eef:f670]) by CH2PR12MB4230.namprd12.prod.outlook.com
 ([fe80::2cdf:d5df:8eef:f670%2]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 01:36:49 +0000
From: Oliver Benning <obenning@fieldeffect.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Issues with excluding private IPs
Thread-Topic: Issues with excluding private IPs
Thread-Index: AQHVUwgRnOEJEM19okifRb/PG/jj+w==
Date: Thu, 15 Aug 2019 01:36:49 +0000
Message-ID: <CH2PR12MB42307DB3AAC719186C705171C8AC0@CH2PR12MB4230.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=obenning@fieldeffect.com; 
x-originating-ip: [206.47.13.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2066be77-c47c-483e-c088-08d721210aca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR12MB4118; 
x-ms-traffictypediagnostic: CH2PR12MB4118:
x-microsoft-antispam-prvs: <CH2PR12MB4118E0C9D3C15320886867B2C8AC0@CH2PR12MB4118.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39830400003)(136003)(366004)(396003)(376002)(199004)(189003)(9686003)(81166006)(71190400001)(8936002)(33656002)(71200400001)(8676002)(1730700003)(99286004)(256004)(486006)(476003)(105004)(54896002)(55016002)(2501003)(81156014)(5640700003)(19627405001)(316002)(7736002)(6436002)(7696005)(74316002)(102836004)(6116002)(66476007)(26005)(66946007)(2351001)(25786009)(66556008)(508600001)(186003)(53936002)(14454004)(64756008)(66446008)(86362001)(76116006)(2906002)(66066001)(3846002)(6916009)(5660300002)(52536014)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4118;
 H:CH2PR12MB4230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fieldeffect.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2GiRHwtr+nCWp3U0wvTpZrtlTjv1LrjyYGx1AuRQHrRyJ8rlqOl20YAgZPWBOFz+jkjZKkSDsnDilOTZ6MCkDn/dh5Hamyc/Qf/mm20SNRX8MnScmB4uGxOhPEzvDFZXAdgttnRTPkuIiSAet/0PKM3P1mnUJ6B8mVIsygkh8AiZhH3KTbv34kqEwG3rtE3Cb9XZ5I5OmpQUAtXIm7QMNB9r5aD/v+1PHVUEmYhljLga/l3b6YejT3mrDrhmqkKaVO7RWnSVjWlFHpn6Dcjhon+gO6VHzRObj7l5Ga629Ev7us7oCcPUbGqM6XhEy7YwrGG7+u/C7zVpFiCv/VpKUVEwDmCYRTvd7BRu7Xj2LnRrD6ZhigMzXht84SXLqEAf2erlil9yCLOUOUa1YbNC8d6rN8bl4CeXJG8TKMg7Oyc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fieldeffect.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2066be77-c47c-483e-c088-08d721210aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 01:36:49.3910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 88e077e9-92e7-4b70-bbae-54ea1caeb46c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuJ98EQQKHr0mIlJfRC99cTA5q9TSRq/+ZyZseHdDGGwgUjvAJZNsQwrW/f30E9Mj++dYgdaVwnHYalMTZBK54E7LGFXblO8eQOQW6sg1UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:43:44 +0200
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
Content-Type: multipart/mixed; boundary="===============4006833263329254903=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4006833263329254903==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB42307DB3AAC719186C705171C8AC0CH2PR12MB4230namp_"

--_000_CH2PR12MB42307DB3AAC719186C705171C8AC0CH2PR12MB4230namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

My setup (may be unrelated):

I have a public endpoint hosted on Digital Ocean, which I connect to simply=
 through its external IP address as the endpoint. It was setup using Streis=
and.

The endpoint itself acts as a DNS resolver within the tunnel for ad blockin=
g purposes, so the WireGuard profile uses the endpoint's internal IP addres=
s in the DNS field. This setup has been documented online.

The issue (on both Mac and iPhone clients):
I would like to exclude private IPs from the tunnel to connect to internal =
resources. Connection works fine with AllowedIPs=3D0.0.0.0/0, it does not w=
ork when using the "Exclude private IPs option".

Log just shows:
[NET] peer(5m6B=85jmno) - Sending handshake initiation
[NET] peer(5m6B=85jmno) - Failed to send handshake initiation write udp4 0.=
0.0.0:63865->[EXTERNAL-IP]:51820: sendto: network is unreachable

I also have tried using a set of CDR blocks such that the droplet's externa=
l ip is excluded from the range and that did not work either. If I have a m=
isconception about the configuration or there is something I should try ple=
ase let me know.

Recommendation
This may have a been recommended below but I would highly suggest a list of=
 IPs to subtract from the tunnel. My ideal scenario would be:


AllowedIPs =3D 0.0.0.0/0

ExceptedIPs =3D 192.168.1.0/24


Cheers,
Oliver


--_000_CH2PR12MB42307DB3AAC719186C705171C8AC0CH2PR12MB4230namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>My setup (may be unrelated):</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have a public endpoint hosted on Digital Ocean, which I connect to simply=
 through its external IP address as the endpoint. It was setup using Streis=
and.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The endpoint itself acts as a DNS resolver within the tunnel for ad blockin=
g purposes, so the WireGuard profile uses the endpoint's internal IP addres=
s in the DNS field. This setup has been documented online.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>The issue (on both Mac and iPhone clients):</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I would like to exclude private IPs from the tunnel to connect to internal =
resources. Connection works fine with AllowedIPs=3D0.0.0.0/0, it does not w=
ork when using the &quot;Exclude private IPs option&quot;.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Log just shows:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[NET] peer(5m6B=85jmno) - Sending handshake initiation<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[NET] peer(5m6B=85jmno) - Failed to send handshake initiation write udp4 0.=
0.0.0:63865-&gt;[EXTERNAL-IP]:51820: sendto: network is unreachable<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I also have tried using a set of CDR blocks such that the droplet's externa=
l ip is excluded from the range and that did not work either. If I have a m=
isconception about the configuration or there is something I should try ple=
ase let me know.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>Recommendation</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This may have a been recommended below but I would highly suggest a list of=
 IPs to subtract from the tunnel. My ideal scenario would be:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt;">
<p style=3D"color: rgb(248, 66, 146); margin: 0px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; font-stretch: normal; font-size=
: 15px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">
<b>AllowedIPs</b><span style=3D"color: #ffffff"> =3D </span><span style=3D"=
color: #4491fa">0.0.0.0</span><span style=3D"color: #64a780">/0</span></p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; font-stretch: normal; font-size: 15px; line-height: norma=
l; font-family: &quot;Helvetica Neue&quot;;">
<b style=3D"color: rgb(248, 66, 146);">ExceptedIPs</b><span style=3D"color:=
 rgb(255, 255, 255);"> =3D
</span><span style=3D"color: rgb(68, 145, 250);">192.168.1.0</span><font co=
lor=3D"#64a780"><span style=3D"caret-color: rgb(100, 167, 128);">/24</span>=
</font></p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; font-stretch: normal; font-size: 15px; line-height: norma=
l; font-family: &quot;Helvetica Neue&quot;;">
<font color=3D"#64a780"><span style=3D"caret-color: rgb(100, 167, 128);"><b=
r>
</span></font></p>
<div style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; font-stretch: normal; font-size: 15px; line-height: nor=
mal; font-family: &quot;Helvetica Neue&quot;;">
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-size: 16px; background-color: =
rgb(255, 255, 255); display: inline !important">Cheers,</span><br>
</div>
<div style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; font-stretch: normal; font-size: 15px; line-height: nor=
mal; font-family: &quot;Helvetica Neue&quot;;">
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-size: 16px; background-color: =
rgb(255, 255, 255); display: inline !important">Oliver</span></div>
<br>
</div>
</body>
</html>

--_000_CH2PR12MB42307DB3AAC719186C705171C8AC0CH2PR12MB4230namp_--

--===============4006833263329254903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4006833263329254903==--
