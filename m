Return-Path: <SRS0=Z6z9=PA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E82AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Oct 2021 19:17:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F3A60551
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Oct 2021 19:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39F3A60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 697280cd;
	Tue, 12 Oct 2021 19:17:25 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn2052.outbound.protection.outlook.com [40.92.45.52])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42a4e03d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Oct 2021 13:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=menHb74cZyxD0Vb3lMuGldEeS8YaluEKV57xPYyiT4I+nj4gZ7c1UavRyhcctu76V3arZX0q3GbcC8dFM28wXptyn/haOgRdVzlWSGvVkZmqSExQJHiwOr0CcbQoCHIsGr/wKVXSJ2UG5N8tf32L7dN549ETq4wBFGuaJOZIPezidFWF69b6Vy6T08EGiyHkjvpqreuLr96Cehncjz9CbVxPhyJ68WByGUqYmva6ObpsxHMFGYBTyMo6HfxYZrFAE9R5RbGOJf5HBgS9oSHUYNCYsHFAhgXwgRJ9ecMjKvdQh5pTB5rx+RYZt+JNpFW5JFjiHSSPUo9evIBcTFo0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4/sW5/DTdXsyrRVxG4hCJj+0AYsS/AngRoG13gN7hM=;
 b=bZojhBgy/QyI3EDXkJRmLaDtCRaTnVeGGfeGcbVOb0i4gWMmQjD0rUmP3EyPI4FdVQn+PiQXKe7T6TyGO2rOBVS1PiNbrEPsDs1kMFBnzOj+Eoq87EzxIPT9WvbYroBxR5Ex62lkvMPKa/xt46g1voRI6f/4IAnNmgH44DJ2x0xvQDjojIaYuuKlyACApKyji2DgGXAITBJP8mswfcKFROjDv/DZmYWb4CJXbbTfwpKrbFFgwAMPwltaOKOC3bskilPkJugRFF79fSYPdh8CqmZki/Dj/Nz9+/fY6cqMVkhxVRVU84KJyKobhLPmK/M4dNQhjJe7VGmDIpf/Vi+dOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM5PR1201MB0012.namprd12.prod.outlook.com (2603:10b6:3:e7::18)
 by DM6PR12MB4635.namprd12.prod.outlook.com (2603:10b6:5:16b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 13:52:45 +0000
Received: from DM5PR1201MB0012.namprd12.prod.outlook.com
 ([fe80::4003:91be:bc2:55bf]) by DM5PR1201MB0012.namprd12.prod.outlook.com
 ([fe80::4003:91be:bc2:55bf%10]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 13:52:45 +0000
From: Gert Mertes <gmertes@outlook.be>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Keepalive packets transmitted by default
Thread-Topic: Keepalive packets transmitted by default
Thread-Index: AQHXv3BV+tMSoDuVZUmGbzJkeAlOdQ==
Date: Tue, 12 Oct 2021 13:52:45 +0000
Message-ID: <DM5PR1201MB0012B195C77099DA856C713CC5B69@DM5PR1201MB0012.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: cb6b6dd3-cee2-efbb-bda6-93159dc61ab8
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [3toXwWtCjujxSg69k/utmQEKgn3rz1Xd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1d472d4-c1ff-410a-b727-08d98d879183
x-ms-traffictypediagnostic: DM6PR12MB4635:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b8x6YtoO8Sq2sDmaIF/dNeCX87A6e9TBjs/l3Cbr0i6krhOLoTjtu4ykymKg50AoeEWN8yygbJXuKpk03VSvb4baYvNwGxPiODKmOlU3OQX45haR3e36nJF/2/NeXSatsbNs2Oqj015oKSEblqMXPd6FKpteqzaT1AFyTYwoHEX0Vf/UTNfvrjXZCNBrFihCiwmoyuJhb7WnL8ekWm2fHikLsvnewPA3BJMtlvjRTLWTA2vKW67c5Vcas9mXg2ck95Wjm9klvNKOujJNHdOyn1oahWL9nn4YkMXcAhNu0jkRYpjetAzn3PKXqdWjLp7r7xndrdeUP+6rCzBFG2vnvRtYsJevavASDKug8XPvRCP9Aami8L2nufxkgK10j7jf+PWjGKPgb752B1dTiLc6zaF6behWR6rTWmyoFppA8rfyfMBcrIWaWO2xVH8qhgbg
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: d0qStIu0M/UH8v6ZhVQZcIVeOGPzV+Bm27m/U58vENf2KhwVIQl/bWFKuuQW1Zm1luHvYukRNqY9JjRSCNWa5JZvkrHg5kjB3xg83FK4vVs8NDXPHwNLZ6yfwWw7LobwrY+9d0Wm5lNanrI4ys/mfA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-db8b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0012.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d472d4-c1ff-410a-b727-08d98d879183
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 13:52:45.0475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4635
X-Mailman-Approved-At: Tue, 12 Oct 2021 19:17:24 +0000
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
=0A=
My Windows client (0.4.11) will still sporadically send (and receive) keepa=
live packets over an idle tunnel, even though PersistentKeepalive is not se=
t in the config of any peer in the tunnel. Explicitly setting it to 0 also =
has the same result. I=92m wondering if (i) the above is expected behaviour=
 and (ii) is it possible to completely disable keepalive packets?=0A=
=0A=
Thanks,=0A=
Gert=
