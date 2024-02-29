Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2DED49225
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:13:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98d94418;
	Mon, 18 Nov 2024 12:45:06 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2106.outbound.protection.outlook.com [40.107.244.106])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fdd3a694
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Feb 2024 10:51:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmzR+5zwYigvHLsPP68GF9rzu/cWd655vL7m/KZik7F+i/FWf4yb8Hw82wuFM40wcJPdCVedkXpA9dzR7Nm+h90VvjXTI152EOwgl2dult2ttiGMvzaBH56egeER9eKT6nnRD/QMJZJLGZ+WLMTqY4Chli6VVFf4NZJzpZTjkiZH0rzIOwl3QGYiuX1FuvYL/uCtSoEUqCMWG3MJXsX0BTDOPCkV6Ps4UYIeomf/Nw9R6j5x1GYZANprWgu20rlucON60qlCwpFWfCYfInrsPm1foDezaXpTjsC2DdB83ZPwHytzO88pm/cm9E+Tjw4X+Nx/n4d0OlqneCKJ4CUwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9t3mA39B/Oy9iuj62vh0ffCcKUvAQm4qCi/sEO65Jk=;
 b=DbdOohb24EdK70SaUB1hVUBEsS+/qSWGPJmVf+V7dMarL1yMpdnwcVn1Me91L7acMd5fmnIoYDjitz7bf85TjZNu9DNjGos4yb/sdhJdWyEIF+lMI2BvObLVuvUgEBgsLOGgIK4cAqh8sXRbWf97yTJg++CkedyGzks8/hIARffR1uFk2emBzDz9cbh58YnO1Yq+wa3wqBz7KKOhJyNQEBDyJ2LzRFIyaOeQfKhFFEjIU7Hz65l8+R0Zmc0t9GEkYrv0NqUTvaFGi9rMtj7FIcSEXanZJOO3CeGNs45itEPvNoIzIrc5xsPNdgxl3JV6DiPeDuKpSOgxISMyGLrHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=versa-networks.com; dmarc=pass action=none
 header.from=versa-networks.com; dkim=pass header.d=versa-networks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=versa-networks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9t3mA39B/Oy9iuj62vh0ffCcKUvAQm4qCi/sEO65Jk=;
 b=B9LAm8PooxzS4S7jE42qNK7oHqleq4y0Tj8GaAnrmQL6RtohBZvpio2x4PChn+A3I7kV9AUsQ6KuN0jxeBxEmrPEQ5LB6Q3TH6TLNQ8KJpemFJAe7DeOQ35IQivLep9XNUJp56EBt5tdvvHsvom5HY/2eco/tKl7ywP2JxtWBm1MrRKLjCscbP4Ar1PXT7cOCwfcC3YPNFlEhtFoo1CYLuCjDYL7hVMTMrK7XNUo5kcXuhklwMqy9DADYhJ0jQpp/FjwdGMlD2oP2Hyz7kdrhfJxtKi39eBshcgGes8GhtujAX27DCXor/Ik11bu2IcYmhQBxDm/sAo0IfC90b8OnA==
Received: from IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Thu, 29 Feb
 2024 10:51:08 +0000
