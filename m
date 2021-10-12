Return-Path: <SRS0=Z6z9=PA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8759C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Oct 2021 21:39:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECE16109E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Oct 2021 21:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EECE16109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=northwestern.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f989cc1a;
	Tue, 12 Oct 2021 21:39:38 +0000 (UTC)
Received: from evcspprf10.ads.northwestern.edu
 (evcspprf10.ads.northwestern.edu [165.124.82.241])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6790f217
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Oct 2021 21:39:34 +0000 (UTC)
Received: from pps.filterd (evcspprf10.ads.northwestern.edu [127.0.0.1])
 by evcspprf10.ads.northwestern.edu (8.16.0.43/8.16.0.43) with SMTP id
 19CLbxMo021407; Tue, 12 Oct 2021 16:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northwestern.edu;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=CGH7eEGxIG5kPjac8p0GZ2iNKbI9NozHlOO8UJpJNLQ=;
 b=K33yQSaO8P8pATXlbs4r1WeDR8CJbo9NCTndOSAa55ROWtdcNWXEnw6ZqltrMsyafHUk
 sYuoRfLX2Tp19ViD/tX1ho5/q0rb7sdiHRh+yoCq9RGhR8DLJVx+h5RpuNP10rtUhyZP
 1Gz3pUlOw49IGxikJYgXdgtbPdUWun6Mc2allzopOB38HVDb8ktyzq/3f+QLg5N3n/nA
 CrCSGuPjqbrodvtfSI1Pu/6Ea3HimD27HdOBPbVn3WuRTZN5395+/uaY+h05kWmNTUl4
 4Wre3cKAfSuQrNit1Wq5I2sMrM0sYfeEnuESRTRRg1OHNoN4wwtDlPXn5NeTTbglnry1 2A== 
Received: from evcspexch02.ads.northwestern.edu
 (evcspexch02.ads.northwestern.edu [165.124.43.180])
 by evcspprf10.ads.northwestern.edu with ESMTP id 3bndq2tmb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 16:39:32 -0500
Received: from EVCSPEXCH02.ads.northwestern.edu (165.124.43.180) by
 EVCSPEXCH02.ads.northwestern.edu (165.124.43.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.13; Tue, 12 Oct 2021 16:39:32 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by EVCSPEXCH02.ads.northwestern.edu (165.124.43.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.13 via Frontend Transport; Tue, 12 Oct 2021 16:39:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yez4cnt8fjWfuKUiOnS4SHc/SdZ2DoY3ITiA2PS7I+6A63hq0EmZt1ZcHgewEctXW5m8ftEQAuiiypCeJ9Ybbf8n0Ff8IGLk3vwcjOj/AWiqcen5IHfbyvGtO5E9L647auM2Nfz7qLrJkQA1GSrVpRQkKnIlAS7kBN1pW+qLPqBJLRjWEW+zdoX9Mum1/xqLgUIpmdqCkcOmkV6zs8XIMwGoUTgyLotRY4o7Lx7Hd9W9kCl/Rhrdfvhv4+NLZDOzGaXN3c2pCXFx7vab5S7Nm4Uye0MghqoZiA0jpvJe/xLmjhe1z+1R7wq6MoMVWGEMwamZKZQqXXAUa5KyJ8v9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGH7eEGxIG5kPjac8p0GZ2iNKbI9NozHlOO8UJpJNLQ=;
 b=Rnqwa6EDQlyqNNY1Ga5m747WEbIaPLg9NBZ7og7Tq9T0FF6GgGvk/iADtZRpSYPGln8RuBPcufKwerioIQ0dl8/5Gy83bAvOCoiAE/sBMHat+CllXScO7hF+jPqpA+IkxRuriefALsMmoINI/fYEh241fZB8HNq/DOCTznRr/3nvKEFrTzWad2oNZfpF4aGHEqfvl9rIYZ0f2Wv0luvnvnMhXXQkRHBasX7wfN426RgeHpDtqwd0zkaHPjSJnVcvqQY2U9GgJ+NpDtk1oWIuvxqxyKKrOmybcyYoqWt1UBBGRk7GpHgA/qMnFQVqog+Dj272bxY8BabrMm99I79i1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northwestern.edu; dmarc=pass action=none
 header.from=northwestern.edu; dkim=pass header.d=northwestern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuwildcat.onmicrosoft.com; s=selector2-nuwildcat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGH7eEGxIG5kPjac8p0GZ2iNKbI9NozHlOO8UJpJNLQ=;
 b=v6RdIqbRg7uLBRKDshlMn7YYKDPSEaXObHpFAfbDRRoXlOb7OkX9MLxosPi8aLPohAHlN+my+xmTPRK17WWrYPoK82h0N1SmbXoLbrm4M1GnmFVbEjGC/m9UGqhAucxDg1hL65F7Aa66uuLelQTpKCNGIKnX+2hkGl+CCaZWqFQ=
Received: from PH0PR05MB7962.namprd05.prod.outlook.com (2603:10b6:510:79::6)
 by PH0PR05MB8041.namprd05.prod.outlook.com (2603:10b6:510:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Tue, 12 Oct
 2021 21:39:31 +0000
Received: from PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e]) by PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e%7]) with mapi id 15.20.4608.008; Tue, 12 Oct 2021
 21:39:31 +0000
