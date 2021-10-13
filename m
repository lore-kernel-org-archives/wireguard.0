Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20810C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 13:32:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFD260F94
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 13:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DFD260F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=northwestern.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccfa18eb;
	Wed, 13 Oct 2021 13:30:05 +0000 (UTC)
Received: from evcspprf12.ads.northwestern.edu
 (evcspprf12.ads.northwestern.edu [165.124.82.243])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfc3a8ff
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 13:30:02 +0000 (UTC)
Received: from pps.filterd (evcspprf12.ads.northwestern.edu [127.0.0.1])
 by evcspprf12.ads.northwestern.edu (8.16.0.43/8.16.0.43) with SMTP id
 19DDQiQK012571; Wed, 13 Oct 2021 08:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northwestern.edu;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=aJzuqvt8MoH68Ab0ik5g+BX0Xu0t/r5MrUN/rqp3QSw=;
 b=ZJ0jZSq8ZDEQtnUTfxpYwHAWAQwu57WPd8SPzY3tKgFJp3uCNbycsCqIZSISTS4dOcHM
 0ijFPLVyfL1020uZ/1kN88KuZMFNRxeBt367xXH3U0IxQ1wI6h1Dc+qynF2wlgG2lcUz
 SPAc8Mw8gnDgRANkRufLZoQWN7frKblE9dQ61qrWtNJ4KDbrDQr8DlBNKdpVODWiDAB3
 a+ViLWWPwAV8DY9mLVXzgSQr+ktYNHBuILPh5bIrwKsGZ07R5YPW4W/BG/TFDycVJN4w
 zqKILjNBN9+21e9cDpF/cjuNJ3EX4m5w6KWZ0t8k6SNiwkbk6oRh061ssS9nmGbQVWJf HA== 
Received: from evcspexch01.ads.northwestern.edu
 (evcspexch01.ads.northwestern.edu [165.124.43.179])
 by evcspprf12.ads.northwestern.edu with ESMTP id 3bncengjh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 08:30:00 -0500
Received: from EVCSPCAS04.ads.northwestern.edu (165.124.43.168) by
 EVCSPEXCH01.ads.northwestern.edu (165.124.43.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.922.13; Wed, 13 Oct 2021 08:30:00 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by EVCSPCAS04.ads.northwestern.edu (165.124.43.168) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23 via Frontend Transport; Wed, 13 Oct 2021
 08:30:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Prhft6PauD4UENAKOUCjg5278pG1RJPyS3HLJJdexo1RHW61lSXpRBM/33jHa/yn241e+90kwy5Wc/l+mrCybfewhvVbVI5WHlpfA6TwkmSF7fZ+4I7i5PKlJVf56+KtHFVew8+IS2RREwu/HuDk88m8k1Ql/2JZm6+LBPnXO5CwWg71SSgo4ac2Ci8qmNVY1y7AtGFDimXZNTZZkcxlvuw3NrfqIb7b93JcFlGPKg6h+N54zsPiGjDEBpm0eHelAG+FUzvAD0Q6OCc1Sd6vyDQK5Q7ZrW+tc499g7eRenErcH0IQlKA7i95AYPcVCfYagmzLcpif9jGZvsWsOTplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJzuqvt8MoH68Ab0ik5g+BX0Xu0t/r5MrUN/rqp3QSw=;
 b=hobNu39Il/b8WqBHYeE2PqbvRrQL7gFJQcvpSnqCY9LQ38QAX056QJyRQ8k+jtMj2srh06MjSGIMQ1wd0T2c9xks7Wh35ai1lVHRNSf1+sucLf5FmPBZh40s5ZceC8A8OMbz5CIM7MlQjOjXoNbSuL63/xtrUdqCIemK87CtGckZnV4MoZ/vVW6A8txFhrlSdUSxyS5D6hYf6O8E7bxiUzArReRck0K6KOJvmOHX8Jddvtltz/lrFIJRA9f12hmlrZps2KbPBvWgp/dXYCIQQ+f7q3yoJ3oFG0m1J1TRXJyT8v5mf5cIhGEHR7TmsnKevLxkkWsJAqqlCx20VCg1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northwestern.edu; dmarc=pass action=none
 header.from=northwestern.edu; dkim=pass header.d=northwestern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuwildcat.onmicrosoft.com; s=selector2-nuwildcat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJzuqvt8MoH68Ab0ik5g+BX0Xu0t/r5MrUN/rqp3QSw=;
 b=r3tdVCiJ4Ovcfq0W4chovv9Xi5yuSPEgr89b7buDqap0f3L5tfo4eib7K6ZxlHN62h+U42yaU97nnCzabKuZZW3sDvcv0qpTyc7LHU6t0luj9dupODTqwafhQaKS7IrxGieRKA/1YqKhtLQtMbIImPYMCea+6eoSlHdN4QgrTF0=
Received: from PH0PR05MB7962.namprd05.prod.outlook.com (2603:10b6:510:79::6)
 by PH0PR05MB8768.namprd05.prod.outlook.com (2603:10b6:510:bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7; Wed, 13 Oct
 2021 13:29:58 +0000
Received: from PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e]) by PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e%7]) with mapi id 15.20.4608.008; Wed, 13 Oct 2021
 13:29:58 +0000
