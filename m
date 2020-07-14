Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270F9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 21:29:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DB0206F6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 21:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=westtel.com header.i=@westtel.com header.b="z8/drHCJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DB0206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=westtel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e22c411f;
	Fri, 24 Jul 2020 21:06:05 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2105.outbound.protection.outlook.com [40.107.94.105])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e9f231ba
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jul 2020 16:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjR8g8+//CnB8kH6jWiWeLZxl1tC4KsV7Iw5z+pAyRNzW2A+bO3Y8RcTkBfRUiu9KXWSyKr/3HP03+QNcBORbvthVMNY5nLqd/rW+/iFWBgnbd45W+5n8AdWWqvfIxBK64wPwlQVaBCJOVWrtCSeNrCZZnoC7OpKSEInzEvAIizyKsz2os/9ztun3JQLEMcrhlkO7pW7VLGy/eDco6NnHt3cvoozAo8WDq2c6cdC0Za4jC7FoDl6jzJ0OoZvitJLfNcNKLUlq5PIQToSDtANB7oo7LFPAYIm2xbbaSsabgJsUiLbgc+vCCrc7bNVBbK9YdG6Zqx1XBEl7+ORttlEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM6O3jVeqkmp9TJ9KVSw/UTqopz4xMxrevkS69NHLB8=;
 b=ZAlSqeXdalKOeZXPomerCjBzXioc+nrPSbYOe7nymUSycPP+G2NOPyhISaF0jcVEzg3Lyl2V0M3KzTmfydpnjLW/E5fiVY6RrhFKeQ8rI9F0BuV4X1BiAWgiJON0aOLI8ZX9ZbL4lNOzmdJFJCEk/WvcjZYU2cASDKqfjgu7kpIO2DNHj3qQ1lrAHRp4Zc8Rl/IT4E2Uf8te0sofp4fQjTVd59PPYoSaVltGKDaXHPMoDNR4gv5xXOHq1eJycsb8HTJU7k8wRetjkDVuzkJ+4D9Tz6xf4NMOew+ezUuBPgD0sj/PBx6J1BVnZZ79Eg08A8ULHQGHmFdIXV0kUPACSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westtel.com; dmarc=pass action=none header.from=westtel.com;
 dkim=pass header.d=westtel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westtel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM6O3jVeqkmp9TJ9KVSw/UTqopz4xMxrevkS69NHLB8=;
 b=z8/drHCJRwoeZuPV0JqZ7lFvnHaROyGwGclucp8YRa+p9iWxnlEwstLW+BHJlYOPuwH6qURLKCuukFXLXF2yyPtL0Ga25es2lsbpQcE/u58Q9aT+Hu+Rg+q/sKZfwYg6uVtRTqHRgunORAEyl3PGvNmEu1LAU3wdgVRvinsVxos=
