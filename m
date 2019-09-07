Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6C2C49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A0C206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lamendola.me header.i=@lamendola.me header.b="nNIce5PN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A0C206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lamendola.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9475e0df;
	Wed, 11 Sep 2019 16:40:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8be0a492
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 12:54:25 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690051.outbound.protection.outlook.com [40.107.69.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e92e7298
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 12:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZHh1FchwuKpD7TQt/bmVonxl6NdBcpijhxTA1rZsQa0888KvIt3KKrmqef8glWJJQkN5f/yXFpiShgit1+mqq+TzeRqVW3k4ntkvBXjUYyMh/eTwX1aQdES/U+sbYy/UX+YWEn86jqKgsdFtxHCD902sT+b+9OkSHDgvG3Xnmsd2U6dFh4haFIf4WD/gyszkZrw0/w9WKW0MNT7MgL6sq9iLCrw4Qn1/UUWHodJ4CJtAGVs+yGAf9lia/eiuaFl1099g0vwNk2NWmvIFhpza66ElMTp+iQr7cT6kffIF0NNjdjLEKoii3mSZGvJ6R2G6ZxnUt7Zrh8WNo28NxQiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYkc7RwnmuKGuy5n+Qo0ma/7WvlmSUPpd9PbKvlL9+8=;
 b=a7RMjO/224tFyHcsOgF0tT2RWpuDyJvWpwCMwv6CgosYkwHY2Pk+7nwLBqfb3c/ZmzQa6IydQ5AU2iMCsQtwMGDW1qOzIn+Q5o4xj8L1GZeA5OGtQaUxslfaBVSufTtpMKJz09PHlIk3v/KpmNh5XLHa0hhaDBD3ezNR4w7mfXQtCOUh2MJx3/yxuG3hEZt/6zuHpfjDodTgSTWXsNXmoRRtZ8aJof/NsTdT52QX6sFtk1pzVFZGmZ+svN6stRzvuslpAFxXIDiC+rp2lSxR8Hf2Db42kYaOCJhAVqrEPOlvXFroguYDGjl0VveHyDOTHTid12qYfWVrOSsNYDRK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lamendola.me; dmarc=pass action=none header.from=lamendola.me;
 dkim=pass header.d=lamendola.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lamendola.me;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYkc7RwnmuKGuy5n+Qo0ma/7WvlmSUPpd9PbKvlL9+8=;
 b=nNIce5PN3O5iZyBjKa+HDNHQY2BhXYz4pCbNEGH59sJJu+gh5u1j8Lw+EewIsCM+04D+W+IWash84SrYOQMkwjEmSdwdQS5l3R8qnPf6+X2grbmWsFKEUVEKQHNlOu1qfMe1YPGMkCBZ6C1CGuO8fkuaaNK79j0gaKu6aNKZiKQ=
Received: from BN7PR04MB5300.namprd04.prod.outlook.com (20.176.29.93) by
 BN7PR04MB4435.namprd04.prod.outlook.com (52.133.222.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sat, 7 Sep 2019 12:54:23 +0000
Received: from BN7PR04MB5300.namprd04.prod.outlook.com
 ([fe80::4842:116d:de1b:6d54]) by BN7PR04MB5300.namprd04.prod.outlook.com
 ([fe80::4842:116d:de1b:6d54%7]) with mapi id 15.20.2241.018; Sat, 7 Sep 2019
 12:54:23 +0000
From: Salvatore LaMendola <salvatore@lamendola.me>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Suggested Debian install instructions patch for the website
Thread-Topic: Suggested Debian install instructions patch for the website
Thread-Index: AQHVZXlRxcIO9IPv3UyYO2n07hdKGA==
Date: Sat, 7 Sep 2019 12:54:23 +0000
Message-ID: <BN7PR04MB5300E9570A3AA9F1A9B82141D4B50@BN7PR04MB5300.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=salvatore@lamendola.me; 
x-originating-ip: [173.70.107.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9564de4-5874-4f10-9074-08d73392822c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN7PR04MB4435; 
x-ms-traffictypediagnostic: BN7PR04MB4435:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN7PR04MB4435BAC3D607F51D22D46F4CD4B50@BN7PR04MB4435.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0153A8321A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(366004)(396003)(39830400003)(199004)(189003)(504964003)(33656002)(91956017)(76116006)(2501003)(2351001)(86362001)(102836004)(66946007)(66556008)(14454004)(53936002)(606006)(66446008)(64756008)(66476007)(6506007)(5640700003)(7736002)(1730700003)(81156014)(81166006)(8936002)(8676002)(52536014)(508600001)(5660300002)(55016002)(14444005)(256004)(6306002)(54896002)(9686003)(236005)(186003)(486006)(99286004)(476003)(66066001)(6436002)(71190400001)(316002)(6916009)(25786009)(26005)(71200400001)(966005)(3846002)(2906002)(74316002)(6116002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR04MB4435;
 H:BN7PR04MB5300.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: lamendola.me does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hcDAsjEjyOTfXkdtVyCenA1SH+jHl1zDSRG3DENlxtnksdwGqAW/+fxL7VQsZ+dIewQhvqlRmoenxkL6dyYFC1oYAHs4vgHRXlzWFJhFY4gEYnC2/cVd+y//3m5cm1NRZOIBF0Q7GFxe85O7XKBU7ooENjGUrPyv3T+rkOFjJU8XM05rS2qmTLnGSAzin4OcrNQ8PoD73xWoixzySNu950jodwJm/HDBY9T4kVAt2Ixw03YfhCI3QyhloicHvNmB4atDquoGAMUQ8/FfCtUa9hLS2HVrRCgOLDhHrqUi9pjEYrDRpu7YSICjS1rCuyVtMOOlZtU7/UZESiODUF6E4ZRib0CUf7SHc+jdUmVl3sANBUdKcpS5TiX+YYOtYFIDhc72aRYb7YDPnwmbDaEeOJZNp6qDUD8NclZThyc2YMo=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: lamendola.me
X-MS-Exchange-CrossTenant-Network-Message-Id: d9564de4-5874-4f10-9074-08d73392822c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2019 12:54:23.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 95fb7574-ac23-41db-ae8e-1bf46bad575b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UMrsGbJSXSkc6dlMO4peGSYiTRRVl35DQUQB0UKXVvIhFGutxZ+6W5KA54wRCXIgsPRKOzdWEUSWP6qcwX+LGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4435
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
Content-Type: multipart/mixed; boundary="===============0402391108421749932=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0402391108421749932==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR04MB5300E9570A3AA9F1A9B82141D4B50BN7PR04MB5300namp_"

--_000_BN7PR04MB5300E9570A3AA9F1A9B82141D4B50BN7PR04MB5300namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

On the [install page of the website](https://www.wireguard.com/install/), t=
he default pin config smartly deprioritizes Sid after adding the repository=
. However, it seems this causes the wireguard packages to be non-upgradable=
. After speaking with someone on IRC about this, I can't think of a reason =
why we wouldn't want to be able to upgrade the wireguard packages. So, I'd =
like to propose the following addition to the pinning configuration written=
 in the instructions (unified diff follows):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

--- orig        2019-09-07 08:43:08.489455140 -0400
+++ new 2019-09-07 08:45:49.056137802 -0400
@@ -1,4 +1,4 @@
# echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources=
.list.d/unstable.list
-# printf 'Package: *\nPin: release a=3Dunstable\nPin-Priority: 90\n' > /et=
c/apt/preferences.d/limit-unstable
+# printf 'Package: *\nPin: release a=3Dunstable\nPin-Priority: 90\n\nPacka=
ge: /^wireguard/\nPin: release a=3Dunstable\nPin-Priority: 500\n' > /etc/ap=
t/preferences.d/limit-unstable
# apt update
# apt install wireguard

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

This preserves the general priority of 90 for *, but it also sets any packa=
ge starting with wireguard to 500, which matches the default priority used =
in the PPAs.

The only reason I chose a regex match here is in case any additional wiregu=
ard packages get added later, other than wireguard, wireguard-dkms, and wir=
eguard-tools. Otherwise, the Package line could read:

Package: wireguard wireguard-dkms wireguard-tools

Anyone have any objections to this approach? Also, is there a repo for the =
website I can fork and PR this to?

Thank you in advance.

--
Salvatore LaMendola


--_000_BN7PR04MB5300E9570A3AA9F1A9B82141D4B50BN7PR04MB5300namp_
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
Hello,<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
On the [install page of the website](<a href=3D"https://www.wireguard.com/i=
nstall/">https://www.wireguard.com/install/</a>), the default pin config sm=
artly deprioritizes Sid after adding the repository. However, it seems this=
 causes the wireguard packages to
 be non-upgradable. After speaking with someone on IRC about this, I can't =
think of a reason why we wouldn't want to be able to upgrade the wireguard =
packages. So, I'd like to propose the following addition to the pinning con=
figuration written in the instructions
 (unified diff follows):<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
--- orig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-09-07 08:43:08.4894=
55140 -0400<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
&#43;&#43;&#43; new 2019-09-07 08:45:49.056137802 -0400<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
@@ -1,4 &#43;1,4 @@<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
# echo &quot;deb <a href=3D"http://deb.debian.org/debian">http://deb.debian=
.org/debian</a>/ unstable main&quot; &gt; /etc/apt/sources.list.d/unstable.=
list<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
-# printf 'Package: *\nPin: release a=3Dunstable\nPin-Priority: 90\n' &gt; =
/etc/apt/preferences.d/limit-unstable<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
&#43;# printf 'Package: *\nPin: release a=3Dunstable\nPin-Priority: 90\n\nP=
ackage: /^wireguard/\nPin: release a=3Dunstable\nPin-Priority: 500\n' &gt; =
/etc/apt/preferences.d/limit-unstable<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
# apt update<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
# apt install wireguard<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
This preserves the general priority of 90 for *, but it also sets any packa=
ge starting with wireguard to 500, which matches the default priority used =
in the PPAs.
<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
The only reason I chose a regex match here is in case any additional wiregu=
ard packages get added later, other than wireguard, wireguard-dkms, and wir=
eguard-tools. Otherwise, the Package line could read:<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Package: wireguard wireguard-dkms wireguard-tools<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Anyone have any objections to this approach? Also, is there a repo for the =
website I can fork and PR this to?<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Thank you in advance.<br>
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

--_000_BN7PR04MB5300E9570A3AA9F1A9B82141D4B50BN7PR04MB5300namp_--

--===============0402391108421749932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0402391108421749932==--
