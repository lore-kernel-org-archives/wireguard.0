Return-Path: <SRS0=G6+c=O4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49F1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Oct 2021 21:49:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3C661027
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Oct 2021 21:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED3C661027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=northwestern.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b88e173;
	Fri, 8 Oct 2021 21:47:43 +0000 (UTC)
Received: from chcspprf11.ads.northwestern.edu
 (chcspprf11.ads.northwestern.edu [165.124.29.101])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf68737d
 for <wireguard@lists.zx2c4.com>; Fri, 8 Oct 2021 20:50:07 +0000 (UTC)
Received: from pps.filterd (chcspprf11.ads.northwestern.edu [127.0.0.1])
 by chcspprf11.ads.northwestern.edu (8.16.0.43/8.16.0.43) with SMTP id
 198KMGs2016921
 for <wireguard@lists.zx2c4.com>; Fri, 8 Oct 2021 15:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northwestern.edu;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint;
 bh=OUFJEbgB9XgRh1RriLtexljvo+/U9mhBST+PomG+0d0=;
 b=NMXHkwe/OTD2icTJgfA0zasWUZAOHACgs/OYttDA+dlhzyvPgwuWE6tsza1Lchp5NVh4
 4AISOnBAQzdh4fRE6xpFTfKezFpq+/9HjalXK0WJShnHmrSY1DT9YkuuEnjOUnKXNNpR
 poFOSmbbds2oEX+AVe0s6OephojbLbAt9pqiv3k+FpoWurQQlELhcn0Nt0zU+4umxg8m
 CuAqki+eneswkUhLrMsZ+ZM3HdGHDkF08ovhgndI33XYe+Sg77m2cPIS9Uj0DCB+fWTQ
 pT7fKtY4Xq3uKnEcd0BYEXDN0XFfrXdhQzrCSPBIgYrmTMXfSOdt55v0KXbFmVozaOaN 3g== 
Received: from chcspmbx05.ads.northwestern.edu
 (chcspmbx05.ads.northwestern.edu [165.124.43.218])
 by chcspprf11.ads.northwestern.edu with ESMTP id 3bhu2cfk0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Fri, 08 Oct 2021 15:50:06 -0500
Received: from CHCSPCAS04.ads.northwestern.edu (165.124.43.210) by
 chcspmbx05.ads.northwestern.edu (165.124.43.218) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 8 Oct 2021 15:50:05 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 CHCSPCAS04.ads.northwestern.edu (165.124.43.210) with Microsoft SMTP
 Server
 (TLS) id 15.0.1497.23 via Frontend Transport; Fri, 8 Oct 2021 15:50:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIpDCsovtc0c4QOTP1zgfHLkZyMfMnhC+7AtMcwb8kiCGWelFJUFvJxokQv2f1wqxjDelye3P1DmEWAGzy9thqWLz/0cHsxLQYfDxL+ohDkpSz3TEG6gwuK8SJHD4E59oR0/1Z2YQhNyCIbb8HOXb78ArEkjya34NpzgZfTmXIgWhakVyPf2X86/DlHvgN5RCIdSLSpFEMdvJq3yqE/WSHSq5d7auJYHaY+D6ZRdK9/qr6BAngYtjpthlJZKXlkrfQJz/qzRHrtJhX55elZHevBZ0Mnyp4TkLYrLRlsdv1GMQrLNtIU+nDmVlIsPyufhVsNEIzpB57kw7Yv0e7bTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUFJEbgB9XgRh1RriLtexljvo+/U9mhBST+PomG+0d0=;
 b=JhKg3YpXn03fc+Cefi4179J/Mlsxd1wmTcLpS9b6Z9AFtlrCQRrJhPCOGsvITbnLfOqg5LQ4SN07pPECbJEOwN7qSjZlNM50xaf+P5WEwZG5H1u3EUOCGJr+SRLYVf09ZH4ImjeP3PKcZPArtzi/j9MuN2TlZ8lKWW8PtsL6WwC2UXbJwUqh0Gj8pv3kqwTgBDRWNKGlh9Z5L+sP+41Xjtzv9rOrvjRnmGVPoIcpMM9un2hSbRQys0V+d1zj4pCCAEnXIUkiVmYWzaAE5d6avOUI7HoI8kHW/Uakv1iMBh98X30pLugaNQJpDSaQxj6MQ4X2P37tPOJv4woq4WwO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northwestern.edu; dmarc=pass action=none
 header.from=northwestern.edu; dkim=pass header.d=northwestern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuwildcat.onmicrosoft.com; s=selector2-nuwildcat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUFJEbgB9XgRh1RriLtexljvo+/U9mhBST+PomG+0d0=;
 b=YmML8udLUO+CkfzD2TZGA5vSHWoJC/Nf3nSmikwvnsd7aVigRInQkjFH7Pl4qf24m4CbcR7kYC5ZdTWoRJ5G8SfZrdWdR0gxg7x13GOuYGh/kpYyDJgf3SkYKrJWVnwFpRPNAQVMecviMsIQnmRRZe9CjqA7g9gT1VjaNGVvKNY=
