Return-Path: <SRS0=nhTB=GJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2268C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Jan 2021 02:45:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A1422CB9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Jan 2021 02:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A1422CB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=morsecom.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5340706;
	Wed, 6 Jan 2021 02:45:28 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2110.outbound.protection.outlook.com [40.107.243.110])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 04ee9b90
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jan 2021 01:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJhSCBl1os4ck/VyKwXuLvws+apswYy9i1uROd9ia9gR2oKkbvoaio0HD7HO9VOjaDNr9bNYLkDtN+ZDlbUDtJQVuVRcqJbUx8LkNQNC+LaEmAY0vdE9uI8W9d71SIyxUJmr2h35bDdOaW1aq3zNO6CBFIbEiv/sLanqezEmR0hy1nvQ/7j3iOySDKXOYk4alrhF0SyXARpkaJkDtSdfk6uJE7O4dusGuPeg0+A7RceBUYfrMAsakHBPduaIpkdvPQLMKYmylfIz4DMNJyNR9WRMtzKAKIZyymiSy0jeLIx5YIug8v1xMISbiwsRUNcfYIaTSmP0pyty3uWd68LMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+c6FwPernKLxay8EhRjybLMyRdOyLYwoMsJyNzQUHU=;
 b=ieJlo8+rqFXRjoBum1BdKA7iHZ8oPgjxSm8GF/HZv7ZpZAk0hP7L9zec6VHsPMj9eFvXhWGknZL1t7VhzdzDUHu6PxarYjbCIhGIjOAKFkSD81ky0blXgoR334Y2U5CsFVfKxECFSsyEV31KLGNOAfliJRS5FPXZzROyX0QM1OyMYC5x6LOnJDAMhwhSl/U9EcuCtoNn0EAg/TAyPcenuBbBVZSsAy8Ya8WSab5X8n5d08D8Avge9gYYq8BLqkV5N97HmVDZnqVfH5DTN76WC8TSk5d8jKcXWnemnDh+pnFDwxClxl/eNc0dDhxY5a+M8FaKevqBjrpvHOkNcVjKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=morsecom.com; dmarc=pass action=none header.from=morsecom.com;
 dkim=pass header.d=morsecom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MorseCommunicationsInc.onmicrosoft.com;
 s=selector2-MorseCommunicationsInc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+c6FwPernKLxay8EhRjybLMyRdOyLYwoMsJyNzQUHU=;
 b=dovI0iD7PTQF9vCloBrr+ehvZ5TirDlmfcR4Z1e4ISvk3fFYlwn7ArIAzB/6U/S73U3yToq8hQT0EQMdLzBCJeH2bb5tEyC5wGYyj3hvBcai7aA4s6tTjdDfqMtlGGoyvIXp+XssmIZQ7/XxomDtreymwIPl+bDGfkfLeAe1Qxo=
