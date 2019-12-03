Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF81CC00454
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 168082077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UHQVP0R2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 168082077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f82646e2;
	Mon, 9 Dec 2019 11:08:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a56991c
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2019 19:20:08 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068078.outbound.protection.outlook.com [40.92.68.78])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61957c89
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2019 19:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZWN65ObW8Em4VNNpMjgbJPA8G+Q8VZ8ywnL+Jv0vmiYKoI6pae4RByfOKDkLRVjlMvXIBplAOk69qV/uwEffAeXFQ5P7AGaLxHWsLGCPS+rdI8ICV5rAVhrCQaWod9jNy8pJXuae4+CCqkUa+kgmpxGzDsVy68toIQELtvsR/H6dzpw0Df6ICyNjnjRGsT2WucIP5dLHbNQNacG0KHQmL8ebyKCjaEBeySekfLAMSi1I3QqmYANp+0rP3JNLBeHerYM4cMzk1gpznHLcwxsNoRHTzZ2OzdT/y44m+O5dRh8D3FDAmvAyUIPfK5Rt7/ba9yGrDcYH0dKzvJx1HCMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj8SAqhqnc+SRpbRF3gvEJRAUBqfNQDH0iZ02Cm5dng=;
 b=lfS5SHUStoo0nJSvmFLWDqwhBBNRVriBYb4OisjrFQsXLo30/55BC6xorbWL1h90p6NdMWpLjkgH4J02j7IZGDMyyMjAJD+5nasoPZgHqVaV2VD6aUCH/WzOR6G6uL/RJ+/wVN6FR39Gt7s8DvBb7Wh2eycwWXIvFBSTsgWDS2LdRPA0QuBaLPoaJsky53Yxxdbe44wmk059R9wtlnP1ba/Q7jvsKag9DCF9ahaGIg4PjM3HDDlAZCttSYY9FSfPpCcJeaAPoOzPZhUveSv/e18KVwCPPOPdVbSMCgpgINDOurZ47Vs6wgWeJ5YZn4ycSJunhNViZ8x9Srf0/to+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj8SAqhqnc+SRpbRF3gvEJRAUBqfNQDH0iZ02Cm5dng=;
 b=UHQVP0R2H8r47EJxBgmQ8DubxTq7onb4yhnsXV+ZWHbEXelYsVDW4vaj9trjsyhzaooqYRuBT3hHx8CNA29dn0ZukLPpaDIp56rIWQej2xGx3qfiYtxkY3f8y0PQ07Q+tiXzup/aFZIYDeng5MTSHdJDpjOwdy5a8wjFIvUSVH3i3jGxoWe04Lphn/5POvMCjotOiX4dgBofdrZGZj+ND+5NgsUD6f+fADlqy/LdmguAIqjYSEbxRVgn1QaQr+jvKtUoXb/OoV2ANSsY+kmq3W5tYmQG2p+4j0ly05tqNZH7+1lPmOW1ViWKnayL3l6IyWQFY6ouYeVuWSceaSGT4g==
Received: from HE1EUR02FT003.eop-EUR02.prod.protection.outlook.com
 (10.152.10.58) by HE1EUR02HT121.eop-EUR02.prod.protection.outlook.com
 (10.152.10.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Tue, 3 Dec
 2019 19:20:06 +0000
Received: from AM6PR07MB4822.eurprd07.prod.outlook.com (10.152.10.58) by
 HE1EUR02FT003.mail.protection.outlook.com (10.152.10.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 19:20:06 +0000
Received: from AM6PR07MB4822.eurprd07.prod.outlook.com
 ([fe80::f9c8:9f0c:1491:8119]) by AM6PR07MB4822.eurprd07.prod.outlook.com
 ([fe80::f9c8:9f0c:1491:8119%7]) with mapi id 15.20.2516.013; Tue, 3 Dec 2019
 19:20:06 +0000
From: Alexey Suetin <sauronych@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard/kernel backend/OxygenOS 10: phone reboots when establishing
 a connection on mobile data
Thread-Topic: Wireguard/kernel backend/OxygenOS 10: phone reboots when
 establishing a connection on mobile data
Thread-Index: AQHVqgoyMxOYUgjwUkqUIN3cFLKFDw==
Date: Tue, 3 Dec 2019 19:20:06 +0000
Message-ID: <VI1PR07MB482965DA17781A167488179EBA420@VI1PR07MB4829.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:069DD2AB0407E1E17CC127B25B72187AE0F4C5710F8C738F9EF5BA295A297F46;
 UpperCasedChecksum:6611FDDE7691E1349DC798815EB00A5099FEE88A019B1DB7E53C786D60CAB8B7;
 SizeAsReceived:6882; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [6KWyONTVpNWvRiKnM66SBSZEI/uvrbWR]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: eac5718c-4f75-45ec-1fcf-08d77825ce26
x-ms-traffictypediagnostic: HE1EUR02HT121:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JZSVaUuDG2wEM/BGmhIH78UEfXv18d3+WYVAoWNfjX2wluE3JBcymeoUCu07Sl1ynyAjqMnJePARZunTRH1AkJGOOKYsQ+PLDKoZrUPIo7BJY6jVNKoOgax3vHcXoQTOTEVHux0jegunE8dNSCjstffSpWZ4icP86W3Tk7+a98KOkOBX3JMaWTcJ8bMlwpZCko1svxnBZY5zo0uw6gx+Wnm1oZ1oE6vjFVYPEiHFprg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eac5718c-4f75-45ec-1fcf-08d77825ce26
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 19:20:06.2403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT121
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
Content-Type: multipart/mixed; boundary="===============2262431777249429656=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2262431777249429656==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR07MB482965DA17781A167488179EBA420VI1PR07MB4829eurp_"

--_000_VI1PR07MB482965DA17781A167488179EBA420VI1PR07MB4829eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This has been happening on my OnePlus 7 Pro since the release of OxygenOS 1=
0. The userspace backend works fine. Not sure if the issue is exclusive to =
OxygenOS 10 or Android 10.

You can read more here and in other custom kernel threads: https://forum.xd=
a-developers.com/search/thread/3936434?query=3Dwireguard

--_000_VI1PR07MB482965DA17781A167488179EBA420VI1PR07MB4829eurp_
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
This has been happening on my OnePlus 7 Pro since the release of OxygenOS 1=
0. The userspace backend works fine. Not sure if the issue is exclusive to =
OxygenOS 10 or Android 10.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
You can read more here and in other custom kernel threads:&nbsp;<a href=3D"=
https://forum.xda-developers.com/search/thread/3936434?query=3Dwireguard">h=
ttps://forum.xda-developers.com/search/thread/3936434?query=3Dwireguard</a>=
</div>
</body>
</html>

--_000_VI1PR07MB482965DA17781A167488179EBA420VI1PR07MB4829eurp_--

--===============2262431777249429656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2262431777249429656==--