Received: from IA1PR11MB7891.namprd11.prod.outlook.com
 ([fe80::1ec9:1893:7aa3:86b6]) by IA1PR11MB7891.namprd11.prod.outlook.com
 ([fe80::1ec9:1893:7aa3:86b6%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 10:51:08 +0000
From: Indira Priyadarshini Thangella <indira@versa-networks.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wintun adapter becomes unresponsive or goes into bad state after
 sending traffic for sometime
Thread-Topic: Wintun adapter becomes unresponsive or goes into bad state after
 sending traffic for sometime
Thread-Index: Adpq/TECowbAz+4NTceW+V1UT0iDEg==
Date: Thu, 29 Feb 2024 10:51:08 +0000
Message-ID: <IA1PR11MB78918BC170A4CB3EF05FB998FF5F2@IA1PR11MB7891.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=versa-networks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7891:EE_|SA1PR11MB6685:EE_
x-ms-office365-filtering-correlation-id: cc2ed558-413e-4a81-e0d1-08dc391455ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q0ODs2IDtxgver+D+sGBhKld7C1FHL+Ht7wX2UApww0ZUzpM2H6A9IsTNV6IfgB1/OYWBX5ifhX31A+Q+JaPQamuyoZ7yVwgh2pMIOBUFahwPvgLnt9HQ8U3C9qpFgVU8TquXWoV+lGDUr6m5NsWibH/KthBHrUtUs8W83Hbudp6BfoiusmHKAENQapLYZcfY0bMnBOETJ/4FwungQDiuvMf9Lhd/kqq4ZBad/b4aXl7adQQLPIPA2AgAMGxf8poTHtiqImCw/H5wi0KYdkB6RCTdk5xUGU3jtCG+iQ2ReiwcEWMzAhvWE0ArzCQJBgFseX1pTVsaolLluVMhVAsiL8tP9fMmfv1VEbHzSf0w90f3GCNNrZoa2ldt7Yg6dubmkQxRcIc6gfUCkqC2Jy9RaEvZamhXlQunxBVpCP1moL5/YqtLTpHRXrbvc5Ub1rbCB89nYa1ch8SzqkxlhrqVrjks0/4Rb/i5b3kJZ9rCG9PtOuKiWIDACN8V8z8ia6PKHQNsPl/D9EFlEaAQpV7VmG4Ra+YUKl6X01L/nmG23c2YynqSARmxVRgOlpK7vVkKF2glbYpSpTIKcR7CQC0ZnFmBrq6m9+hn+NAhMY5H5W6moZNsFks7OwuBThLz9eQOvkWYh9OYkjtMI6r9pv5mmVybYVdFDJ9GnQoUQ1ibEF5sxnBpSnP6pC6UZgWqFYCWqiHsDG+SIETRoJcK7hGVqs3nzOJVDxplA1V12eGFeY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7891.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CP8ahV2s0JfJkH8wix/pY22E71Hf5ujv4vPDjHvkKWO4pb3uLpJI6eAyCeGt?=
 =?us-ascii?Q?7HHaanSqZun08z3UYZkov2i+RIed4dTrhmev9jCVCTm8/duSA0php2B0tFiP?=
 =?us-ascii?Q?XBfDw9zPeMILW6t8ltZXuy0xRXfbFIhQ681NoRPV8jvqJ6i5Rtj+0K/4JQvX?=
 =?us-ascii?Q?yaLqH0eDAuax7nwPhLk9qjvWdE3unYpBwBTwMxBtTNlaY4NAjU48e88SOnvn?=
 =?us-ascii?Q?1tDtxwSLvXryCywdvOA4KFkhfDURfiT36xkPlPR1ngdJMYTZCjp97KmlMcC5?=
 =?us-ascii?Q?ia/Cdrs0r3JWiy8dD+Dqt/qx7vVAcfyGdNsXavsHM4MDYcZmEcASDnkKGr1f?=
 =?us-ascii?Q?NQEjlP86WF2qyIC4U0wS3lGk9o1hvl41vuKwwPiX0brSDuxpsWcYwZQIziid?=
 =?us-ascii?Q?141TL4xFSLKYJ1hEk+g9Gn/L+yaMIhJwse3BsqpJz18JerpIXxarQ8vXineC?=
 =?us-ascii?Q?fFQcz87aFwvUb6iVKLCzEQ23YWtP0vBp/pNPjbuHsnsZDad92Oz7Us8e6h+j?=
 =?us-ascii?Q?2pEP2QB7U1q+qQOm+tm28L333J3A3HH5rePxvvoBLx1Y6HWIWiwwFU6FzsPn?=
 =?us-ascii?Q?ipcqw7U5jkiFb1RkMaJiPNgCOjwmdD/pDglpReGUizFw7rpr6z4T1dl6mXiV?=
 =?us-ascii?Q?nwUa6okwNSwL40GT5O/WWFsJ5UKieJaoNM7sUmrnD78RpAODl8WpPXzVs60+?=
 =?us-ascii?Q?pntw6T0Pa4WpovqimC2wBPRWf/g9WjpbCeMwKeEHUQ546/t0xP4n0yem9KQR?=
 =?us-ascii?Q?cd/nVyNE12mpEXYZgoqInCUvVSApgd0cpYbPa+aJMWqBYF6MsvWTL6EYDTcH?=
 =?us-ascii?Q?cV1XZlrxPVZtORCDbqWDTgRFRdx6yKhZ9z6mRDRnVNcs01g2+ihSvQAjt1uk?=
 =?us-ascii?Q?4RnmwjRkMD9zFUAaCHa2CXkv7pkJ9A+1CGmryREeDz99xnyqpMjx40aWV845?=
 =?us-ascii?Q?8XifolxFctrMhW5ciyoAIwjzpZfUIW1S4XYFOOXNYrg4DstcdaUCdgO80JOw?=
 =?us-ascii?Q?E4Y3qy4ZgWS+yoJZE9lChMobZdeGAquYV+mX1zidWXRXeGUlsbhgIZEmnOuj?=
 =?us-ascii?Q?0j9QiiZEKnHHKf2K9JeCCiCmOi3llnrUTr5eiV+RuEUHAIuHaw0WeSPUS9bE?=
 =?us-ascii?Q?+2GdEiuDZ9gYAvGg+Poc3D3twRN3wl5K2dpKbAq3FexWtsVEbQ9Pi4dumLyb?=
 =?us-ascii?Q?skPmriaHT7bckPg4yHPlkAP1qvVV53KuKAsNsY01W54LKujCVUEkR171+/Zw?=
 =?us-ascii?Q?JyqaIJ4Rk86If9rRk/JbjcEZZC+hk1BoQCfwGFmfmqhaGW27CEczftbS+Et/?=
 =?us-ascii?Q?M5uDwYTdbyubESOlVGDfHQvDjN78bcmoCx+he8ziIstLgbW0LXU/bbd8tQ6Q?=
 =?us-ascii?Q?vSOyWx8lRwtabU/cXVH4RJzZivt3UFMiXhn4Uo6ipgRq/n+cva2ogKNXrn4o?=
 =?us-ascii?Q?DwvXLR+NsZYAcNirdNw4bj6RzrRaq16pgUsdwQcXp2N6tKUolhdNvUPynVwr?=
 =?us-ascii?Q?umB/u4JAiDzvNiWstt7qXXMXW5D96RGrbY1tliksWogNVkyrFa5CTr2621xw?=
 =?us-ascii?Q?xt+HjtL5fgAREgHeFhQudHefzzsFXAqqbc9lEeld?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: versa-networks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7891.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2ed558-413e-4a81-e0d1-08dc391455ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 10:51:08.3473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d39a23bd-897c-45f1-a3f5-c5213b673627
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3fbFx8/hEj4g+0Omy2dhSXTNqCbrC+EZz7H9o/qV0KgmeSZYvSiV+JAvxVR+GFOnD9Fdttqh6xvo4mJrJOn6hEQAf5o+ab1+Z9Qd9xrJzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Hi All,

I'm trying to setup a SSL-TLS based VPN connection. I'm using wintun and ab=
le to setup VPN connection and the tunnel comes up fine with my local serve=
r within a controlled environment. After the connection is up for sometime =
and after couple of speedtests(using Ookla), I'm running into a weird issue=
 where I don't see wintunreceive events. It looks like adapter is not able =
to receive any packets from tunnel interface. At the same time, packets com=
ing from server are not able to be sent to the wintun adapter using WintunS=
endPacket. Ping requests throw general failures once we hit this issue.

I've two threads one for processing wintun rx packets and the other for win=
tun tx packets. As I mentioned, I don't see any wintun rx data processing a=
fter speedtest. Just to mention, it happens randomly. Sometimes, I hit issu=
e, during the first speedtest itself and sometimes after couple of speedtes=
ts but I'm seeing this very often.

Below is a snippet of my wintun tx packet thread handling. Once I hit the i=
ssue, I'm constantly hitting else condition where I reset the tun tx event.

=20

    HANDLE                      WaitHandles[] =3D { sslvpn_inst->tun_tx_eve=
nt,

                                                  sslvpn_inst->wintun_tx_th=
r_term_ev };

=20

    while (1) {

        event_result =3D WaitForMultipleObjects(_countof(WaitHandles), Wait=
Handles,

            FALSE, INFINITE);

        switch (event_result) {

        case WAIT_OBJECT_0:

            if (vs_sslvpn_recv_crit_itc_message(&sslvpn_inst->tun_tx_queue,

                &packet, &packet_len) =3D=3D 0) {

                tun_packet =3D packet;

                if (tun_packet !=3D NULL) {

                    LogVerboseW(__VNFUNCTION__, __VNLINE__, L"VS-SSL> Sendi=
ng packet to Wintun");

                    WintunSendPacket(sslvpn_wintun_clnt->session_handle, tu=
n_packet);

                }

            }

            else {

                LogVerboseW(__VNFUNCTION__, __VNLINE__, L"VS-SSL> Failed to=
 receive crit_itc_msg. Reset Event handle 0");

                ResetEvent(WaitHandles[0]);

            }

            break;

=20

Did anyone run into this issue? I typically see General failure errors with=
 ping requests once I run into this issue.
However, the ipconfig still shows up the adapter but it just seems like the=
 adapter went into a bad state. Once, I tear down the connection and set it=
 up again, it works again for sometime but eventually run into same issue a=
gain! Any help or pointers is appreciated. Let me know if the above informa=
tion is insufficient to understand the problem I'm trying to explain here.

