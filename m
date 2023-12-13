Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441A4C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f8acbaf;
	Wed, 20 Dec 2023 04:59:08 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2121.outbound.protection.outlook.com [40.107.223.121])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2672ec8d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Dec 2023 11:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1BhlHtgBsbK4ogxT/5/WYH8jMFag433bNx7V0+D0w87Y7h0/XCc+vC069/FojejhatfSXDw4xiecEmr3j8nE96eiUdAXXOemNiY+Gk8hQJxvQM62XAFt2qhctzhGA1LtqZXpPmz7EbDxnBaotUpnuAPn2GPiSB7UpzP7MhkbJclEj5xWDt5lFPNUCs4wUYl0brggbsY1NPd2AmTCQeTLZGM73Vt8jMwgjZKcgsrLIn54IrVTcxixztX+clb1AuR06mZ2Rcvg31ky2YC7HcInXlwmxYiDpL/hs3BH97ObOCY2g1hMlk64cym9CRxIXL+dh7nGfwBMXLVnETwWpOZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=al9VC0PtiGVAW0RWjOnEmgAdBGPKKBpN5m55OXcVnlQ=;
 b=lPyat7Xgzu+sitl4qL9LHYr4epJ39OWiGnkHC1jqrjWtFdkhesgLQHa+wTjFVgfmsHOiIvp9rIZVOgcWBFSt8DnvKmdFCAwdauL1cD0wNuLVBlGguSMKGhjmmB8Hktk/l3btSACAWfvNACDTnKWMzX39HnjPZSPd7cljqrApBqUxAEyP89seLazMh0k+Nx4cIarFhGK3LL7YSFCiJbriOIyfc153Mwv+a8N2vQuIwC0WxMTxKh47+MfY0NhmYKeY6VSFZ4XdzL1fASeyE2Zl4L5vIgPKVWri6fdM0HAmQyGp1Ec4/4gFua/c2n+dAjCFfz1C7XhZJNd5bRifMVf0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=accenture.com; dmarc=pass action=none
 header.from=accenture.com; dkim=pass header.d=accenture.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=accenture.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al9VC0PtiGVAW0RWjOnEmgAdBGPKKBpN5m55OXcVnlQ=;
 b=c4Fs9x1v9qFCoBBwu5IN/LQe2wzfppdd7Fz4Vod+IZ4S1C1wkMbO0AybHxuTH67H3OXxIPDPtUaY+f2aBw686h0Y85kaPLYKw8fHzKvf/K6X6w+QN8JF85uWaXKDNBJ+I8iEN9Snwr62H3yZxKLy4suaQWB0ZIFbqmRgHoRPiBBy3lAKhQ8uQlk4g6bVvPtHIPXOuzDHHDpbLWOUgoxnfIvBh90AJl0MfTCS+djKlKylABoh1mxYJLiQpIPdD6vxaAiHxxf5N+3CaG0Nke7byAMmfnfYT6Lqf/HP8b/XHZW8ZzOedoY5BATkEP64TTLRlV/6hHVqmVvqQANd9utQsw==