From: Frank Wayne <frank.wayne@northwestern.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Windows Log Output to Event Viewer or Text File
Thread-Topic: Windows Log Output to Event Viewer or Text File
Thread-Index: Ade8hXp6vXTKnBzbSjyqsCyYnavaygACoVmAAMgWpPAAAF8sgAAgcX6Q
Date: Wed, 13 Oct 2021 13:29:58 +0000
Message-ID: <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
In-Reply-To: <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zx2c4.com; dkim=none (message not signed)
 header.d=none; zx2c4.com; dmarc=none action=none header.from=northwestern.edu; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e24b315-844d-40f1-e77a-08d98e4d8d62
x-ms-traffictypediagnostic: PH0PR05MB8768:
x-microsoft-antispam-prvs: <PH0PR05MB87688C625D429F4911631D6E99B79@PH0PR05MB8768.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rwakj/dtZSnRvlARmnZA6J6flkOib3mRe0s4p+I/ckJCYVEtn/2k0cZiLSmjYyynU2Ir286MFKBRPr+IBuJTWLNxmRRTST4sQ8X/O7NPXsMJrBdligKG9LqTakODpbbP7modEoa2Yc+43doJVQ14P2hQcAJgolxjoWgMXh3vbCsYku2sXbi1rIVf6bNgfa9I/PrQR/I500hPgr/bbl05i8kvQpcSD+7yAFTV/roDAG8CW0slzUARbH6cgUIBDa2eHOybzAWh6FbtEzPmJoHN0NrblAtNyLLpwQkWczJ4DPQ30GoKuP0zmDpVeVjxDITVvhbVd52DDz9nxTS8gMCW28zSuQFS1n5/e1fjjG02ZqToIkXkseRlvXWlnmKvmSBqxDsqCjFp8nIFOGpBMO1GckYERlkLfLqnY3NH/2UQqPOQfYMVNjH6HKkygau+mQFw6Gtiq9prYrozgBIcMdnTVSKyJEoTqcP9GLJ3kYFRRyeO6FI48cqpc1h3c1UXKSfB0oy+RK0XtbyjpgRdyoevCDWehZfbFM17y6l5ghLWwZlWSUMBIzDTmLKHRid5Y+5hK6OrUdNXfcouPVl/qlBbqY9ugsd7I/Auby1UVIHRN1rTS8Jad9+YUa1f04eVfavDK/DoX8ouF2HAR5EwvfqSbg1ukGFCol1xJN6vwuLMO81uUi/OW1A0ghut2rJ/Btz+YeEqBxT8wcKNEDEozaJMSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR05MB7962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(508600001)(33656002)(316002)(2906002)(8936002)(8676002)(86362001)(122000001)(38100700002)(71200400001)(9686003)(55016002)(5660300002)(53546011)(52536014)(76116006)(44832011)(66946007)(75432002)(7696005)(786003)(66476007)(38070700005)(6506007)(83380400001)(186003)(66446008)(26005)(64756008)(6916009)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFuZSttS1Z6eGJ3ZGdIaTMxUkxEOHhCenZqQmp0UzdleDNGdmxlbVU5R2dI?=
 =?utf-8?B?anNOSEVxVFhuMDgyQ1NDVFl3ME1YQUZnTjRYRWFhQWsvN1kzMTNuMmhqdmw1?=
 =?utf-8?B?Y2I0d3RjOXdzSDhYTkFFc0MvOEhmWmxXQjV5UGZ5RWMvVnN0bFJvM3VwZW56?=
 =?utf-8?B?dFpINk9Sdzg5Q0JYdzdTTG5tK3dnQlJqZVRsVjFvYyt5SzhJeGZZZi9UcFRj?=
 =?utf-8?B?TDdFZUZFQlprRFk5LzN6KzYvMk1BV2d6NVJpZlBqaHdvdGFTVjZTc2RoNlZZ?=
 =?utf-8?B?YVJ4bjVjclA2L3dTOEdHN3RuNE0vOVVZOHlWbjdKUU5DVWVzRWhYbGxCV3hj?=
 =?utf-8?B?T25HSlVPenVLcC83RjFSNmdoeS9yeXQwa1pnNGFDeksvZ0xGd0pGU2g4RTla?=
 =?utf-8?B?c0VxcGs5b2tTbHByUVAzdHdSdng0SHlRaEl5TDAvVzZVVDV1dlhMWHJOZUov?=
 =?utf-8?B?MGxEMHQybmpTODRJRVV5ZjVNNWxKUXVNdzVKMWg3bmNzWC9TNEU3cXZ3U0ZV?=
 =?utf-8?B?L2FXNG9pQzVmWDNOSlZlS2NJeldzNTlycFFZNHE5ZWEwTVdTU0QwZUR6QU1F?=
 =?utf-8?B?UVlEL09ZVGVjZXl1QjRjamxxTngrQm5RSk5xQ2FjMVlKbTV5OHE2eFVxbURV?=
 =?utf-8?B?YXNsZjJmV0x1b3o3UTQwZDFCU01SNE8xMTR6dTNSamtCK0JrLzNLa2ZwTkQw?=
 =?utf-8?B?RHBkOGFUR0hhbWlnay9jK1R0ekV6NzJ5OXQ0RFg4QkNvczJlaU1veEtVZUZX?=
 =?utf-8?B?K2Q0NjhacjdWL0Q4aVREWnRxSnMxT2Q4SjQwMnlYMHNTdzA3L0s4WDArak44?=
 =?utf-8?B?bHZIK0RPeVUvK0FBdG4vQ01Ra0ZzdWJ2Um9ybGRzOFVTQi90cnp5c09YcjFX?=
 =?utf-8?B?WjN4SHJwczJRejdnbVVUQWpqZUlQSWdHQzQrWHZ4S0QrZUxoRnBGcHpYcUhV?=
 =?utf-8?B?WDhJZVNscU9nTHdjbmRYNlFqKzM0OWZmaDlBY3FKdU1GS0dUNkRiQnVSK0JS?=
 =?utf-8?B?cEFJdzd4bHFaa2xIYUxtdFVrU3FUZjRCY1JsMitNK1hVQTJ6SUV0US9oeVBp?=
 =?utf-8?B?T0tWN2cxQk9HRUlqYk1jaCtTaEpnWGQyUmhxd3RlU2VGSGNSQUc1NExpdkRY?=
 =?utf-8?B?ekh2V3Z4UUwwWExjRnZHMnEyN2M1aHJxZEtTM2M4R2cwNEdMRm52ajBHUTFE?=
 =?utf-8?B?QVBlaFZ3SDJoUTVQRzhFNERDTFFZMzR0Rmk2TVhYK2NmT1hOY2lHeUZUcEhZ?=
 =?utf-8?B?c0ZmSjlxcmdPV3psaVo0WXZ3VTdsTDdtZlBrMXZwejhIaTBrVjJseGpKNjg2?=
 =?utf-8?B?MzdVb3JaYmlaOFhsN3ArVUZETDdBMWtxc0N0eGhac1JyOHdsZ3F4bk5aVXQ3?=
 =?utf-8?B?MXloUVl2clRFWDFrS0diL3lvOUE4VWk1OGJJNTZENlBUZHFIWXBtNlFkdW5F?=
 =?utf-8?B?VG5CMXlxdEFwVkxoeC92UmJMbmdVRFloNWF6dlpCY2tLSXIwV1krbTUvUVNH?=
 =?utf-8?B?a0tsZFVISEFMczg0dUNPWk5QODZqVTVTcEs1QTFGaW5VT05qUi9McXl6c0FK?=
 =?utf-8?B?MG5jK0FmNUdwYXRVc3I3cGEzeGRreW1ZOGdobmtORnpKVCthQmptRWVhS0dq?=
 =?utf-8?B?UXE0Y1Z0Wm9tSnE4UFNpZVJjaXNoZlVYbmdyank1SFRpVGF0M0h6YzljRGY0?=
 =?utf-8?B?SmM0WTVHU2JPT1BzMFU5MEhEaUtUc20xQ2hHWWV0dDB5ZThQRS9EcytYdG16?=
 =?utf-8?Q?roIavc/anGjfI/iXWPPuOPler/fTIpTJimlNoMb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB7962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e24b315-844d-40f1-e77a-08d98e4d8d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 13:29:58.1687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d76d361-8277-4708-a477-64e8366cd1bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQgoRZZN1kEQVX/8ADWEfPOPEgaSbpHYtzEg78jOxIctWVKtvOgZ1D16w6f6EWnKKDe55vVXPqP3f8KPCfW/VAg5g1VI5mmfibAgv0sXZwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8768
