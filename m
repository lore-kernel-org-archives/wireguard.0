Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8698C282DD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 21:21:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7F620656
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 21:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.usask.ca header.i=@mail.usask.ca header.b="kbMkv17e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7F620656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=usask.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 797e751f;
	Thu, 9 Jan 2020 21:20:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f3518d2
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 21:20:53 +0000 (UTC)
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
 (mail-eopbgr660138.outbound.protection.outlook.com [40.107.66.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76ce06ec
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 21:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hipo8V0xFozPf/nck4UpUZTfPhjbiPlYiqZO2wBpumQqhaGEnjrOXfzuabGK0apc1oVNVOOWjQXl+2MVxpjwmo1RT3zoA42EOv0cQFuyjuGU/ajLSyMSDM0m7kQSmJhjGcs3a2EicuinslwDR9Lf/eEkfDUenhxcArd/5g8bDthmil0YROXGmWxr4pMje9cmwkLjnhWM2/TudImznn7UU82QzeUQK5LEkMd0/Ig8JlDfy2eqOrS0msEuAvvvkIjlPRgznZQiZD8193WGmpGth90+B2c/ST3txfEaV5LxShAM4msWPA/qL/Pd3AlVEZ8K/1sDC8f8h4QuZHebvygRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77lTKVjKnBXrDjCVBYLxz0bqC92bfWPd46wYG6d0x88=;
 b=cEDsZbqU6v1niD1yabPEw7f59teYcxVbCuxjIA4nPSqcNomxGmd1nSjdwk/UcveBlKWmqLlqpd9tg01vezpJmrZGiAGUUX1RS2o+q+ZbtnMuiHlsMj2UDp79Jo9E6qRMnVIT2l8DLtL39QH3OFgIlUKe4ItH4bOtYs/htDU9A2fTA8vdBUKfC60UN3lxxQ7jiUNoRkueWDBPg+/AhjBvbDaUezytP2dpK3l0AvF+VD40nJlxmJsCEpE8cEJf2xR1Lx91DndavkQBwAEp6xr/YgEkv3/5d/wtg+qIbqJtiRLDNkNKQUnvqFqdEx5gRZBl1MG2Gz1PglJf3iA8wB3Nig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.usask.ca; dmarc=pass action=none header.from=usask.ca;
 dkim=pass header.d=usask.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.usask.ca;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77lTKVjKnBXrDjCVBYLxz0bqC92bfWPd46wYG6d0x88=;
 b=kbMkv17eOyIS6IeQGByLgGnHGrUP5Bl4qBWIaCzKbrcjEm056giitkUwkM/z6PCwflT/C9C4Tdd8THQqPWffgdtFR3B7PJtvf4KD1/j3lTBtyHPVyAIjyBvIPrkjZlJ8QXVyxxDZp6Ok6M+zP55fbxypdCXNHqD3nzIHxZK8NjM=
Received: from QB1PR01MB3843.CANPRD01.PROD.OUTLOOK.COM (52.132.86.19) by
 QB1PR01MB2514.CANPRD01.PROD.OUTLOOK.COM (52.132.86.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 21:20:51 +0000
Received: from QB1PR01MB3843.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4149:3a08:accf:f004]) by QB1PR01MB3843.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4149:3a08:accf:f004%7]) with mapi id 15.20.2623.011; Thu, 9 Jan 2020
 21:20:51 +0000
