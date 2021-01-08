Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4816AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 00:44:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C42B2343B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 00:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C42B2343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=morsecom.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e431577a;
	Fri, 8 Jan 2021 00:44:34 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2111.outbound.protection.outlook.com [40.107.94.111])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dd327f30
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 00:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POU8uJ3alsPziFC0/qfowlfohjyv/DeoEbQkirkXWDlxTTyO915AyQkQJDeX72GXAxcoi1cIFTQDVIKyoeGGf7F1vCjy5C7sSL+w30wDW/Som4NqjN28ggXkShXnj0ahOQJKf0GqgUzjlXnWi4DrFyvV2TCpDPo3E8dg3h1P///PY3+NWsGzovL0VCWY8OQobcJnGjVkrg3n8/jZwkQZY9sMLilCxtbhpVg1yEKorHt+TpIP0MTBJjObYMSfKyAPdXPE086W+8Ab3aV11MyiKEvKO3P53/NVgQfK/pCtEJKNOqTy1F1w+xyqN8ibRbo/ev+dEOhWtHtpLz6pekD8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szkITdTBEB/G2F1WkDDQvEo2X6T36K9O2ey/8qbIWDo=;
 b=haKT6S0yzFH2UtI3ghB3IRuPGw/Is9t6xS4rmWNqWFDbw0TqE1Xwo3CIrAs9IHP38cXqHt6pGhFtFy2GZMhCWTMa1d6k7JZd1e/RUh3be8s89CU12Uve5jvCtWRV8NL434VCSGS/ZnRm+EBo+kBxXGTjH9weQMfT5svX4pZ9bAF/9FljXrY59cyCVluofGCegPqvCc0qcsgatQeGkypnNntzBFJpzTVqjYMOatJwD9nBvqlsFt/d1niJx2rJ0J/KsoEnZbV80uWhyZKe3UEx9LPZAR6r3A5+Tb6hu80eVVlLHsLYrmfe5FB4bgezdQfSqLRzNLs0oXcxQ2lgutNEJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=morsecom.com; dmarc=pass action=none header.from=morsecom.com;
 dkim=pass header.d=morsecom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MorseCommunicationsInc.onmicrosoft.com;
 s=selector2-MorseCommunicationsInc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szkITdTBEB/G2F1WkDDQvEo2X6T36K9O2ey/8qbIWDo=;
 b=lJc4JAFHMguymkggyBUKF30Ov7hT5D5jyCL5YUeRzLKMD3NtFddLVpLE8gw/zwtMpFm3nJdbtF/ZXjxyV8fzO7H9UpGTDv4HohnFbGLCQgNleZSJDaEl4daZVTHQBvdWNwO/fC80STMx/MDcEy8R1kRIBu42eLTXMMn9uQyijfE=
Received: from BN6PR05MB2962.namprd05.prod.outlook.com (2603:10b6:404:28::15)
 by BN6PR05MB2962.namprd05.prod.outlook.com (2603:10b6:404:28::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.3; Fri, 8 Jan
 2021 00:44:26 +0000
Received: from BN6PR05MB2962.namprd05.prod.outlook.com
 ([fe80::81f8:5744:c4a3:abdd]) by BN6PR05MB2962.namprd05.prod.outlook.com
 ([fe80::81f8:5744:c4a3:abdd%12]) with mapi id 15.20.3763.004; Fri, 8 Jan 2021
 00:44:26 +0000
From: Corey Costello <ccostello@morsecom.com>
To: Eric Light <eric@ericlight.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
Thread-Topic: UBSAN: object-size-mismatch in wg_xmit
Thread-Index: AQHW1xTBoapJy1K2eUK0f/WmpHtAF6oBRT0AgAAj5QCAGsg6gIAAbyYAgAABzACAAFuVgIAAAk2AgAAAeYA=
Date: Fri, 8 Jan 2021 00:44:26 +0000
Message-ID: <AB0E5484-9274-4079-9A94-E464E218689E@morsecom.com>
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
 <CA5B0431-801C-4F2E-85F5-E329F02D364A@morsecom.com>
 <0029bece-0f7e-4467-948d-b48af50e5bca@www.fastmail.com>
In-Reply-To: <0029bece-0f7e-4467-948d-b48af50e5bca@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.20.0.2.21)
authentication-results: ericlight.com; dkim=none (message not signed)
 header.d=none; ericlight.com; dmarc=none action=none header.from=morsecom.com; 