Received: from BL0P114MB0802.NAMP114.PROD.OUTLOOK.COM (2603:10b6:208:b1::19)
 by BL1P114MB1505.NAMP114.PROD.OUTLOOK.COM (2603:10b6:208:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 11:53:30 +0000
Received: from BL0P114MB0802.NAMP114.PROD.OUTLOOK.COM
 ([fe80::dc92:bc52:2644:bc55]) by BL0P114MB0802.NAMP114.PROD.OUTLOOK.COM
 ([fe80::dc92:bc52:2644:bc55%7]) with mapi id 15.20.7025.022; Wed, 13 Dec 2023
 11:53:29 +0000
From: "Karaahmetoglu, Ahmet" <ahmet.karaahmetoglu@accenture.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [android] Device protected vs. user-credential protected storage, no
 tunnels before first unlock on modern Android?
Thread-Topic: [android] Device protected vs. user-credential protected
 storage, no tunnels before first unlock on modern Android?
Thread-Index: AdotusCQFdyMWnXNTxCToG5Fao3Nzg==
Date: Wed, 13 Dec 2023 11:53:29 +0000
Message-ID: <BL0P114MB08021FF0D2666BECAFB26DA6EF8DA@BL0P114MB0802.NAMP114.PROD.OUTLOOK.COM>
Accept-Language: en-US, tr-TR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=accenture.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0P114MB0802:EE_|BL1P114MB1505:EE_
x-ms-office365-filtering-correlation-id: 8eb201e8-9ada-4ce2-f3cd-08dbfbd21fc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mis9+rgnEoHsnaaIuPZpuvJOq/qbI8iS8EORRnS6XLkAB+xWh3bNrV0nBKlfIkVWqLYTVeyChyuHabzXm4eKuOdU+J1/4O3JABkfA9Y5/clcvzA58eJmySM+oYf6ZVP+MebAGZgznn7gLBg7asYqpyuHv3OM1IcYIyhCvTtH+nPRXAz3g6sAZOqCQrEw/Snp6giW6z3TcHntOepc75yNLmprdF5APv7M48iZ+lwWyjlVyfg5t6cSfmpSI4Digw4emK4YVDg0FYaZUovieYtuX+oDNJIdTVzSSigCXoUymTXyXwr7VdbuIK5RKf5YczjsMV5TDQagMM7JsrKZH4VzGBFeNzgJjLVK4FiL5kCxq9gtu8DxOsFKHDGVr1h1fyj2MdZ9SWDjRhgFOaO1jG+6CXqq2RDgVRTJakHUJOlrpRkaWcewChZfzC3YjzEIemyvrJp4idS8cQZyNW+JlsavU0bskhfEcYvRdhhh9pTw8uPm0aTJMXEXiq56JblIHDFGV7JsYkg6aipE2Rln1Fs27qLNY5rekyTiVxRqqvEdv+bt7wIr04CA2RNlPPi1kDZtwaLmZfULhrKa4pRPWbiAKihEvqxszI9QUfn0nKggVgRQ4W/fJeNNDZo2ZU9KIJeudESmYatBN7bqo22gXRMXZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0P114MB0802.NAMP114.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(316002)(6916009)(66556008)(66446008)(66946007)(64756008)(66476007)(76116006)(5660300002)(52536014)(8676002)(8936002)(66899024)(86362001)(41300700001)(122000001)(83380400001)(71200400001)(33656002)(82950400001)(82960400001)(26005)(38100700002)(55016003)(15974865002)(966005)(38070700009)(7696005)(478600001)(6506007)(55236004)(9686003)(18886075002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WZGd9/V51lodrRce9OLnzDvQgVpKeWYPMGw/3ElsjYtrKKXVNqNVW15dHlUs?=
 =?us-ascii?Q?pBCXyOHTtmaHcSYQgGiEVACst/pV5/0M3Yhg8YE5GGV9ayk/9ogZBK+jupTy?=
 =?us-ascii?Q?TbVVrc9h15McNb654fSKPRxXNV0honfvO1tvBAe7waEc1OGAOT3daOWWoMQo?=
 =?us-ascii?Q?pWWX/AVJaeZrtj0kmPlcdVh567G3D+/qz2CAXpXNaYIAztJ6prREnuXJ7++N?=
 =?us-ascii?Q?fC2NiZjlAr83V5nBrwOQb8+75tCBRXuOfFwrBhu6OpfbuXKJkY/VH8e5X+xo?=
 =?us-ascii?Q?cD+fLhXqtjQ1GcZD1tSmW3oTWN/W1yIIWxBK8gxg78CbqPVBPrQAKg2oKMjv?=
 =?us-ascii?Q?wxvLG9xzKUTXsOGmCl6cfb73B1hAcbRNQByD9MI4ZEj/dfKCh/LNZBNDQK0w?=
 =?us-ascii?Q?G2V75lPsesgoqLhD3tNZY0rHJ1776pH3qMj//f/aXkKvVf9BLrAGCRP/hsFx?=
 =?us-ascii?Q?I1187VMugcKwCp9wy6cHcv9XFpxmK7nQlVV9Jn4AOpa0CBNnH9pxtNIfhBlQ?=
 =?us-ascii?Q?A8eV2LmUZW2Rp9jStLf+YFSjhnSwmidO8lmiDEDxL1hTfkxhdCSixf/p93bv?=
 =?us-ascii?Q?Tw+my+o9JRLkDPr18N+4Vg2ZuKe0og0Vb2rxzJTj9/7Yq59XlEooASHuB9T8?=
 =?us-ascii?Q?xl/guLOOoKoGdM1g7o7yDTTGr0hsYvDwSZJWrlOoAXkrdfmlEdQWmFbUKJVH?=
 =?us-ascii?Q?ysZLqbIwdAILsg5nvE9i9XOFsUIHnxk0cuGJfQbiST2Cz9pZ25bTyuJI2Lc7?=
 =?us-ascii?Q?TrPHNQLIq9i7PulkJKwsoPwfGSrudbXeHdrz74vFOp4bAB2dyVGtEaz5QT/7?=
 =?us-ascii?Q?5a41nUbi5a5vMJRbxcYILNXfXY2kGhmdbIyaQJvlFOYbUEvRn/HXwNxowNOj?=
 =?us-ascii?Q?92dQWuTrj9M4/uiU4wj13+CpnBEIG4TYLlW+jwJNtDdRdrt0c2v52RJSUn3X?=
 =?us-ascii?Q?Oze1pYmT3e8CY+8LigWFplktCURo6jT6bJ7TumLaFkjOeOeN2P+BJvplY3tT?=
 =?us-ascii?Q?qXofeVAAlnjZ6dujmmgxvWu3FMMYaK6Ws6MQtgC75v0CNxsdd5NUdttoSqEb?=
 =?us-ascii?Q?d4WMeZ2SezDsKnnfZdrnL8zFRDUbInl5jFnZQeP8iwcNsWaH8lyJRNygn3se?=
 =?us-ascii?Q?MQO1MRGz7Uv084ciGLWGgOvQqV259ZCELKVhFwb1/BLJiWDtoU6amhdbYxhu?=
 =?us-ascii?Q?YKewKnELzUgCnIT5xLue5aCqI0MYuW65UYZpRUtLUipRo1MxWty8Mh+oNXRG?=
 =?us-ascii?Q?6exrZwxu92GfPkyyhpr4u3TIIrx69UeTavwk6oSZrme0P1CStoZu1sSULuYm?=
 =?us-ascii?Q?UNc+V5BKVs5YdsQx+4c2dZbQVecanRQ8mGTzKp75zN+dt/wVtoR7J+8J8h2O?=
 =?us-ascii?Q?edZneUsx94/MP3cUUM4bn5CZwg7SrsBpltDtCi8R4YJ0eZGTqLw7UaEJU8u0?=
 =?us-ascii?Q?lSKo8gFghu4s8omj44FNqmTUoS8+6kxPKGJzJJpd8K/yPz6xlU2OAphY5Pnd?=
 =?us-ascii?Q?sQKfR9eCpeIb5q/5qvrHhmP4LMhjx+kkgzPiPDc7JZV97XNF7PR5UB5CYbyS?=
 =?us-ascii?Q?pZUUjOGvHwbT1aOQ5qnCMtXUSVF0IYxlOrq+GVydOeFAWL0VWdZRHAMeNnQK?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: accenture.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0P114MB0802.NAMP114.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb201e8-9ada-4ce2-f3cd-08dbfbd21fc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 11:53:29.7634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0793d39-0939-496d-b129-198edd916feb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxrAg6dHr5eU+i5NV4883A+/Cn4Zd760OKrZEQ7xaezY8We3dxJ0H4s6f0UoeWnMyISgBsfFFj93muoElj2k29a6yM9S+wKBc5P+wTzppE8SECZt/yekjjUm8wZRE2+y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1P114MB1505
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Dear WireGuard community,

It seems that for accessing tunnel configurations the different components =
of wireguard-android only support accessing the user-credential protected s=
torage (/data/data/). This path is usually not available before first unloc=
k on modern Android, so WireGuard is not able to access its configuration.

I was wondering if this in on purpose or are there any plans on adding supp=
ort for device protected storage (/data/data_de/)? Actually, I would assume=
 that storing tunnel configurations there is essential for always_on_vpn_lo=
ckdown to be working - which seems to be supported by WireGuard when lookin=
g at Android VPN settings. But this can hardly be the case - if I'm not mis=
taken.

So, any hints/background information about the situation is highly apprecia=
ted.

Thank you very much in advance, and kind regards,
Ahmet Karaahmetoglu


________________________________

This message is for the designated recipient only and may contain privilege=
d, proprietary, or otherwise confidential information. If you have received=
 it in error, please notify the sender immediately and delete the original.=
 Any other use of the e-mail by you is prohibited. Where allowed by local l=
aw, electronic communications with Accenture and its affiliates, including =
e-mail and instant messaging (including content), may be scanned by our sys=
tems for the purposes of information security, AI-powered support capabilit=
ies, and assessment of internal compliance with Accenture policy. Your priv=
acy is important to us. Accenture uses your personal data only in complianc=
e with data protection laws. For further information on how Accenture proce=
sses your personal data, please see our privacy statement at https://www.ac=
centure.com/us-en/privacy-policy.
___________________________________________________________________________=
___________

www.accenture.com
