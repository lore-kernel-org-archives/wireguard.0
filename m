Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AF4C3ABB2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 May 2025 17:26:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ee7d193;
	Wed, 28 May 2025 17:26:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023116.outbound.protection.outlook.com
 [40.107.162.116])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 203e96c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 May 2025 17:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pA9CYjLpUbDFa3s54F7kvWJDOX+/rELH/OxRFs+8zgB6NXT1CZBCdXTDUQZuk/xmCsh+YBdZJhcVqBzDtm6sz7rtQGOlEhnF0afAKU3tLHm/KpCXm/rmzkKbB68ZDTMc6Z1Bws4Kv3Ggr0iiOfOD661VYkfuOSVQB0wfdLTo9hJZvpSPhTlF9skXvP/UwvI7aru4I+772D+KN8SeLaZrMgVT08iKqoDgra3BkUJqs1UrHWW1WuvyoW8Xmo6dg1GLnMbuVQyT/5ko0hc/z8Qys5b7ox/xmjcb7o9QAPp18LW65ez9ZP7As6t1Sr5BLMG0Seu1OmMuAxKgjJEucvHxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvgj4pMs5ACNSINv8ZDsiG3pL8ryJBWmosKhEq6gSd8=;
 b=cRT+iA4BhOeDtXmWNUWr53pmg/Y+X8JWNt95IwqOtbPaYQtLAjgE44qjBJBLt0djMl1jZkG+acoXzGRm+HDbEVzDMO6zT1zGLIozrmOHvyFIib2rz6SJ9kX8opSaRLtqwcz2CPFEzD5P7sjTg+u3tO3KPMqxImcDasIbdtkJLaaXmaCjl04udsMUMbwAcY+Alyxv1J0BIUMPX3J1AqvJw/bLjv4altgn0T3OWQDB8gRVg3lhiiPjbUiU4a/z2VZgJaxrDx62tCEZgTIzrVfnbZj4gVwRoX1dT7dMnviZCprKqMpXMjPb2ly7JBjGM705ZvWNJjpstISAsI0M7Oi4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polito.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvgj4pMs5ACNSINv8ZDsiG3pL8ryJBWmosKhEq6gSd8=;
 b=f3SUvg3pL1nlG+JGighSuCA61B5O2cX93AOm6E3cp2X1z7tSp8P2klUp9bPOwHbtYdLQbU59dXB6uOoSvCS4DrsvgN3AO6j4oOPlbKPTx7h7QUEnoi+utKUilt5ENBLdNm2Gi+B8UQqyRhIB2OA6uLN6O+CEpeAAbyWIwBP/Edg=
