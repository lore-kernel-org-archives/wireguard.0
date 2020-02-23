Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81551C35DF0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759EF2072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walker.earth header.i=@walker.earth header.b="p52cElI+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759EF2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=walker.earth
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fcecfb3;
	Tue, 25 Feb 2020 00:43:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3378b044
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 16:22:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2135.outbound.protection.outlook.com [40.107.22.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e02719dc
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 16:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPM1I2Nw1gkUDOB9oP5daVsEJSbqK+ncZ2dN+EgMaFOdMZmwTf73f/gsFQgOoT0pv7Tfa81vcnQgDsPA2dClopQlwsaNw+hJh2I0Gzpw54DREKF6kbdZ1EBul9E/WiLbhGE+u+PAe51eypNjI3lrgtG80IvzEqg0Th0zvQoxAYnKl2CiueZS01x8gxVCaX7k8a3rMMWmSfEFalkE9CBTY91Q3J8lQQG6RNBQKhDjkT8sSG7fQkZDTxSLimkDuj14/h2brjP3Sa3Zehre9Oz35OHzQmBwGawKfGvxvzX/NFNcdovSTm294BamTXVY1mwNqhrIzdPKUyXtnPxc3C/+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fBodo9Tnw05EihXwWrlvv3/XOlvg7rvt6Zy1JsdeuE=;
 b=Kp9uHHvZXjjVBBsf+KIloKEIbvRys/rKOw/UpSmxnR2WRrcV80iOU6Nd79Fyb/lXcKKnUyn2/5kq3d7twdYxnZ0iABXvMWr9srP674TGY09NXn8iGgaLPKDacDFvmeycCpyrkgqxQr6pWP2FBANMOtKqsauhEWV6hs/fziwPvxbt5q4ssodnhvs3rtPZjaXTvAqpz8BzzcrwhblpqdoFm382eoOOSMA9OPPEo6HZerYHVq86F2LMtFP/ZrTViD51+qlPE21Sspo2clf/Nxo4prZylYJ1s2mdNvsr/9Y0mkWZMckk7w51zA+y5YEaR279mp0bWrgUP9AM1HPtxUvAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=walker.earth; dmarc=pass action=none header.from=walker.earth;
 dkim=pass header.d=walker.earth; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walker.earth;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fBodo9Tnw05EihXwWrlvv3/XOlvg7rvt6Zy1JsdeuE=;
 b=p52cElI+fxld+w3aJrMkd7GCyd26NjBu1TyBLpnxOw5cutQDIz5gMv7ZFHWRiSHY64634xghaNKlpNTGChg7KKISEoy8Yo7A1j4jVduZhWxGhhk4QaoSlYyRjSNPodPWKLHXARt50ZR1/3/hHUQJgS2GP5I5hIySC4wke1Otk+c=
Received: from AM0PR03MB4354.eurprd03.prod.outlook.com (20.177.41.143) by
 AM0PR03MB6084.eurprd03.prod.outlook.com (20.179.39.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Sun, 23 Feb 2020 16:25:26 +0000
Received: from AM0PR03MB4354.eurprd03.prod.outlook.com
 ([fe80::4538:1377:1440:9ae6]) by AM0PR03MB4354.eurprd03.prod.outlook.com
 ([fe80::4538:1377:1440:9ae6%6]) with mapi id 15.20.2750.021; Sun, 23 Feb 2020
 16:25:26 +0000
From: Maurice Walker <maurice@walker.earth>
To: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
Thread-Topic: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
Thread-Index: AdXqZPlKmTqbmje8QT2M1WMdtTHVuQ==
Date: Sun, 23 Feb 2020 16:25:26 +0000
Message-ID: <AM0PR03MB435421232B923FCE2962C7B0DCEF0@AM0PR03MB4354.eurprd03.prod.outlook.com>
Accept-Language: en-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maurice@walker.earth; 
x-originating-ip: [2a02:8071:31be:6201:e0b7:607:4801:73bc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acf15a36-03fe-4021-cb89-08d7b87cfda8
x-ms-traffictypediagnostic: AM0PR03MB6084:
x-microsoft-antispam-prvs: <AM0PR03MB60848BAB298DA8EAC879E36DDCEF0@AM0PR03MB6084.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0322B4EDE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39830400003)(366004)(346002)(136003)(189003)(199004)(2906002)(66946007)(71200400001)(52536014)(66556008)(316002)(66476007)(6506007)(508600001)(66446008)(64756008)(5660300002)(9686003)(55016002)(81156014)(8676002)(76116006)(7696005)(186003)(8936002)(81166006)(33656002)(4326008)(6916009)(86362001)(46492005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR03MB6084;
 H:AM0PR03MB4354.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: walker.earth does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QcRemKAw5QrWhDlhFvlFWVvHFUtblWOJFWGCMqK+gwTnuWiadztKkWHI6Gpb38flIE7kClC6JHo4oZ/yGpsrkX4t+ZP8YoXtAzukwE3Z5PUfGSwWr+6R7Z48nPqXCdeVDeZ09b8jI1fGz9eWyC2xZN/GARfhhr7sKWNUdOjIkYJePaV3q/sn98atadRs0sHsrEq8jqmgN5aZA5cl6jyl3Thzs2VETV3ICKzRyVpHOZyCsEVj8oI+UvMS8iDY4FNEOWs6SUYscMgIOxeII6HrvO1RkqjEKuxW1ey5Jqm1zMjIushcX3cmRFEZdBR8xR7mEPZdj6y+sihQ8FFMA3DNV9XC0wv75FbeOav/h+5Htr+lRA5DzoUOCznZsWqmCoAVcrga/XWVZphFMMInVb9ZUC7/cDi3mcsHs5B01b8i+z5MOZm7EVq5jy2yP39tp4JUWEpbc1f++pxiHClRKDSAj/hNUW9EYDAbpDzWfN9NYY4=
x-ms-exchange-antispam-messagedata: edlWqF/tglhWb93oBIVAz8nrEaxVHTT9Q9gTvTReIz/TjRzo6e0cwpMlZ/o/NvcBes6fqIWCEUIZ4pJnXp4x74lDRnXEaOmWsVWiwdflJA33ZCW3HIPsgkmoL5XzrQeLox1EaXHuT89wzVdsOPOw01QS31eBH9z/Hr5Qi5lM613JS5cvvHmnBLiLo470ErYNlQDn9K50sz/D/YqJ8mTWUg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: walker.earth
X-MS-Exchange-CrossTenant-Network-Message-Id: acf15a36-03fe-4021-cb89-08d7b87cfda8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2020 16:25:26.6438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0547d8f4-2a6b-4582-bed6-f413072064c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UIddv3cvLv5P0xa1a6rLCpBRBY9kFPW3mn1YKma0PdhZ8IAUexq76vhpf6XmB1cKiDWCttH3kLYM3/cD20+VZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6084
X-Mailman-Approved-At: Tue, 25 Feb 2020 01:43:43 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Matthias,

Thanks for the explanation.

I did some more testing on Windows. If the peer FQDN resolves to both AAAA and
A, WireGuard seems to check for an interface with an IPv4 address (other than
link-local or loopback). If there is one, it uses IPv4, otherwise IPv6. The
issue is that it doesn't seem to check whether there actually is an IPv4 route
to the peer. So as long as there is any IPv4 address on any interface, WG
doesn't use IPv6 - even if there is no IPv4 default gateway (or other IPv4
route to the peer).
Since it already seems to perform some rudimentary IPv4 connectivity check,
a simple check of the routing table could be a stopgap fix.

> Thus the frontend needs to remember all addresses, send one to the
> driver, wait a bit, check whether a link could be established, then try
> with another peer address. Repeat until success.

Right, that would ultimately be what one would wish for. But until this is
implemented, WG should at least prefer IPv6 over IPv4.

Cheers,

Maurice

(Sorry for double posting. I mailed again after the first mail had been on
hold for moderator approval for three days. I will be more patient this time.)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
