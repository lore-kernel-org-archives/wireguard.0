Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAFBC2D0BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BC82077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Z24ITlIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8BC82077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bec6d81e;
	Mon, 9 Dec 2019 11:08:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d38be1e
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 10:25:49 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092067082.outbound.protection.outlook.com [40.92.67.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03f15dd3
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 10:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kxwh3okentJ7rbZzbGAbAKBgUNrc72X74VmT4mRhl0wvzZPvEThNsaOyeRSqLIFH50e7v8R7VY5aL8kkGZkskRJSLTpKhBxsZtNfTfExs8fyPkIaa7PGSsnZ6OLD1LL2y0twRRuEtqkfXbUVuimnw5hg76iqxaV4LDvm9oJe+/1hGczlUSr71XxEwB2TG2TEtTkEJuKqBxpdDgn3Ik2u+YbWhiduZu9swGcorO/o1xuHnsIaVXgHoxnBFknKr1CSStzfQF/DioSLsGm6tmjeBb/rTkfFD4ZEcaahuG39iW9JKkOb5IOtLhbYbeg8EYcaZpX6mDNHUIht8TODnrjBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSZ0OSMTiD89KwHBJ70ErSxclSlMlYqBY/CYF8QrAxQ=;
 b=Rcy3DHIr7fR5TflZfyG17rT7ESfanC29Ox0HhTjkqhSQgFlSgqoay4BD8XyMfNPAHjedbg8fSZ2wQeSDzca4qojiz4YA4cbp4RoAjXQAAJgpwKsoyNjsGHWRX2z/Kx2XRjWaqzH4Gi2yyu6qnQXD4mvZW4qBfGCyUdcxC/k58I7U8g0nT852KlNe3MllbJvIaZb4iH3RRjsIMX/XClwWB3vje5EhtAkmXXW+mdpPskH0qwNDuCb88lLIZsyLgVdCh+iKAeaYfd2xf7ykqAlPrvB4YexzXYqUaaBrqVcGN2nHrSrH56jJyBFN92/+RkaMzRY3rsJW4P5JCZSTxnkkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSZ0OSMTiD89KwHBJ70ErSxclSlMlYqBY/CYF8QrAxQ=;
 b=Z24ITlINzfC+9yE7VsyqUmxj32d7Md4dvDoKtDNbjF0X0Y6BE2c5wJks5BkRR6yUNT1/q7q7PZQJMfRIZ9FqdWA3bgDhHGn0EdTMN1wx/2dHUQUQo7H3CiF9JfgUnCuAd7ARbDGiGkWmX+o3x5A1T9PA+aIIiiJ+dwiGMY7FnOxaYzOwf6Y5Knfh2TjFYwara+8CLpASF2c5wmNWXwdelCmNZKYHMQKat74SlzExK5YVTgG7jOCrE2+J94LXXk/W1KuRNaeXL0FQcZWkOp/gnJiOoenYJH30uZ1b2qb4paHZG/KXuLtT2Q+KZsPbpt3cLgsHZQxNHI6vxFlaOLsGpg==
Received: from AM5EUR02FT062.eop-EUR02.prod.protection.outlook.com
 (10.152.8.57) by AM5EUR02HT176.eop-EUR02.prod.protection.outlook.com
 (10.152.9.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Sun, 8 Dec
 2019 10:25:47 +0000
Received: from AM6PR07MB4822.eurprd07.prod.outlook.com (10.152.8.57) by
 AM5EUR02FT062.mail.protection.outlook.com (10.152.9.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Sun, 8 Dec 2019 10:25:47 +0000
Received: from AM6PR07MB4822.eurprd07.prod.outlook.com
 ([fe80::7da3:c026:335c:7c8f]) by AM6PR07MB4822.eurprd07.prod.outlook.com
 ([fe80::7da3:c026:335c:7c8f%7]) with mapi id 15.20.2538.012; Sun, 8 Dec 2019
 10:25:47 +0000
From: Alexey Suetin <sauronych@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard/kernel backend/OxygenOS 10: phone reboots when establishing
 a connection on mobile data
Thread-Topic: Wireguard/kernel backend/OxygenOS 10: phone reboots when
 establishing a connection on mobile data
Thread-Index: AQHVrbGeIzRWCegrX0OR+fJT7Y4Hbg==
Date: Sun, 8 Dec 2019 10:25:47 +0000
Message-ID: <AM6PR07MB4822344E7FBF3D0DE3170F9EBA590@AM6PR07MB4822.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FA8668D168BD1AFF91EE2DFF86153213587FA2FE26816916F91D2F2079CE765F;
 UpperCasedChecksum:D202438E857ECC8A12C7B725A481F9618EF2CE74B78EE4F8AB9D97D34535EFDB;
 SizeAsReceived:6855; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [7MdAGhCzjVc0T2zMr9UMpyfOIjGYMaT6]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 2fcfc5f9-7a2a-4a21-3aa0-08d77bc8fdce
x-ms-traffictypediagnostic: AM5EUR02HT176:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D4QMASZmxriSDtC+RVbtaRkookjcEUq23wEoewpmT+HEKW7Zm363OIwBkLy6/4EYu4sGsoIvdSZ0jdhVgNubbLk9dhYzIpDsjLCOnSUybV39xJ9nr6nD0SMa7FgA/jUIbFyXvhl5ijdaBXOa92v74Bp+hF/aSF+6p0hMFk7zGjSsSdZGGIreY6IeVD3Y8KW9+Buu9fCHqkuguYyAZzcDGSpqMjkjcIPWcsm+3k83n+g=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcfc5f9-7a2a-4a21-3aa0-08d77bc8fdce
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2019 10:25:47.7751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT176
X-Mailman-Approved-At: Mon, 09 Dec 2019 12:07:58 +0100
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
Content-Type: multipart/mixed; boundary="===============9180718290370381176=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9180718290370381176==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR07MB4822344E7FBF3D0DE3170F9EBA590AM6PR07MB4822eurp_"

--_000_AM6PR07MB4822344E7FBF3D0DE3170F9EBA590AM6PR07MB4822eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This has been happening on my OnePlus 7 Pro since the release of OxygenOS 1=
0. The userspace backend works fine. Not sure if the issue is exclusive to =
OxygenOS 10 or Android 10.

You can read more here and in other custom kernel threads: https://forum.xd=
a-developers.com/search/thread/3936434?query=3Dwireguard

XDA user B1oH4zard identified a possible cause in the kernel module thread =
https://forum.xda-developers.com/showpost.php?p=3D81125845&postcount=3D275
WireGuard Kernel/ROM Integration - Post #0<https://forum.xda-developers.com=
/showpost.php?p=3D81125845&postcount=3D275>
few months ago i build wireguard module for xiaomi mi9 and have same proble=
m, need remove rmnet_iperf module before loading wireguard, it us...
forum.xda-developers.com


--_000_AM6PR07MB4822344E7FBF3D0DE3170F9EBA590AM6PR07MB4822eurp_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
This has been happening on my OnePlus 7 Pro since the release of OxygenOS 1=
0. The userspace backend works fine. Not sure if the issue is exclusive to =
OxygenOS 10 or Android 10.</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
You can read more here and in other custom kernel threads:&nbsp;<a href=3D"=
https://forum.xda-developers.com/search/thread/3936434?query=3Dwireguard" t=
arget=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin: 0px">https://=
forum.xda-developers.com/search/thread/3936434?query=3Dwireguard</a></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
XDA user B1oH4zard identified a possible cause in the kernel module thread&=
nbsp;<a href=3D"https://forum.xda-developers.com/showpost.php?p=3D81125845&=
amp;postcount=3D275" id=3D"LPlnk302834">https://forum.xda-developers.com/sh=
owpost.php?p=3D81125845&amp;postcount=3D275</a></div>
<div id=3D"LPBorder_GTaHR0cHM6Ly9mb3J1bS54ZGEtZGV2ZWxvcGVycy5jb20vc2hvd3Bvc=
3QucGhwP3A9ODExMjU4NDUmcG9zdGNvdW50PTI3NQ.." class=3D"LPBorder862451" conte=
nteditable=3D"false" style=3D"width: 100%; margin-top: 16px; margin-bottom:=
 16px; position: relative; max-width: 800px; min-width: 424px;">
<table id=3D"LPContainer862451" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td style=3D"width: 100%;">
<div id=3D"LPTitle862451" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: wf_segoe-ui_light, &quot;Segoe UI Light&quot;, &=
quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Taho=
ma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor862451" href=3D"https://forum.xda-dev=
elopers.com/showpost.php?p=3D81125845&amp;postcount=3D275" style=3D"text-de=
coration: none; color: var(--themePrimary);">WireGuard Kernel/ROM Integrati=
on - Post #0</a></div>
<div id=3D"LPDescription862451" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: wf_segoe-ui_normal, &quot;Segoe U=
I&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12=
px; margin-right: 8px; overflow: hidden;">
few months ago i build wireguard module for xiaomi mi9 and have same proble=
m, need remove rmnet_iperf module before loading wireguard, it us...</div>
<div id=3D"LPMetadata862451" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: wf_segoe-ui_normal, &quot;Segoe UI&qu=
ot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
forum.xda-developers.com</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
</div>
</body>
</html>

--_000_AM6PR07MB4822344E7FBF3D0DE3170F9EBA590AM6PR07MB4822eurp_--

--===============9180718290370381176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9180718290370381176==--
