Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E985C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 13:28:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A65CA61151
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 13:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A65CA61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=northwestern.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf164fbf;
	Fri, 15 Oct 2021 13:25:29 +0000 (UTC)
Received: from chcspprf12.ads.northwestern.edu
 (chcspprf12.ads.northwestern.edu [165.124.29.102])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32186d68
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 13:25:26 +0000 (UTC)
Received: from pps.filterd (chcspprf12.ads.northwestern.edu [127.0.0.1])
 by chcspprf12.ads.northwestern.edu (8.16.0.43/8.16.0.43) with SMTP id
 19FDH9gg018616; Fri, 15 Oct 2021 08:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northwestern.edu;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=vIt6wkaulvEEnNS/dqfapwUgbGoF9V4CFZb7hfJiJf0=;
 b=d7Q/JPspGxz1st0wJQiTG9h56ZsKfZPNgtFhx/x/9JOWDqPPtUvY36GJPEzQ1254cJSq
 TnSGEcd2aFOdvD10A9jXPuYXUQDoF5v+BDMvY5lC/s0dY2TS9pNl1QsGQb6KjD+gNtfJ
 d9mALatPpTv8uXbhMIM+g8Lb+RNiNm3YA6Nehj98frLeiZDSeevHog/8+XkXOmbuQzwH
 uAcN80E5mUdnjLFoq/8MyR4dTCN8K5n4/miqgVvODxD645AKAXC3oPoRZaClUhp78X7o
 AZNCR6d9re5QC3vWbgIoRusCEyih/sr7Xl82T1yP/DsVPj2Towty80aK1oYab1GabtP7 qA== 
Received: from chcspmbx05.ads.northwestern.edu
 (chcspmbx05.ads.northwestern.edu [165.124.43.218])
 by chcspprf12.ads.northwestern.edu with ESMTP id 3bq4rqt1v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 08:25:24 -0500
Received: from CHCSPEXCH01.ads.northwestern.edu (165.124.43.220) by
 chcspmbx05.ads.northwestern.edu (165.124.43.218) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 15 Oct 2021 08:25:23 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by CHCSPEXCH01.ads.northwestern.edu (165.124.43.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.13 via Frontend Transport; Fri, 15 Oct 2021 08:25:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMrpqg7qLjS1TcFsKZVH0Axhs/bWpNxKqvpiyBstCxgAd8d/uEdZ0csf5EbPPluRoZ590EVfvdOq72tG8tTQmxufkU5/w4ait257WXKlF4L5zKBUlKipLj2NqIDjlLU9/C46jH7EXaLbVMbKURt5YTbU+Sak0CXSIv8CNqnfnUZiH4FPXfR/QD3TST6wuEWGTBcRWt0KNGSjyhVDa8gJgTKCN6m7UoI7NEhFBGRkY7e3PEkDy/pyW6fzoBDMkosmCwqWoqu57dVjWt4Qmk9xPKESHSuFr15uBshjooj+2b0V67FqQ2z0vbqc030yzCMcDapHQjLlIvFxTFGwzcwoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIt6wkaulvEEnNS/dqfapwUgbGoF9V4CFZb7hfJiJf0=;
 b=JBKFwunCsOv95KQkimjeKjOAFinf7bvnyWQ790nBKdsjUhLt1S5Sq9CmFtUfIJtAMeCQNtoHE+FMGzl0lf1yh3WfW/HQLZ0alHoYrN7p9RJX2IoLp7C2VDiU18iDrJRAZpBrdp8iC2KSkkTRemx2GPRl0VpkSMhDFpPfMZWuzGsjSb8+diDFK+cYcEtyC+oUg0gfSXpv/+BMWWmCawIQMP0bE6AsZqt4qJzSCT7KTESrlRNivOsbXNJnK86jMkR2QeLjSxA8McxJT2mbw02IHqcX/TDT0XleuRdojuuA8mweDXWQHDlx9zu8Arljsy2+cuzodY29vAqPbGOLhF5OhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northwestern.edu; dmarc=pass action=none
 header.from=northwestern.edu; dkim=pass header.d=northwestern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuwildcat.onmicrosoft.com; s=selector2-nuwildcat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIt6wkaulvEEnNS/dqfapwUgbGoF9V4CFZb7hfJiJf0=;
 b=n28+veIJ6kg95Q9GhtB4pgB2Myh/cBxVYhPGk8ZdgUG649AEUMpbc7Be8RV7unSeLHVjfieu1bnHz6N05mPrXh7n4n788jE50ppd6MzS2dhJHK4NR3/hQklt/6EiYgyP9Kb9Ngq+lZ+K45Xl6Jaql6lo7GI6x6E2UFRaGUG3k4Y=
Received: from PH0PR05MB7962.namprd05.prod.outlook.com (2603:10b6:510:79::6)
 by PH0PR05MB8590.namprd05.prod.outlook.com (2603:10b6:510:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.13; Fri, 15 Oct
 2021 13:25:22 +0000
Received: from PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e]) by PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e%5]) with mapi id 15.20.4628.011; Fri, 15 Oct 2021
 13:25:21 +0000
