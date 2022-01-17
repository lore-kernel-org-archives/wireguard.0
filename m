Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD76C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Jan 2022 16:09:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5c4e2dde;
	Tue, 25 Jan 2022 16:09:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70117.outbound.protection.outlook.com [40.107.7.117])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cfcbdcb5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jan 2022 19:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMSN2eS5mIp9lGwffIQdb8bYSkpA44Ycak+q2sfbOpIgRljsVn1FjF+xJmzOPyMyEIlizJaGwXxcdirKHKu2GAhj/Ae8yRzo3Er94ZBl9uH0C6I9YN+Qa/7tZr/UUUVzjP1MhFMWRbFXg7GffM0d5PGnzmfg5Xpkjlraf4jU7jZUfS5WIYnNLKOvnkpkqEAbJq7CguyTrQ969GQKsfcdL2v4v6RwgxkKW11sAdpb+KtMWyU/FZeP7s7hti1m7Gsd3EiLADlOEZ8Qqe2QgnPE9iGWgU0Ag/iBodFfpfc397RQLyrQAVeD17aSnWLTHrLQJVnyLlAxbwBL84HeYJ5mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IElsiOnVenMKn6ivE+vmwAEyWPm8YMcd40aa9BISVx4=;
 b=QJ5W7aEPnm6j/rB4cY4p4jk+F5s1I1qGG7Xavu2wnsfi28LnjA0xeFWstGOWx1rYdSspFrmHPw+GMP2nIOxWYeDq2RSKRSgbPYbTinBKtrYnAYWU9OOpzZE3WgUqtSKj+w7+DyfOsWvaAcmk2SkjqWz0Bz/18C9oZkkRwI3J9lYweVnjLVshH9PFAqijOh5AFO8ZhxgF7JvsSnx0DE1MJxDOvqDEefr1+e0cOm5IVB0fdAIOhVu4MDEzqTMTo6HJCEDml+g1h6bEeM2p4qvn2YNkM46COXLcDN+z7mMaDyzTKrfW5WgKLoW+GtgPlWE3gUOcjlWmsQqIXFhmKLPcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netcore.se; dmarc=pass action=none header.from=netcore.se;
 dkim=pass header.d=netcore.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netcore.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IElsiOnVenMKn6ivE+vmwAEyWPm8YMcd40aa9BISVx4=;
 b=rFDMDxY4jZaH/v2Lc+QmTn37na4scbtFjXmDLxTE3tGX601U8g5ki9gl+RjZKy+TphIxrDShHJpXQ3Ztr0s7RqW9mMSAhL5ifjj7baLSFbwaU/wjlgah8wus0WhCLs927F4rrDHXevKE04chorOFn2fVH3aiBK5b53/FGKHEkGM=
Received: from HE1PR10MB1756.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:56::14) by
 AM0PR10MB3732.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 19:49:53 +0000
