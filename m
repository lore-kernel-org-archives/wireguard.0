Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6238AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3B361041
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A3B361041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=northwestern.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ed3211a;
	Thu, 14 Oct 2021 21:45:06 +0000 (UTC)
Received: from chcspprf11.ads.northwestern.edu
 (chcspprf11.ads.northwestern.edu [165.124.29.101])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3f4ac07
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 21:45:04 +0000 (UTC)
Received: from pps.filterd (chcspprf11.ads.northwestern.edu [127.0.0.1])
 by chcspprf11.ads.northwestern.edu (8.16.0.43/8.16.0.43) with SMTP id
 19ELgtwk012200; Thu, 14 Oct 2021 16:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northwestern.edu;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=nTP4ahSS/nZTPYbspQMqUhie6xLPWyoCAi3aznO9nXI=;
 b=a6DuzICofmbOAPtHhgew3Zy/rDFg8FzMmtEG4ysmdNE0MlJeUbcodEYegcSoDwLgzph/
 iN2s4N/pDTVjTQgYfyS0LvpsA8n89qrF952udf7HEDj3MInW0EU9yhDbSLHMeN6ByKUC
 Qp++S0I+N1/j9NZ2TPui7H8mcojQehWYELpJOfnc/611Tl/NXRW6RQ1jeLck4FqmLIei
 xwoX717Jq9jrJQhL63QZv3uPKSDpDuPEQI4m0tBLtEloDF2L8udNp/+gLZFEHaEq8B+d
 2tuSC3fI++1a/BlJ+M3RLlHNvAd5usiNGIPpmIb9V4Q3qV+srnkagLnmOQO6gVuuu4YX mA== 
Received: from chcspexch01.ads.northwestern.edu
 (chcspexch01.ads.northwestern.edu [165.124.43.220])
 by chcspprf11.ads.northwestern.edu with ESMTP id 3bny6q79kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 16:45:02 -0500
Received: from CHCSPCAS03.ads.northwestern.edu (165.124.43.209) by
 CHCSPEXCH01.ads.northwestern.edu (165.124.43.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.922.13; Thu, 14 Oct 2021 16:45:02 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by CHCSPCAS03.ads.northwestern.edu (165.124.43.209) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23 via Frontend Transport; Thu, 14 Oct 2021
 16:45:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGQIKsDi4+6i6HTrLGmLc+11foDpiZ0MfgiOt+z+Bm27IjQgyXeLaO5aSoJqtP+KI8Ct2BCwnBuRmA0Q6GHdgSvLj3+NP2PV++MfhxKLpMGbFA6aNwUBVBLP76MRqv/S0bCczXUsxfRUD5hxIiRX7EZWlFSCJMhnqvLEKL4eBvZAUfCLrolJmrieBKnhnfis13P0at3P3As0uUB9yYhfM20MX/4+SBe79Vj3HroTyxW4HLVwE7iHAoHzGIptw2wupZL1dYKtNeNgWyaB9fC0lODdU6pTNWzDNawLt+TfLFjzER1vt+noc/jjxxyApmoYeSagM/PResw1mLa/5AnAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTP4ahSS/nZTPYbspQMqUhie6xLPWyoCAi3aznO9nXI=;
 b=LI6ujZqJW1hYRmGnRc+XjjVcQtWsNWEWQEn9Bk+GbMgv46iA5klXXNdgKzHgHYSrllV6+SJXnsuHJfhL4pB906+jjGIl8n9QmbzK/SD2gJ7d7lPrJRSY/wb7oHtxa2Gx8xbhM3iQsgb5SVqGyQLBqTrdZxVkcPxLDHhAR/hBqzoVjyzeSyzhEMdbEYMRG2cYtr6kQSc58smGyZ5xt30xb31i7+J3nOBj0w/kPwOPAWtoX9CDOhT/S+K8CBsSGBNYHfj5FSKEB9xztc0X51NU0ARxS6zdIAEc9pU1asmemoRvY0Djcc+o+6fMW70JMh6tbgO339nEZyn5tIdEL8YfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northwestern.edu; dmarc=pass action=none
 header.from=northwestern.edu; dkim=pass header.d=northwestern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuwildcat.onmicrosoft.com; s=selector2-nuwildcat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTP4ahSS/nZTPYbspQMqUhie6xLPWyoCAi3aznO9nXI=;
 b=vxet0ek6iQ6Jcjx2fKr23nafwYfSMpP21u/GJPJYCG6I5OmUjqZ65pTA6SL4rBSv5+kKg7bsVQJOjGc8V55lOYZ1vOA3o7wbezhwl6OE5Ty/LFbWzVA7AzMDFwIT96OmG+QkPrzubD6CSBMF1JIzuuKq28nOpnEMVvvIolKc+f0=
Received: from PH0PR05MB7962.namprd05.prod.outlook.com (2603:10b6:510:79::6)
 by PH0PR05MB8448.namprd05.prod.outlook.com (2603:10b6:510:cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.8; Thu, 14 Oct
 2021 21:45:01 +0000
Received: from PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e]) by PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e%7]) with mapi id 15.20.4608.008; Thu, 14 Oct 2021
 21:45:01 +0000