Received: from PA4PR05MB8995.eurprd05.prod.outlook.com (2603:10a6:102:2a6::12)
 by PA4PR05MB9043.eurprd05.prod.outlook.com (2603:10a6:102:2aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 17:26:35 +0000
Received: from PA4PR05MB8995.eurprd05.prod.outlook.com
 ([fe80::9d7d:b4bb:1d50:70ce]) by PA4PR05MB8995.eurprd05.prod.outlook.com
 ([fe80::9d7d:b4bb:1d50:70ce%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 17:26:34 +0000
From: "Mirco  Barone" <mirco.barone@polito.it>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: R: [PATCH] Enabling Threaded NAPI by Default
Thread-Topic: [PATCH] Enabling Threaded NAPI by Default
Thread-Index: AQHbzubCWqzF5L/Ns0et8HxS4wFhZLPmZMsAgAHoGbE=
Date: Wed, 28 May 2025 17:26:34 +0000
Message-ID: <PA4PR05MB8995DDB49A853E42F264B6458967A@PA4PR05MB8995.eurprd05.prod.outlook.com>
References: <PA4PR05MB8995153AC212DDED36166CC48964A@PA4PR05MB8995.eurprd05.prod.outlook.com>
 <CAHmME9pV8inzKksdXFq8C1ey9dLJZBUzNJoCr7PrrqeHqy=e-g@mail.gmail.com>
In-Reply-To: <CAHmME9pV8inzKksdXFq8C1ey9dLJZBUzNJoCr7PrrqeHqy=e-g@mail.gmail.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR05MB8995:EE_|PA4PR05MB9043:EE_
x-ms-office365-filtering-correlation-id: 4b4e98aa-a8e8-496e-c422-08dd9e0ccb8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?KSUpprRSvv3Vv2u15CdmPASU4jnDoUOK1O1pdBbmzrztpfP5+BjvjxBsW8?=
 =?iso-8859-1?Q?2s7JL4Pws6BNCIW0/f/7tmE9eWRYJ7Tz+QphvwgsBnptiGo/GByfa/sUZa?=
 =?iso-8859-1?Q?7OsGuX34niYE3zGyQS2AJBx9tVz6EtSrWDtFe6EvLvCrF60vJPF6FeLwcL?=
 =?iso-8859-1?Q?hCfim5DniyiLZqZcQxmcB4fxF5BCcwHUVopjt9fyDhgYc+6igALwsjhhyy?=
 =?iso-8859-1?Q?ntxfTRpPQCddZjEIyTHVQ5vbHLsprMqDZnhgDw0d193gM+y+6NIJFmBFc8?=
 =?iso-8859-1?Q?9utDy35AHWnOypxybKMagaPs9MnMazQqdh42tsBb1JflzyIvXW3MCfGO7Q?=
 =?iso-8859-1?Q?J/HyPFr67n089hE8gr8FOELA9hnr77RtG+VNd6JtcaX23s6phs95uFJ9lc?=
 =?iso-8859-1?Q?MSDxy4vc6A6/rnylrN3E+wRZoJC+ASeUzyHtjgga863vPP3Heo14L3Or5P?=
 =?iso-8859-1?Q?wx7ueu+Qi+NU5zzU+iHj8t0L150NQirKgSKbX1HQh3fceOlghyrnuEXr48?=
 =?iso-8859-1?Q?vW2Hmz2/jPVi7Zm/Me4JlJiRcShl/iLGdF3+Ugbet9uk2esFC2H5Jplspa?=
 =?iso-8859-1?Q?PMXn56CmY8oT77nbjgzKM1K2MsqGtHYqOqRtfCz17A5UJZ/a3Z4CiODiyY?=
 =?iso-8859-1?Q?WUMVrklSbWvItslTe2Ifnota0pAtfPej4gx8kd3w/SVO0LtV/u0DdSdQ3i?=
 =?iso-8859-1?Q?hrmPRNTTeBU2CWfPUKl9N3grXCtnJ260hxYC7ZpuXFlMQutSPlDa0r9QXY?=
 =?iso-8859-1?Q?1Zd6vriYn7olqRmp/Xs3JeGDa/gxA/s/Z4jbEmhXzcJD16pGBN5Y5o1hRw?=
 =?iso-8859-1?Q?13OgUoRoxpIAShi9tNmZLs1Aou4I58HLy8WWQKrCdaxSDGCTuMMYKjwkVu?=
 =?iso-8859-1?Q?JSlXIt7pcKdnrdxkQl9UByOntgHmi+hChbS/qK/62mLNjv591mGbiI7R6/?=
 =?iso-8859-1?Q?qogL+n+BI+02O219FR08LLBP29jLf/fX8hJxxQSZwot8bfLvEv8S7/Oijn?=
 =?iso-8859-1?Q?cRyiPjV4DsdeWexDt2AxswzhfMJD5VFYDoiKBXaYbRDt4MZKJyTZGsrAHR?=
 =?iso-8859-1?Q?icv2twY3nmJXN7S4FGHDDh9JFxBS+wVxkiXTQTM2Ke03qQyiOjlj50GfkA?=
 =?iso-8859-1?Q?o4rm85j/HRHiYx1hePnJGuAVrWw3Pnv5j9UGio6HOuIqHw6P5PRJcRGvc4?=
 =?iso-8859-1?Q?x8QcDNT9DS32MI7vo0aiSTO8A/JJsN8+RanjIlDPRBRLt1wxrI8XBtDB/R?=
 =?iso-8859-1?Q?G7UkvjYBjiCHDWlEsNOM1fsv8uuDmvduM9fnfGgZ9LEOSLWxVnF6DUBOaH?=
 =?iso-8859-1?Q?oZD7Jo8ZOXADg1LvyJEr2ORV4FpfBZtIkFoAtZScpbwOLCYkPUvOUaNSMQ?=
 =?iso-8859-1?Q?tGm0/eptdNavKyyMxzwR5Ahf85+F1Euiu6xiHstd1gdvnYnjIr7JxwlVd/?=
 =?iso-8859-1?Q?nNtRQWnu8EzAAvBu6eq0+tvHFxx4cf5NCPrVtRIZX+BFMoP17A/3aroY3e?=
 =?iso-8859-1?Q?0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR05MB8995.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6hbVEt+Q00tBWvV1MC6H/l81u1IBLpbsJTaLJWaymNq9k5zbE/QXiMO01L?=
 =?iso-8859-1?Q?V55RLkqtluIWPtkeAfKAnxmxbx6MZQUXmLVMweoQjm1LqyrsG8tyBV4R32?=
 =?iso-8859-1?Q?v3k4KyS4PWVZkM/D4VHWAHGA/UYP2RrBja8VZUsKtT+1JaIFcvSJDEWJlW?=
 =?iso-8859-1?Q?HkgQpxFBWQZwlAeSaoXjkUvOCtgtBPqPdJoC2Mmg+uVGjpZuTutpUkkz9O?=
 =?iso-8859-1?Q?yCMB15UN4Vf98VPPeaPg25khnXeWrnkx0NJCHGM0/JjsShkEccCCCjNqRX?=
 =?iso-8859-1?Q?s/LBNwUGMq/EFnOZwTDpVNLMW3lowE81qREcjAqSd8l5ZGS5Dr5+Mb/aut?=
 =?iso-8859-1?Q?es8AG/OOIKLollMp9U6UJWO/ze4+ewLolQiFKIvp7aJTGF8FFK5V9/J6q5?=
 =?iso-8859-1?Q?RgV2ExRnwqMyKkIjsfXe71QQabn4hdw+2XTuD764XLIZQo/IUb+WleqsUL?=
 =?iso-8859-1?Q?BrvlclrYwqQVAJfY/VmSz77HvC0fOfjfyxozBtXv86huh7+vr/WNkLaPGR?=
 =?iso-8859-1?Q?K8LBMJreaiEz5edXZx4QvBBjABWjKeS2165r4kk5F5rxEv4koT0EGymgOh?=
 =?iso-8859-1?Q?ngPVxQfHZALm4pqHwCf6aWDqubsnefip4s2/4oshixqQG7Wl+9gMEFD6eC?=
 =?iso-8859-1?Q?F9kmkCFnIYlMIX9b16XVq6m5k8DI1wDOlpsT8OxLQsYgqgzmy8WkyxV9fi?=
 =?iso-8859-1?Q?GvHr1KpyL7U6l/pblNwwzSw6yZ67hiVS26sCNPTp/ffgd5krc8/d42Ejz9?=
 =?iso-8859-1?Q?7CkR1rvMCQJ6XLqXrtvA/EB7RKLbxZLRzx//UKWZwyU9YGKX5+4zV5vWHV?=
 =?iso-8859-1?Q?l/KQjg1GkUAiExP987EiYjVmkOLIVHJQFgG+1bzMcdn55cGFuGbWOFWL1v?=
 =?iso-8859-1?Q?ERjCpt6naSGOGYsLScxuxSO/4kcnMnfKgjhWRiAesNNmRjKh/gUKMhbTbV?=
 =?iso-8859-1?Q?CIbOrLRXR/qldijdAzjJXtEk39GyRvPg/ZmHJ2ASCW9K+vHSPnAC30r+Hk?=
 =?iso-8859-1?Q?jTscTGAj27Tu/LUxWaP+faFoe9cPTqQMUf5w9mkdhd4TvpsHk48ZzijrJB?=
 =?iso-8859-1?Q?svBwTe3LO0LGEd08csaZYZIggNYmnAlDgU+O6MUTLYz5U1EANhWmjPQdt9?=
 =?iso-8859-1?Q?pi713Lc+nJdZZl4rZYLwXFvI5G9iXpL5G2hMw3HUaemUy/bhP2mnUaC+uH?=
 =?iso-8859-1?Q?xd0v3iyHXHONbNbXMvIYmXXYgw1dcfTrDyIeT0qwgFh11bhV2wAB8o/qUH?=
 =?iso-8859-1?Q?G5g/vjnL9Gua3DrcgGlvvm5DfHdRC4+quH8QauBoD1e9xVKU66/3xMrOPp?=
 =?iso-8859-1?Q?FrDWVYLP///UdfHUeq356zRQutORAiPOATP99ChT6NA2tMK6QNWPCKSwev?=
 =?iso-8859-1?Q?PbXZcHW3JWyMBnmZgPinq4iQKE36cvGdYa4awebfhIE3Q5AV5nVow9g86K?=
 =?iso-8859-1?Q?JlndxmTIf/Gv4g77U1w8Dz7mUJMvDkwGMZ88NW49Jr3eHAyprm30rhHkfw?=
 =?iso-8859-1?Q?02vSEpB7loZwzVhrlLz4HRYx/kNoGoHqWVlpbXadtWcTMQRDg7xTVmq1af?=
 =?iso-8859-1?Q?BSWeCkpax7COKr1AT7bf9cLcBZvfKw3IRGiBAb5Pq0cDhknBkfGfxQbVRB?=
 =?iso-8859-1?Q?xSK4vwnDX17kKwKrYVStJfMShe2KrshRtl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR05MB8995.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4e98aa-a8e8-496e-c422-08dd9e0ccb8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 17:26:34.7864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWK0mCJAjmiyeFFHUY/ePgEqB4P82h35MI+nEx1bLA42Ez0svtG0DJgqL1AH6yle2P9haIOxK29Hjw0NVlaxbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR05MB9043
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

This patch enables threaded NAPI by default for WireGuard devices in=0A=
response to low performance behavior that we observed when multiple=0A=
tunnels (and thus multiple wg devices) are deployed on a single host.=0A=
This affects any kind of multi-tunnel deployment, regardless of whether=0A=
the tunnels share the same endpoints or not (i.e., a VPN concentrator=0A=
type of gateway would also be affected).=0A=
=0A=
The problem is caused by the fact that, in case of a traffic surge that=0A=
involves multiple tunnels at the same time, the polling of the NAPI=0A=
instance of all these wg devices tends to converge onto the same core,=0A=
causing underutilization of the CPU and bottlenecking performance.=0A=
=0A=
This happens because NAPI polling is hosted by default in softirq=0A=
context, but the WireGuard driver only raises this softirq after the rx=0A=
peer queue has been drained, which doesn't happen during high traffic.=0A=
In this case, the softirq already active on a core is reused instead of=0A=
raising a new one.=0A=
=0A=
As a result, once two or more tunnel softirqs have been scheduled on=0A=
the same core, they remain pinned there until the surge ends.=0A=
=0A=
In our experiments, this almost always leads to all tunnel NAPIs being=0A=
handled on a single core shortly after a surge begins, limiting=0A=
scalability to less than 3=D7 the performance of a single tunnel, despite=
=0A=
plenty of unused CPU cores being available.=0A=
=0A=
The proposed mitigation is to enable threaded NAPI for all WireGuard=0A=
devices. This moves the NAPI polling context to a dedicated per-device=0A=
kernel thread, allowing the scheduler to balance the load across all=0A=
available cores.=0A=
=0A=
On our 32-core gateways, enabling threaded NAPI yields a ~4=D7 performance=
=0A=
improvement with 16 tunnels, increasing throughput from ~13 Gbps to=0A=
~48 Gbps. Meanwhile, CPU usage on the receiver (which is the bottleneck)=0A=
jumps from 20% to 100%.=0A=
=0A=
We have found no performance regressions in any scenario we tested.=0A=
Single-tunnel throughput remains unchanged.=0A=
=0A=
More details are available in our Netdev paper:=0A=
https://netdevconf.info/0x18/docs/netdev-0x18-paper23-talk-paper.pdf=0A=
---=0A=
 drivers/net/wireguard/device.c | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.=
c=0A=
index 45e9b908dbfb..bb77f54d7526 100644=0A=
--- a/drivers/net/wireguard/device.c=0A=
+++ b/drivers/net/wireguard/device.c=0A=
@@ -363,6 +363,7 @@ static int wg_newlink(struct net *src_net, struct net_d=
evice *dev,=0A=
 	ret =3D wg_ratelimiter_init();=0A=
 	if (ret < 0)=0A=
 		goto err_free_handshake_queue;=0A=
+	dev_set_threaded(dev,true);=0A=
 =0A=
 	ret =3D register_netdevice(dev);=0A=
 	if (ret < 0)=0A=
-- =0A=
2.34.1=0A=
=0A=
=0A=
=0A=
=0A=