x-originating-ip: [2603:9001:420c:3ba1:b546:d664:6398:63f2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d91cc12-5904-4bef-ad51-08d8b36e8cfb
x-ms-traffictypediagnostic: BN6PR05MB2962:
x-microsoft-antispam-prvs: <BN6PR05MB296245DA1F18184A2695229DD0AE0@BN6PR05MB2962.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:22;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SSII+e2LPA+9taKdm4IOcrVfU8B6oRzV6dNjxfGZdfn+80mVaZuicl1J7J7sffCJBoGNGboZ7qoH0lWhJ4Bng7/VGoBRmgZRRPfAjpbhyG9/G3X15EjYfCEZ57DEI21KQIgXiQnpQXoYJzmkYwWSXZySzapS3Fk0uBHL6FKVPo+EeaRHBNNxbuCD/nQ6S0zeYmZHchqhjqvnMUANxNyAHM0L/3PC0oVGf5HsTvWuuavMxlnb0ipHuaQHiaM/OoIr41Xru2/K3Z7Bwu566ZNU0FJnZuw0fplEwxlOtlcuaUd7Ti48zcnqB0rsybJ044cL0PaUyL3Gu4ewRDMClSCR25EwWTGaJgF6hZM1qLt5GbASvVfnDppehNyVVuMC47LKVLrwXT0DZDvQKnkHRbV0gJBplo+X9WRhg63RWA5cRyz6o3uNry17ounIPV96K7Phn7F6y4+/sZ6vm1NFCegXyJtx/xKqEiVMhopQqzXW7onXCowKAGO8Dmmxuh6JUPZGWehjh0Meu2K3q14xhQ5Y15tdgDAA20Oe5HRHzj+uOKsD3zNq/UXfoPKBBzYcdjrAlflq570nAHnRrjO1pMPvaoUCwb9qtl4fZn0aIECOrjs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR05MB2962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(39840400004)(346002)(396003)(66446008)(66946007)(66476007)(64756008)(66556008)(83380400001)(76116006)(478600001)(316002)(966005)(2616005)(71200400001)(186003)(6486002)(2906002)(33656002)(86362001)(6506007)(53546011)(6916009)(36756003)(16799955002)(8936002)(5660300002)(4326008)(6512007)(83080400002)(8676002)(31884003)(99710200001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?M0lUMFI2TXB0WkdjVWJrU1dvaVF0RUJlc0t3UEo4Q3Boay9tYzlRa3FXSVlU?=
 =?utf-8?B?LzB1eDE0b3VpeWZyMjB6NjRPR0hSMkxIREZLTWpReGRpd2QyUVBEby9hR3FV?=
 =?utf-8?B?LzErSm4rNWtnTk5VVWEyOFE5cGpjdWFWSWFjTXNLUVAzMGQ1SlZyUE5aMmRF?=
 =?utf-8?B?S1hPMENVVmJ2NXdQZ3NDYjdFTnA1UjZTbENsc0hwMU5JazBXemI0Qnh1TU01?=
 =?utf-8?B?R1dsUG9qamlBQzNOaGovNTZ5TTNES0ZlZVpPWCtIekpJemo1dTlrMVlscUV3?=
 =?utf-8?B?UmhBbVBaUHdIQTZ3WnFtRDVGSlI0a0xkczlzUXlhdkZPelNPZ0VwQ2NmSnBu?=
 =?utf-8?B?VWd1Qmc0djdwM1EyV3NtQVJIcStYWGVNaEtvTlVFWHc1cjZmSUFtTm5Cekg3?=
 =?utf-8?B?a01DZUZHMk5SbHdjTkdNbVFWL1FOSzFlZEV6UEcxMEY2cGZ5S3JtV0pPZUVv?=
 =?utf-8?B?bi9BQkx5WVNMMEphVGZraC9aSWxyWTFNcVppTWNjUzFKQjhKL2xyS0hWS0Ex?=
 =?utf-8?B?RElzVWpNY1lsMm51NFo2S3RmcVVOMTBGNTNCZEJCZk1XVUQvOVl5TXkwSXd0?=
 =?utf-8?B?czF5SUxxLzVMdnd6Vm4yUk1GdXp5eHI5b3dOTDhrUnp6VXJ6UnlLL0U3SVJZ?=
 =?utf-8?B?OGk4WkxhSUZBeXdNTktrQVBSWXp0QlMvTTFadVk3cU9VVHhHYVVqQWUwZlVJ?=
 =?utf-8?B?QUpCNkFpcVhoUUg0NzY2UnlWYlZoU29hY0xmRDBqYzZOOWlBZ1pBZ1Jib2hN?=
 =?utf-8?B?ZUk0TGZYRjBaMTZpeGd0QWE2MkNrS1Qzb0JnTER5S29jVHg4TDh2OVZXNXRl?=
 =?utf-8?B?ZFVxVktURUlSa0R1NmtDRHBIZ1RaaEZJZlRTK21aRFdtcTYvNU1DSjlYZURj?=
 =?utf-8?B?VXZFZEtRRnhqWWk4T3hwbGk1UXVINzNLeUhoRGNNdkxMSHN5cGdTd3N6dGJJ?=
 =?utf-8?B?UFE1NmduOEcrNTFHdUZudjNweFB0emZoYlZHMXRRSyt0RXpRM1VEWlp6UXZ2?=
 =?utf-8?B?ajZoWmhmWHV6SThHV2NSTkU1cmtxT0E2MzJaSFZVdUFoYmVQYU84YjB4Mzgz?=
 =?utf-8?B?cFZPR0lkc3Y5ZGRCWFE3bkh2bmpUUVQraXJJZGdWMDd0Qzc2TmdaUUJFOVNw?=
 =?utf-8?B?VXNJdjNySEhNSjZ5UEtpSHB5amkyUmFQMDIvRUtWa1VxWUxYRVJ6REhydTlI?=
 =?utf-8?B?WEFkd0FZUGxYcnJMVnhmY3RtTTk0SjdjM3YyVCtFajF0Z3pmMDVJa3JYcnBL?=
 =?utf-8?B?T01ESncyTVpsbTZZTzBScW1uTGxJZkRoRkZpRW5iSEwyb25XS0tQTHVjSXIr?=
 =?utf-8?B?MzVaLzFOeGZVaE9uS1FmQ3NaTnlNdk5QKzBFMGxyZUVialN2Skh6TUJOdlBD?=
 =?utf-8?B?anhVQklNK0lEb2x5VUJqSm1MN0JBSThqM1oxRnBhVFRianNINng1RG9BbHAx?=
 =?utf-8?Q?3sYSd8Wl?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1EDC70674C27249982EDF1D27C0D02F@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: morsecom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR05MB2962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d91cc12-5904-4bef-ad51-08d8b36e8cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 00:44:26.4414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dd11875b-80bd-4856-b2d1-d8b42fe95638
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxnLQRkoqxvk5j16Pc+ozuvwhTvS+9zqQSIcgGYc1PBDtS9gGNqi1VHnhWPYklfcEYHjeD2O/PRdnOYB3ZdGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2962
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

WWVhaCwgaXQgZG9lc27igJl0IHdvcmsgZm9yIG1lIDooIA0KDQo+IE9uIEphbiA3LCAyMDIxLCBh
dCA3OjQyIFBNLCBFcmljIExpZ2h0IDxlcmljQGVyaWNsaWdodC5jb20+IHdyb3RlOg0KPiANCj4g
Q29yZXkgLSBoYXZlIHlvdSB0cmllZCB1bnN1YnNjcmliaW5nIGF0IHRoZSB1bnN1YnNjcmliZSBw
YWdlPyAgaHR0cHM6Ly9saW5rcHJvdGVjdC5jdWRhc3ZjLmNvbS91cmw/YT1odHRwcyUzYSUyZiUy
Zmxpc3RzLnp4MmM0LmNvbSUyZm1haWxtYW4lMmZvcHRpb25zJTJmd2lyZWd1YXJkJmM9RSwxLEF4
YS1FbGJYMGFyQTBnUzI3a25xTWNNblVYaWttcEd1eDB1VjdHdjY2Sm5pTXBYUlZWdFdOZVlFOG11
MTduUWF3cGZRRW9kdGVCZkg5dHE0M3JvbkdrbW0wN1RfVHE5dXJUbXRZTFRUSzhZd0ZnLCwmdHlw
bz0xDQo+IA0KPiBIb3BlIHRoaXMgaGVscHMsDQo+IA0KPiBFDQo+IA0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBROiBXaHkgaXMgdGhpcyBlbWFpbCBm
aXZlIHNlbnRlbmNlcyBvciBsZXNzPw0KPiBBOiBodHRwczovL2xpbmtwcm90ZWN0LmN1ZGFzdmMu
Y29tL3VybD9hPWh0dHAlM2ElMmYlMmZmaXZlLnNlbnRlbmMuZXMmYz1FLDEsTDI4X29CRnIwQ0tB
WERzRzBCaURrRERoT1lhRzRGb0g3dmRlYUtvcW5zVnduMTRraXo5Sl9QcGpNWkFvSXRyX3dkRnZt
V1M0d0FJN3FEZ0JQbGpUOHF4Z2RBd0NBOVZ5NTRNM2JjcThuSkJLbkExMUdGVFRHNkJFdjA0LCZ0
eXBvPTENCj4gDQo+IE9uIEZyaSwgOCBKYW4gMjAyMSwgYXQgMTM6MzQsIENvcmV5IENvc3RlbGxv
IHdyb3RlOg0KPj4gR2V0IG1lIG9mZiB0aGlzIGZ1Y2tpbmcgbGlzdCBmZnMuDQo+PiANCj4+IA0K
Pj4gDQo+Pj4gT24gSmFuIDcsIDIwMjEsIGF0IDI6MDYgUE0sIEplZmZyZXkgV2FsdG9uIDxub2xv
YWRlckBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFRodSwgSmFuIDcsIDIwMjEgYXQg
MjowMyBQTSBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4gd3JvdGU6DQo+Pj4+
IA0KPj4+PiBPbiBUaHUsIEphbiA3LCAyMDIxIGF0IDE6MjIgUE0gRG1pdHJ5IFZ5dWtvdiA8ZHZ5
dWtvdkBnb29nbGUuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gTW9uLCBEZWMgMjEsIDIw
MjAgYXQgMTI6MjMgUE0gSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+IHdyb3Rl
Og0KPj4+Pj4+IA0KPj4+Pj4+IC4uLg0KPj4+Pj4gDQo+Pj4+PiBUaGVzZSBVQlNBTiBjaGVja3Mg
d2VyZSBqdXN0IGVuYWJsZWQgcmVjZW50bHkuDQo+Pj4+PiBJdCdzIGluZGVlZCBzdXBlciBlYXN5
IHRvIHRyaWdnZXI6IDEzMzA4MyBWTXMgd2VyZSBjcmFzaGVkIG9uIHRoaXMgYWxyZWFkeToNCj4+
Pj4+IGh0dHBzOi8vbGlua3Byb3RlY3QuY3VkYXN2Yy5jb20vdXJsP2E9aHR0cHMlM2ElMmYlMmZz
eXprYWxsZXIuYXBwc3BvdC5jb20lMmZidWclM2ZleHRpZCUzZDhmOTBkMDA1YWIyZDIyMzQyYjZk
JmM9RSwxLFJWcGdac1JVQ0dzMmpLbHVtaU1BTW5wZU9GNFFkaVc1aDhHRElzQkpQei1vckZOd3Z3
Q1huY2VDOW41QmhyMWgtRzJFc1UwdGxDN040UVVwSHVGNnRJTUk3dFRuQm9SakFvNXRULUJrOS1G
aGU4Q3BwdU9MNG1xZGtBLCwmdHlwbz0xDQo+Pj4+PiBTbyBpdCdzIG9uZSBvZiB0aGUgdG9wIGNy
YXNoZXJzIGJ5IG5vdy4NCj4+Pj4gDQo+Pj4+IEFoaCwgbWFrZXMgc2Vuc2UuIFNvIGl0IGlzIGVh
c2lseSByZXByb2R1Y2libGUgYWZ0ZXIgYWxsLg0KPj4+PiANCj4+Pj4gWW91J3JlIHN0aWxsIG9m
IHRoZSBvcGluaW9uIHRoYXQgaXQncyBhIGZhbHNlIHBvc2l0aXZlLCByaWdodD8gSQ0KPj4+PiBz
aG91bGRuJ3Qgc3BlbmQgbW9yZSBjeWNsZXMgb24gdGhpcz8NCj4+PiANCj4+PiBZb3UgbWlnaHQg
Y29uc2lkZXIgbWFraW5nIGEgdGVzdCBidWlsZCB3aXRoIC1mbm8tbHRvIGluIGNhc2UgTFRPIGlz
DQo+Pj4gbXVja2luZyB0aGluZ3MgdXAuDQo+Pj4gDQo+Pj4gR29vZ2xlIFBvc3RzIFBhdGNoZXMg
U28gVGhlIExpbnV4IEtlcm5lbCBDYW4gQmUgTFRPLU9wdGltaXplZCBCeQ0KPj4+IENsYW5nLCBo
dHRwczovL2xpbmtwcm90ZWN0LmN1ZGFzdmMuY29tL3VybD9hPWh0dHBzJTNhJTJmJTJmd3d3LnBo
b3Jvbml4LmNvbSUyZnNjYW4ucGhwJTNmcGFnZSUzZG5ld3NfaXRlbSUyNnB4JTNkTGludXgtS2Vy
bmVsLUNsYW5nLUxUTy1QYXRjaGVzJmM9RSwxLDd1My1qV2Fka2xZbzhhaV9YclBOdmpudTQ2TExB
eWcwaHFzR0lhTVBhb1E1VXh0Y05NODRqckhVZ1NnNFZjaVhLazlYVnB3Z3lCd0Q4NUxiYlc1X2ox
OTVqU0g2UnJBZWo0NUkxa3JfWGZRLCZ0eXBvPTENCj4+PiANCj4+PiBKZWZmDQo+PiANCj4+IA0K
DQo=
