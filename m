Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB52C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 20:21:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5A760BD3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 20:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D5A760BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98cb19eb;
	Sun, 8 Aug 2021 20:20:13 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2021.outbound.protection.outlook.com [40.92.41.21])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 681efbd6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 18:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/yWwZKZ5j7zXREfs9NDosOxceqNmpG6helUaT0LkvfYrtXGg18uir204ZFLM4l+vyznxNyRaFo8l7NuC4f3Azda8dGGtyCXn0D0n9fbfhglg5FFZhp03+IyOrF4O1xi04XGPNnVVjEAeYC+P5Df9C/2GskhkQGZ0Czu+zXbGRlb2FA9DAlNMh87Us0zv8nNbjy+bTsMVyfp6P1H9bURCjjFaG6p9vvY1/xhrXv1+ZU2/Vrs2gW+nT9ecVL5pnxWplGfir/gxsjG3JUxZlL16Dp08IIiEWUNg674GfLWISK/Nfymx1eRY6qBfl1Vp7ackGy4+CLBvaJ2enPs8LQzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp43o292zatlhAqmskU6EDpO9ZBBvh6SXI7+L26bF5A=;
 b=QC3QEOgKD7J66WXnHINCD52QyzuWPvK9EuzNN5Z8JM5L3XfPe+RQoRDcpRupSNk3g57UVuUNvqLMIHd1PBrFguKP8TAU9xt97kiQ+/m5hwurx3NgrptOWPjsdghjHGZ2o7JKf4NdWO4DP1tPj+HwjrZjG2Uy7M4WdHmwwQQgE38Ox0ciycVdOmeNzXr2UiIF+aKQpZtCe0YArMcZsdY7cSex8yBEirAvPFoFw9i325ykC8sFXdEr+RFqVto12Wj9GTRlSGdajb5xKmSTRNUJub+c/jrdFnlHyOvoyf2hQBXpGluJ+OJQ4wVOaCzqKIx0F2dRiqn4PcxQqtxr4GTreQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp43o292zatlhAqmskU6EDpO9ZBBvh6SXI7+L26bF5A=;
 b=IZEsXCeEDFXG1Xl4poGqh7fnxm64mQLkHpRH6TDlTCIF8w/Oe18g44dQwxueCAwP3uj8+n/vx2Y3atJ1HniaLllQSzPxPOK7zIlfKkFPc1J6HLKwew4Dfu0dKwFW9oQnvyDlxzLrNV4xUeW1kW1+NK2tA4nMM7h9pHLlT9Mbksj+/1mPPjvdjjcODwZDMM96Om4KVPRZk60l/VuGHucbnQ8DTdgtD4/rAbVdDSgXKJy3t7YLCdr+Hkv0iRFt+szhWEOvpHRBv3n9tRYYvNM8IVcnjGmk6pIM41/3RkVy8URST2xboQJW0/rnwVvoXyNOrSUEjN6AYDNPusszBpTndQ==
Received: from BL0PR13MB4275.namprd13.prod.outlook.com (2603:10b6:208:8b::19)
 by MN2PR13MB3743.namprd13.prod.outlook.com (2603:10b6:208:1f1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.9; Sun, 8 Aug
 2021 18:08:00 +0000
Received: from BL0PR13MB4275.namprd13.prod.outlook.com
 ([fe80::c2:1455:2db6:dc51]) by BL0PR13MB4275.namprd13.prod.outlook.com
 ([fe80::c2:1455:2db6:dc51%6]) with mapi id 15.20.4415.012; Sun, 8 Aug 2021
 18:08:00 +0000
From: fawaz ahmed0 <fawazahmed0@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard client v0.4.2 doesn't work on windows 7 
Thread-Topic: Wireguard client v0.4.2 doesn't work on windows 7 
Thread-Index: AQHXjGvHnWW7dy+/oUGLvzKrGzPpzatp5sS2
Date: Sun, 8 Aug 2021 18:07:59 +0000
Message-ID: <BL0PR13MB4275F28AA336DA744F182FDDF1F59@BL0PR13MB4275.namprd13.prod.outlook.com>
References: <BL0PR13MB42757EC47068BD919AD32569F1F59@BL0PR13MB4275.namprd13.prod.outlook.com>
In-Reply-To: <BL0PR13MB42757EC47068BD919AD32569F1F59@BL0PR13MB4275.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Be8DSJ6pqmKvYrYzovDz7ijAQRitSWZs]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 935f577f-00a8-4a77-000c-08d95a977510
x-ms-traffictypediagnostic: MN2PR13MB3743:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XW7TIIMOT42CqyR3RGLvNuBW4kjX12GIJThWwQ/TPwt2Vtsn9Tpi5U9uxg50V0ZPYUTPLKrARv8VS1tPPLLnUsRL4JUm9VHMwyrJ7U1mIngDxBH8EiYraj7z0WY8CXiknGd0a1yhvcQbaygd9tFk5kXFcIyqFPudGOW2+pclKyK3yUQfe08dMI8xl4Ug4aN0uG+xLQR5ihA42iBovBFDG1ycZbMfLUzBWzvYaXz+gksf0FJ1cG36eDzcf3sXfp6zLSHT4S7VBA/kZoUxmyOAdywnyRV7kWcSG4JcpKJp86B+FLAGlFB+tF45MiVMKAgh0l8obZCScSp64bmEwOUcu5iyXRjvijp2ebehAbmEur60Zw1XynRGEYGzfqS7upqZvv8C892gVVOIrq/Iqb9DfwMKtbB4MpVqRZGRv+p/Jpw9V4XmWnC1k6qPlFeuRN1L
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: vNYJR2eqHAELbrZ1k7mVhbIgXt18Khmy2cyZd/sYYBvs2iT4ETY/H+HGdX2TaIuAPs3MilZRFE1kcYeMMkvExKmxaaZ2+I2v0Hs/h8X3G9wmItEUwTvgrjnTpepwyj7i4jPA4c8liYsHBsWDh8lbrQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-8-msonline-outlook-32ef5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR13MB4275.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 935f577f-00a8-4a77-000c-08d95a977510
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2021 18:07:59.9650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3743
X-Mailman-Approved-At: Sun, 08 Aug 2021 20:20:10 +0000
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

Went back to v0.3.15, just had to disable driver signature enforcement to m=
ake things working again in v0.3.15=0A=
=0A=
Thanks,=0A=
Fawaz Ahmed=