From: Frank Wayne <frank.wayne@northwestern.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Windows Log Output to Event Viewer or Text File
Thread-Topic: Windows Log Output to Event Viewer or Text File
Thread-Index: Ade8hXp6vXTKnBzbSjyqsCyYnavaygACoVmAAMgWpPAAAF8sgAAgcX6QAAq46YAAMLVwMAAFR/yAAAN2PXAAAITbAAAf8sRA
Date: Fri, 15 Oct 2021 13:25:21 +0000
Message-ID: <PH0PR05MB7962AD9044A813DE82AE796A99B99@PH0PR05MB7962.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
 <PH0PR05MB79620040C1298C80677C4BF999B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q9VB7eEsZCFUqo8XG7qj1pe2RwgLezJEHueF4_AjmA4A@mail.gmail.com>
In-Reply-To: <CAHmME9q9VB7eEsZCFUqo8XG7qj1pe2RwgLezJEHueF4_AjmA4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zx2c4.com; dkim=none (message not signed)
 header.d=none; zx2c4.com; dmarc=none action=none header.from=northwestern.edu; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2941421b-99fb-47ec-e4c6-08d98fdf3d64
x-ms-traffictypediagnostic: PH0PR05MB8590:
x-microsoft-antispam-prvs: <PH0PR05MB85907DFB7455E37DE25F9B9A99B99@PH0PR05MB8590.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qIeR+lsh8GCMyaE2mLlfz8WA55Ys28YzWMxLGljFBn3TWjEeW0pD6AGHgJlBvyfjQ7hc6JrRl2WFGjfCR7NaVRYEtExEGZmlBCwSliF63QTKhSI2cOSc7sjKjDDFJf+cwx0o1KzDwgJdqJbORwgyv2y/Vt3fb+PHipdfsfHS9cxblsERhPtHEsEJRxsyZEwVbwoKKINHChKcvWZDfDgPQJSL0J5po6NGPNt2yo9YsWCXHnHTUq9VpUOnBprRpmbVsafou9dIVPACmQbaoYqHyoFqDpMn4pn+tuc2LTGbLWQkuWVrhNS1enPChs2K1A5ioeadjzijms8Uxt0Xqo0VgQdVil89GoxlLk0B9GFN5ExfQs/CkYkYLRb/B+xOIKB8u9GDDJ/t7PFkDV3BYddwyxupNI09z7UY43/g373nbzo5taHUG55lE3npUC1x+UwnscnymJ2ROc4Ey5YQrDdfiRn0C0SFzwIhbGxMUPvm2oD0w+YkUOwt2Nrl/bzHhoitRe0qKw2flupgeWQuH/tKdzJe5Rfuq/sdtwOIuceIrGDpzP14Z2hy/1sOdof5vOeJ+vAPFPIMBFg9+jAmIlwAkbgf7UxCxvocl9/RwZsh4PHMQWmpTvYigwXyTeLzSrpg2z1r2JyZID4zpF+JsS1AM3qHGThqSpgZRbo6lLvND8rDwvSeLwRzCDiGVtjVjYec9+59V3FC7xSMsDxATi8Kag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR05MB7962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(6916009)(38070700005)(38100700002)(508600001)(75432002)(76116006)(33656002)(786003)(8936002)(6506007)(186003)(52536014)(8676002)(66556008)(66446008)(26005)(66476007)(66946007)(64756008)(7696005)(44832011)(5660300002)(122000001)(86362001)(4326008)(316002)(71200400001)(2906002)(4744005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG9tZm15SEh3T09jVU9VM1JjV28wT1FVcnlXdXVuY3FnSUtLVGk0SllqMDRZ?=
 =?utf-8?B?Z2xhVHZhNmFiaXlDU2pZczdIYUk0eVowZlFLQ2pwTHBmK2JsaUhxTXVUMWt6?=
 =?utf-8?B?MUl5b1J2bVQ2MVVodDRjdjhwUWw0Y3RWdUsvN1cvcXArNGEyajEyN3gyYmJO?=
 =?utf-8?B?R2VMNmxMNlVLM1A3a0hVSERySWpRYVBLcEZVdVRubU5ROTZFYnlKYzJaWXZR?=
 =?utf-8?B?SmZHSXRRK2xPeUQydXhzT1ROWGVhTlZsNExtR1hVOUpSb3dkT0xkU2Y2d21E?=
 =?utf-8?B?bVRKOXFvRFplNWtyUWYxN3lPQVhoaS9hUFByLzB5dUhZYlMxWWJ3SGJjcyth?=
 =?utf-8?B?K0xKVkFQOVpwUFZUSE54MlpNTkIrd0V0RWRQQ2JQaFNGeUJ2ZGkrUEZoVFRL?=
 =?utf-8?B?bVlVOU5pd0t0YlhMRW1HMGlWZTUwdWNEeitsdlFlbk1HYSthYnZ3U2ZHenlL?=
 =?utf-8?B?L1NFRUh5TjIzTUd2bXE5Z3lhNEp2bG04YjFYd1dIT3daODRlam53ZCswWVJ1?=
 =?utf-8?B?aFhjMzJZbW52VXlwNXpqdkhFaDY3MTB4M05aSGNUY0tSU3E3WVpydFZJNUNN?=
 =?utf-8?B?UWpJcG5TOTFNN1UzVW51UTZ2eXl4T3NYQXQyR2Z1TjlwQlpQMnAvMzRySzRC?=
 =?utf-8?B?Vk9ZVm15blZSd1ZnVkVWVElqclpFb0VySndGMG5uajFBU2FsMnJGZUovaUU4?=
 =?utf-8?B?T0tyMStwa2lsc1ZVNDJGbHpLWjJhd1BiSk80Vkh0bWphRWhQWWsvV2VDaXAx?=
 =?utf-8?B?OFV0Z1d6Y2NTbk9IOWNaYXI5aUVmNFFOL3YvNGZjaFZuQjIrc2srL3I1UFVR?=
 =?utf-8?B?ZS9qK3JyKzhITmhBRmtEZjJOWVd2a2RNLzRHc2FpdkZuRUt2TGxMeEYrOTdU?=
 =?utf-8?B?alZxQmtnOHhtSXZjd0ZTNkhWNjVITTRhcUsyTlFIL1RveWZGWEJIR1UwbTVj?=
 =?utf-8?B?cVpXTnpHbWZpeXZINThtYncwL3NEaTJUeHlwRVdtWXI3TFlIUkRZRU0zOUdx?=
 =?utf-8?B?SkR6cFV3ejRCOGtOQStLcHMvaWFKWm0wWXF1Qlk0VDJKRGx0RHJoMnFHYnZT?=
 =?utf-8?B?dkNBdXg1QmZxV0FsMDg4N1FrUk5UYVdNK2o2QnlpWitRL2E3a0kyRHArVWtt?=
 =?utf-8?B?K1ljUXJVSGNBVUtHcVRxUFY4MGp5M0tHb3hpSVZIbStVVmNBdnFDdlB6Qm01?=
 =?utf-8?B?NWJyT1lkMzVnNmo4bXJMd3ovejVFcm9MSFgrdU9FVm5IcGVSeDA0NHViWlVh?=
 =?utf-8?B?UnFpTk5EV0c0aTBIRVVjVHFzdVpNMDVqRGNwQ2RZZ3ZuTkp0cVYzT0xpSkx1?=
 =?utf-8?B?Y2ZpdDZ2UjNWSFVDRzlNYkozSzBtTFVCT3Nra3VFdmRkL3VuNHlpYVNiN3k2?=
 =?utf-8?B?eitSYnFtZzRLZ0ZKSGlaY0xSY25FMG0vdFZsd2NHNUh4VGNkbHg1dGhmTlJ4?=
 =?utf-8?B?RDIxWXczd1dSQWYvUzNEVmFXYVAvVW91Rkg5eFpPajFRM0lJOURQSmp1ZWNW?=
 =?utf-8?B?WXRkLzN1Yi9tZWNWb3VoTHZwSS9WSVpHVitaK05LckFlbmhNdjB3QlNnZ3VZ?=
 =?utf-8?B?MTF3UW9XNXJPYlM1UUw1Um8zZjQvQ2tUaXdkc01GVE9lcndYSTFNbllBNHJE?=
 =?utf-8?B?L0t1ZE1NWEdzYW5SUk1EWm5oak9sMHZ4QkdDOWlQc3BuSVlyVENhOGE5QkNs?=
 =?utf-8?B?aWhMWXo4cklkLzdNNlBtUXZ0RysyNG1UN3dUL0ZpNXNOTHVWaExPUkJyc21i?=
 =?utf-8?Q?BhAecKtEWbyfTSdJmySO3wfVCJgdCFBO1MUJXVd?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB7962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2941421b-99fb-47ec-e4c6-08d98fdf3d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 13:25:21.7568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d76d361-8277-4708-a477-64e8366cd1bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQNWkOqmmLwds+rhiZsFCS4eOtUq5Poukj5iM+CQ8hzM5b1Xz9sNbk3dWiAGfIdJ+f0mX8bsS5umLFBPs0T6fCDE2OQC3JxtCwv0+Jzdsqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8590
X-OriginatorOrg: northwestern.edu
X-Proofpoint-ORIG-GUID: SspDAWQXqWSkNvpxl72AFwmQKUsWICyu
X-Proofpoint-GUID: SspDAWQXqWSkNvpxl72AFwmQKUsWICyu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-15_04:2021-10-14,
 2021-10-15 signatures=0
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

SmFzb24sDQoNClBsZWFzZSB1bmRlcnN0YW5kIHRoYXQgdGhlIHF1ZXN0aW9ucywgYWx0aG91Z2gg
cmVhbCBjb25jZXJucywgYXJlIHJoZXRvcmljYWwgaW4gdGhlIGNvbnRleHQgb2YgdGhpcyBkaXNj
dXNzaW9uLiBJIGtub3cgdGhlIGFuc3dlcnMgdG8gdGhlbSwgYnV0IHRoZXkgYXJlIGludGVuZGVk
IHRvIHNlcnZlIGFzIGFuIGV4YW1wbGUgb2Ygd2h5IEkgY29uc2lkZXIgdGhlIHRhaWwgb3B0aW9u
IG9ubHkgYSBwYXJ0aWFsIHNvbHV0aW9uLiBUaGlzIGlzIG5vdCB0byBkaXNzdWFkZSB5b3UgZnJv
bSBpbXBsZW1lbnRpbmcgaXQ7IGl0IGlzIG1lcmVseSBhIHJlc3BvbnNlIHRvIHlvdXIgaW5jb21w
cmVoZW5zaW9uIG9mICJ3aHkgaXQgZmFpbHMgdG8gbWVldCIgbXkgZXhwZWN0YXRpb25zIG9mIGNv
bnZlbmllbmNlLCBldGMuDQogDQpGcmFuayBXYXluZQ0K