Received: from SN6PR10MB2559.namprd10.prod.outlook.com (2603:10b6:805:44::22)
 by SN6PR10MB3086.namprd10.prod.outlook.com (2603:10b6:805:d6::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Tue, 14 Jul
 2020 17:00:43 +0000
Received: from SN6PR10MB2559.namprd10.prod.outlook.com
 ([fe80::ad7f:8682:77c2:6d4a]) by SN6PR10MB2559.namprd10.prod.outlook.com
 ([fe80::ad7f:8682:77c2:6d4a%4]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 17:00:42 +0000
From: Matthew Nichols <matt.nichols@westtel.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: DNS Issues with Wireguard for Windows
Thread-Topic: DNS Issues with Wireguard for Windows
Thread-Index: AQHWWXEvTgpLRhNfa0OiZWEIgWAiVKkHS/zw
Date: Tue, 14 Jul 2020 17:00:42 +0000
Message-ID: <SN6PR10MB255974BC35791CCF2971225183610@SN6PR10MB2559.namprd10.prod.outlook.com>
References: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
In-Reply-To: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=westtel.com;
x-originating-ip: [23.24.152.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e88b348-5f0b-4491-00af-08d8281771b3
x-ms-traffictypediagnostic: SN6PR10MB3086:
x-microsoft-antispam-prvs: <SN6PR10MB308674662BD19A2D30EE4E4483610@SN6PR10MB3086.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxfUCDWShoYyZ7vJRPSSSU5ouv4bjnbtH2lAT2tGtDDmRCP7n3ODVmiQlmWJotBMxAPp9wII+tV5gWnISH8KJHVRga3R3BbrHEn5/ruxGihRfu6y2EIvarl8tRQ4YkRerNTAiqVthh74C6CE0HuYdF+u71SyBKQlmbRa4YTpeuTXTbT4yNlKidjsuI1jaMai+UdtobdWol8qDztXAYI9zIeJwysLVLESAR+SXmDZXGbZD21SYFQEvEXwQ3H02iwomS3BcoRwy0FwRnFxHWzNcXutOO1TFO1EYCxuCdrB7P+W2JiTNQZkUnO7cXfZbFwhNfe3z8WZlVJckXrgoDWhlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2559.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(376002)(39830400003)(136003)(346002)(186003)(5660300002)(26005)(8676002)(86362001)(508600001)(33656002)(66446008)(8936002)(83380400001)(71200400001)(9686003)(64756008)(66556008)(2906002)(66946007)(66476007)(316002)(6506007)(76116006)(66574015)(52536014)(6916009)(53546011)(7696005)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PsVIJe2b9BQLQ7nukV6ia/PCDcg7Cf3A6eYS2+hLuW+Xy7gDjtAtR5G2c3t2awHsPsBb4uX/JJw40AN0SIsHoU3556QVizGYXRlMB/pytXMmNHnTVWfQjQALUNUXo+tWq4fWhjKcvFtAD+mERWNtAQII1W9c3ASxQC4oq5TaBlUCY9hWXZ/8rLMUCLVSidZ/DZIW3tblLHtfmCQxsibxO+HBmdAAPVglaYeeMIoNUaKnPocb/hvtLRO1eDfZK1ZQFbsi+Qf1JgLJtjHZqc56Bmq6kw5H/TFi0YOGJRnPnqOfx8kZAYdYqljuudoJcwTVFEkG98ZDYP70gqamlHup3sgROfSRzoUye7dYzQNuE7K1dpknguPDgazzRwlizRo/NA/A/C8TXvqfhziqzlJxMdpz0/6D13T1XvKpyq72kuALY5lBEL3Mqiq6ERolSp4yToknlLXSQdzecV2yXC+seJYrCj48L8teRmW/4ao4crw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: westtel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2559.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e88b348-5f0b-4491-00af-08d8281771b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 17:00:42.8471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dd66a788-b195-4b27-b04c-9c2edc080bae
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDNruol57XHGxIv2yhdOgatEkLZSXSMn27NgttYX1DbN/VHQDnux6Ev58VOYtsFiITFxT9+lx4chM1g0Td8F62IHZ3XWUfhx35NFUyMD4sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3086
X-Mailman-Approved-At: Fri, 24 Jul 2020 23:06:03 +0200
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

SSB3YXMganVzdCBsb29raW5nIGludG8gYSBzaW1pbGFyIGlzc3VlIHJlY2VudGx5IGFuZCBpdCBs
b29rcyBsaWtlIFdpcmVHdWFyZCBvbiBXaW5kb3dzIGFkZHMgZmlyZXdhbGwgcnVsZXMgYmxvY2tp
bmcgYWxsIEROUyBzZXJ2ZXJzIGV4Y2VwdCBmb3IgaXRzIGNvbmZpZ3VyZWQgRE5TIHNlcnZlcnMs
IHdpdGggbm8gb3B0aW9uIHRvIGRpc2FibGUuDQoNCkkga25vdyBmb3IgdXMgaXQgd291bGQgYmUg
dmVyeSBoZWxwZnVsIHRvIGF0IGxlYXN0IGhhdmUgYW4gb3B0aW9uIHRvIGRpc2FibGUgdGhpcyBi
ZWhhdmlvciwgYXMgaXQgaXMgdmVyeSBzdXJwcmlzaW5nIGJlaGF2aW9yIHRoYXQgbWFrZXMgbW9y
ZSBjb21wbGljYXRlZCBzZXR1cHMgbW9yZSBkaWZmaWN1bHQgdG8gaW1wb3NzaWJsZSB0byBkbyBj
b3JyZWN0bHkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXaXJlR3VhcmQg
PHdpcmVndWFyZC1ib3VuY2VzQGxpc3RzLnp4MmM0LmNvbT4gT24gQmVoYWxmIE9mIEFuZHJldyBC
dXJrZXR0DQpTZW50OiBGcmlkYXksIEp1bHkgMTAsIDIwMjAgNTozMSBQTQ0KVG86IHdpcmVndWFy
ZEBsaXN0cy56eDJjNC5jb20NClN1YmplY3Q6IEROUyBJc3N1ZXMgd2l0aCBXaXJlZ3VhcmQgZm9y
IFdpbmRvd3MNCg0KSSB3YXMgcnVubmluZyBpbnRvIGRucyBpc3N1ZXMgd2l0aCB3aXJlZ3VhcmQg
b24gd2luZG93cyB1c2luZyB0aGUgcmVsZWFzZWQgZ3VpIGFwcC4gSXQgc2VlbXMgbGlrZSBhIGJ1
ZyB3aXRoIHdpcmVndWFyZCwgYnV0IG5vdCBzdXJlIGlmIGl0IHdhcyBhY3R1YWxseSBzb21ldGhp
bmcgYWJvdXQgbXkgbmV0d29ya2luZyBjb25maWdzIHRoYXQgbWVzc2VkIGl0IHVwLiBJIHdhcyBh
YmxlIHRvIHdvcmsgYXJvdW5kIHRoZSBpc3N1ZSBieSBjaGFuZ2luZyB0aGUgd2lyZWd1YXJkIGNv
bmZpZyAoaW4gYSB3YXkgdGhhdCBzZWVtZWQgb2RkIHRvIG1lKSwgYnV0IEkgdGhvdWdodCBpdCBt
aWdodCBiZSB1c2VmdWwgdG8gc2hhcmUgd2hhdCBJIHdhcyBzZWVpbmcgaW4gY2FzZSBpdHMgaGVs
cGZ1bCB0byBvdGhlcnMgb3IgaWYgaXQgaXMgaW4gZmFjdCBhIGJ1ZyBpbiB3aXJlZ3VhcmQuIEkn
bGwgc2hhcmUgdGhlIGNvbmZpZ3MgYXQgdGhlIGJvdHRvbSBvZiB0aGUgZW1haWwsIGJ1dCBJJ20g
anVzdCBnb2luZyB0byBkZXNjcmliZSB3aGF0IEknbSBzZWVpbmcgZmlyc3QuDQoNCk15IGJhc2lj
IHNldHVwIGlzIEkgaGF2ZSB3aXJlZ3VhcmQgcnVubmluZyBvbiBhIGxpbnV4IGJveCBmdW5jdGlv
bmluZyBhcyBhIHNlcnZlci9yb3V0ZXIgdG8gYSByZW1vdGUgbmV0d29yay4gSSd2ZSBnb3QgYSB3
aW5kb3dzIGRlc2t0b3AgY29ubmVjdGluZyB0byB0aGUgbGludXggYm94IHZpYSB3aXJlZ3VhcmQu
IFRoZXJlIGFyZSBkbnMgc2VydmVycyBvbiB0aGUgcmVtb3RlIG5ldHdvcmsgdGhhdCBJIHdvdWxk
IGxpa2UgdG8gdXNlIGZyb20gdGhlIGRlc2t0b3AuIEkgYWRkZWQgdGhlIGRucyBzZXJ2ZXJzIGZy
b20gdGhlIHJlbW90ZSBuZXR3b3JrIHRvIG15IGRlc2t0b3Agd2lyZWd1YXJkIGNvbmZpZy4gRXZl
cnl0aGluZyB3YXMgd29ya2luZyBmaW5lIGZvciBhd2hpbGUuIEF0IHNvbWUgcG9pbnQsIG15IHdp
bmRvd3MgYm94IHN0YXJ0ZWQgY29tcGxhaW5pbmcgYWJvdXQgbm90IGJlaW5nIGNvbm5lY3RlZCB0
byB0aGUgaW50ZXJuZXQuIEkgd2FzIGFibGUgdG8gcGlucG9pbnQgaXQgd2l0aCBzb21lIGNvbmZp
ZGVuY2UgdG8gZG5zIHJlcXVlc3RzIGZhaWxpbmcgd2hlbiB3aXJlZ3VhcmQgd2FzIGNvbm5lY3Rl
ZC4gRXZlbiB0aG91Z2ggd2luZG93cyB3YXMgY29tcGxhaW5pbmcgYWJvdXQgbm90IGhhdmluZyBh
IG5ldHdvcmsgY29ubmVjdGlvbiwgbXkgYnJvd3NlciBzdGlsbCB3b3JrZWQgdGhvdWdoIGl0IHNl
ZW1lZCBzbG93IHNvIEkgYXNzdW1lZCBpdCB3YXMgdHJ5aW5nIGEgZG5zIHNlcnZlciBhbmQgdGhl
biBmYWxsaW5nIGJhY2sgdG8gYSBkaWZmZXJlbnQgb25lIGFmdGVyIGEgdGltZW91dCAoYXQgbGVh
c3QgdGhhdCB3YXMgbXkgZ3Vlc3MpLiBUaGUgImNhdXNlIiBvZiB0aGUgcHJvYmxlbSB3YXMgYWRk
aW5nDQoxOTIuMTY4LjcuMTIvMzIgdG8gdGhlIEFsbG93ZWRJUHMgb24gdGhlIHBlZXIgKHRoZSB3
aXJlZ3VhcmQgbmV0d29yayBpbiBteSBjYXNlIGlzIDEwLjk4LjEuMC8yNCBhbmQgdGhlIHJlc3Qg
b2YgdGhlIG5ldHdvcmsgaXMgdW5kZXINCjEwLjAuWC5YKSBBZnRlciBhZGRpbmcgaXQgYW5kIHdh
aXRpbmcgZm9yIGEgY291cGxlIGhvdXJzIHdpbmRvd3Mgd2lsbCBpbmV2aXRhYmx5IGNsYWltIHRo
YXQgdGhlcmUgaXMgbm8gaW50ZXJuZXQgYWNjZXNzIGZyb20gbXkgbmV0d29yayBhZGFwdGVyLiBT
b21ldGltZXMgbnNsb29rdXAgYW5kIHBpbmcgc3RpbGwgd29yayBmaW5lLCBzb21ldGltZXMgdGhl
eSBzdGFydCB0byByZXBvcnQgZXJyb3JzLiBNeSBzb2x1dGlvbiB0aGF0IHJlbGlhYmx5IGZpeGVz
IGl0IGlzIHRvIGFkZCBteSBsb2NhbCBkbnMgc2VydmVyICh3aGljaCBpcyBteSBsb2NhbCByb3V0
ZXIgaW4gdGhpcyBjYXNlDQoxOTIuMTY4Ljg2LjEpIHRvIHRoZSBkbnMgc2VjdGlvbiBvZiB0aGUg
d2lyZWd1YXJkIGNvbmZpZywgd2hpY2ggc2VlbXMgbGlrZSBhbiBvZGQgZml4IHNpbmNlIEknbSBu
b3QgYWN0dWFsbHkgc2VuZGluZyBsb2NhbCBkbnMgdHJhZmZpYyB0byB3aXJlZ3VhcmQuDQoNCkkg
Y291bGRuJ3QgZmlndXJlIG91dCBob3cgdG8gdXNlIHdpcmVzaGFyayB0byB2aWV3IHdpcmVndWFy
ZCB0cmFmZmljIG9uIHdpbmRvd3MgdG8gc2VlIHdoYXQncyBoYXBwZW5pbmcgdG8gdGhlIGRucyBy
ZXF1ZXN0cywgbm9yIGRvIEkga25vdyBvZiBhbm90aGVyIHdheSB0byB2aWV3IHRyYWZmaWMgKElm
IHNvbWVvbmUgd2FudHMgdG8gcG9pbnQgbWUgYXQgaG93IHRvIGRvIHRoYXQsIG9yIHNvbWUgb3Ro
ZXIgd2F5IHRvIHZpZXcgbmV0d29yayB0cmFmZmljIG9uIHdpbmRvd3MsIEknbSBoYXBweSB0byBs
b29rIGF0IGl0KS4NCg0KQW55d2F5LCB0aGFua3MgZm9yIHRoZSBzb2Z0d2FyZS4gSXQncyB0aGUg
YmVzdCB2cG4gc29mdHdhcmUgSSd2ZSB1c2VkIGJ5IGEgbWlsZS4NCg0KQW5kcmV3DQoNCk15IExv
Y2FsIEdhdGV3YXkvRE5TIGlzIDE5Mi4xNjguODYuMQ0KTXkgTG9jYWwgSVAgaXMgaW4gMTkyLjE2
OC44Ni4wLzI0IHN1Ym5ldA0KDQpXb3JraW5nIENvbmZpZyAxDQoNCltJbnRlcmZhY2VdDQpQcml2
YXRlS2V5ID0gWFhYWFgNCkFkZHJlc3MgPSAxMC45OC4xLjEwMy8zMg0KRE5TID0gMTAuMC5YLlgs
IDEwLjAuWS5ZDQoNCltQZWVyXQ0KUHVibGljS2V5ID0gWFhYWFhYDQpBbGxvd2VkSVBzID0gMTAu
MC4wLjAvMTYsIDEwLjk4LjEuMC8yNA0KRW5kcG9pbnQgPSBYWFhYWFhYDQoNCldvcmtpbmcgQ29u
ZmlnIDINCg0KW0ludGVyZmFjZV0NClByaXZhdGVLZXkgPSBYWFhYWA0KQWRkcmVzcyA9IDEwLjk4
LjEuMTAzLzMyDQpETlMgPSAxMC4wLlguWCwgMTAuMC5ZLlkgLCAxOTIuMTY4Ljg2LjENCg0KW1Bl
ZXJdDQpQdWJsaWNLZXkgPSBYWFhYWFgNCkFsbG93ZWRJUHMgPSAxMC4wLjAuMC8xNiwgMTAuOTgu
MS4wLzI0LCAxOTguMTY4LjcuMTIvMzIgRW5kcG9pbnQgPSBYWFhYWFhYDQoNCk5vbldvcmtpbmcg
Q29uZmlnDQoNCltJbnRlcmZhY2VdDQpQcml2YXRlS2V5ID0gWFhYWFgNCkFkZHJlc3MgPSAxMC45
OC4xLjEwMy8zMg0KRE5TID0gMTAuMC5YLlgsIDEwLjAuWS5ZDQoNCltQZWVyXQ0KUHVibGljS2V5
ID0gWFhYWFhYDQpBbGxvd2VkSVBzID0gMTAuMC4wLjAvMTYsIDEwLjk4LjEuMC8yNCwgMTk4LjE2
OC43LjEyLzMyIEVuZHBvaW50ID0gWFhYWFhYWA0K
