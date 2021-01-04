Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638EDC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 18:59:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABCC5206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 18:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABCC5206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac492916;
	Mon, 4 Jan 2021 18:47:56 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092064087.outbound.protection.outlook.com [40.92.64.87])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 076a6bb0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 13:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beiVmaurPn6r2noK4WVOaDwMQyjAYMBZgzxVq4AQyQVMrLUG5zqixXrXbVoraPmg79vfeBcMxHBdDflddATWSd8B98ebuG5V+JqtCHWTZ/GwS2OBMbW8f4sOcGddpkHI8zmvV2lGlXoxfSgK1ZZX8BtDlaI9rcm1Yv+SVvGkcKOcSROJupwfNWo2cmSNzJWy8hCFT5wDkaBQw8PhD2+h65KPvqV4KJHNXxnvPctqQC1xFUQJPPgoRG8ZNhiBTLT5dlxiULhHRypLGENHDzm146YWwaVj7tRSHWJ3Y2ee30IqZw6v+p0JijpupJbFVEVypkueBDQitZactUOu2V3CLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWtI2qbjsuR3zpouXABrGrrEq4BgwJZBbTaXdAnWsgg=;
 b=e4dDjdAg2nPaUyUykWZjUB5hZ7mbjMB1XIn8WsCLKFyOftFFrPwH42QbwNTzNYh7XmhtuvEHohuHH6WbVlCJQUNEIA4Tn137QmSO1DZHUk5wHT+/kR/MKNOe2jWzHpHTJsZQvRkXtSiVLF0HR2xf+0o3Eg2yi6hAQC2sXjy6IMqK0MXqdA0EFtQnqX0slwruh/tYH9SZKNvNRU3/VOaNjGpHBheupmNptl7nz6wLmCHrQXipX6wj6zWGIb6m478PyEEVcPd5l5gouNywfyjwK7B9kTIsKmAppbnoReclh2j+VHGeweehVN0HZYQzSfDX+w0u3P2YIaDb3DoH+oyKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWtI2qbjsuR3zpouXABrGrrEq4BgwJZBbTaXdAnWsgg=;
 b=h1djrD6FhchZ4SJYVp6wRVq8RqZeMHXDzEm6ZRivwTXAdOU0F6VsW01HdccJWal6VvolMogF+DjQFvdpR9pgG9tS16NFR6HNcct2PYeXwGsYifpXl3GTtyfbc5jEE3PnI8n0SoLizc4KcH73kwTWkIIV8UaoizumpmfE5fqw9899QcqGV1GAMeheE/gsecUmMtXsVjQGk0oKeGd9zztyKcSO7LonSjWVym9P/SXapRrTFT8hv3DU6HDmIPn8DQIJaOMmHyGQ1Z33oj/DPRbQm5TvVwdKSylW1XGMfWr8CXs1nfunK2Hm5Q/MjF6iN4WidtlaSlqdIhXermF1ApwsAw==
Received: from DB5EUR01FT009.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::4b) by
 DB5EUR01HT159.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::466)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 13:22:31 +0000
Received: from AM7P191MB0883.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e1a::50)
 by DB5EUR01FT009.mail.protection.outlook.com
 (2a01:111:e400:7e1a::124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Mon, 4 Jan 2021 13:22:31 +0000
Received: from AM7P191MB0883.EURP191.PROD.OUTLOOK.COM
 ([fe80::44fa:9de8:7d52:5e20]) by AM7P191MB0883.EURP191.PROD.OUTLOOK.COM
 ([fe80::44fa:9de8:7d52:5e20%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 13:22:31 +0000
From: Gijs Conijn <egc112@outlook.com>
To: Chris Osicki <wg@osk.ch>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: RE: WG default routing
Thread-Topic: WG default routing
Thread-Index: AQHW4pbaOsnvZT6N8kyEOI7d4iaAxqoXcz1w
Date: Mon, 4 Jan 2021 13:22:31 +0000
Message-ID: <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
References: <20210103215441.GA24251@server>
In-Reply-To: <20210103215441.GA24251@server>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:62EA335472B7F9CCC86B7D81E00519A2E7A87249450C1C93CB08EB260472057A;
 UpperCasedChecksum:B28D38DA31D62B7FF96237D912E021F89B8BB6063E3B87E36E191C9230580CA1;
 SizeAsReceived:6759; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [stFJ9IuaO72UG3A9+yOF96b2nPo37uKw]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 78175dae-dcdf-475f-44bc-08d8b0b3caa7
x-ms-traffictypediagnostic: DB5EUR01HT159:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jmryXT+YGowjP8KmkGsESz08kji983+4pvdnoeQ87Of/m+yU9v3OFDe0LL3XPhe2U5SmHF2l1ArodVqTRcPBq2i25OJVjCEgqwfV6rRu3j/QUR/aW7luwZQ1Vjn8HP+J64/cbER5pQETlPxVHDwWYovoc3HfkOOgLXyL8Z2In7aHbsn4o2lYFzjhBErB4WMGOhu69YyYyJC7pj7hWbYbfWIMyNnw2R/9AulySCo19nKQ7jnDY3C+Q/QV8JPNy3jq
x-ms-exchange-antispam-messagedata: NUsKCqMb/tQREYI2L37C8fW57jgQE5BayorMW7Vl0BQdpCFShUs0l5QTrC3giHH3DYY6Inipb+GAXLj+Wk2t39y70pspaMN/9raTMxmIUsmwjWM0I/e+QJXJcYtbNKN375pE5v9dQzwu8kn3+OIYBA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT009.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 78175dae-dcdf-475f-44bc-08d8b0b3caa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 13:22:31.7713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT159
X-Mailman-Approved-At: Mon, 04 Jan 2021 19:47:54 +0100
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

That is what I am using the allowed IP's for
I only want to route via the tunnel to my home LAN so I enter the WG subnet=
 and the home LAN subnet in allowed IP's
(As I understood Allowed IP's are not only Allowed but also routed via the =
 tunnel)

Regards, Erik=20
DDWRT WireGuard user

-----Oorspronkelijk bericht-----
Van: WireGuard <wireguard-bounces@lists.zx2c4.com> Namens Chris Osicki
Verzonden: zondag 3 januari 2021 22:55
Aan: WireGuard mailing list <wireguard@lists.zx2c4.com>
Onderwerp: WG default routing

Hi

I am quite new to wireguard, moving after years of OpenVPN, and found it si=
mple and _really good_.
One thing, however, makes me wonder. Why WG tries always to take over all m=
y routing?
My first try was with wg-quick, and noticed all my traffic went through the=
 WG-VPN connection.
It escapes me why. What is the idea behind this policy?

On my Linux boxes it's not a problem, I don't have to use wg-quick and with=
 few lines of bash in a script I have what I need. I have root.
On my Android devices I don't have root, and I cannot change anything in ro=
uting etc.
Why don't you provide an option to specify which net to route which way?

Regards,
Chris