From: Frank Wayne <frank.wayne@northwestern.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Windows Log Output to Event Viewer or Text File
Thread-Topic: Windows Log Output to Event Viewer or Text File
Thread-Index: Ade8hXp6vXTKnBzbSjyqsCyYnavaygACoVmAAMgWpPA=
Date: Tue, 12 Oct 2021 21:39:31 +0000
Message-ID: <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
In-Reply-To: <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zx2c4.com; dkim=none (message not signed)
 header.d=none; zx2c4.com; dmarc=none action=none header.from=northwestern.edu; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 727f434e-c614-4926-a9b1-08d98dc8c6ce
x-ms-traffictypediagnostic: PH0PR05MB8041:
x-microsoft-antispam-prvs: <PH0PR05MB804109D88AC0DAB4EAA2D8DB99B69@PH0PR05MB8041.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7B18FhNSt++bTnSLt3dEwuILH0aMEoxzfhNkV65/Tj2Q7uaTT5zMVWVYihgiv6vWxRVNWLj+1p6P4NJtlyEFh3CqXw9wKSxhdRAOhhfhGgfY7obPMB1Chr7zNxlvC3Ww9qKWuGTo0GxhqUjYqooRQM1ro43zFOwMxL+qUfHbkBTFp4QGAdTXHpZlvcGa+DO1m/rxY2XGQyUscX7PxodG/Bcxx207fLM7awMJbwXmt0yXStdxZrN9lHC/4kuW98z9gVAylAus8adSBmj4xDQ3gJhjjeUY828/SyCy4wtgCjcYzBJwJNE2U1P7uFVCrqKhHrgCjnCB4ExxJteIf/rT5LQ6KKlDnEEM2BUCQJ0FvGa9KL28Ou5bzBaYhm2+RZoDFkEXcsEtgbKBFyPt1At2wgIOtmHHicSKcZ9jXN/9Y2OJkgdZmLMgxJusSc3oNsMzJmCycZb5Ku7kCcQgbjVjT9pDpoduGYPL6jEq9h9feGFv3bFgkILot5JkvSraiv9JY26utiKYlTI68K2X135KQvwKcQ9Ebz91HD3k15BU/Mit6l9Y29IMf5cW1NxHYGyjaOYhMqcIpQYuSyr57HKc0Y3TXLlIm373RepmWnH6sAq0S4CGixDl6yyLhX/Zqi8palbmf+F1KSGCGdOsShDcVIFGDT8xpXzQAiUr9o4K+5EHLvh5KbfQL6DqFPD2OJdWCrDcnlH0yT3f28q/N1ibLj5MOC15831uu4JpjWvHFohFDbchGMizkhhbt6wtS6mBgMBhZHRJu2Gp3O9nalf2UA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR05MB7962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(71200400001)(33656002)(55016002)(2906002)(6916009)(5660300002)(76116006)(9686003)(86362001)(8676002)(4744005)(4326008)(26005)(66946007)(8936002)(64756008)(38070700005)(38100700002)(75432002)(6506007)(186003)(66446008)(122000001)(52536014)(316002)(7696005)(66556008)(786003)(53546011)(66476007)(44832011)(83380400001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDk1eFJDUlBHNUZucS93RExQU2kwUXEzd2NieDIxUDdaS2x4eSs2dU9OT0E2?=
 =?utf-8?B?WWlNd3FoNExHNkJzRk5XbVg4MHhWNUNvMWZWNGJuS3NaMUJjLzd5UVY4LzV4?=
 =?utf-8?B?WlkvbC9HUE43OUNES0xQZnQ3eVBKMHUxQ1FZOVJpNERRRzFLWUgxZm9jRGpC?=
 =?utf-8?B?ZE9xYjZlcHRvTnhncGNPbXUwcEtpb2xvd2Jyc1NzclNNb3VuZzk3RkJkdFhN?=
 =?utf-8?B?N0VkOWRhMHdrdHRjV3lKSVNBVS9rejMzRmFMb3BYVkpjTjBHV3NVdWlIM3I2?=
 =?utf-8?B?Q1A1aCtXUFF6bDA3THErbzZMOTF3cXAwRFZuUWxMdWY3TmJhSzliMXpHSU5I?=
 =?utf-8?B?TlNjdi81RnlpSzJiMlVmMUhRQlptbEtpWk45U2pVQ295S0tCTWcwd1pOWHVZ?=
 =?utf-8?B?MEZUcWMyN2RWdVFBdGJ2M3pLcVlLYjFtSVd3MkhxaGRPeE1SR291bFNhT3Vh?=
 =?utf-8?B?QUlGbytMQWtEdXpxVk9DdWtlQ3daVkNMUFhJS1A1VmpJWnVtaUJNVTNFMXJC?=
 =?utf-8?B?N0d5MU5KS2RPZTJUL1VkMlJjYlJ2QmYxSTVSc2t1cGNPK1R6RjFSbVB2MXJv?=
 =?utf-8?B?UzROM2F1dm5hb1FiYnRzR0xoS29TOXFIczJ5TkFjTmYwbnRGVlVOZHhZNVho?=
 =?utf-8?B?Q2M3bnUrR2tYaDNQK0lFb1A3bU9WWkozTnovUEhtb3U3WnJ0WCtkRUo0eXVr?=
 =?utf-8?B?TmRQblE3bVUzMzFROGxZckFkc2t0U01PNGJkMGZPQVlZTzBMNStyMjYvRC84?=
 =?utf-8?B?MkV4dk1ldzJROVE1QXFBU0hlME9sSlFYZS90TGhDMkVzc0xtVkVJeDIrL2xh?=
 =?utf-8?B?Wm1DNlBEdE5XQktrbmdwRnhGQzBremthWmREaWJJQldqMXg3QkFXWDhJdnBn?=
 =?utf-8?B?NGh2ZElKdHF3bld0dXdGWjBKYy9mK1lHSWFnd0s5MmI1aThtYkZxdVRURDg1?=
 =?utf-8?B?bmVBbTZhRUV0MEYyUDFvRndGazFaKzUyb3lFYjhmUHlQNE1nUVdGZXJwVFds?=
 =?utf-8?B?cEJWRVArbjQzNW9Qb2xseU5YTGNIbGxGOTdtMXNveUNiRHE4azR1SGY2R3ZK?=
 =?utf-8?B?SzJPaHVPMHV4N3dwb2owYWk4TFc5VHNhNS9CYzMvNFZqNExIaG5pZXJUYm5l?=
 =?utf-8?B?NFhGcUtTcHdobWIwMTZVYUYrV0lJVW1VdEhoMVRkUzc1NTBnU2Ntdm9hWnZu?=
 =?utf-8?B?V3FOVnAvTFhCMXJZZ01CVEs3bHQ0K2tRVURzUjI3ZU9FMHFHMWIwMDl4bjdM?=
 =?utf-8?B?Rk5TS3NFZEF6ZGtNeTFGd2tKelczVzVTZ3pRVEV3NUQraTBRZ0xtU042bFp4?=
 =?utf-8?B?S3RWcmVZV3JQb3AvY2RXeFBxOVBMa0lBM25aUERDbTM4OHYySG1yeUxHcmdm?=
 =?utf-8?B?UHJUa2htZTJsVDZvWEVPUUgydHdER25DTE9MVEFIVG9TNUFxSTVKMGJxUGpS?=
 =?utf-8?B?S1Y0LzlhV01hTlVHc1RXaFhiSEhCSkRESXM5Y2svSVFvdE5ubms3eXB4R0tU?=
 =?utf-8?B?SXJyVFpNdEhoQ05pa3I2UmlqQ3NMVGgrTFFMVHNoZ3Z0R0UvVzZ6cVhRNWp0?=
 =?utf-8?B?QzBPZ0dRcW9OUGF3MUpjQUpOY1pNQWhFYUoxZmRSOGpHVXJZbzdFVSt4RnFp?=
 =?utf-8?B?SXVmamNtNjZxbzdrNEJBZ3hGRTUwTGdkMWlBMDY2THpxL3FqUWI0cEE2REYr?=
 =?utf-8?B?NUZKTThVRlVxUWN2TGpraUN1UTlHQTFmWWkrRXNRNkpmdkpnZHplVFVFWHFh?=
 =?utf-8?Q?mG9YAwn2weB7pH3zx0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB7962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727f434e-c614-4926-a9b1-08d98dc8c6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 21:39:31.6132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d76d361-8277-4708-a477-64e8366cd1bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNEI6UN50B04nyFmQJfUgF4YuKlNX2SlIEiYMIg9Ns6QLCsUPksdnSMPUKvmZa+Aevy57WpsZ2Ow52MBJ7TpGYvGA8+0uY0FRi8UkUe08VA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8041
X-OriginatorOrg: northwestern.edu
X-Proofpoint-GUID: cms5R2ayJvsGxl3aLiI_QrfNNp7nlpTr
X-Proofpoint-ORIG-GUID: cms5R2ayJvsGxl3aLiI_QrfNNp7nlpTr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-12_06:2021-10-07,
 2021-10-12 signatures=0
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

VGhhbmtzIGZvciB0aGUgbGluaywgSmFzb24uDQoNClRoYXQncyBwcmV0dHkgYXdmdWwuIEl0IGlz
IG9ubHkgcG9zc2libGUgdG8gZ2V0IHRoZSBsYXN0IDIwNDggZXZlbnRzIGFuZCBubyB3YXkgdG8g
Z2V0IGp1c3QgdGhlIGV2ZW50cyBzaW5jZSB0aGUgbGFzdCB1cGRhdGUuIFRoZXJlIGlzIG5vIHdh
eSBmb3IgYW4gYWdncmVnYXRvciB0byBzaW1wbHkgY29sbGVjdCBXaXJlR3VhcmQgbG9ncyBvbiBX
aW5kb3dzLg0KDQpGcmFuayBXYXluZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+IA0KU2VudDogRnJpZGF5LCA4
IE9jdG9iZXIsIDIwMjEgMTc6MDENClRvOiBGcmFuayBXYXluZSA8ZnJhbmsud2F5bmVAbm9ydGh3
ZXN0ZXJuLmVkdT4NCkNjOiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0IDx3aXJlZ3VhcmRAbGlzdHMu
engyYzQuY29tPg0KU3ViamVjdDogUmU6IFdpbmRvd3MgTG9nIE91dHB1dCB0byBFdmVudCBWaWV3
ZXIgb3IgVGV4dCBGaWxlDQoNCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dp
dC56eDJjNC5jb20vd2lyZWd1YXJkLXdpbmRvd3MvYWJvdXQvZG9jcy9lbnRlcnByaXNlLm1kKmRp
YWdub3N0aWMtbG9nc19fO0l3ISFEcTBYMkRrRmh5RjkzSGtqV1RCUUtoayFFbkg1Yy1fV1F1S0d4
RFl3bTczN1JwRFB3MG1LcWxvdWNfbC0yY0dzNG9tanVOLVNhZllxLUhIcG5LS2p2a25Qc24wU0xo
cHEkIA0K
