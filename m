Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7BEC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:27:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3712070B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="rh3zNukq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3712070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9107d72;
	Thu, 28 Feb 2019 18:16:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e24ef33a
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Feb 2019 12:30:26 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010032.outbound.protection.outlook.com [40.92.10.32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23c05139
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Feb 2019 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U3OzjHEdULmrB6oo3anZ6JqYXyrow2/vaLB7RjHsKE=;
 b=rh3zNukqfQRo8rwJnIqoESJ2ThYcRV910wllST9CWP2+Jw4zx+8So06S6B5oYHWrYUTqn9HxxXt7GtLhNGt9vtH9dZPPzLLA8DzuwU4dTjMehmGu7b+EcLQIXm/sSRFjk6LeW7rQlS4PQ6JGInxhv/4YLUJOP5jQByIXgVdokhF51bmwZh14NiszIFeScIeNELE6yFKhepVzfb/yvpTPXJR+PPqcVK3mZA7o/+WqG3COzKhT0aHMJuEDdAi3Wq3l8OqTlvhbIZoqOtkV8JfbKxq37fUGrULYb1Y0A83A8zyOUuXey2zjwJZOXNmUlwDqd1mxnBtps1hW86+wAUqDWw==
Received: from SN1NAM04FT023.eop-NAM04.prod.protection.outlook.com
 (10.152.88.54) by SN1NAM04HT248.eop-NAM04.prod.protection.outlook.com
 (10.152.89.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.11; Tue, 26 Feb
 2019 12:39:50 +0000
Received: from DM6PR12MB3401.namprd12.prod.outlook.com (10.152.88.59) by
 SN1NAM04FT023.mail.protection.outlook.com (10.152.88.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1643.11 via Frontend Transport; Tue, 26 Feb 2019 12:39:50 +0000
Received: from DM6PR12MB3401.namprd12.prod.outlook.com
 ([fe80::b857:1112:6a20:2311]) by DM6PR12MB3401.namprd12.prod.outlook.com
 ([fe80::b857:1112:6a20:2311%4]) with mapi id 15.20.1643.019; Tue, 26 Feb 2019
 12:39:50 +0000
From: "STR ." <strykar@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Help calculate MTU, ISP's 1448
Thread-Topic: Help calculate MTU, ISP's 1448
Thread-Index: AQHUzdBdEG2NAOrQUEeABRiQoQDZLA==
Date: Tue, 26 Feb 2019 12:39:50 +0000
Message-ID: <DM6PR12MB3401FF1DE04A62EAD84F2C74BB7B0@DM6PR12MB3401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To DM6PR12MB3401.namprd12.prod.outlook.com
 (2603:10b6:5:39::32)
x-incomingtopheadermarker: OriginalChecksum:EC1AD79435BAD909DBF5AE3A2CEFCB4723CEEC06DC5E0E17193CD432378483F6;
 UpperCasedChecksum:F1A8887B2AFAB46FC4AE410DA8A13FF49E562B3F32E53C154DA72AEE84DCDB5F;
 SizeAsReceived:8125; Count:60
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [0NCaY1oI88FQqGlrv3It0mPz+pF0+Kf/]
x-microsoft-original-message-id: <7295c2d2a1f43309b83978e409bcd768e303861a.camel@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 60
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM04HT248; 
x-ms-traffictypediagnostic: SN1NAM04HT248:
x-microsoft-antispam-message-info: 4c/z5noOOUDIPOHqMCaowobedv6t3Dpi5KgW7rTDqdm8iaync5VkWbQnSGIKYxEF
Content-ID: <8ABCEB273432EB418BB8A3AD238789AA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c32cbe8-cec0-4cae-56be-08d69be77fdf
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 12:39:49.3600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT248
X-Mailman-Approved-At: Thu, 28 Feb 2019 19:16:51 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I have Fiber to our apartment complex basement, from there Cat6 runs to
each apartment. The ISP/apartment service provider suggests an MTU of
1448, which I set for the PPPoE interface on my OpenWRT router.

I read 
https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html
which comes to (assuming 1500 byte MTU) to 60 bytes (IPv6) to 80 bytes less to account for Wireguard protocol overhead.

Using this info, I tried an MTU of both (1448-80=1368) and (1448-
60=1388).
As my ISP assigns only IPv4, I expected an MTU of 1388 to work, which I
set on the Wireguard interface in OpenWRT.

However, when set to 1388, almost everything works except any Google
related sites like Maps, Gmail, YT etc.
When set to 1368, everything works and it's the way I have it setup
right now.

What am I missing here?
Why won't Google sites load via my WG VPN when the MTU is set to 1388?

If it helps, I host the WG server on Google's cloud platform and was
informed that GCP has an MTU of 1460 bytes.

Thank you,
S

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