X-OriginatorOrg: northwestern.edu
X-Proofpoint-ORIG-GUID: uggDdYXy9K3hKbPumAz_lymg3F8qvJdH
X-Proofpoint-GUID: uggDdYXy9K3hKbPumAz_lymg3F8qvJdH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-13_05:2021-10-13,
 2021-10-13 signatures=0
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

DQo+PiBPbiBUdWUsIE9jdCAxMiwgMjAyMSBhdCAzOjM5IFBNIEZyYW5rIFdheW5lIDxmcmFuay53
YXluZUBub3J0aHdlc3Rlcm4uZWR1PiB3cm90ZToNCj4+IFRoYXQncyBwcmV0dHkgYXdmdWwuIEl0
IGlzIG9ubHkgcG9zc2libGUgdG8gZ2V0IHRoZSBsYXN0IDIwNDggZXZlbnRzIGFuZCBubyB3YXkg
dG8gZ2V0IGp1c3QgdGhlIGV2ZW50cyBzaW5jZSB0aGUgbGFzdCB1cGRhdGUuIFRoZXJlIGlzIG5v
IHdheSBmb3IgYW4gYWdncmVnYXRvciB0byBzaW1wbHkgY29sbGVjdCBXaXJlR3VhcmQgbG9ncyBv
biBXaW5kb3dzLg0KDQo+IFlvdXIgInRoYXQncyBwcmV0dHkgYXdmdWwiIGFzaWRlLCBpcyB3aGF0
IHlvdSdyZSBhc2tpbmcgZm9yIHNvbWUga2luZCBvZiBDTEkgImZvbGxvdyIgbW9kZSB0aGF0IGRv
ZXNuJ3QgdGVybWluYXRlIGFuZCBzcGl0cyBvdXQgbG9ncyB0byBzdGRvdXQgcGVycGV0dWFsbHk/
DQoNCj4gSmFzb24NCg0KTm8uIEknbSBub3Qgc3VyZSB0aGF0IHdvdWxkIGJlIG11Y2ggb2YgYW4g
aW1wcm92ZW1lbnQuDQoNCkluIExpbnV4ICh1bmRlciBzeXN0ZW1kKSwga2VybmVsIGxvZ3MgYXJl
IGFjY2Vzc2libGUgaW4gam91cm5hbGQsIGNhbiBiZSBmb3J3YXJkZWQgdG8gKHIpc3lzbG9nLCBh
bmQgZnJvbSB0aGVyZSB0byBhIHRleHQgZmlsZSBvciBleHRlcm5hbCBzeXNsb2cgb3Igd2hlcmV2
ZXIuDQoNCkluIFdpbmRvd3MsIGxvZ3Mgd291bGQgaWRlYWxseSBnZXQgc2VudCB0byBFdmVudCBM
b2dnaW5nIGludG8gYSBXaXJlR3VhcmQgbG9nLiBUaGF0IHdheSwgdGhlIHVzZXIgb3IgYWRtaW5p
c3RyYXRvciBjYW4gdXNlIEV2ZW50IFZpZXdlciB0byB2aWV3IHRoZSBsb2csIGZvcndhcmQgdGhl
IGxvZywgIG9yIHVzZSBhIGNvbGxlY3RvciAobGlrZSBTcGx1bmspIHRvIHJldHJpZXZlIGFuZCBh
Z2dyZWdhdGUgdGhlIGV2ZW50cy4gVXNpbmcgYSBwcm9wcmlldGFyeSBsb2cgbWFrZXMgaXQgZGlm
ZmljdWx0IHRvIG1vbml0b3IgdGhpcyBvciBhbnkgb3RoZXIgYXBwLg0KDQpJJ20gbm90IHN1cmUg
d2h5IFdpcmVHdWFyZCBkb2Vzbid0IHVzZSBXaW5kb3dzIEV2ZW50IExvZ2dpbmcuIEkgY2FuJ3Qg
aW1hZ2luZSB0aGF0IGEgcHJvcHJpZXRhcnkgbG9nIGZvcm1hdCB3b3VsZCBmbHkgaW4gTGludXgs
IG9yIGV2ZW4gYmUgY29udGVtcGxhdGVkLiBJcyB0aGVyZSBzb21ldGhpbmcgdGhhdCBwcmVjbHVk
ZXMgdGhlIHVzZSBvZiBFdmVudCBMb2dnaW5nIGJ5IFdpcmVHdWFyZD8NCg0KRnJhbmsgV2F5bmUN
Cg==