Received: from SA1PR05MB7966.namprd05.prod.outlook.com (2603:10b6:806:1a8::12)
 by SN6PR05MB4654.namprd05.prod.outlook.com (2603:10b6:805:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.15; Fri, 8 Oct
 2021 20:50:03 +0000
Received: from SA1PR05MB7966.namprd05.prod.outlook.com
 ([fe80::29b4:c44c:5f6b:d163]) by SA1PR05MB7966.namprd05.prod.outlook.com
 ([fe80::29b4:c44c:5f6b:d163%3]) with mapi id 15.20.4608.005; Fri, 8 Oct 2021
 20:50:03 +0000
From: Frank Wayne <frank.wayne@northwestern.edu>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Windows Log Output to Event Viewer or Text File
Thread-Topic: Windows Log Output to Event Viewer or Text File
Thread-Index: Ade8hXp6vXTKnBzbSjyqsCyYnavayg==
Date: Fri, 8 Oct 2021 20:50:03 +0000
Message-ID: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=northwestern.edu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77f9c682-e6b6-4b4a-d033-08d98a9d342b
x-ms-traffictypediagnostic: SN6PR05MB4654:
x-microsoft-antispam-prvs: <SN6PR05MB4654B5F3CA7ACE45D29CC70399B29@SN6PR05MB4654.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vFYhVB0fuGmXLRj7Hiy8DmmVTrxGqzfi681/aii6s/3uLDvsBgt8eA1sVrophRRuVTSrSH73p+MVdKh1rruObz0WfjK6gj8hzoTlgBzXS5kBHZMrqnbQC+h+n2UKjHwhRWxEXSa+6mBqQR3lr7UOdVcRVz1Klucyi+zaaRlWXK/dVu4OSr7tgLlv0+n7iPsgbKLRVFGQXhP/iExx1tlRHLMWW1uAmvakL3Y3biBhpVzhJtADkASQ+i2OKoCG/wVCxLV2/v8tHK3L0LhQDf/WVgOUTkYdBLaEgLQH3zDacVnjnJy0fDwhzjDfPySC1ossTooItpPfDmQ7IZ5RMmxN7OBZETXIVb5MBp2bM4Jsl18rlUM+4tSv2/7DOJVODVcwbT73hrw0vJ8eFqRVDUwsM1TK1BwzgmfKFpSu5dDf7TFKQqkxAOvJdeGVruJrnnLpl6jl1DyvqGtXbol9Od/vfDN0BJS5B6oH7vDevJGu9vnFQWXaAZxMG0zQGGDqdkoF2oUYYbHizFVRRwVu/NAwlHVdUNpBPrUCIyv5wE1IFIH5OP6D+P9pRR6AQsrxuplAU89scImEmIB1v0JXuXo9vJqKkK9JxQYZGPyEGdkOTqbx4MLPPJ/SJIvQeVPEYOwvO1lD7KatPROHV8uRfOKzi0GBbKXVj19I0jh6mYNq9nBNcxuWct2R6eOEPtr23ocHYig1QdTx7y5zZl5ZVLC/5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR05MB7966.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(558084003)(122000001)(38100700002)(2906002)(71200400001)(75432002)(33656002)(66556008)(44832011)(55016002)(9686003)(64756008)(66446008)(786003)(316002)(7696005)(186003)(6916009)(6506007)(26005)(8676002)(52536014)(8936002)(5660300002)(66476007)(508600001)(83380400001)(38070700005)(66946007)(76116006)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R8zg82hcXBkaztw4ayxdeaQcVTE0O6baRNpq8gaiwKk2EwiVFXhBISqW+wLs?=
 =?us-ascii?Q?KBgNl5a27cqNHzvPuHZgdyKJiVM0OqMz4dd8sL2dIM+zZK5wykJMtFan36PH?=
 =?us-ascii?Q?7aTqvjdWxawxNwBl0b+/7RP7ZF8LtEEV8agM4adnjdhhpItkf13tOIj0+nl4?=
 =?us-ascii?Q?ha8nZXJggAjbn5w3rjZZwcwvkJGnXN5yzYt510N5liwOHkG8UHN24OYBSlf6?=
 =?us-ascii?Q?ca9QG9JKhYIbDGYI66ff3tQ9TQ7XEgXkvZ+g1VP7+/XhER+Jn1LdyhYhXXG0?=
 =?us-ascii?Q?Ua2Ta1SyNPASuvGnsQHOlHNfoenKFatf10Bk119ZgdEhD50H2GbAL+XcaaFd?=
 =?us-ascii?Q?2EbHN95eJv27Xe1UydmRmdSoYGU04jArKoBcHxzUGh2/G6bqeajmjRknkHdm?=
 =?us-ascii?Q?2Zln6cQ10Ie0zvm7LKsL3ou8DT6Egie7Y/R/GJ/0+rsal1UWwVPbmbSbRJxq?=
 =?us-ascii?Q?LQJvJhwvehBBaJzRIOpWqr8ZzhKQxLkDhXssOAEejUhYG1Y1+DmLzLLEyQ5R?=
 =?us-ascii?Q?dX4huqM0lboNT3QA36wQM07SqOG1thKxbKx4f3lKgSO4sPOOr+ithL9x7PJt?=
 =?us-ascii?Q?fNdAfySZ+UIXXxKtCYgPp4h7VNLHl00KHTJA/Eoe7RJH5xHpSHNHDBdL0Ojq?=
 =?us-ascii?Q?zkjH0cW2HMeujko5rRJIas2zF1yknR3aV4eKxRDnr+QQlpFUUwc31mZahr3p?=
 =?us-ascii?Q?lG3UeSz6/pcHWQkvt4GIXTaBTDRYYRD4ApZzdgLP1fo8fStJrtm445ORlETS?=
 =?us-ascii?Q?QpVbRvBoyL3TqmmWU+/B9wKUxsNnTocEZQe/FzwWi99qRbX3t1UF5pWrqQJ6?=
 =?us-ascii?Q?JfbvlKH48nyTgQixM13z0888qPk9fbYR0l6xnBJHjHgb7rbQUUaLECqqOAdt?=
 =?us-ascii?Q?YhJYSTEAXitn7/IuECl+zMu2BuAIn0TXHPjKbTpqXoCfUvD/Xqd04PuRIqV7?=
 =?us-ascii?Q?t/0gtD8hM/BfVKALWqNEXaum5iSN8sYzG1uQgp7er6uuUPDTCyLaDiMgrdxK?=
 =?us-ascii?Q?cyUGaTr1+kegctxkFQvXu3Rx6qVMmgf8Bw7N7RpDe101zksTmRh4c/t9bT7B?=
 =?us-ascii?Q?ImqcE/RhIiIPuwJC5FuyCxBWFEdxOeyuyNzhPp8Einrfg891YY9oxAs1+sG+?=
 =?us-ascii?Q?t07AT3mB3VgZgH5kXrvqzUZer94zeErpSUbLf15SmSUoyAcc29Hbhp3LJ8ke?=
 =?us-ascii?Q?Ndbx5M0DLtazSiUmzKFXbJBmLEjEIgo3NyE+BNbnXb0aZ/0QLNJ6cv7uj7/b?=
 =?us-ascii?Q?fpAOo7JpJ9ku4bzeA+yJJQ2xIK9GFColgtzjzt0Zyg/cZnlKh4S1G9BBHD0S?=
 =?us-ascii?Q?6dPYnQqUhsbEqJBjCjICzih/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR05MB7966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f9c682-e6b6-4b4a-d033-08d98a9d342b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 20:50:03.8295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d76d361-8277-4708-a477-64e8366cd1bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGc9pDAkK3clQeX0Sznv1xc1OYPf5YRATYteMEt8b2j6VekqhLR79o1A3O9riCJtH/Kg7YtUuXBe37SmvLgr1thc6IwDXj8kaeA7XrIF+/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4654
X-OriginatorOrg: northwestern.edu
X-Proofpoint-GUID: k2xdZcNHXDwFwUhejN-naFWvctRY0bOR
X-Proofpoint-ORIG-GUID: k2xdZcNHXDwFwUhejN-naFWvctRY0bOR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-10-08_06:2021-10-07,
 2021-10-08 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 08 Oct 2021 21:47:41 +0000
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

1. Is it possible to get WireGuard on Windows to output its logs to somethi=
ng other than the binary file "Data\log.bin"?=20

2. Is there a way to access the contents of the binary file outside of the =
WireGuard UI?

Frank Wayne
