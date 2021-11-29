Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4525C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Nov 2021 15:50:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b83b47c8;
	Mon, 29 Nov 2021 15:47:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eb2798f1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Nov 2021 15:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhjO9DjvjFCqdMfeMv4vC2Rczloks+/wcaclUK+om+5Va7JqM1BwnSPFs5dYamp1robWtZAnjQbggdn252avOJUSDCajR51l8anU9fiEzv/u+Xrh3goDRLNw7zzAY811TsPlPj3zZkqFyMCNZctJj4VmrxePtMlKaH6fO3YfV9ItW64whI4uuqwuEevoKeuFZ2qJbd+KasRG5hrla3i9ROQiadS4XWzL2n9rSCW2rvWdOQvCzkRxj0LTKnsKe7ECBjn6EOyBUdeLKC+6lTPAzSRE3AP3yqSUdJpVZxZOPGC2xC5StdfePz83rXV7gwUeQ9tWtIp8MG5GVevEdtAOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMjJPfE9PQPz2OjJoIzZ1kRUEccdiE3Oc9siWElPnZI=;
 b=GV4y4DOYmSNoxTh1xbvVelXb9PQLt8l9GvOQLocyL7UA5OFk6ZxJcu4M8+opTZzEv7VupaBAsSEzoUh1ut9L0Zi9rJUXGv/uG6vMIilO9tv39LsHcGQNF4r8c1+zj7BvGlwLstEhE7WRz9CDel3Lo0zYXzAmrvtgk9I29eFwAZ//Xx5DeAIWaQ7aqkDbZmEhBDwvQLk/eu1JGGuEGmkqslPK7epLW2f4Zi6WRDSL7HdOvTWjjHoJcg6yyOH/FQnzcJmbXL+Y79H0+K2jSWC2DrunBAfmE3uGOQR6fH5d0ZqqhaTklBI08DFoBNTTrRA/hmKA9JDTdCzyyTBzC3/qow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eagleeyet.net; dmarc=pass action=none
 header.from=eagleeyet.net; dkim=pass header.d=eagleeyet.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eagleeyet.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMjJPfE9PQPz2OjJoIzZ1kRUEccdiE3Oc9siWElPnZI=;
 b=DrUHAAV5sQNHGKEcAjF2UpYpyrqhnIWsZlL0kVKOdhSQgLLKVHgCdO38n02+aA9wv5+nmTkQMJblIw0CPEtyQS/X/cvh0SoFyELunng1OkFXspIB9dA2HFTgTxeMtA3m5wYXF/H+CMB/g9Ernc0BOJ3boP/ElutFSUqTd6wJfXwFhvWYqIk20s0KEA4owMpvDoc1U+g3/l30UV58s2JsVw7EKPuErN8IE6m31GX8f86JvSKkxF1G5JrteYRsfHq4r8OUgItsWJwsLchWX/2O476JEnWMtN3rQCyGRqDRfU2QSGgw4eLJWbsb2CJrFdCF/DzgOhIWZ4c4uVzn7vGEew==