Received: from HE1PR10MB1756.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::458b:d4c0:8ee3:4e33]) by HE1PR10MB1756.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::458b:d4c0:8ee3:4e33%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 19:49:53 +0000
From: Richard Werner <richard@netcore.se>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [macOS] possible bug
Thread-Topic: [macOS] possible bug
Thread-Index: AQHYC9tl9e7hQWly10+4Omo3mKOvpQ==
Date: Mon, 17 Jan 2022 19:49:53 +0000
Message-ID: <948FB3D5-2990-48E1-B27F-FDA699AEAF24@netcore.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netcore.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 589d4076-23ee-47c7-93b5-08d9d9f2880b
x-ms-traffictypediagnostic: AM0PR10MB3732:EE_
x-microsoft-antispam-prvs: <AM0PR10MB3732BE9D7EEE5B12B44B21B7C1579@AM0PR10MB3732.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdMomzZxaKHAhxoi8IVXhJ48D/xJ38PRlpzkstDF0biwuB+AxfjZc+jzquDVkfawFxxvKivAVcw9whMtLTlfX1n9qLZXwA4xn+T0irQO08oE/Fby6U+b0LgNoHYjmH0AI2F2h9Zkk49e1yG9XQpYhXgkIyahBgfslZdGsBH9PYxrz1zDB2tCGOxIFJOzgh8IlgS0yaUcp1dvgXzniltVJcCmNPQRt5I/fvmTDrMFX7dSoCjfnpM9D+ksVJkSemqD8GoskiSxtr56WDriloVIk2MhtzWqEnTWkMmOjIaDbkBkCMhyxkUQfU0+pOeIU9Osi5NfyhH+6TTduFDGDPDx/jxHUTcEm3OKsALAln6Nj6+ZCYzWyH+doaon3DF9sxw8a2sOdTI4DWiCFVHmkOi5knNKPtv82BHqJzpuAcLWC9QF/IeG5TgKv8CJt4/KQGZ/TLsrF/MB1ZlnE8+WfMsYs44F5r506Wfp9Xr3/H+VtxIIG0JRWjiNHJOQCg1wZUgwacme0u383YBDNLH2kJCc9lZoK1v1Kwudciozcv1CCu67mux/0lYsrerzF6BaKv3TDwotWtdVXP1/e6rwwHqD++vxGcdvUENTPpo7JKgwg119IGWYxqStbJ1j5gz3yUbmfYXhrEZ+CzMeddrXKbO94lguBarXcjvHwHnU3NlB9S0YQBV+rFcBO2i6U1EWLCoDQOyaOA2VeNgcM7tN5nDA9bKILXAPABCCoZuzZ8fFoKHNkhp76a8p3L+/vSZ1RIrKdL4VOTI1PaYLdfFKvptcA45tghLfksqLN7SAp6Y0JwV63Zq4X9QLYhyRJ0/T2JJIHiAu+YuE5JkTsDEJVCQPZbyOwGLpYUQ436qkvC4Obpc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR10MB1756.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39840400004)(42606007)(376002)(136003)(346002)(366004)(66556008)(66476007)(66446008)(2906002)(66946007)(6916009)(6512007)(64756008)(6486002)(33656002)(186003)(5660300002)(8676002)(8936002)(2616005)(316002)(71200400001)(6506007)(91956017)(76116006)(26005)(38100700002)(508600001)(122000001)(966005)(36756003)(38070700005)(86362001)(83380400001)(10126625002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3ZwY0pCa0tpUFhkYUVhZnV4aHJKMTJiVkt3NEtlS2NTM2taRTlCSkZkT0ZB?=
 =?utf-8?B?d1pzR3R4ZFhaQ1FYWGk2MnJXUHB3T09YREtGNWZoWEpQZlY2Z2R1UlhaRCtI?=
 =?utf-8?B?TmtFOW55dzNLaDI0V2V3a0tiK0ZScmFsTTJTWFhNU1RWK01tcHFlVnhyUjVY?=
 =?utf-8?B?aEFuVVlZamcwZlVXY254ODJDQXlYRWF4V0V3YWZtMHdpelpwRDB2NTBNbkdx?=
 =?utf-8?B?cWxwNUVzMHN6aXVpTnRXYm4zUS9nazlkSzV4cFFab21xWTRtMjZ4RkZJbFBp?=
 =?utf-8?B?M0JGMGl0aThLa05rRzE5dStXMEpQZlpZd0VsQlBYanBzd0tsdFpHZTUzSGhL?=
 =?utf-8?B?eVNxYmY5VEJ6MThIUjJkZDJMRk9GRVZMcHJjMlhmSGdPSGhTLzBYSGl5UVdn?=
 =?utf-8?B?MnJVUk9CVGRRWVBsQlpOdGJBZE5IT1JSc2xpeXBEcFhVdmdMbkNROU1mT0pM?=
 =?utf-8?B?S0dJVGsvS1NObENwVDJSTlEyTERrWW1yMTBjMlovdEdaSGxZWnluUllDMGcy?=
 =?utf-8?B?YXdPVHcvNVFSTmVIVUhKU3NnSkxCdWFWenFmSEUvNnJLTWpGN3pqTVo5dE9m?=
 =?utf-8?B?N3p6U0luOWo5c2U3ZmFNVWdlUUxTTDAxZjQ0VTZEZUxpY3o3cG1oaDhMUUR4?=
 =?utf-8?B?TW9KL3V1RzMyNmdvNG1EUHAza0xQS2lLS0VEY3FIelRDTHpOb01LK2RSYThY?=
 =?utf-8?B?NTN0VHI5WUVpTjZQSjY3ek9yVnppRi8yT0FuSHZTRXROY1M4K0dnajR0QVVY?=
 =?utf-8?B?aEtBeWc1c0pmajFNQlh4d0I5Mm51ZzloTytROElXSnFURG1nczFkMmpuTDZs?=
 =?utf-8?B?cnFhcDJka0thVjFpaGtETEFZd1Z5bGZrMXNlVGU0UGFYbGp0RXpDY3VtZ3p2?=
 =?utf-8?B?TWNLaklGUU1abHA2KzNrRDZWQVFBODI2bkQ0RmRZdGpKZlU5UUdnVXNPY0Nn?=
 =?utf-8?B?bUd3R0lycDEyd3cwVTE1dDVPSUFPcURVWkdkOE9ZWmdzL1VWNW5GNGY0STNX?=
 =?utf-8?B?ZjMzRVMwd2FRZ1RBQmR3ZzBhZ2FhYVlLUmZRb3FvakdEZzRmZzAzU3V2Wmds?=
 =?utf-8?B?VmdxcDJlT1RrWmpkUmVUS1JqR2hYRjVyTEI1cUgwcCt4SlgrbGRvSS91YXNC?=
 =?utf-8?B?L2kwaGJRZHM5VmM0ZGpBamd6TDQ2MFI2WXZZOCt4UEo1NUNBNFBGY2w0RTBT?=
 =?utf-8?B?NE5NQlNSME1uTTE1VkRBZVJmOThlQnBqQ1JIcnpsS2NCUW1hdUdWWjJjSWZX?=
 =?utf-8?B?bVkzb2ROZ2hoaXJlcGFoMHpZRHFrRWorVEp4T2JOUjB4SXpDK2N1M0xKRHNy?=
 =?utf-8?B?VWQrZXZQSElEMUZsWXlySUZoWnVXLzZCZkZLV1ZkTlJGU2ZWdWZFbHVlQkZC?=
 =?utf-8?B?NExNUy9zOUk5dVNwQStQeURQMURVVlRFTG1lNXRpN2V6NEQzbE1RNnhTcVcx?=
 =?utf-8?B?bWtBWmRJYnN6UWdNVjN0Ty96ZHpTa3lyWVNheU8vSzdqQTh1VEpWSSthTTh4?=
 =?utf-8?B?a3VLYXR5WVZWaTdTS1VIRVBMU1pEQTJ3VWM3UXByNjBab1pGQ1pjVGxVZWxH?=
 =?utf-8?B?a2o1UmdVRWFQYmZDR09UTkU4SnBwaFJtTGJkVFV0M2hVWkN4cC9VR2JZYnpG?=
 =?utf-8?B?Q2VLRjJVSkIwb0pKRWdlNHY3QXBSa3FCT0MvQkx0WUhaS1ovUGRTTDErWVhP?=
 =?utf-8?B?WTl2U2NMcEt6Q2JjU0ptdkZ5UG1tNDR6KzUwUldXandsU1U5WUJCa3FqcDBj?=
 =?utf-8?B?QytqaXBId0s5Z1VuUkVvZllBa0djZ3dkS3NnOEV5N2tqa0ExYXkvWGVPRnhm?=
 =?utf-8?B?UkNHeXZ1RzlSZjB0RWpod1NFa2R6czdSc09WN3luZUIzRlpha01pdnRyT094?=
 =?utf-8?B?b1BKSXc4WGlKaWtxRWl0ckJTYi9aaHRqcnJITzN2c25nRDZrZHhMSG0xaWVL?=
 =?utf-8?B?UVZ6MzVvVllFKzlobDRQcFNVYWNJTi9zWG5WaG9KWkMzdWgrb3NWRGZZcVNS?=
 =?utf-8?B?ZHRtRllZbXhtTHJkWkZKRTA3cmFZRy9Uc0pTNVZPVG1kRm1UYms1eHRkSlFZ?=
 =?utf-8?B?VFk0blNyRkZEa0lTMy94VmdVU0JFS0JDa0RrT0loNEpPMmplK3BhZzhDeGxZ?=
 =?utf-8?B?WkJBTmF2SFI2U2hYUFJ5QlVVZzVqdXdZYmd6blEwa0pWVHdzZTcydkhXeFhY?=
 =?utf-8?Q?NtWoXwNmN2+/bdoS1O7i2aE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59B1DB4858918D45B9246B67E8DC6ACC@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: netcore.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR10MB1756.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 589d4076-23ee-47c7-93b5-08d9d9f2880b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 19:49:53.6315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e28b9eb9-6cf7-4f24-80ca-0d1f6fd8cb47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAcZ2hOYOeJ7Rn2X6RGDWZWp/CGRVAq6J6LzeZA8H7PyXiRYxexuSKPJYxpVEulx7cf1uUKR4y8RRGW+C2twRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3732
X-Mailman-Approved-At: Tue, 25 Jan 2022 16:09:01 +0000
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

SGkgZXZlcnlvbmUuDQpXZSBmb3VuZCBhIHN0cmFuZ2UgaXNzdWUgcmVnYXJkaW5nIG1hY09TIGNs
aWVudCBhbmQgaG9wZSB0aGlzIGlzIGEgcHJvcGVyIHdheSB0byBzdGFydCAoYW5kIGdldCBzb21l
IGhlbHAgZGVidWdnaW5nKSBhIHBvc3NpYmxlIGJ1Zy4NCknigJl2ZSBub3QgYmVlbiBhYmxlIHRv
IGNhcHR1cmUgdGhlIGFjdHVhbCBlcnJvciBtZXNzYWdlIHNob3duIHRvIHRoZSB1c2VyLCBidXQg
SSBoYXZlIHRoZSBhIGxvZyBmaWxlLg0KDQpXaGF0IHNlZW0gdG8gaGFwcGVuIGlzIHNvbWV0aGlu
ZyBsaWtlIHRoaXM6DQoxLiBIYXZlIGEgd29ya2luZyBjb25maWd1cmF0aW9uLg0KMi4gU29tZSB1
bmtub3duIGV2ZW50IGhhcHBlbnMgKHN0aWxsIGludmVzdGlnYXRpbmcpLg0KMy4gQW4gZXJyb3Ig
bWVzc2FnZSBpcyBzaG93biAoc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZiAidW5hYmxlIHRv
IHJlYWQgY29uZmln4oCdKS4NCjQuIE9ycGhhbmVkIGNvbmZpZ3MgYXJlIHJlbW92ZWQsIGJ1dCB0
aGVyZSBzZWVtcyB0byBiZSBtb3JlIGdvaW5nIG9uIHdoaWNoIHdlIGNhbuKAmXQgaWRlbnRpZnku
DQo1LiBObyBXRyBWUE4ncyB3aWxsIHdvcmsgcmVnYXJkbGVzcyBvZiByZW1vdmluZyBjb25maWdz
LCBrZXljaGFpbnMsIGV0Yy4NCg0KRXZlbiBpZiBhbGwgdHVubmVscyBhcmUgcmVtb3ZlZCBhbmQg
YWRkZWQgYWdhaW4sIG5vIHRyYWZmaWMgbGVhdmVzIHRoZSBjbGllbnQuIEl0IGVmZmVjdGl2ZWx5
IGVudGVycyBhIHN0YXRlIG9mIG5vdCBiZWluZyBhYmxlIHRvIHVzZSBhbnkgd2lyZWd1YXJkcyB2
cG5zIG9uIHRoZSBjbGllbnQuDQoNCg0KU29tZSBlbnRyaWVzIGZyb20gdGhlIGxvZyB0aGF0IHNo
b3dzIGdvaW5nIGZyb20gd29ya2luZyB0byBub3QgZnVuY3Rpb25pbmcgd2lsbCBmb2xsb3cuDQpN
b3JlIGNvbXBsZXRlIGxvZyBhdCBodHRwczovL3Bhc3RlYmluLmNvbS9tMk1xSGhQRg0KDQotV29y
a2luZzoNCjIwMjItMDEtMTcgMTc6NTU6NTkuMjkyNzgxOiBbTkVUXSBwZWVyKFpZNnjigKYxWkJj
KSAtIFNlbmRpbmcgaGFuZHNoYWtlIGluaXRpYXRpb24NCjIwMjItMDEtMTcgMTc6NTU6NTkuMzM3
MDQyOiBbTkVUXSBwZWVyKFpZNnjigKYxWkJjKSAtIFJlY2VpdmVkIGhhbmRzaGFrZSByZXNwb25z
ZQ0KMjAyMi0wMS0xNyAxNzo1OToyMi4wMDc2MzQ6IFtORVRdIHBlZXIoWlk2eOKApjFaQmMpIC0g
UmVjZWl2aW5nIGtlZXBhbGl2ZSBwYWNrZXQNCg0KLUVycm9yIG1lc3NhZ2UgaXMgc2hvd246DQoy
MDIyLTAxLTE3IDE4OjM1OjI5LjA4MTczNzogW0FQUF0gQXBwIHZlcnNpb246IDEuMC4xNSAoMjYp
DQoyMDIyLTAxLTE3IDE4OjM2OjIyLjY2MjI4MTogW0FQUF0gc3RhcnRBY3RpdmF0aW9uOiBFbnRl
cmluZyAodHVubmVsOiBWUE4gWCkNCjIwMjItMDEtMTcgMTg6MzY6MjMuNDkwODI1OiBbQVBQXSBV
bmFibGUgdG8gb3BlbiBjb25maWcgZnJvbSBrZXljaGFpbjogLTI1MzAwDQoyMDIyLTAxLTE3IDE4
OjM2OjIzLjQ5MTA1ODogW0FQUF0gc3RhcnRBY3RpdmF0aW9uOiBTdGFydGluZyB0dW5uZWwNCjIw
MjItMDEtMTcgMTg6MzY6MjMuNDkxMjg4OiBbQVBQXSBzdGFydEFjdGl2YXRpb246IFN1Y2Nlc3MN
CjIwMjItMDEtMTcgMTg6MzY6MjMuNDk3MzQ5OiBbQVBQXSBUdW5uZWwgJ1ZQTiBYJyBjb25uZWN0
aW9uIHN0YXR1cyBjaGFuZ2VkIHRvICdjb25uZWN0aW5nJw0KMjAyMi0wMS0xNyAxODozNjoyMy41
ODIyOTg6IFtBUFBdIFVuYWJsZSB0byBvcGVuIGNvbmZpZyBmcm9tIGtleWNoYWluOiAtMjUzMDAN
CjIwMjItMDEtMTcgMTg6MzY6MjguNDkxMjg1OiBbQVBQXSBTdGF0dXMgdXBkYXRlIG5vdGlmaWNh
dGlvbiB0aW1lb3V0IGZvciB0dW5uZWwgJ1ZQTiBYJy4gVHVubmVsIHN0YXR1cyBpcyBub3cgJ2Nv
bm5lY3RpbmcnLg0KMjAyMi0wMS0xNyAxODozNjoyOS41MTcxMzI6IFtBUFBdIFVuYWJsZSB0byBv
cGVuIGNvbmZpZyBmcm9tIGtleWNoYWluOiAtMjUzMDANCg0KLVR1bm5lbCBjb25maWcgaXMgcmVt
b3ZlZDoNCjIwMjItMDEtMTcgMTg6Mzg6NDcuMTI3ODM2OiBbQVBQXSBBcHAgdmVyc2lvbjogMS4w
LjE1ICgyNikNCjIwMjItMDEtMTcgMTg6Mzg6NDcuMzM3MzU1OiBbQVBQXSBSZW1vdmluZyBvcnBo
YW5lZCB0dW5uZWwgd2l0aCBub24tdmVyaWZ5aW5nIGtleWNoYWluIGVudHJ5OiBWUE4gWA0KDQot
VHVubmVsIG5vdyBmYWlscyB3aXRoIHNhbWUgY29uZmlnIChpbXBvcnRlZCBvciBtYW51YWxseSBl
bnRlcmVkKQ0KMjAyMi0wMS0xNyAxODozOTo1MS45MjQyMjE6IFtBUFBdIFN0YXR1cyB1cGRhdGUg
bm90aWZpY2F0aW9uIHRpbWVvdXQgZm9yIHR1bm5lbCAnVlBOIFgnLiBUdW5uZWwgc3RhdHVzIGlz
IG5vdyAnY29ubmVjdGVkJy4NCjIwMjItMDEtMTcgMTg6Mzk6NTIuMjQ4OTg3OiBbTkVUXSBwZWVy
KFpZNnjigKYxWkJjKSAtIFNlbmRpbmcgaGFuZHNoYWtlIGluaXRpYXRpb24NCjIwMjItMDEtMTcg
MTg6Mzk6NTcuNDEwNTQ3OiBbTkVUXSBwZWVyKFpZNnjigKYxWkJjKSAtIEhhbmRzaGFrZSBkaWQg
bm90IGNvbXBsZXRlIGFmdGVyIDUgc2Vjb25kcywgcmV0cnlpbmcgKHRyeSAyKQ0KMjAyMi0wMS0x
NyAxODozOTo1Ny40MTA4Nzc6IFtORVRdIHBlZXIoWlk2eOKApjFaQmMpIC0gU2VuZGluZyBoYW5k
c2hha2UgaW5pdGlhdGlvbg0KMjAyMi0wMS0xNyAxODozOTo1Ny40MTEyMjY6IFtORVRdIHBlZXIo
Wlk2eOKApjFaQmMpIC0gRmFpbGVkIHRvIHNlbmQgaGFuZHNoYWtlIGluaXRpYXRpb246IHdyaXRl
IHVkcDQgMC4wLjAuMDo1Mjk4Mi0+PHNlcnZlciBpcD46NDQzOiBzZW5kdG86IGJyb2tlbiBwaXBl
DQpb4oCmXQ0KMjAyMi0wMS0xNyAxODo0MDowMC4zOTYxNDY6IFtBUFBdIFR1bm5lbCAnVlBOIFgn
IGNvbm5lY3Rpb24gc3RhdHVzIGNoYW5nZWQgdG8gJ2Rpc2Nvbm5lY3RlZCcNCjIwMjItMDEtMTcg
MTg6NDE6MjcuNzM1MDA0OiBbQVBQXSBUdW5uZWwgJ1ZQTiBYJyBjb25uZWN0aW9uIHN0YXR1cyBj
aGFuZ2VkIHRvIOKAmGludmFsaWQnDQoNCg0K4oCUUmljaGFyZA0KDQo=
