Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEC0C54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3652821556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="caoEwlzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3652821556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb8bd339;
	Fri, 24 Apr 2020 20:37:50 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092064105.outbound.protection.outlook.com [40.92.64.105])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 988caed7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Apr 2020 12:10:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMnkq2a4boxVGepAFthJyGLERGuYNgEdUd4ZexANcPyqDuSihJwv9wGecYqCQuzB7AZNUrfe+kBgii81f0qMee7hg0e57zC5wRgevy18FebG/TB6vBWGCKP7Aj0Qym/9z5tcn74Z/SleqR0+yuUR5c9//NWw0yxOt7h8RHsgzfgIM+XoAM8/4Z/e0qJPTPTIR9GT3YRD3foJJUtQn8M7RcuLFNyRgTiMy28ir2Gk/U9xh70npOQsiv0/LRcu3q2LurhaBGGqODBtp68cCgpHKW+/KDfuDEsYwrt2t3IYtGrflg2DbuEaNjraOM8r+VNNtUNA+4uTx4QgrD2c7qVOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0vME2PFfyViMhndw/EV0sd3mocEo8f2A5XTeT9d/zk=;
 b=gC5wdUSxbFow4N259hZ5WEedI8TzJDjsk0BazG5yXJMtkW2HP4aM4FZPgI0H+4BIkQc6hTnpuzBMYNt3ZnvZFLhzfNVtOYy1g+5SY4hkNTNMFdKN5VvMmGuvtvdnpQlZL0Rx60It1A4Pf2lGUxBl0vLZptrePep6GC7lOtJcV9/DpP6QQtIh1g7Z5gtqdDDDwJL8G3K6tnqgn2esAr1llrCxKnWqsZV7eoS0JPekFclDlIURLKe8OepaLneKWwo8aPc9ENjQydnbubQTixhFCBMvYopbA3wqW98Ij8yzvzWW0GD+W3bZ1dNHGXvoAhZ7R9LETHeYx+/rRA3dJso4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0vME2PFfyViMhndw/EV0sd3mocEo8f2A5XTeT9d/zk=;
 b=caoEwlznuNLopjg17lGBr6jCiuQG9Xrmwn4ZmpoSQKvzNS3+Gk4UxbFd6auRNA9YMT/Ujb+jDoEvw6AmCJm2EUO+0eVE4k4+muLipQv5jMo+JDwG3H2XSNjVTCI/V0lgASwyYIoNDayuLrLn+rsGeYEC967BUvRa+LCqsGDyXOH1Ji6Cg7rYAfJxByyPaCmf061X4tSyiZeSGhUv5a74j9eHuCUtn0FvUtkfcpkMo1OuK/CwKXmgBhNxShDyE7nFAD+nlkjZyid6/A924Z5bAhAno5zQ1CP7uuO4SV/vrxjCFi2Eg1Bo0bBp/iY5pClhYri1IWiYvdOwq0jFey48Eg==
Received: from HE1EUR01FT011.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::49) by
 HE1EUR01HT079.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::248)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Thu, 23 Apr
 2020 12:21:21 +0000
Received: from HE1P191MB0234.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e18::52)
 by HE1EUR01FT011.mail.protection.outlook.com
 (2a01:111:e400:7e18::173) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Thu, 23 Apr 2020 12:21:21 +0000
Received: from HE1P191MB0234.EURP191.PROD.OUTLOOK.COM
 ([fe80::1d8d:cc19:568b:ba73]) by HE1P191MB0234.EURP191.PROD.OUTLOOK.COM
 ([fe80::1d8d:cc19:568b:ba73%8]) with mapi id 15.20.2921.033; Thu, 23 Apr 2020
 12:21:21 +0000
From: Alessandro Magri <alessandromagri@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Debian package dependencies
Thread-Topic: Debian package dependencies
Thread-Index: AQHWGWmbT3vJyskyuk6r8m1s9bejmQ==
Date: Thu, 23 Apr 2020 12:21:21 +0000
Message-ID: <HE1P191MB0234A66C8CBFBB289F58E747B2D30@HE1P191MB0234.EURP191.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FD12696D1A880CEE316E2F35BA4C285A591E0D418626E9A30502C894B92BDD9A;
 UpperCasedChecksum:2C72BEF5C413AACDC3F2AA7760BC2255281EB87F02496B4B6D1CA9DB1C5C857A;
 SizeAsReceived:6722; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [B3dFqEyxogzEzkXttIDGccJONMlWAkTf]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 69462317-a740-4199-1b04-08d7e780d543
x-ms-traffictypediagnostic: HE1EUR01HT079:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8s2THBlO54Mz1F/yLP0PfSihb4dYdf7y75uM7QuAOo7umluY0QRoDnjHlNMmcc6oS60dxUQxFUjeHc5uWhjMeI2jbyaDk/iPatmi1q08dzZmynOWjaXYTEqz4Z+NrEslnZbchFLcwMZDr5rT1II4xFB1HowrtPvmdQzwK5VCIVLLMaEadfW7WVxwUTQMqU9muxtxuQY6tGlyfgjrXOVMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1P191MB0234.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: szQs/NjJd8MoSxkBEKVQj8qWvNVxLbFmcw0nPArn/yG1HS7jvABY0zxTr1r/3CCkPoFpaU/JvGKBuCDLHnST5fvLEbdh47EK2AcRcGh0L+NMtbK4ciDOWizgA7hg4uraSlEiGAw1qzlHSC0vSvU57w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 69462317-a740-4199-1b04-08d7e780d543
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 12:21:21.5299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT079
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:37:47 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,=0A=
I'm new to this mail-list, so i hope to use it in the right way.=0A=
I'm using wireguard on some Debian machines, and yesterday after some updat=
e wireguard promt some strange errors about the wireguard-dkms module confi=
g.=0A=
In the end I've to install bc to make all work again.=0A=
=0A=
I suggest to add this package to the dependencies list.=0A=
Thank's=0A=
=0A=
Alessandro=