Received: from BN6PR05MB2962.namprd05.prod.outlook.com (2603:10b6:404:28::15)
 by BN6PR05MB3507.namprd05.prod.outlook.com (2603:10b6:405:45::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2; Wed, 6 Jan
 2021 01:03:42 +0000
Received: from BN6PR05MB2962.namprd05.prod.outlook.com
 ([fe80::81f8:5744:c4a3:abdd]) by BN6PR05MB2962.namprd05.prod.outlook.com
 ([fe80::81f8:5744:c4a3:abdd%12]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 01:03:41 +0000
From: Corey Costello <ccostello@morsecom.com>
To: Phillip McMahon <phillip.mcmahon@gmail.com>
CC: Chris Osicki <wg@osk.ch>, Roman Mamedov <rm@romanrm.net>, Gijs Conijn
 <egc112@outlook.com>, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WG default routing
Thread-Topic: WG default routing
Thread-Index: AQHW473AVRDnT1+4qUGnzrlAAAGSQaoZyA2A
Date: Wed, 6 Jan 2021 01:03:41 +0000
Message-ID: <CEA16B45-9AED-41ED-AE10-1E93374C9A75@morsecom.com>
References: <20210103215441.GA24251@server>
 <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
 <20210105201212.GA31054@server> <20210106012530.2754726a@natsu>
 <20210105211301.GC31054@server>
 <CABtXGiB0bOWtmOSbJCnGFRM9d-7W0+L4QUz=ZvmX35b8hyzG_A@mail.gmail.com>
In-Reply-To: <CABtXGiB0bOWtmOSbJCnGFRM9d-7W0+L4QUz=ZvmX35b8hyzG_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.20.0.2.21)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=morsecom.com;
x-originating-ip: [71.47.200.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21b5ff74-0f92-4d31-2f54-08d8b1dee8ca
x-ms-traffictypediagnostic: BN6PR05MB3507:
x-microsoft-antispam-prvs: <BN6PR05MB35070425DC250C2A9AA7EA36D0D00@BN6PR05MB3507.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FZUO0SLymT+ZHyYuQcDwg4WTc12L0KmOBIBzoOQr1Q5NrO/ioVvtdiJJBb93a/7S/5UgDjfQcODdH6Pon0e5I45B874Ybt8n0D4J1MRrF1qwl/30SaT5C4YrD8Gl4+jWr3hMfyGmBcFYTzdfbf3iVI07TocQwQV3RQ3PAwnwWFxuH/qvWDS02TcC7398G6Ad0jTz5I3+uHIc5nsIcBqA5yuuKbZnkJR4kJsATr+HawbQWYPPFaFNVKx3Ej7JA6x6SEZWP4Qhx++DV+SVOhgzAmPHV8CWs9WiSvKy+tdSzG+AAoE63IEmwWg+IAuARQmOo3hZxQ5Pk7Lih21D6lCD/GV4IT2hZDw6kkoUf5MhtBcuDjw7P1hKBRC/PwbstRubamiiA9QnAP5/GaX7NraW5iKNX1c6UDp9lYfYNsXI8h8ZsimbpzKwqOw7qF73SKBBcsHBn7b1yHzgXYVGCPBe2rtaRVqB9I0W8pIBcJh366HL7DTUKTy3q6/fOWa31ubTwR+FodZYHajPIqpR+RGaqaXrKo6BU3hchChYGG5lpHk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR05MB2962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(366004)(376002)(136003)(86362001)(2906002)(478600001)(66476007)(66446008)(64756008)(3480700007)(6512007)(66946007)(66556008)(36756003)(5660300002)(966005)(71200400001)(6916009)(186003)(4326008)(6506007)(316002)(26005)(8936002)(76116006)(53546011)(83380400001)(54906003)(7116003)(33656002)(8676002)(2616005)(6486002)(44894002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VDNEcGZ2MlNJZGIyZTJyQnlKVFlUellXSUpBVHpQZXozMFJobUNBYkMyVW1S?=
 =?utf-8?B?QTVobEtNVThNN1JBR0FoS3NUd3BpU1ZiNDZTL01zS1piaGpEcFRzcDJrQmN6?=
 =?utf-8?B?QWdrd2RSRm4xSy84WXl1WElRTEx3NjJlRWZHUG40aThkRXhFTDFXUFVVdUhz?=
 =?utf-8?B?NWZGemF2WmZFbFNoSkp1am9GZ1ZyV21MZlQ4dFd2ekhBdDNYTSszS2VSN3l4?=
 =?utf-8?B?aDB2UEhQNDdlVjhSSW85dzFtNUZDUkEyUm9qLysrdEgrM1VtNzdvVk1JbDg2?=
 =?utf-8?B?UVhCSHVXcmZWK2JkWFBzVW5JelBOMlR3UnRiTnVhV3ExMVN2cERRanhTZmti?=
 =?utf-8?B?ZkJLbFpsRGlmUHdPRzFScDFNNzVYZ3dKTnRQUnkwb3JIQThkNEpkcHBON1RL?=
 =?utf-8?B?bktmZTZ0QjVCQ2NGRndMcHRZZ2VDMFAwTFVEeTJrYXhJS2FrNGlGR0lUa0E2?=
 =?utf-8?B?SnBtMVY3dkE1eXo5VWFLYm5CYk9WckQ4UkxBN3p6cEpRU04zS3hwT3ZIcnBQ?=
 =?utf-8?B?RkFWZHJtQzBSM0tOcFNmTGc2RjFpMHFiUGRQbHplTXBPaXUzNWhaTVFRcHZ4?=
 =?utf-8?B?RXRJVjJCUVYrWkwwVHpkVURjSnN4aFhsYlZCa3k3N2pibjRJQWNKZWl5Z3Jx?=
 =?utf-8?B?TG15a1pNS1lsSHM4aXdQa29vNWZKMFY4bDR0RVE0RjIzdVlaN3FrOUtkMmQy?=
 =?utf-8?B?R1dwdm52QVRTOE1TN21Zb3BreTgxS2hhV3FFay8reGtrOStIcVhLUEtCNitX?=
 =?utf-8?B?RVYwRHNoTHBCWDg5aVFVWnhwUFh6dDFMKzN4bmlXbHVLUTcvNktnWEpQWndW?=
 =?utf-8?B?a0ZLSStjb3JXKzJSZkJFY2g2bVFrSHZab0lMcFhkSlBDVWlkNytucHNsRTdB?=
 =?utf-8?B?L0hYQ1hjb1JuM2VQd1ZhVncxMCtaNFlXU1VtaW9GejNxZy9vMUlSWFBJbGlk?=
 =?utf-8?B?bDZMaTFBUzhNUVluN2c2KzVORkJGNXZtWHZzQkUza0pqWm1qQ2xEQk8zOU9V?=
 =?utf-8?B?MklGVS9qamVES21vZ3I4aS92V20vVmMyWU5uTWdrcFZ3VTlqQURudmpKc28v?=
 =?utf-8?B?eDR5U2ZUL2dUcTFucEhGU3IxTExFWUhLSFQySjVhNTlMMER1Z0ZXUHZQajBp?=
 =?utf-8?B?RTg5ZjBldTMya01PUzF5SEo0dnJST0VYMUN3M3lOaFhUUmQvRDNhZ09tQzZ3?=
 =?utf-8?B?WlhCUnN6d21kTnBsOFBMOFBWNUxFeVFrZ2xnbk41bU1jZ04zVnA5QXdmSmhk?=
 =?utf-8?B?aCtnYnVna2VnT2xFcUpCa0l4aXF2bWxxdEZkV0U3ckQxN1grMmF3eDZCaWRj?=
 =?utf-8?Q?A3tnsWPHzletzSkVHEhCO2w+p4jhEzMZcU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4779AE0D1A3D98478D35539D88B4DE40@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: morsecom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR05MB2962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b5ff74-0f92-4d31-2f54-08d8b1dee8ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 01:03:41.7826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dd11875b-80bd-4856-b2d1-d8b42fe95638
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5j2KblYyEtS7pin9Gxq0vAA8yp0VoWdYqMjtkd9Y5BwRYftNmzd54rUgpVzwBDWxVb7fUAx8dQQ3F5GzvvhsTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB3507
X-Mailman-Approved-At: Wed, 06 Jan 2021 02:45:27 +0000
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

Q2FuIHNvbWVvbmUgdGFrZSBtZSBvZmYgdGhpcyBsaXN0Pw0KDQpJ4oCZdmUgdHJpZWQgbGlrZSA0
IHRpbWVzIHJlcGx5aW5nIHRvIHRoZSB3aXJlZ3VhcmQgbGlzdCBhbmQgaXQgc2F5cyBVbnN1YnNj
cmliZWQhIEFuZCB0aGVuIGNvbWVzIGJhY2sgOiggDQoNCj4gT24gSmFuIDUsIDIwMjEsIGF0IDY6
NTAgUE0sIFBoaWxsaXAgTWNNYWhvbiA8cGhpbGxpcC5tY21haG9uQGdtYWlsLmNvbT4gd3JvdGU6
DQo+IA0KPiBIaSBDaHJpcywgeW91IGZpcnN0IHBvc3QgbWFkZSBpdCBzb3VuZCB2ZXJ5IG11Y2gg
bGlrZSBhIHF1ZXJ5IG9uDQo+IHdnLXF1aWNrLCBpdCdzIG1lbnRpb25lZCBpbiBhIHdheSB0aGF0
IGltcGxpZXMgeW91J3JlIHVzaW5nIGl0Lg0KPiANCj4gIi4uLk15IGZpcnN0IHRyeSB3YXMgd2l0
aCB3Zy1xdWljaywgYW5kIG5vdGljZWQgYWxsIG15IHRyYWZmaWMgd2VudA0KPiB0aHJvdWdoIHRo
ZSBXRy1WUE4gY29ubmVjdGlvbi4NCj4gSXQgZXNjYXBlcyBtZSB3aHkuIFdoYXQgaXMgdGhlIGlk
ZWEgYmVoaW5kIHRoaXMgcG9saWN5Pw0KPiANCj4gT24gbXkgTGludXggYm94ZXMgaXQncyBub3Qg
YSBwcm9ibGVtLCBJIGRvbid0IGhhdmUgdG8gdXNlIHdnLXF1aWNrIGFuZA0KPiB3aXRoIGZldyBs
aW5lcyBvZiBiYXNoIGluIGEgc2NyaXB0IEkgaGF2ZSB3aGF0IEkgbmVlZC4gSSBoYXZlDQo+IHJv
b3QuLi4uIg0KPiANCj4gT24gdGhlIHdvcmtpbmcgY29uZmlnIEkgaGF2ZSwgbXVsdGlwbGUgY2xp
ZW50cywgbXVsdGlwbGUgd2cgdHVubmVscw0KPiBhbmQgcG9saWN5LWJhc2VkIHJvdXRpbmcsIEFs
bG93ZWRJUHMgZG9lcyBzZXQgdXAgZW50cmllcyBpbiBteSByb3V0aW5nDQo+IHRhYmxlLiBOb3Qg
c2V0dGluZyBhbm90aGVyIGluIEFsbG93ZWRJUHMgcmVzdWx0cyBpbiB3aGF0IHlvdSBhcmUNCj4g
c2VlaW5nLCBubyB0cmFmZmljIGZsb3cgYXMgdGhlaXIgYXJlIG5vIHJvdXRlcyBlc3RhYmxpc2hl
ZC4gd2cgdXNlcw0KPiB5b3VyIHN0YW5kYXJkIE9TIGZ1bmN0aW9uYWxpdHkgZm9yIHJvdXRpbmcs
IHRyeSBhZGRpbmcgdGhvc2Ugcm91dGVzDQo+IG1hbnVhbGx5IGFuZCBubyBpbiB0aGUgd2cgY29u
ZmlnIGFuZCB5b3Ugc2hvdWxkIHNlZSBxdWlja2x5IHRyYWZmaWMNCj4gc3RhcnQgdG8gZmxvdy4N
Cj4gDQo+IEFsbG93ZWRJUHMgZnVuY3Rpb24gaW4gdGhlIGNvbmZpZyBpcyB0byBlYXNpbHkgZW5j
YXBzdWxhdGUgc2ltcGxlDQo+IHJvdXRpbmcgcmVxdWlyZW1lbnRzIGZvciB0dW5uZWxzIHRoYXQg
cHJvYmFibHkgc2F0aXNmaWVzIHRoZSBuZWVkcyBvZg0KPiBtb3N0IHNpbXBsZSB1c2Vycy4gU3Rp
Y2sgaW4gMC4wLjAuMC8wIGFuZCBldmVyeXRoaW5nIGdvZXMgZG93biB0aGUNCj4gcGlwZSwgb3Ig
YWRkIHNwZWNpZmljIHJhbmdlcyB5b3Ugd2FudCB0byBnbyBkb3duIHRoZSBwaXBlIGFuZCBub3Ro
aW5nDQo+IGVsc2UuDQo+IA0KPiBPciB5b3UgY2FuIGdvIHlvdXIgb3duIHJvdXRlIChubyBwdW4g
aW50ZW5kZWQpIGFuZCBtYWtlIGZ1bGwgdXNlIG9mDQo+IHlvdXIgT1Mgcm91dGluZyBhbmQgSVAg
Y2FwYWJpbGl0eSB0byBnZXQgYXMgY29tcGxleCBhcyB5b3UgbmVlZC4NCj4gDQo+IHdnIGRvZXNu
J3QgaGF2ZSBhIHBvbGljeSB0byB0YWtlIG92ZXIgeW91ciByb3V0aW5nLCBidXQgaWYgeW91IHVz
ZQ0KPiB3Zy1xdWljayBhcyBtZW50aW9uZWQgaW4geW91ciBmaXJzdCBwb3N0IGl0J3MgdGFraW5n
IGNhcmUgb2YgbG90cyBvZg0KPiB0aGluZ3MgZm9yIGVhc2Ugb2YgdXNlIGFuZCBiYXNlZCBvbiB0
aGUgY29udGVudCBvZiB5b3VyIGNvbmZpZyBtaWdodA0KPiB0YWtlIG92ZXIgYWxsIHJvdXRpbmcu
DQo+IA0KPiBQb3N0IHlvdXIgY29uZmlnIGFuZCB3aGF0IHlvdSBhY3R1YWxseSB3YW50IHRvIGFj
aGlldmUgYW5kIEkgYW0gc3VyZQ0KPiB0aGlzIG1haWxpbmcgbGlzdCB3aWxsIGhhdmUgeW91IHVw
IGFuZCBydW5uaW5nIGluIG5vIHRpbWUuDQo+IA0KPiBPbiBUdWUsIDUgSmFuIDIwMjEgYXQgMjI6
MTYsIENocmlzIE9zaWNraSA8d2dAb3NrLmNoPiB3cm90ZToNCj4+IA0KPj4gT24gV2VkLCBKYW4g
MDYsIDIwMjEgYXQgMDE6MjU6MzBBTSArMDUwMCwgUm9tYW4gTWFtZWRvdiB3cm90ZToNCj4+PiBP
biBUdWUsIDUgSmFuIDIwMjEgMjE6MTI6MTIgKzAxMDANCj4+PiBDaHJpcyBPc2lja2kgPHdnQG9z
ay5jaD4gd3JvdGU6DQo+Pj4gDQo+Pj4+IEFzIGZhciBhcyBJIGNhbiBzZWUgYWZ0ZXIgZmV3IHRl
c3RzLCBBbGxvd2VkSVBzIGNvbmZpZyBmaWxlIG9wdGlvbiBoYXMgbm90aGluZyB0byBkbyB3aXRo
IHJvdXRpbmcgYW5kIEkgaG9wZQ0KPj4+PiBpdCB3aWxsIHN0YXkgbGlrZSB0aGlzLg0KPj4+IA0K
Pj4+IHdnLXF1aWNrIHVzZXMgQWxsb3dlZElQcyB0byBhbHNvIHNldCB1cCBtYXRjaGluZyBlbnRy
aWVzIGluIHRoZSBzeXN0ZW0gcm91dGluZw0KPj4+IHRhYmxlLiBUaGlzIGNhbiBiZSBkaXNhYmxl
ZCBpbiBpdHMgY29uZmlnLg0KPj4+IA0KPj4+PiBJdCBpcyBqdXN0IGEgZmlsdGVyDQo+Pj4gDQo+
Pj4gSXQgaXMgbm90IG9ubHkgYSBmaWx0ZXIgb24gaW5jb21pbmcgcGFja2V0cywgYnV0IGFsc28g
V0cncyBpbnRlcm5hbCByb3V0aW5nDQo+Pj4gdGFibGUgZm9yIGtub3dpbmcgd2hpY2ggcGFja2V0
cyBzaG91bGQgYmUgc2VudCB0byB3aGljaCBwZWVyLg0KPj4gDQo+PiBJJ20gc29ycnkgdG8gY29u
dHJhZGljdCB5b3UgYnV0IGFmdGVyIHNvbWUgbW9yZSByZWFkaWcgSSBoYXZlIHRvIDotKQ0KPj4g
V0cgaGFzIG5vICJpbnRlcm5hbCByb3V0aW5nIHRhYmxlIiwgd2ctcXVpY2sgKHdoaWNoLCBCVFcs
IGlzIG5vdCB0aGUgc3ViamVjdCBvZiBteSBxdWVyeSkgdXNlcyBpdCB0byBtb2RpZnkNCj4+IGtl
cm5lbCByb3V0aW5nIHRhYmxlcywgZnJvbSB0aGUgd2ctcXVpY2sgbWFuIHBhZ2U6DQo+PiANCj4+
ICAgICAgIEl0IGluZmVycyBhbGwgcm91dGVzIGZyb20gdGhlIGxpc3Qgb2YgcGVlcnMnIGFsbG93
ZWQgSVBzLCBhbmQgYXV0b21hdGljYWxseSBhZGRzIHRoZW0gdG8gIHRoZSAgc3lzdGVtICByb3V0
aW5nDQo+PiAgICAgICB0YWJsZS4gIElmICBvbmUgIG9mICB0aG9zZSAgcm91dGVzIGlzIHRoZSBk
ZWZhdWx0IHJvdXRlICgwLjAuMC4wLzAgb3IgOjovMCksIHRoZW4gaXQgdXNlcyBpcC1ydWxlKDgp
IHRvIGhhbmRsZQ0KPj4gICAgICAgb3ZlcnJpZGluZyBvZiB0aGUgZGVmYXVsdCBnYXRld2F5Lg0K
Pj4gDQo+PiBTbywgaW4gbXkgdGVzdCBjb25maWcgSSBoYXZlIGEgc2VydmVyLCAxMC4xMC4xMC4x
IGFuZCB0d28gY2xpZW50cywgMTAuMTAuMTAuMi8zDQo+PiBJZiBvbiB0aGUgc2VydmVyIEkgcmVt
b3ZlIHRoZSBBbGxvd2VkSVBzIG9wdGlvbiwgbm8gb25lIGNhbiBjb25uZWN0Lg0KPj4gR2l2aW5n
IEFsbG93ZWRJUHMgPSAxMC4xMC4xMC4wLzI0IGJvdGggY2xpZW50cyBjYW4gY29ubmVjdCBhbmQg
cm91dGluZyBpbiB0aGVtIHN0YXlzIGFzIGl0IHdhcy4NCj4+IFRoZSBzYW1lIGZvciB0aGUgY2xp
ZW50cywgd2l0aG91dCBBbGxvd2VkSVBzID0gMTAuMTAuMTAuMC8yNCBjYW5ub3QgY29ubmVjdC4N
Cj4+IA0KPj4gVGh1cywgbXkgcXVlc3Rpb24gc3RpbGwgcmVtYWluczogd2h5IHRoaXMgZmlsdGVy
aW5nIGZ1bmN0aW9uPw0KPj4gDQo+Pj4gDQo+Pj4gLS0NCj4+PiBXaXRoIHJlc3BlY3QsDQo+Pj4g
Um9tYW4NCj4+IA0KPj4gUmVnYXJkcywNCj4+IENocmlzDQo+IA0KPiANCj4gDQo+IC0tIA0KPiBV
c2UgdGhpcyBjb250YWN0IHBhZ2UgdG8gc2VuZCBtZSBlbmNyeXB0ZWQgbWVzc2FnZXMgYW5kIGZp
bGVzDQo+IA0KPiBodHRwczovL2xpbmtwcm90ZWN0LmN1ZGFzdmMuY29tL3VybD9hPWh0dHBzJTNh
JTJmJTJmZmxvd2NyeXB0LmNvbSUyZm1lJTJmcGhpbGxpcG1jbWFob24mYz1FLDEscTZIN3hMbzJR
bDFja1F6bi1zRzBXYUxwS24ya0RNUHA2OTZsVEdtTzZ5STVFVkpBUUFxSlJkeC15Ykc5X3VxeEx0
YndQdXZwN0d4aUtoSUJNZzM4V05EVk1md3ctZWpQSjNVTFdfUmREZywsJnR5cG89MQ0KPiANCj4g
UC5TLiBEcm93bmluZyBpbiBlbWFpbD8gVHJ5IFNhbmVCb3ggYW5kIHRha2UgYmFjayBjb250cm9s
Og0KPiBodHRwczovL2xpbmtwcm90ZWN0LmN1ZGFzdmMuY29tL3VybD9hPWh0dHAlM2ElMmYlMmZz
YW5lYm94LmNvbSUyZnQlMmZvbGQzbS4mYz1FLDEsZlZ2MXpMYzRHSmE0dHM4NUNNUFFuTkh2SnFx
REJoNHBaUHBOTkdxSjdPSGJqMmpSeV80ZzQ5dzhDVS1CdmpOOUtlMThXVVJoZlgxbVJ4Sjhtc1px
QjlfSmxQbVRHbC10M0NYTGs5eUhjOVRBLW1lRmV3VXAwdywsJnR5cG89MSBJIGxvdmUgaXQuDQoN
Cg==