Received: from VE1PR08MB5837.eurprd08.prod.outlook.com (2603:10a6:800:1a9::23)
 by VI1PR0801MB1902.eurprd08.prod.outlook.com (2603:10a6:800:88::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Mon, 29 Nov
 2021 15:47:52 +0000
Received: from VE1PR08MB5837.eurprd08.prod.outlook.com
 ([fe80::6140:e93a:1deb:ba36]) by VE1PR08MB5837.eurprd08.prod.outlook.com
 ([fe80::6140:e93a:1deb:ba36%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 15:47:52 +0000
From: Jonathan Aquilina <jaquilina@eagleeyet.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Watchguard T35 site to site with wireguard tunnel
Thread-Topic: Watchguard T35 site to site with wireguard tunnel
Thread-Index: AQHX5ThpgoN8zfefGkKm5PF4jY3+Ew==
Date: Mon, 29 Nov 2021 15:47:52 +0000
Message-ID: <VE1PR08MB58376D02F4068133D5B52F30A0669@VE1PR08MB5837.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: edde1dfe-4779-08fa-ca4d-c46218cb9adc
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eagleeyet.net;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb881866-70b3-4ca2-f20d-08d9b34f9aad
x-ms-traffictypediagnostic: VI1PR0801MB1902:
x-microsoft-antispam-prvs: <VI1PR0801MB19027F330C84BB2828F77212A0669@VI1PR0801MB1902.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SEEnNp4el7xfIbeHJh6fdziLSqMdZiYsNlO8FokjByrZvVZ5cKrPsfSzct0PdObTy7mkH7lyR0MG1GfQdRj6yVJ7GU+k5T1p77r85+KLIwfshtUFcI1NpqzwqDbKEFu431NLId9qCX4/rUDOXLdTIcuxzd9+dbkFRdHf8b2UU3V1pNaZBuTZVRTsO/AVhQRXw8bMDus5/5U8Xxgdt5c1LWRJad9lnsjSYCA2dZew0H8/Ppa+VQe8NQo83SYER8oAcsgq9BxvHOU9wh0ux1fwiKwicxPj2yhj1wPZXC+SvoutJyiPJofMXAqgLx1PXXEoJLLPG9Pmn0HEJ55Fj9nrsCekux+5FASeLuubgzc4LUpXyrLUH9lFKO4YBhauk9q2qWXR9175k8Ezqw+xMfhHFyUJw0rWTBiw8j2MwiFgim+0iX4NNunVFxQbMOw4fVP/aoaSbEmF9Nuhu/H6KWMezwosxs8bsQ+BvanvaSTdpe+NS+dDWsjffJzhV14jk32dXuFqtIYX+a/ILnv+0qGzjW6aO8uPrSmcAaCqfEFKF7krD/sXr/YjOwEdyk8+sLZh2EJnUDVuqiCf3XZGRLNDnEbsw5lqXBg4t9hkilYBNQB/IrUyjpA3YEwaYPsgwhnh00naoOG/ofCWPtLY1Lv79TwGuPWCpbCg4slmAGLWz7eCNUFR3KR6WgCyWOedgUoXekXoRlTKmSlZXLwSqzkO5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB5837.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39830400003)(396003)(346002)(6506007)(122000001)(26005)(558084003)(66556008)(64756008)(316002)(76116006)(38100700002)(2906002)(33656002)(5660300002)(7696005)(186003)(55016003)(38070700005)(71200400001)(66446008)(508600001)(8676002)(6916009)(9686003)(8936002)(86362001)(52536014)(66476007)(66946007)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Xs2x6MDNBhCMutrJ3ZFIII3EKwOGcx+0jp0LTPhSRMATIFVSwK0EM9wqMO?=
 =?iso-8859-1?Q?I6rG7QvDYvEG+Wm/4uVPmjwqRArx4CuhFv6/iBOM0kHlHzhFwYOZJi/299?=
 =?iso-8859-1?Q?LwXIArEC3o8cq3zwT/a7YFhFuc+Q4NjRi1y66GYV97lzNB8Qal2Imp4mq8?=
 =?iso-8859-1?Q?hxmTa+CRgGNKvCGpG00JOdA4ytgrZgU+qguGckzlnSxl3K58nv64BJtONM?=
 =?iso-8859-1?Q?lPGY03xJFQDCzPku1QgoiIJ9HNGcaWqTj6k1RLBhb+WyBv1u3c6xrF1RjF?=
 =?iso-8859-1?Q?AZ7R1KQJw+lVl/3kptgQNIl5JuMm+/FLlg5FEfNNPYmW43vfb4gOhAoNfM?=
 =?iso-8859-1?Q?W7+LrOwdg30mjWZi64PBBAzYRnhlJVPxWLl4Jers6PLt2018dJfZHsCURd?=
 =?iso-8859-1?Q?h6lnIRUbsp7SHBFOtwEe8jCvkHzqLQBr1HYPmxyyE8HaNq4E1xGFTUxPuV?=
 =?iso-8859-1?Q?82Jq7L1Y1uN7vui/321LRbAQ6r0IuXHfIdQLj2E0RX4lL6Kzbx5EC3I90S?=
 =?iso-8859-1?Q?D4yph7/rO/5y+J0GqeLa4BQeqCrK5fEtL9wBoKLRR++n1xpHiXJQvLpQGL?=
 =?iso-8859-1?Q?ihQs3dPkRMv9oTFO6+yVvO3350p4KN2f1HUDXPwSQgpK2NYDLJXAh2fJMB?=
 =?iso-8859-1?Q?o/XG2AsOz/e54KxPY6chThBO7tTz/ATAuL/aCEcz+56y4OhfykgqWOY9jj?=
 =?iso-8859-1?Q?PNeuJFYEgALV9nLeY/J8Jm/5Y2Oi47tHFoNQ0iiVYYuFBLSfkqxYiJr1Fc?=
 =?iso-8859-1?Q?vTj4ssZX3U1za4aa48XqARzaYKsS3j4zxXVeT+Fmdt98JNd0kxW5iAVKp2?=
 =?iso-8859-1?Q?BgttJoGKkfSPQwMT60NWMQxi0IddOik/EPLHt7aOgTw93uEPJJSYobPzXe?=
 =?iso-8859-1?Q?ylOU3YFTluMxEo8VeIr2nKoOd1NBUoEgJqeAPbfYs8zqF8whqTClc1GWZ2?=
 =?iso-8859-1?Q?cWOENjFSPR9uhREOZCe8C7N0as12cdB3PnMt1o3ZN5miG1XXj6h2kIh+kZ?=
 =?iso-8859-1?Q?NznFuFopfkRT6Ab+YqFK/zXGynmev15KcI6tl7YSDf+uj/m3lzYV/vrHVh?=
 =?iso-8859-1?Q?+wRORkpzfcGyMFR0zuk00KBYFHc4oeNCcnUdLhUZZs98HxzBaEAV6raU70?=
 =?iso-8859-1?Q?szc/TLJQOa3A2UC8m75hxXiMf7SmOMXPZWDU4pTyiGd0dO+/Fum6FZU2yZ?=
 =?iso-8859-1?Q?LHT+M43v34J8MMICPqEtB8D9Eg6k+pjI432NAlC+Egns4rUP6WYBhkuI6U?=
 =?iso-8859-1?Q?ETth/IDNpfNgd/+l3F5t9WxNFlULwYt6qete9hfoLKGSYwoQ8eqP6sv+kv?=
 =?iso-8859-1?Q?pAjC3wYiUp0lJ6xzNu9ET8r0WvizxvgP3Oc7zGKgKI5WFAYegYNm2SIB89?=
 =?iso-8859-1?Q?in3pBn3hCShW4Yg1eD2FnQ0wCqKitQPc4OclfreWLa+5o8oUyBA8qLwixN?=
 =?iso-8859-1?Q?qDyPuYf7WP71HMATbhp6YG9H0mSYKzn2PYc8ISGmIEKFYGb+1TuF+yIWpZ?=
 =?iso-8859-1?Q?0BDNLBLEeGQ2q9oQpHHJc+pAiK1Vb39bQplmFlS0DyJZTo4rv11hdKM9B+?=
 =?iso-8859-1?Q?HtzXzNwdPzkPRcGXVBmw0DhXy2+eUxFPwaWYPwnn8ulZdgWV4A45PMQhFF?=
 =?iso-8859-1?Q?h0S73pMgojmORH9Vvpa7S70l146WfaWPf/8KT6XABxRVp5hCLtee8mVt/D?=
 =?iso-8859-1?Q?v+kCuOKChWiGGlR26R0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eagleeyet.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5837.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb881866-70b3-4ca2-f20d-08d9b34f9aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 15:47:52.7698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 689fcbc3-edb4-45aa-9f50-cf9ecb3e505a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lqq8mORwV3dGfcypcmow8eQPH+8hn58aGLle9bGFaqKIlG19Q1vMM7PqS2eQffWOCUQMD4GliQP6UuKri+nONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1902
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

 Good Afternoon All,=0A=
=0A=
I am just doing some brain storming as I am considering revamping my infras=
tructure.=0A=
=0A=
As an edge device I have a watchguard T35. I am wondering if I could setup =
a site to site vpn from that device to a watchguard tunnel.=0A=
=0A=
Regards,=0A=
Jonathan=