Received: from [10.119.18.8] (128.233.6.93) by
 MWHPR1601CA0017.namprd16.prod.outlook.com (2603:10b6:300:da::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 21:20:51 +0000
From: Nicholas Kinar <n.kinar@usask.ca>
To: Ilie Halip <ilie.halip@gmail.com>
Subject: Re: Cannot build Wireguard for ARM embedded Linux 32-bit Tinkerboard
Thread-Topic: Cannot build Wireguard for ARM embedded Linux 32-bit Tinkerboard
Thread-Index: AQHVxbYxsADximje20mqwTdLee7GCKfh/y0AgADauQA=
Date: Thu, 9 Jan 2020 21:20:51 +0000
Message-ID: <b5916353-33ea-132e-1655-dfdf847b2da0@usask.ca>
References: <94a4b886-b7f1-ec54-c5ff-d2447ca08d3a@usask.ca>
 <CAHFW8PQ2oOSXVx87_1yoax5z+-=uEzYD-kNYn2Dp5knWPTnejg@mail.gmail.com>
In-Reply-To: <CAHFW8PQ2oOSXVx87_1yoax5z+-=uEzYD-kNYn2Dp5knWPTnejg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR1601CA0017.namprd16.prod.outlook.com
 (2603:10b6:300:da::27) To QB1PR01MB3843.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:32::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=njk024@mail.usask.ca; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [128.233.6.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aca4527-9529-4226-77fc-08d79549cde0
x-ms-traffictypediagnostic: QB1PR01MB2514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <QB1PR01MB2514E3C4E79D693A2A572890D7390@QB1PR01MB2514.CANPRD01.PROD.OUTLOOK.COM>
x-uofs-origin: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(346002)(39860400002)(396003)(189003)(199004)(40764003)(16576012)(316002)(478600001)(966005)(66946007)(786003)(8676002)(53546011)(4326008)(31686004)(81156014)(64756008)(81166006)(66476007)(8936002)(66556008)(66446008)(186003)(16526019)(26005)(36756003)(52116002)(71200400001)(2906002)(956004)(6916009)(2616005)(6486002)(5660300002)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:QB1PR01MB2514;
 H:QB1PR01MB3843.CANPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mail.usask.ca does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20uUdcaB1btQG6kcpYmqP4WN4CRXnF6I8277rF91Ty3e7ewqfUOo2iTxwCFu/ks0noXZSRifAyaxM06q4J+KTMiwhHx14JKdf00utLKibYglD3HeW1yTXQXO8uUcgA1+a6UO6LQAhwdyxKY/vYYedznPSzp/7xDg9I0Zv5hRdz2yTTfeGcMd/ldLaxuHqfUh6Js0ampB3j2m2qRqcWjEFg1A7C1RQ93dMxiMm9j8ilWB5HA09UsjsyOgUDb+Hk+Kv/jn6AZyRcZ/eF0DyIMB8OYMHS32Rwkawej9TF9XKOrYqvkSXRBAMcdDzybj1VjPS6nJXHvNajW9B+dzRmumBtPReZjb9e8yBitdbk3EiBEGl7yIU/FVVML/u/9t3rFybcmCGjI8q2s5Xtm/o1kvryweogb5nEp+Hsehnyy8e7D8nHVVO3lqoFLfwSVvWZBg+QZajOmdqwWnSoGLQD0UDxP1HmtlVlPp/sE5H+XJ73edVKjC3oV3o2lcn6CxcuxMTkADZz02iR+XP+jPK7Bxuo4c2z9YjwNi5oTPA6aCr4TDF1p1k5I43OYLLvgok//k
Content-ID: <D1899F587210CF43987E96A54FC00DB3@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: usask.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aca4527-9529-4226-77fc-08d79549cde0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 21:20:51.7794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 24ab6cd0-487e-4722-9bc3-da9c4232776c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yP8GGYUvpT0dqnkTa+w+3hhoLEEkRw3dPAgzgN8q4wGdfCkBI60Wc2SNtgxD1QYt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB2514
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

T24gMS85LzIwMjAgMjoxNyBBTSwgSWxpZSBIYWxpcCB3cm90ZToNCj4gQ0FVVElPTjogVGhpcyBl
bWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgVW5pdmVyc2l0eSBvZiBTYXNrYXRj
aGV3YW4uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4gSWYgaW4g
ZG91YnQsIHBsZWFzZSBmb3J3YXJkIHN1c3BpY2lvdXMgZW1haWxzIHRvIHBoaXNoaW5nQHVzYXNr
LmNhDQo+DQo+DQo+IFlvdSBjb3VsZCBqdXN0IGNkIGludG8gL3Zhci9saWIvZGttcy93aXJlZ3Vh
cmQvMC4wLjIwMTkxMjE5IGFuZCBydW4NCj4gIm1ha2UgVj0xIiBtYW51YWxseSBpbiB0aGVyZSBh
cyByb290LiBUaGF0IHNob3VsZCBnaXZlIG1vcmUgaW5mb3JtYXRpb24uDQo+DQo+IEkuSC4NCg0K
SGVsbG8gSWxpZToNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAsIEkgZGlkIHRoaXMgYW5kIGl0IHNo
b3dlZCB0aGF0IHRoZSBjb21waWxlciBkb2Vzbid0IA0KcmVjb2duaXplIGEgY29tbWFuZC1saW5l
IG9wdGlvbiAoIOKAmC1tZ2VuZXJhbC1yZWdzLW9ubHnigJkpLiBUaGUgb3V0cHV0IGlzIA0KcGFz
dGVkIGJlbG93Lg0KDQpsaW5hcm9AY2xhdmV0LXNlcnZlcjovdmFyL2xpYi9ka21zL3dpcmVndWFy
ZC8wLjAuMjAxOTEyMTkvYnVpbGQkIHN1ZG8gDQptYWtlIFY9MQ0KdmVyPSIjZGVmaW5lIFdJUkVH
VUFSRF9WRVJTSU9OIFwiXCIiICYmIFwNClsgIiQoY2F0IHZlcnNpb24uaCAyPi9kZXYvbnVsbCki
ICE9ICIkdmVyIiBdICYmIFwNCmVjaG8gIiR2ZXIiID4gdmVyc2lvbi5oIHx8IHRydWUNCm1ha2Vb
MV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbGludXgtaGVhZGVycy00LjQuMTMyKycN
CnRlc3QgLWUgaW5jbHVkZS9nZW5lcmF0ZWQvYXV0b2NvbmYuaCAtYSAtZSBpbmNsdWRlL2NvbmZp
Zy9hdXRvLmNvbmYgfHwgDQoowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCmVjaG8g
PiYyOyBcDQplY2hvID4mMiAiwqAgRVJST1I6IEtlcm5lbCBjb25maWd1cmF0aW9uIGlzIGludmFs
aWQuIjvCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQplY2hvID4mMiAiwqDCoMKgwqDCoMKgwqDCoCBp
bmNsdWRlL2dlbmVyYXRlZC9hdXRvY29uZi5oIG9yIA0KaW5jbHVkZS9jb25maWcvYXV0by5jb25m
IGFyZSBtaXNzaW5nLiI7XA0KZWNobyA+JjIgIsKgwqDCoMKgwqDCoMKgwqAgUnVuICdtYWtlIG9s
ZGNvbmZpZyAmJiBtYWtlIHByZXBhcmUnIG9uIGtlcm5lbCBzcmMgdG8gDQpmaXggaXQuIjvCoMKg
wqDCoMKgIFwNCmVjaG8gPiYyIDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwNCi9iaW4vZmFsc2UpDQpta2RpciAtcCAvdmFyL2xpYi9ka21zL3dpcmVn
dWFyZC8wLjAuMjAxOTEyMTkvYnVpbGQvLnRtcF92ZXJzaW9ucyA7IHJtIA0KLWYgL3Zhci9saWIv
ZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1aWxkLy50bXBfdmVyc2lvbnMvKg0KbWFrZSAt
ZiAuL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQgDQpvYmo9L3Zhci9saWIvZGttcy93aXJlZ3VhcmQv
MC4wLjIwMTkxMjE5L2J1aWxkDQogwqAgLi9zY3JpcHRzL2djYy13cmFwcGVyLnB5IGdjYyANCi1X
cCwtTUQsL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1aWxkLy5tYWluLm8u
ZCAtbm9zdGRpbmMgDQotaXN5c3RlbSAvdXNyL2xpYi9nY2MvYXJtLWxpbnV4LWdudWVhYmloZi84
L2luY2x1ZGUgDQotSS4vYXJjaC9hcm02NC9pbmNsdWRlIC1JYXJjaC9hcm02NC9pbmNsdWRlL2dl
bmVyYXRlZC91YXBpIA0KLUlhcmNoL2FybTY0L2luY2x1ZGUvZ2VuZXJhdGVkwqAgLUlpbmNsdWRl
IC1JLi9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaSANCi1JYXJjaC9hcm02NC9pbmNsdWRlL2dlbmVy
YXRlZC91YXBpIC1JLi9pbmNsdWRlL3VhcGkgDQotSWluY2x1ZGUvZ2VuZXJhdGVkL3VhcGkgLWlu
Y2x1ZGUgLi9pbmNsdWRlL2xpbnV4L2tjb25maWcuaCAtRF9fS0VSTkVMX18gDQotbWxpdHRsZS1l
bmRpYW4gLVdhbGwgLVd1bmRlZiAtV3N0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJpZ3JhcGhzIA0K
LWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLVdlcnJvci1pbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbiANCi1Xbm8tZm9ybWF0LXNlY3VyaXR5IC1zdGQ9Z251ODkgLWZuby1QSUUg
LW1nZW5lcmFsLXJlZ3Mtb25seSAtZm5vLXBpYyANCi1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10
YWJsZXMgLU9zIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIA0KLWZuby1vcHRpbWl6ZS1zaWJsaW5n
LWNhbGxzIC1nIC1wZyAtTzMgLWZ2aXNpYmlsaXR5PWhpZGRlbiANCi1EJ3ByX2ZtdChmbXQpPUtC
VUlMRF9NT0ROQU1FICI6ICIgZm10JyAtV2ZyYW1lLWxhcmdlci10aGFuPTIwNDggDQotSS92YXIv
bGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MTIxOS9idWlsZC9jcnlwdG8vaW5jbHVkZSANCi1E
Q09ORklHX1pJTkNfQVJDSF9BUk0gLWluY2x1ZGUgDQovdmFyL2xpYi9ka21zL3dpcmVndWFyZC8w
LjAuMjAxOTEyMTkvYnVpbGQvY29tcGF0L2NvbXBhdC5oIA0KLUkvdmFyL2xpYi9ka21zL3dpcmVn
dWFyZC8wLjAuMjAxOTEyMTkvYnVpbGQvY29tcGF0L3B0cl9yaW5nL2luY2x1ZGUgDQotSS92YXIv
bGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MTIxOS9idWlsZC9jb21wYXQvc2lwaGFzaC9pbmNs
dWRlIA0KLUkvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxOTEyMTkvYnVpbGQvY29tcGF0
L3NpbWQtYXNtL2luY2x1ZGUgDQotSS92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MTIx
OS9idWlsZC9jb21wYXQvc2ltZC9pbmNsdWRlIA0KLURDT01QQVRfQ0FOTk9UX1VTRV9ERVZfQ05G
wqAgLURNT0RVTEXCoCAtREtCVUlMRF9CQVNFTkFNRT0nIm1haW4iJyANCi1ES0JVSUxEX01PRE5B
TUU9JyJ3aXJlZ3VhcmQiJyAtYyAtbyANCi92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5
MTIxOS9idWlsZC9tYWluLm8gDQovdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxOTEyMTkv
YnVpbGQvbWFpbi5jDQpnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlv
biDigJgtbWdlbmVyYWwtcmVncy1vbmx54oCZDQptYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQ6Mjc4OiANCi92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MTIxOS9idWls
ZC9tYWluLm9dIEVycm9yIDENCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTQ3MTogDQpfbW9kdWxl
Xy92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MTIxOS9idWlsZF0gRXJyb3IgMg0KbWFr
ZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL2xpbnV4LWhlYWRlcnMtNC40LjEzMisn
DQptYWtlOiAqKiogW01ha2VmaWxlOjMzOiBtb2R1bGVdIEVycm9yIDINCg0KLS0gDQpEci4gTmlj
aG9sYXMgSi4gS2luYXIsIFBoRA0KUmVzZWFyY2ggU2NpZW50aXN0IHwgR2xvYmFsIFdhdGVyIEZ1
dHVyZXMNCkFzc2lzdGFudCBEaXJlY3RvciB8IFNtYXJ0IFdhdGVyIFN5c3RlbXMgTGFiDQpVbml2
ZXJzaXR5IG9mIFNhc2thdGNoZXdhbg0KMzA2LTk2Ni0yMDkyIHwgbi5raW5hckB1c2Fzay5jYQ0K
aHR0cDovL3d3dy51c2Fzay5jYS9oeWRyb2xvZ3kNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRA
bGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8v
d2lyZWd1YXJkCg==