From: Frank Wayne <frank.wayne@northwestern.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Windows Log Output to Event Viewer or Text File
Thread-Topic: Windows Log Output to Event Viewer or Text File
Thread-Index: Ade8hXp6vXTKnBzbSjyqsCyYnavaygACoVmAAMgWpPAAAF8sgAAgcX6QAAq46YAAMLVwMAAFR/yAAAN2PXA=
Date: Thu, 14 Oct 2021 21:45:01 +0000
Message-ID: <PH0PR05MB79620040C1298C80677C4BF999B89@PH0PR05MB7962.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
In-Reply-To: <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zx2c4.com; dkim=none (message not signed)
 header.d=none; zx2c4.com; dmarc=none action=none header.from=northwestern.edu; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ef2a75f-d25a-4230-28c2-08d98f5be008
x-ms-traffictypediagnostic: PH0PR05MB8448:
x-microsoft-antispam-prvs: <PH0PR05MB8448C2A25FEA80C8F24B105E99B89@PH0PR05MB8448.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UM++8CG70Tt7L1c8UQYI6XVXcSq78K8UO0bKOMeLyDsBFMUHKiNllZs/N6c/0Z+nTTQ/lCX2Vim5rkWjJCWuoHNxlyjgsMoulWt60DhsPpfbSrMiYTnQs4LuCvDgKGUJcEKPK+aOGJbuJUi7IIK4XEn4ivK+qYetew6cOK/GtvDs9JdSO7h/tlNS53VNoCzbaAfnkXOkKfkC+q4w/DVIjln6L+sYBFFN/0m/RbJPNuQ9AsyN12Rco+7rFQSOy8cqt0jJjLhjLjlO85SCxw3S7HBgjuTmsRAJ51DqrEll+QKGDj25fgX2b6/+TVKIEBK/b4g7puNc/te4uyHGQpK+TAiOJsCUueaSBHkkQL/2TjhT96ubZ5VUrJ02aJ4/52ijRlUK0jDq0FpSr0tddqSweO4XPT7Bzeb21zj8pMlQO6n503hQqB5pGtjNmYPwrWRv7Ag23VlxCLZfeTu+NxUcUqvNHaCFjG1cwo/V5mv1wIatQnhmBueVqhlMF6rZeY6FViN60DZhAhImk82BoAS8oBjJdnRp6jaMnDgROjxW/OAFo+3Fwud1r6ZKKjDGHQ8qWSgKSx0wlhgkyYEUUwednInpKsOn7Pe5Je/L0RnQH4SNgMoUcoMWxhU5Q60ky7S65H0ZfyKsyrUnpnBXfNBptKuKTy/kOJRL+QRzYJ16GRLUoAoFjKJDFxFVKE0wVH624f/vRuUYYSnH9UStJKDgHIyyPMtH9JWke1aij+SaryA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR05MB7962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(786003)(9686003)(508600001)(75432002)(44832011)(5660300002)(26005)(186003)(8936002)(55016002)(8676002)(86362001)(316002)(6916009)(52536014)(122000001)(6506007)(66476007)(38070700005)(53546011)(64756008)(7696005)(66446008)(71200400001)(83380400001)(2906002)(66946007)(76116006)(33656002)(38100700002)(66556008)(4326008)(460985005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0VxQlVTSGdIbk04NEhzUVVsbHZ3dFNxN0FlTGhiWHJzaUZUb2c0Z1VXdHl1?=
 =?utf-8?B?Q3JsYnVZeElYMEtSSGl0US9YcmorUFZrd3NXTGhoam9OM2tDbXg1UjBUalFV?=
 =?utf-8?B?bXV4ZXRFT2c1WC9aYXh2NnVLZnlHMzI3clpsNlRwSVFkeTBRZ3dEbzBuNWZw?=
 =?utf-8?B?UlB0cFpvaElQcXNEamoycHZuK3F4OGpzMmhjRmtwTGxDYWhKYXZzcnhOdEkw?=
 =?utf-8?B?aGNUcnYxL3FkZVhyMlZ3cVIyaEl0cU5Ocml0eHV6ZExUcU42NUlwdXVWWWd1?=
 =?utf-8?B?N012c2VybXRUT09kWmtncC80VUY3bklKOWYyNGhScXBFNmpqaVFjQytUNGhj?=
 =?utf-8?B?S0JpWmFJOHJrN2ZJdlk2RDRIanZ1NzBmNnQyRnUyVmpvOGhMR2xRTlRIVUNU?=
 =?utf-8?B?MFFzRC9JakxqYjIwdWN0eWhQeHpKdnhPbjFTd2lNWVNMaXFoRkRTemRHZU1p?=
 =?utf-8?B?OCtCYVRsTisrUFQ1TGRaQUU5VUtvcTFqSHNkZXdFVHptT2FUcFNyekNsMis3?=
 =?utf-8?B?bE5VcnBRbmRWbHdZY3FBb1l1MG8xWjczSjVoVzdSMDF6SFNldzRBUVBHUGYz?=
 =?utf-8?B?OFE1YitrcDJsa081VXBQQlJFMmNydHRBN1o2K01oM1FNeGpaOXp6WnNYeStj?=
 =?utf-8?B?YVFONDRzNWNLMFp1Q09ycnhQRW42ZEl1bGtmODBvaVk3MlUwSWpBQWp5Tlda?=
 =?utf-8?B?SEhPeXdjazdRT25rWXIvU1cxNTUvL3l5cGJ3aHFMTU1WSWx5QUxxKzZPR2gr?=
 =?utf-8?B?RnlxdG0vVkF2bWZ3NDBRd3VxYk5Cbm9sUXpoblp3MDMvQjArK0Q1QWYyVklQ?=
 =?utf-8?B?VDJyQ3ZlMjJxeTdJMGM1dEx2NENQazd1RC9MTWpQTW5DcGlDcUFBc05scElZ?=
 =?utf-8?B?QXVvdmR4RnR4K2wvY3dlc3cvRDVaVEgwRGpSMDZBc042aDhNM3dTZkpBL3NK?=
 =?utf-8?B?d0NZM1h1UW03azh2bjgzOUpJUVg4UXpsMTNia2JXRTB4dnpCOXVXSEZ5bll3?=
 =?utf-8?B?VnFxTCttUUhZMG9tR01MWEtlNDVzWE00aXF5UHIwaENza1p4VzRNVXpZMStD?=
 =?utf-8?B?QllLdStIUERQeUhLblRyc1lPQitXSUhQUG5NRFkreEVyTDFZcXBUd0w0Y1Bt?=
 =?utf-8?B?V1pEY1NFakN4a0NGWFFKUFAxM2FXMmFQbUFSK1Rja0U3V3VKR1gxSTJnNVds?=
 =?utf-8?B?aVVSaVIrOG1MNElidDdIWlVTT1ZiMlh2cjdEeFhaczRGakR0eWVlRmtCdTJq?=
 =?utf-8?B?bnZpWC9RZGhxNzlQWTFZak5LMlBkRmJFUDQ4Q1FzZG54N01LemhGOXlFN2J0?=
 =?utf-8?B?Mnp2ZFgxK2lSeGZtR2hQMW5DQjAvK2NmRkpqSlhDaWRWVUd4cXVPcEZwVVBx?=
 =?utf-8?B?M0RDcjkvazNubTlKRU9uSE9tRXJVb00yeXY4RHVXaVBtWk8zeWJxeXZGRXlo?=
 =?utf-8?B?ZGlidGU0UHV1SUwrN3dQTEZsVFBObTM0UlBuTExTeStCUmovZGZCWlRZWlRQ?=
 =?utf-8?B?WU5RdlA2RS9DUjRObmcrcDdHZFFWVG9MRU15THNESTQrWXdmU1oxeVFSbDRn?=
 =?utf-8?B?OUpkZmZEZ0t1SWRqS3VMN2U2bUxaMTlNckw4Tm5NcDc2QUhXRVdydTZSekxJ?=
 =?utf-8?B?VW5zQnF6VVZncVRoTWluYmlvcXdZTStpbTF1L0Z5QUx1aHNmOXA2MTc0VUF3?=
 =?utf-8?B?cUUrSjJRZEZMSTBVMVNxaDNIMUpLR1VUcHIrK0EwWHprZzFVTkNoTjVNNU5T?=
 =?utf-8?B?UlZmOE5DV1lmZXdnOXpXR29FcUFPTWIvNGdZS2QrT1V1QXVZTTFMOXZqV2Rj?=
 =?utf-8?B?N2k3WnMvNDJMZWpGdEFlSW9lbStXa1dwMU5RYUNQaXIxMkF1YVBJUDBab3Jj?=
 =?utf-8?B?Uk1ZRXp5ZWljRWRtWWo2RXZWNmdXYWJhRTlkdVRmYVBoa2p4eXJ6NGhadHpP?=
 =?utf-8?B?YmxpWFVxUTdTYWh1VGhqb2VDV25vM1RRL214WEs0MzlIWUkzb1BFY1BqNzNl?=
 =?utf-8?B?VDcvaEdGSWtBY0RzekZKYkFJYVB2WDNkODQxam5RaWFkU21pWmdWaEhXL1VM?=
 =?utf-8?B?Mm5rSTl4aWo5TkNXUmxWZ3F1SHZyTTlPK2orLytjZkFQemVsTVovckNyaGo5?=
 =?utf-8?B?enFtWC9veU9DL3drU0E4UGg5Z2wxNVFoRWtGZk9vNldLeWNzZ1lzYktObWdU?=
 =?utf-8?B?Q3ZVQ1RHK244Nk81djZ1ZW5aNUZhL2hMRERGUWxSdFg2STAyWnk0dHlmRng5?=
 =?utf-8?B?T3Nucjh5aU9NQXU3K3lKQ01mY3l3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB7962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef2a75f-d25a-4230-28c2-08d98f5be008
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 21:45:01.1768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d76d361-8277-4708-a477-64e8366cd1bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgVkgSclix8yuCub8xFKWqwbHoY4ht9zUU8VTnlMlBp6BypmEA2cPGbFs74yXNxxm2c0rbS9yKXxA7PAEq08g+7sQNkbPPgCzVNer9RGH5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8448
X-OriginatorOrg: northwestern.edu
X-Proofpoint-ORIG-GUID: fx5biWMU_1zH4wliGvmuQjia15cssS-o
X-Proofpoint-GUID: fx5biWMU_1zH4wliGvmuQjia15cssS-o
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-14_08:2021-10-14,
 2021-10-14 signatures=0
X-Proofpoint-Spam-Reason: safe
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

SmFzb24sDQoNCj4gRnJvbSB3aGF0IEkgY2FuIHNlZSwgbm9uZSBvZiB3aGF0IHlvdSd2ZSB3cml0
dGVuIGRlc2NyaWJlcyB3aGF0J3MgbGFja2luZyBpbiBhIHBvdGVudGlhbCBjb21tYW5kIHRoYXQg
d291bGQgdGFpbCB0aGUgd2lyZWd1YXJkIGxvZyBhbmQgcHJpbnQgaXQgdG8gc3RhbmRhcmQgb3V0
LCBwZXJwZXR1YWxseS4gQXQgbGVhc3QgSSBjb3VsZG4ndCBmaWd1cmUgaXQgb3V0IGZyb20gYSBj
bG9zZSByZWFkLiBBcyBJIHdyb3RlIGJlZm9yZSwgeW91IGNvdWxkIHRoZW4gcGlwZSB0aGlzIGlu
dG8gZXZlbnQgbG9nIG9yIGludG8gYW55IHBsYWNlIGVsc2UuIFlvdSBzcG9rZSBtb3JlIGFib3V0
IHdoeSBzbmFwc2hvdHRlZCBsb2dzIGFyZSBwcm9ibGVtYXRpYywgYW5kIEknbSBpbmNsaW5lZCB0
byBhZ3JlZSB3aXRoIHlvdSBmb3IgYSBmZXcgcmVhc29ucyAodGhvdWdoIG5vdCB0aGUgb25lIHlv
dSBtZW50aW9uZWQpLiBCdXQgd2hhdCBJJ20gc3VnZ2VzdGluZyBpcyBhIHRhaWwgbW9kZSwgdGhh
dCBrZWVwcyBzcGl0dGluZyBvdXQgbmV3IGxvZ3MgYXMgdGhleSBhcnJpdmUuIEFyZSBwaXBlcyBw
cm9ibGVtYXRpYz8gSXMgdGhlcmUgbm8gaW5nZXN0b3IgdGhhdCByZWFkcyBkYXRhIGZyb20gc3Rk
aW4gdGhhdCB3b3VsZCBiZSBjb252ZW5pZW50IHRvIHlvdT8gV2hlcmUgZG9lcyB0aGUgdGFpbCBh
cHByb2FjaCBmYWxsIHNob3J0PyBEb2VzIHRoZSBtZXNzYWdlLWJhc2VkIGFwcHJvYWNoIG9mIGV2
ZW50IGxvZyBjbGFzaCB3aXRoIHRoZSBsaW5lLWJhc2VkIGFwcHJvYWNoIG9mIHdpcmVndWFyZCdz
IHVuaXgtbGlrZSBsb2dzPyBJIHdvdWxkIGxpa2UgdG8gZnVsbHkgdW5kZXJzdGFuZCB3aGF0IGFi
b3V0IHRoaXMgYXBwcm9hY2ggZmFpbHMgdG8gbWVldCB5b3VyIGRlc2lnbiBjcml0ZXJpYS4NCg0K
SSB0aGluayB0YWlsIG1vZGUgY291bGQgd29yay4gSXQgd291bGQgYmUgZWFzaWVyIHRoYW4gcGFy
c2luZyB0aGUgYmluYXJ5IGZpbGUuIEkgY2FuIHdyaXRlIGEgc2NyaXB0IHRoYXQgcnVucyB3aXJl
Z3VhcmQuZXhlIGNvbnRpbnVvdXNseSB3aXRoIHRoZSB0YWlsIG9wdGlvbiBhbmQgY29sbGVjdCBz
dGRvdXQuIE1heWJlIGl0IGNhbiBiZSBtYWRlIHRvIHdvcmsgdW5pdmVyc2FsbHkgd2l0aCBtaW5p
bWFsIGVmZm9ydCwgc28gdGhhdCBpdCB3b3JrcyBwcm9ibGVtLWZyZWUgb24gd2hhdGV2ZXIgV2ly
ZUd1YXJkIGhvc3RzIEkgcHVzaCBpdCB0by4gSWYgeW91IHdyaXRlIGl0LCBJJ2xsIHRyeSBpdC4N
Cg0KPiBPbmUgdGhpbmcgd2UgY291bGQgcHJldHR5IGVhc2lseSBkbyBpcyBhZGQgYSAiV2lyZUd1
YXJkRXZlbnRMb2dnZXIiDQpzZXJ2aWNlLCB7dW4sfWluc3RhbGxhYmxlIHdpdGg6DQoNCj4+IHdp
cmVndWFyZCAvaW5zdGFsbGV2ZW50bG9nZ2VyDQo+PiB3aXJlZ3VhcmQgL3VuaW5zdGFsbGV2ZW50
bG9nZ2VyDQoNCj53aGljaCB3b3VsZCB0aGVuIHNjb29wIHVwIHRoZSBiaW5hcnkgbG9nIGFzIGl0
IGdyb3dzIGFuZCBzcGl0IGl0IG91dCB0byBldmVudCBsb2dnZXIsIGluIHJlYWwgdGltZS4gVGhp
cyB3b3VsZG4ndCBiZSB0b28gaGFyZCB0byBkby4NCj5Ib3dldmVyLCBJIHdvdWxkIHJlYWxseSBs
aWtlIHRvIGZpcnN0IHVuZGVyc3RhbmQgcHJlY2lzZWx5IHdoYXQgdGhlIHNob3J0Y29taW5ncyB3
b3VsZCBiZSBpbiBhIHNpbXBsZXIgdGFpbCBzdWJjb21tYW5kLiBUaGF0IHNlZW1zIGEgbG90IG1v
cmUgdmVyc2F0aWxlIGFuZCBzaW1wbGVyIHRvIGltcGxlbWVudCB0b28uDQoNClRoZSBzZXJ2aWNl
IGFwcHJvYWNoIGlzIGludGVyZXN0aW5nLCB0b28uIEl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gaW5n
ZXN0Lg0KDQpJbiB0ZXJtcyBvZiBzaG9ydGNvbWluZ3MsIGNvbnNpZGVyIHRoZSB0eXBpY2FsIG9y
Z2FuaXphdGlvbiB0aGF0IHdhbnRzIHRvIGNvbGxlY3QgbG9ncyB3aXRoIChmb3IgZXhhbXBsZSkg
U3BsdW5rLg0KDQpUaGV5IHdhbnQgdG8gY29sbGVjdCBFeGNoYW5nZSBNYWlsIGxvZ3MuIFRoZSBT
cGx1bmsgYWRtaW5pc3RyYXRvciB3cml0ZXMgYSBtb25pdG9yIHN0YW56YSBmb3IgZWFjaCBFdmVu
dCBMb2cgYW5kIGVhY2ggZGlyZWN0b3J5IHdpdGggdGV4dCBsb2dzLCBwdXNoZXMgaXQgdG8gdGhl
IHNlcnZlcnMsIGFuZCBsb2cgZXZlbnRzIGJlZ2luIHBvdXJpbmcgaW4gdG8gaW5kZXhlcnMuDQoN
ClRoZXkgd2FudCB0byBjb2xsZWN0IFBvc3RmaXggbG9ncy4gU2FtZSBwcm9jZXNzLCBkaWZmZXJl
bnQgT1MuDQoNClRoZXkgd2FudCB0byBjb2xsZWN0IGFwcGxpYW5jZSBzeXNsb2dzLiBTZXQgdXAg
Zm9yd2FyZGluZyB0byBhIFNwbHVuayBsaXN0ZW5lciBhbmQgZG9uZS4NCg0KVGhleSB3YW50IHRv
IGNvbGxlY3QgV2lyZUd1YXJkIGxvZ3MuIFdlbGwsIG5vdyB0aGF0J3MgZGlmZmVyZW50LCBidXQg
b25seSBvbiBXaW5kb3dzLiBIZXJlLCB5b3UgbmVlZCB0byB3cml0ZSBhIHNjcmlwdCB0aGF0IHJ1
bnMgc29mdHdhcmUgZXh0ZXJuYWwgdG8gU3BsdW5rLCBhbmQgcnVucyBpdCBjb250aW51b3VzbHks
IGFuZCBjb2xsZWN0cyB0aGUgb3V0cHV0LiBXaWxsIGV2ZXJ5IGhvc3QgaGF2ZSBXaXJlR3VhcmQg
aW5zdGFsbGVkPyBGb3JldmVyPyBUaGUgc2NyaXB0IHdpbGwgaGF2ZSB0byBjaGVjayB0aGF0IHRo
ZSBwcm9kdWN0IGlzIGluc3RhbGxlZCBvciBlbHNlIGNvbnRpbnVvdXNseSBnZW5lcmF0ZSBlcnJv
cnMuIElzIHdpcmVndWFyZC5leGUgaW4gdGhlIFBBVEg/IEZvciB0aGUgdXNlciB0aGF0IFNwbHVu
ayBydW5zIHVuZGVyPyBEb2VzIHRoYXQgdXNlciBoYXZlIHBlcm1pc3Npb25zIHRvIHRoZSBXaXJl
R3VhcmQgcHJvZ3JhbSBkaXJlY3Rvcnk/IFNob3VsZCB0aGUgc2NyaXB0IGNoZWNrIHRoZSByZWdp
c3RyeSBmb3IgdGhlIGV4ZWN1dGFibGUncyBsb2NhdGlvbiBpZiBpdCdzIG5vdCBpbiB0aGUgcGF0
aD8gQ2FuIHdlIHJ1biB0aGF0IHNjcmlwdCBvbiBlbmRwb2ludHMgd2l0aG91dCBjaGVja2luZyBl
YWNoIHRlYW0ncyBzZWN1cml0eSBwb2xpY3kgcmVnYXJkaW5nIGluLWhvdXNlIHNvZnR3YXJlIHJ1
bm5pbmcgZXhlY3V0YWJsZXMgb3V0c2lkZSBvZiBpdHMgc2NvcGU/DQoNCkkgZG9uJ3Qga25vdyB3
aGF0IGFsbCB0aGUgc2hvcnRjb21pbmdzIG9mIGEgdGFpbCBzdWJjb21tYW5kIGFyZSwgYnV0IHRo
ZXNlIHF1ZXN0aW9ucyBjb21lIHRvIG1pbmQgZXZlbiBiZWZvcmUgYW55IGRldmVsb3BtZW50IGlz
IHN0YXJ0ZWQuIFNvIGlzIHRhaWwgbW9yZSB2ZXJzYXRpbGUgYW5kIHNpbXBsZXI/IEZvciB3aG9t
Pw0KDQpUaGF0IHNhaWQsIEkgdGhpbmsgaXQgd291bGQgYmUgYSBnb29kIHN0YXJ0Lg0KDQpGcmFu
ayBXYXluZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmFzb24gQS4gRG9u
ZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+IA0KU2VudDogVGh1cnNkYXksIDE0IE9jdG9iZXIsIDIw
MjEgMTU6MDMNClRvOiBGcmFuayBXYXluZSA8ZnJhbmsud2F5bmVAbm9ydGh3ZXN0ZXJuLmVkdT4N
CkNjOiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0IDx3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tPg0K
U3ViamVjdDogUmU6IFdpbmRvd3MgTG9nIE91dHB1dCB0byBFdmVudCBWaWV3ZXIgb3IgVGV4dCBG
aWxlDQoNCkhpIEZyYW5rLA0KDQpGcm9tIHdoYXQgSSBjYW4gc2VlLCBub25lIG9mIHdoYXQgeW91
J3ZlIHdyaXR0ZW4gZGVzY3JpYmVzIHdoYXQncyBsYWNraW5nIGluIGEgcG90ZW50aWFsIGNvbW1h
bmQgdGhhdCB3b3VsZCB0YWlsIHRoZSB3aXJlZ3VhcmQgbG9nIGFuZCBwcmludCBpdCB0byBzdGFu
ZGFyZCBvdXQsIHBlcnBldHVhbGx5LiBBdCBsZWFzdCBJIGNvdWxkbid0IGZpZ3VyZSBpdCBvdXQg
ZnJvbSBhIGNsb3NlIHJlYWQuIEFzIEkgd3JvdGUgYmVmb3JlLCB5b3UgY291bGQgdGhlbiBwaXBl
IHRoaXMgaW50byBldmVudCBsb2cgb3IgaW50byBhbnkgcGxhY2UgZWxzZS4gWW91IHNwb2tlIG1v
cmUgYWJvdXQgd2h5IHNuYXBzaG90dGVkIGxvZ3MgYXJlIHByb2JsZW1hdGljLCBhbmQgSSdtIGlu
Y2xpbmVkIHRvIGFncmVlIHdpdGggeW91IGZvciBhIGZldyByZWFzb25zICh0aG91Z2ggbm90IHRo
ZSBvbmUgeW91IG1lbnRpb25lZCkuIEJ1dCB3aGF0IEknbSBzdWdnZXN0aW5nIGlzIGEgdGFpbCBt
b2RlLCB0aGF0IGtlZXBzIHNwaXR0aW5nIG91dCBuZXcgbG9ncyBhcyB0aGV5IGFycml2ZS4gQXJl
IHBpcGVzIHByb2JsZW1hdGljPyBJcyB0aGVyZSBubyBpbmdlc3RvciB0aGF0IHJlYWRzIGRhdGEg
ZnJvbSBzdGRpbiB0aGF0IHdvdWxkIGJlIGNvbnZlbmllbnQgdG8geW91PyBXaGVyZSBkb2VzIHRo
ZSB0YWlsIGFwcHJvYWNoIGZhbGwgc2hvcnQ/IERvZXMgdGhlIG1lc3NhZ2UtYmFzZWQgYXBwcm9h
Y2ggb2YgZXZlbnQgbG9nIGNsYXNoIHdpdGggdGhlIGxpbmUtYmFzZWQgYXBwcm9hY2ggb2Ygd2ly
ZWd1YXJkJ3MgdW5peC1saWtlIGxvZ3M/IEkgd291bGQgbGlrZSB0byBmdWxseSB1bmRlcnN0YW5k
IHdoYXQgYWJvdXQgdGhpcyBhcHByb2FjaCBmYWlscyB0byBtZWV0IHlvdXIgZGVzaWduIGNyaXRl
cmlhLg0KDQpPbmUgdGhpbmcgd2UgY291bGQgcHJldHR5IGVhc2lseSBkbyBpcyBhZGQgYSAiV2ly
ZUd1YXJkRXZlbnRMb2dnZXIiDQpzZXJ2aWNlLCB7dW4sfWluc3RhbGxhYmxlIHdpdGg6DQoNCj4g
d2lyZWd1YXJkIC9pbnN0YWxsZXZlbnRsb2dnZXINCj4gd2lyZWd1YXJkIC91bmluc3RhbGxldmVu
dGxvZ2dlcg0KDQp3aGljaCB3b3VsZCB0aGVuIHNjb29wIHVwIHRoZSBiaW5hcnkgbG9nIGFzIGl0
IGdyb3dzIGFuZCBzcGl0IGl0IG91dCB0byBldmVudCBsb2dnZXIsIGluIHJlYWwgdGltZS4gVGhp
cyB3b3VsZG4ndCBiZSB0b28gaGFyZCB0byBkby4NCkhvd2V2ZXIsIEkgd291bGQgcmVhbGx5IGxp
a2UgdG8gZmlyc3QgdW5kZXJzdGFuZCBwcmVjaXNlbHkgd2hhdCB0aGUgc2hvcnRjb21pbmdzIHdv
dWxkIGJlIGluIGEgc2ltcGxlciB0YWlsIHN1YmNvbW1hbmQuIFRoYXQgc2VlbXMgYSBsb3QgbW9y
ZSB2ZXJzYXRpbGUgYW5kIHNpbXBsZXIgdG8gaW1wbGVtZW50IHRvby4NCg0KVGhhbmtzLA0KSmFz
b24NCg==
