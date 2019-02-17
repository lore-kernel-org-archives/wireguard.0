Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE26C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2A812176F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iaUanXNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2A812176F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yogotech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07829885;
	Mon, 18 Feb 2019 22:54:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c88bc37d
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 05:48:01 +0000 (UTC)
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092000065.outbound.protection.outlook.com [40.92.0.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de57f667
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbYsHHcakOM3dpfq3NpGIJzG0UJHrytn4s5Zf4LRujU=;
 b=iaUanXNCGkO3aWMpiL68i3W7K25Z2YPmdnK3BG3etDaEyZ4mhdb/OA01xTz2ROgA064W8AAfWA9ibe6c/hGa21j2SbNemRXjrgal2GYRISB6O3OiFHxDWubuB0Qya5uZv3CdckEOF7Qut2wSe19fZ6fZdIWU+aJr6RHDr5buaME5emt0JNcsq/85pBu7t9QAtPn4SNiScSFYft/pcpOhlhHTE0DCEzmBs4AfAptON3CNJww8eNUTLcnxAOl4CjhwXMBAlLIk8QJAv6lCaBSJaf1sU1qjqVkAfU3L7nEo4v283n/s1yfy2g9EqCiHHo0eWxmqtzGu4cbBxZj6wle2cQ==
Received: from SN1NAM01FT005.eop-nam01.prod.protection.outlook.com
 (10.152.64.51) by SN1NAM01HT171.eop-nam01.prod.protection.outlook.com
 (10.152.65.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.10; Sun, 17 Feb
 2019 05:56:15 +0000
Received: from MWHPR20MB1245.namprd20.prod.outlook.com (10.152.64.52) by
 SN1NAM01FT005.mail.protection.outlook.com (10.152.65.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.10 via Frontend Transport; Sun, 17 Feb 2019 05:56:15 +0000
Received: from MWHPR20MB1245.namprd20.prod.outlook.com
 ([fe80::14e2:419e:b515:921c]) by MWHPR20MB1245.namprd20.prod.outlook.com
 ([fe80::14e2:419e:b515:921c%10]) with mapi id 15.20.1622.018; Sun, 17 Feb
 2019 05:56:15 +0000
From: Nate Williams <nate@yogotech.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Nate Williams <nate@yogotech.com>
Subject: Re: Wireguard-go on FreeBSD - Not working until the interface (wg0)
 is set into promiscuous mode
Thread-Topic: Wireguard-go on FreeBSD - Not working until the interface (wg0)
 is set into promiscuous mode
Thread-Index: AQHUvmgLm3kSS0yxK0mput6GEXPkaaXjUvOAgAA7JIc=
Date: Sun, 17 Feb 2019 05:56:15 +0000
Message-ID: <MWHPR20MB124594346E8D2C2A6D605439E9620@MWHPR20MB1245.namprd20.prod.outlook.com>
References: <MWHPR20MB1245664BA43F11A3368F1D8BE96F0@MWHPR20MB1245.namprd20.prod.outlook.com>,
 <CAHmME9r=rUwZpwW_Q4wYaV-LBGf5YSxgD8dJW-uf2JKEuSXRrg@mail.gmail.com>
In-Reply-To: <CAHmME9r=rUwZpwW_Q4wYaV-LBGf5YSxgD8dJW-uf2JKEuSXRrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4A1ADD7C9FB0D0D423A14CE42E87791DBF62398886CE2744015F6F7510D8CA87;
 UpperCasedChecksum:62078E29FDFC6197AE532ABD592964AD5A0B2CC96F4F01293324074EB1DD6D2F;
 SizeAsReceived:7185; Count:46
x-ms-exchange-messagesentrepresentingtype: 2
x-tmn: [Cswagf5eUXrgp1GErOf7IrVA6vwfrlP6]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM01HT171; 
x-ms-traffictypediagnostic: SN1NAM01HT171:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
 SRVR:SN1NAM01HT171; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM01HT171; 
x-microsoft-antispam-message-info: W7PgQNYIY31cmQ6366peDMntbr/8WZEswCv7F+ZBO9u1TQwx9DpyFjOZePhWqW3R
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 24fd1209-d934-423e-a578-ee886993c07f
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5b4e69-fa17-4498-7d4b-08d6949ca0c2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 24fd1209-d934-423e-a578-ee886993c07f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2019 05:56:15.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM01HT171
X-Mailman-Approved-At: Mon, 18 Feb 2019 23:54:13 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8662091414551256816=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8662091414551256816==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR20MB124594346E8D2C2A6D605439E9620MWHPR20MB1245namp_"

--_000_MWHPR20MB124594346E8D2C2A6D605439E9620MWHPR20MB1245namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'll test it in the next couple of days and get back to you.


Nate
________________________________
From: Jason A. Donenfeld <Jason@zx2c4.com>
Sent: Saturday, February 16, 2019 7:24 PM
To: Nate Williams
Cc: wireguard@lists.zx2c4.com
Subject: Re: Wireguard-go on FreeBSD - Not working until the interface (wg0=
) is set into promiscuous mode

That's odd. Does this fix it for you?

https://git.zx2c4.com/WireGuard/commit/?id=3D7c833642dfa342218602ab18e7091e=
86408d2982

--_000_MWHPR20MB124594346E8D2C2A6D605439E9620MWHPR20MB1245namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I'll test it in the next couple of days and get back to you.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Nate</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jason A. Donenfeld &l=
t;Jason@zx2c4.com&gt;<br>
<b>Sent:</b> Saturday, February 16, 2019 7:24 PM<br>
<b>To:</b> Nate Williams<br>
<b>Cc:</b> wireguard@lists.zx2c4.com<br>
<b>Subject:</b> Re: Wireguard-go on FreeBSD - Not working until the interfa=
ce (wg0) is set into promiscuous mode</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">That's odd. Does this fix it for you?<br>
<br>
<a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3D7c833642dfa34221860=
2ab18e7091e86408d2982">https://git.zx2c4.com/WireGuard/commit/?id=3D7c83364=
2dfa342218602ab18e7091e86408d2982</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MWHPR20MB124594346E8D2C2A6D605439E9620MWHPR20MB1245namp_--

--===============8662091414551256816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8662091414551256816==--
