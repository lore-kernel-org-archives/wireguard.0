Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C5EC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D9360F6D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0D9360F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a35ea886;
	Mon, 2 Aug 2021 13:14:18 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2052.outbound.protection.outlook.com [40.92.40.52])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0b5f449
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Jul 2021 05:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3NETBuHAo+4EWH+1naEMt23xbCOGt4wfFH0SWwFEUqUwIQ0Vt4fDvlhElKrpnPhlfqF1Ej6oRhRpzs0VETMYB/vEq3Zmgfe3pRxvI4TVl+GX9YUSn+Lx0lgt6yOn1Jowb0keMYwHrb5lTqautMRWoTUR97W8OWRmieux2ODUuhVBJZi5e4FUwbxoNJRq3ZKMrA2LaI4q1r7BaKjXds/XVu5AUUJw4qjs/eIH+U4vMAKC+V9UPGyTwVKDq6JNMzrvR47UToG7ozHs3TFRG/soQvTooJaETDaZyh2fU6ys1nrAb8NrPBKmu0M25/EQLfUsVyOdgCqvmgH66QLZiFHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGQt4hFWkociciM5QlPwxi+c3TaxMzg91SC0pYGilXg=;
 b=kkf4D08YiqI2tdXhEnzPGYyPSHmRiIQrTdZFDqn2jgiNIYGKAgrpEQS6FNG5C8ly9wAPoTPX2OIJJDcat+75n/NoJ2hfKgRREpkGy5uMSvkVG2SEclgXNbIGvD49uMYVfPosPjhe6HWDyLlocn26fWTy9/txgvQQjMx372Og0XijU8IOZt3o7SdmEhi14Az2pXxFR5jxkIuynb7qT6wa9MmBxrIwh015s5aRJ2Yqy00+otjwdpEuiV1wXKz2yZuEFFjTmXm8qyV8PQA9dQKoJst/4DqF0CnD1iX45+5TOT24fEGuToSCUs5GPxOBWXKgqVvp1lUDc3BVF0NJJFztyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGQt4hFWkociciM5QlPwxi+c3TaxMzg91SC0pYGilXg=;
 b=H6sK0DUW5SzI8Mizz5+uS8WZQal4+e/B22/dEwn8UAyPZb3pp8plBc3zDfweJy1WvODcTQMy54+3Ri+t3iKUrP4Ax3OEIqLFzn6lF9WvaJCQUu9TGXA82gwRpYA6Z0Z/U24DCErDI3awGJmsc5OdXPpQJoDycRTxqvBfTYvcf5PgNJVl0VCW1VbtvhN0XumnIEEC9GaS1cXmhvV0mB0t5byWe0C6yeJG9brtziQZ+qGECIQOiNqtyujyIxUDDV4MM0f9BLKwOIn0aLZNNwmNkn6xLggkj1Oa0N6KfIpkwSsxugIK3jRSa21JCRef/rf1mVI2eCdmbhOOr5RtgZnrVQ==
Received: from BN7NAM10FT040.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::43) by
 BN7NAM10HT046.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::452)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 05:48:07 +0000
Received: from DS7PR07MB7591.namprd07.prod.outlook.com
 (2a01:111:e400:7e8f::48) by BN7NAM10FT040.mail.protection.outlook.com
 (2a01:111:e400:7e8f::238) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 05:48:07 +0000
Received: from DS7PR07MB7591.namprd07.prod.outlook.com
 ([fe80::3071:6cd1:89d6:e7cd]) by DS7PR07MB7591.namprd07.prod.outlook.com
 ([fe80::3071:6cd1:89d6:e7cd%7]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 05:48:07 +0000
From: matt spaethe <mspaethe@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: wireguard command line, dumplog and GUI pop-up in 0.3.16
Thread-Topic: wireguard command line, dumplog and GUI pop-up in 0.3.16
Thread-Index: Add0hSMgimWruSSvQcGnAqKkW01LsgAAEpBQ
Date: Fri, 9 Jul 2021 05:48:07 +0000
Message-ID: <DS7PR07MB759127E1827ED9A3CBB69D43CF189@DS7PR07MB7591.namprd07.prod.outlook.com>
References: <DS7PR07MB7591F166B9EC0B30DB10D5B0CF189@DS7PR07MB7591.namprd07.prod.outlook.com>
In-Reply-To: <DS7PR07MB7591F166B9EC0B30DB10D5B0CF189@DS7PR07MB7591.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:E203F24D9F84C9A50111DCA851FA78F2C33E99C8ECDF6F253AEC946E6D37222C;
 UpperCasedChecksum:D563BE5406EF2B7F90BE9D5E7BEC7CC60F00D1FEA24D377679423AA85D5B7437;
 SizeAsReceived:6878; Count:43
x-tmn: [PiX9V9N4q+iWkWIRXyKT0aadIalOmtst]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: be10c4e0-a675-4d8f-5a75-08d9429d20ed
x-ms-traffictypediagnostic: BN7NAM10HT046:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eC9nEU5dSki0LepcugePzqM6UsJOkxa0jJye2zKTN9t6Dz7p6HF9QqCODNb4VdMkXIcKKmjkT27iOWbp3Yay7af2Na7fA9m19FCqeCY3Sxyr0QOo4i1NYuFZLPfg+uF5ZLqvYVy/T/sMiH0E45IhrpkL6l7NUJnSHwDiApaZT9pBTpu0LYC/efYDA20jkYgEmcyJyIs/5b/Ji+5QwVIdQ9CZwqXXTGE54jAEKrk9d5pCCrRcvJKgQsOhQYNM4ivFupF2EqA+BbN99QYJPjgXB9SdiXzzuSjRIMcjeZW7SyoF73vZ/NgEvAfH64OIdkKHPQj2079JLQZD4LBTeEYYwge6plvQDCoV/08GKKkKrBVdSbbAhsjmCyPWRWei1dmRu8uMhf2LlDhSwOAlqQEssa4ZctpMo7AWDLRSB4w5IU3loVp3p9S6Bsz/bRNVjPLa
x-ms-exchange-antispam-messagedata: sT+ZMa6rU6ydyFUP7TE7+sTs0eWvkdgo2VN/ZW7/fDb0PjteFXe5sw0Zds4Ja/0OGPPTHcRxmYN3QDAChnjuzQC+JV8yWg5Z9gA7pMUengymotnZPjKL4rEF578qOnAVJvjxNQpd1Gy1NYH3eoFjBg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT040.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: be10c4e0-a675-4d8f-5a75-08d9429d20ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 05:48:07.8265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT046
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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

Hi,

I installed wireguard 0.3.16 as a tunnel on Windows 10 IoT.=A0 When I attem=
pt to dump the log buffer to file, I get a pop up about usage of wireguard =
command line.=A0 I then verified that I can still perform /dumplog on a sec=
ond machine with 0.3.14.

I then went to a third machine with 0.3.14 and /dumplog worked successfully=
.=A0 I then upgraded to 0.3.16 from inside WireGuard Manager on this machin=
e.=A0 In the same Windows shell, the command 'wireguard /dumplog log.txt' r=
esults in a pop up about command line usage.

I've been trying to run without Manager because I don't want users accident=
ly shutting down the wireguard tunnel.=A0 So to look at logs, I use the com=
mand line option /dumplog.

Thank you,
Matt
