Return-Path: <SRS0=hu3I=OJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3D8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Sep 2021 02:16:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F0B60F92
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Sep 2021 02:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81F0B60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 529161a8;
	Sun, 19 Sep 2021 02:16:40 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2062.outbound.protection.outlook.com [40.92.18.62])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 522bd4cc
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Sep 2021 00:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ekoio4xbbHtz3Geg8j8CuMj39UWIvVb7FtZCGlgttLKwywTyIjgUfpkEMyFdDFtHeXOyDVQemwwPDpfpFzd1/opPpdP17+B6QMaPY09gJUbepCS+tyUzD8T78ZfXmdEmCJJD7s/777YpRLtJhD+t0eSZKmwnpDxXbrest/XweEGf/lzM537Ljk+uG8qJAP3oBca3hfRHbQigCj3f6Qmu3lyMiUja05aBvvk8EcGU+1hAmVLtDmamxY9C7ApOx2SjgwpzggWDl31Z5pe8UcKJ4sGLu6SPvlzNGoZq7m0Cz9pVsetZgBVPwsTZyMzGYz23rrwjGCNPtdmkIMbVzpMZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NRvfnRkvnccv3cZnHQbhUc+zCLHwo1Avkyi4PDHolh4=;
 b=Hhw0Yh5YCQDsYxRQ9g36aaDQHpB09TvvNsYlKKVDcPh07hhP+VegWMcT834UoOKa2umb8bbefbKD/OjC45VF47SQeBS9kj/u6d+J1mLKx3yWLbpnUVZ+JEdPU8nT8Ml0E9hdvxXIvBLxkEb6HedJZYdw1U20NcsepQo2lNYKGWElKP1iFk0VkOtJuHBt5YEYT63aYe0UKS7f5k2hydnSZIli90/xbrcXSf5MtIszfDQSsLUFqt+tSRDpdQAiyQTMHKNi2Os8agDeJx/MAiGmguHRVeGZHvQeDxUzUw35qgvw/Es8ovzsEWELikD1pTf1ijYa+c7yxhZbWxdEBcRGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRvfnRkvnccv3cZnHQbhUc+zCLHwo1Avkyi4PDHolh4=;
 b=WMxau4d75o/ZTaJLtfWo2mJV5UuWev7r+Hd5kxcQAcM/oErEeLwEutwKeBEEgOw2u58jV4TYuoGv3flnRNMz5G4oNtVKcokckGeJf+8+nB5SVlJbaoiiJFOm1t+scKuWtnErTKFoiGhaELoRDAeyvZRnKPrYelii4LIdvLA25Gf0wHEuuDW23yaEm7CJ0ZHiLd1BYXl5eespF7JdLJVpoYtQB48CSZmhatXZR8had2/JtjygkVagdWScpFf6lr2p9eUvjoJmFW6FLVdOrtZc0/hhh/CpU/lRxlddgPNy7O9wDjlfnxX++2jLgA5HOfcJ5cSmTAk40EGd5IABCMhq8A==
Received: from BN7PR13MB2226.namprd13.prod.outlook.com (2603:10b6:406:b5::33)
 by BN6PR13MB1089.namprd13.prod.outlook.com (2603:10b6:404:6b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.7; Sun, 19 Sep
 2021 00:42:41 +0000
Received: from BN7PR13MB2226.namprd13.prod.outlook.com
 ([fe80::c9ab:bd6f:675a:d472]) by BN7PR13MB2226.namprd13.prod.outlook.com
 ([fe80::c9ab:bd6f:675a:d472%3]) with mapi id 15.20.4544.011; Sun, 19 Sep 2021
 00:42:41 +0000
From: Jeff L <strangebrew114@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Android 12 kernel module
Thread-Topic: Android 12 kernel module
Thread-Index: AQHXrO8CvGpZWwI5j0GdO9cG2ohoGQ==
Date: Sun, 19 Sep 2021 00:42:41 +0000
Message-ID: <BN7PR13MB22265FBFBE4E7132F8EA6D5992DF9@BN7PR13MB2226.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: e3ead8ee-18b1-f43d-22c5-f51bf76704e3
x-tmn: [jfjt2Jw7jG7N+tb/Ahcm7MjyAJRGqxyG]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b67ab064-3444-4161-264d-08d97b06634a
x-ms-traffictypediagnostic: BN6PR13MB1089:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LHmACekfttJK9PiLDVtSLqaUaq3h1W6qW+WbwQ0H28k7CpXyB0X8Zb2YlKOxpaDbCQicNeOKxJLtgE7EUM+Rcc7csph9Gr3uCmJRO7OaoNO3fOmXNwoeD27Opjs2Kc9RPTcRsDQHN4ea5DFDauRWxU/V2a84km6EtRBygKYkZJtCn9gcwYSgi31s3Q1iwSlI4KFD0BjBz29q3ATXqmSNRSN7I8b6Vk31DJUqCeZq07G249Lc8Mpx9nStzL66De6g8ysVfd+W+HEemkDErx6JJWyFof9JEiIEFvXR21NWW5zzJuEuVyG7HrUX9JOkJWl44cxmapTbOqJFcp+SqoBkYEvDywJ25nqGnfZP3F5fSGs4WDNoWHBLsZKxdd9nCLXk396613EEVvLAHxagHU4AseW0rd8vKVqOHyujVQ4Cs+8q1SKJZdnOlLPRLWhY0u3Q
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: SZ62axR6RXPI5f4Hkr2qT5C5oJavq1bYS2eT/RgqTw2iqYDZFF8qA546MNXATzYC3RZecFyMB3I8/Kafgby0NDpC9+NjfJeB3K8Kmd7m51HFS1vhgXmOJ2avdr28gfAO+n2n+eSuAxOEcqpN5N7vIw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR13MB2226.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b67ab064-3444-4161-264d-08d97b06634a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2021 00:42:41.4960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR13MB1089
X-Mailman-Approved-At: Sun, 19 Sep 2021 02:16:39 +0000
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

4oCLSSByZWNhbGwgcmVhZGluZyBsYXN0IHllYXIgdGhhdCB0aGUga2VybmVsIG1vZHVsZSBoYWQg
bWFkZSBpdCBpbnRvIEFuZHJvaWQgMTIuICBJJ20gY3VycmVudGx5IHVzaW5nIGJldGEgNSwgd2l0
aCB0aGUgV2lyZWd1YXJkIGFwcCwgYnV0IGl0IHN0aWxsIHJlcG9ydHMgdGhhdCBpdCdzIHVzaW5n
IHRoZSBHbyB1c2Vyc3BhY2UgYmFja2VuZCBpbiB0aGUgYXBwLiAKCkRvZXMgdGhpcyBtZWFuIHRo
YXQgdGhlIGtlcm5lbCBtb2R1bGUgaXNuJ3QgYWN0aXZlPyAgV2hhdCdzIHRoZSBzdGF0dXMgb2Yg
dGhlIGtlcm5lbCBtb2R1bGUgc3VwcG9ydCBpbiBBbmRyb2lkIDEyPyAgRG9lcyBzdXBwb3J0IG5l
ZWQgdG8gYmUgYWRkZWQgdG8gdGhlIGFwcCwgb3IgYXJlIHRoZXJlIG90aGVyIGJhcnJpZXJzIHRv
IGdldHRpbmcgaXQgd29ya2luZz8=
