Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755F9C5B542
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 May 2025 06:55:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d07259a;
	Mon, 26 May 2025 06:55:07 +0000 (UTC)
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazon11010011.outbound.protection.outlook.com
 [52.101.167.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aa34081a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 May 2025 06:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ+0cLLp2M5Fc4OTZSjPX/G8YihscZEPqH5QAmBQ4bqkthRPyedG+j3nNOnj2iV0vszL7KkUV79hSXoDtAp6rTebC0JkNSdsaUczm6raCjCIzwfk+gdKQP5lF4ePU2MGX683aR8SidtsALcSJAbD2BfWJrgpDw/BTdMN5m10kk2ttHe51o3ITly2hiKbCexZnMlXs2e82Lw/fTPQCN5ZkMY8vfryPucCF0enC73wQG7mgxoihD5R18doxa3/GmWVFrVV3L9hO+1Wt/t5KYVV5+QNM43vklBh/fFGuv3sn+bSoKeBKpC7pFb20nQ4FB6309XMw/l8uM2WZwm5Ny9bTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+yDZAoHZbjJdOZzSS2rli+iKWqvUPBscygkkPcT8/Q=;
 b=PqklAO/62Vh2im5hlj8gnXwYU5A3reNNeE4AXr/V03ejT6/4rpfqODhbE/rwuxOhtBe96hnaCYh5zo2qk5jXG9aywUfmVB92kAr+kHXasGjG7/JXznGkorFulsBZDg1qM5H0XnBe7zYbflYQ2G4Jx2WaOjVilQra5cJxnc4besSwTFi8ZZagkO4W2siuRSoJzOctrDQE8bwW8D7oRWILsdTwdNx5YY4n+kY1zq0JvuFmGpoF3jbXsCDIp9QmP3/Rj88nCcudFli0pw5/eWXIqrxJbcDYB/1mGMsT0KzFDOuitJ1k782oxPgLmZIBBYtrqIh+vOagoAoIj594kqdvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=softathome.com; dmarc=pass action=none
 header.from=softathome.com; dkim=pass header.d=softathome.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=softathome1.onmicrosoft.com; s=selector1-softathome1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+yDZAoHZbjJdOZzSS2rli+iKWqvUPBscygkkPcT8/Q=;
 b=UaRVlGHYOsgnBlU0H8kxUopzzOVNE1TTqhTJ60BIFOMKEEldGRfPk4pukQVTAsM8ABYpMSBn9x0UR5XnDeRM/RUoTLVFdR35OGSAJVn0cIHsIL5SV5Y6O5N/uKIPxE5GI0tebAmtZo3oeLhzRyCzerAVYeOhAG0LtsVXiYwoIKNQGVcNbS1ZMh5bUA12KvuwwxNPdwf3M7iWJ3d5i+lKyEgA5UDVA6Wirp62B5CQKULeWGdBV0eBsKZu8+Y4WdD7x9gHRaKdFC3FK2KgOj9e0L347Yc82CHq9YX4eFaIF3zE1ped5vrctovWM/wag+ah2xuzJdMM5K5VWIxLDmUDSA==
Received: from MR1P264MB4452.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:24::11)
 by PATP264MB4722.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:427::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 06:55:03 +0000
Received: from MR1P264MB4452.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8c4e:37f5:3ef5:354]) by MR1P264MB4452.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8c4e:37f5:3ef5:354%3]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 06:55:03 +0000
From: "Patrick HAVELANGE (EXT)" <patrick.havelange_ext@softathome.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] wg: syncconf: also handle psk changes
Thread-Topic: [PATCH] wg: syncconf: also handle psk changes
Thread-Index: AQHblMT8+nFMmIA0uk2aFdaZ7aeA3bPg93CAgAPz+QI=
Date: Mon, 26 May 2025 06:55:03 +0000
Message-ID: <MR1P264MB445204E4D8B3618505A57500B465A@MR1P264MB4452.FRAP264.PROD.OUTLOOK.COM>
References: <20250314093920.3448871-1-patrick.havelange_ext@softathome.com>
 <CAHmME9q9t122WdD=kW6siHujMVjXOj-rehx-2wKFUuq15-dkQQ@mail.gmail.com>
In-Reply-To: <CAHmME9q9t122WdD=kW6siHujMVjXOj-rehx-2wKFUuq15-dkQQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1925f328-931c-4d86-9b48-4db24b002721_Enabled=True;
 MSIP_Label_1925f328-931c-4d86-9b48-4db24b002721_SiteId=aa10e044-e405-4c10-8353-36b4d0cce511;
 MSIP_Label_1925f328-931c-4d86-9b48-4db24b002721_SetDate=2025-05-26T06:55:02.700Z;
 MSIP_Label_1925f328-931c-4d86-9b48-4db24b002721_Name=All Employees
 (unrestricted); MSIP_Label_1925f328-931c-4d86-9b48-4db24b002721_ContentBits=0;
 MSIP_Label_1925f328-931c-4d86-9b48-4db24b002721_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=softathome.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB4452:EE_|PATP264MB4722:EE_
x-ms-office365-filtering-correlation-id: d2d6a33c-b219-47fb-9027-08dd9c223d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RTZscDZRMUpRTzl3VUdPU29MQlZTbllSbmdiaWhrYmNhcFpVOGY3TFJ0dXpC?=
 =?utf-8?B?LzRsQVJhR1VEWkVtSG9wcVV1c2xLOGRQaHcwbFlzK1JEaFJhUWlkclJjQzZW?=
 =?utf-8?B?c0IyQXVvZHh2T3VoUk5lNzVzWTZoTEo2NWxPUUszRE1Xd0FndE5Ic0RuMzUw?=
 =?utf-8?B?am4vQnBMeFFnWTU3NG5MRGoxM2xpK1B5OVduZCtHdTlHN1lhdWJiL2t2WVUz?=
 =?utf-8?B?TkZGU3M4eDA1TU9BUDl6Z0VBV2xRQ3F6Uk1sQ2tMQ2FRU1VEazVURGVZcVVy?=
 =?utf-8?B?MytoSjJiMWRxUkZ1azJZSEZ5emw3SkhWRE5oeVRGK0RXTlZQc1Jod1ZMODVv?=
 =?utf-8?B?Z0tJYWRQdVVjQkJoQ1BTbVZqWGtZVzlYcFR5cDdzeUluVFFGUytGaXR1Y25r?=
 =?utf-8?B?RURVeFNpalNERHcvM2FxdmY4cWRtV3hPbkg3VXBsZFRCaGxmMEJZWFJzWnZ5?=
 =?utf-8?B?RVJpd0htaXF5dGtKUUxuVXBMa0tqWEFSN0MxcXo1NXNIRm1JU1gzbmo2NTc2?=
 =?utf-8?B?SjBzdkwvTG52Mjc2c29KM1hKdjRyNFQ2TmErVDRpNTgwb3JhZE9BbkkxZ1Bz?=
 =?utf-8?B?Znd2WWZTSTRtZ3ZGM3lnMDdRaFU2STlBRXk1WWJZNnJ3UW1nTW96QWh4cVdY?=
 =?utf-8?B?TEdrV1hNVzY0UWdQM3RiQkRiZ2pLTitBNk1TYnNwSlVVTXhvZ041cXZoc09m?=
 =?utf-8?B?TVMwbUpYUDIvYTk0cXZBa1ZkbEtKZVlmaVV4aVMzVnB4QVd1SkdWK2VuWnJh?=
 =?utf-8?B?QVVHSFU5b3AxL1VBNTM1UmZva3BxQnU0aUhyZ2xUN1M0TWtaYVE3MnQzLzlK?=
 =?utf-8?B?R2tmaVVhR2xHckRSYm5ya3hEQTNJSFRDQUYwT2JEUWVWVE4yUXJiSUtLYVJ3?=
 =?utf-8?B?elRUZWIyMTRtcHdWY3Iyc212RitJdkVFNVJBQXUxc0Z3VDZsTnQ3cy9LRHI3?=
 =?utf-8?B?dVBEcWJHWUxtcTBIeGpoeW95K3pmbG9SWkNJUjFpcEJhano1YmdSR3pmZXk5?=
 =?utf-8?B?VXVpN0hOYUp5V21uNk82dkk2a043TXRLRkFyVE5STnJkNkZGYVVhRkxxQlhl?=
 =?utf-8?B?dXR1Qkt4K05YQ3ArUlpEejJrazBkM1h1UWNUNUxxOThTTnMwOVJ1RHhZWGIw?=
 =?utf-8?B?UlJ1cDB6UVFRdForbjRDSWx0djQ3UWIvK0REUHBiNmlNVCtLSHpoNDBBdEtp?=
 =?utf-8?B?REduQWF2a0tNMG52c1FIcnRRWmlYdThMV1NObmhoNC83aW5NYWk3T0NyaHNi?=
 =?utf-8?B?RGRkbFZRU01LUW1UVFE2THp5eUIyaEJIWEVHeTUzTTRFUWdUK2JaV1I3Y2tI?=
 =?utf-8?B?dklTOWlnVDFCcWVRdzBZZGJkZkpFejJ0OFI1RDVrNU1YSkhDeHVRbk56ekts?=
 =?utf-8?B?SmRNSTZRRis0K3BZZDhPRnZqVmRRTTVEYys5TkRSajVoamZFZjZJRFpoUnZO?=
 =?utf-8?B?SklmamZYM2V5QUwzMDc2Um15Ky9tYWJmS3RmaVpvcTV6N3hodEpNeE4wcGN2?=
 =?utf-8?B?NEtneURBQU1mRDFFTmVmSk42YitDdTVoYlRINGJGcFk5bDcxUkUwbXVBMWt3?=
 =?utf-8?B?ekJtTldyOWlybTBaa3BRK2hxbGtmbjJkUmhibGFsemVUdHVQayt2Wm1zdjhP?=
 =?utf-8?B?R0lUWVFUb3h4Wkd6RmtSaDVVSFg0c1o3YnRhcjgrRHIxZ0lZWG1wK1RxU3dt?=
 =?utf-8?B?alI3d0pQREVYcDVncmFiclE3U2tQT3RDdGRyMVhtWFB0QWJTUUh6Y0NZNVdK?=
 =?utf-8?B?VW93N0t0MXVlclBSVy9CK1grSEtTT1E0eU9Pd3hLYjlPcFp3cnF0NzZnOG1u?=
 =?utf-8?B?WUJUVUdsZlZ3WGtEYXU1UGZFcG8yNWx5NWdXeEo4Z1RlMjJkODZNeFNxQXh5?=
 =?utf-8?B?T2pOZk52dHM3TkRKTUIvYktzRFU3blJocmFueHp4TW83a1gvV0JGb1dhd09U?=
 =?utf-8?Q?oQliBjugh6w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB4452.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzhJK3p1cnNjblVQTXdXa2lmN3V1dWovOFVmK3B1RmttRElUU0xNOUsvemZl?=
 =?utf-8?B?Sy9JMVMwVkpaclA2eVYzT0F1MWtvMTREOVRlcmRIZU9vUTJBNlNCZFpDOHZM?=
 =?utf-8?B?ZWlqOEdzakZVTlRTY1kranBSQVVaV0tBczNJZUU5VFJ4aEltNGFiNGkrai9x?=
 =?utf-8?B?WVdhS3duRlR5YThpckJ6bGZYK2VJRDVPZWlEL2kxdlhiZ2lsYzZqRVpVWkVU?=
 =?utf-8?B?NXRBbEFjbnBDVjVVM0Rqa0p4S3RXVzJsV1JubFZraXAzMGNIUDIxT3BrdTBD?=
 =?utf-8?B?OG9wZXdHVmJlMWhNaWNiRHFBSGlZZnUrT1liMVBnTUk1VGJscWhIS1FhbkNT?=
 =?utf-8?B?aFdXeDFuelFkT2NvOW55QWh0bGY5eE5WN2RyQVg2d3MyZGhXUEp2ODRLSGpn?=
 =?utf-8?B?T3AyMHVqWjQ1S3BzNVBVWmtFLzlMRDgyUzJNWWQ0S004WjBGWERZTm9JZFp4?=
 =?utf-8?B?OUd3RjhPUHNnU2U3VFJsbmZyMk1tVE5RTlhZK21pZnZQYmJrN2gyZlF4NGV4?=
 =?utf-8?B?SG9RRnNJdGFka2d0MDl1VXVqTVpZRzF3VmdPK2dPQUN4a3c2TWhTRjB2aEtO?=
 =?utf-8?B?MTNsWXhzT1RKRlFYQnUwM2VJVkZ4ZEdRVnQ1VkFGNitrR3BadUJwdlVubXRK?=
 =?utf-8?B?SVRpQWJQWGhxWUZ0cHB4TVlGc2xDOXZjMGdPT2tzenpLbWI3QXF6bWpyZUx1?=
 =?utf-8?B?NXliaURaczdsa2RYN0ZuWWpNZWdvNlphMGtIcDhCYUZuT3RCOTQ5YzhsTys3?=
 =?utf-8?B?bE9PaVE3cGR4a2p6UVN2YU5zSndPbnJ6blJzWEI2cWRpZTFFSUJKTENtY2lT?=
 =?utf-8?B?TXRKU25yZ0RzaC9lVWlYd1RGS3FMREhGRTRMaGs5UWRtMlFSVFpSYUh0MTNO?=
 =?utf-8?B?LzFFaDdSeG8yMGhjNmM2YWNtSWxzR3pHZ0hDMk50MGZLS0JaKzVyZ1ZuVXNu?=
 =?utf-8?B?dHRjTUlQazZIcFlRMW1BWktJN3pjL1BXU2JPY1JKWGZNU1FwdlJIaGE2M01U?=
 =?utf-8?B?bHRiMHZQRjJoYVJ5eVdmc1JTYnBtYng3R2pQVFpLZVFUUzFVbUE1b1crV1dx?=
 =?utf-8?B?ajY1NGRSalhjYTJETjg5MDZzcFc2VjM3eW1QQnZ1NlVEZEhjRnJXZEx0b2JX?=
 =?utf-8?B?K1cwOE5TOFlXL3dRVGlFNzZNK0I3ajdKRmpzbHd1V084SVljMmFCV2hhaUhD?=
 =?utf-8?B?eWNSRmpla3lCaHYxaUpyS00xalZZVUtJYStIeWdQdnF3anNDNi8zd1A1RFFa?=
 =?utf-8?B?Z3Z6OGJaa1BDRVVKcXY4K1JnY2pROWM1aUU2Sk9nQ1hjVGs4M1h0cy9sOW1S?=
 =?utf-8?B?Ty9zenBYYU5jZ1RGakJIOWFCaTRTc295aDJCWTJUdFlYTFpPZUIxWFBsUGcv?=
 =?utf-8?B?dDB4MGVEdVhlUG1qNG9KQ2VaUDlLeWkxbFZtWEhJVUpDNisvUDRKNysvVDVu?=
 =?utf-8?B?NUtTZi9IbitFTUd4Tzd1aHRaSGw2RnYrWGFrS01Xa0xVYzNNU1Mxa3BRUEMw?=
 =?utf-8?B?Y25jWGZXYXI2MGlhWVJWZVB3QmJTejU5eUZWZWtpRENHajBJNnF2SXhiQkRN?=
 =?utf-8?B?ZGxlY2ZoSnh0L2dkM3loY1JQN0NYdzhuUVJvdmlDUnd6YnpOcmN3QmMyUS9z?=
 =?utf-8?B?L01rSVRCV2s2NUFlcGhCajlDV3d2Y0lrVFQybUtmc2RXVk5obWE5NHhEOC9P?=
 =?utf-8?B?WXpBUXFQL2ZKbzJFSnJHci91UStZM3VnL3YxNWl1S2FQd1E3OC9UeWpNTUN1?=
 =?utf-8?B?MW0vRW1WZGJYcThvU3ozUjUrNUN4aGtEamlnRXB4N1l5NFlBeFgrVUk4Wngr?=
 =?utf-8?B?bGJlSjI5eU02MkYzMC85R2kzV3RVMlZGRjlNMFVEbjNKUTdDUXZoU21WakF2?=
 =?utf-8?B?NHF3cTNpbjF0ZVlaNW1meWVRa3c0eUFhbTdKSkdqZXNyMVZCTG94SFdCNFJU?=
 =?utf-8?B?NTIvK3F6blBYQlJmSnVHZUVQdElsenZrc1F6TlphaVdXSndVRDdFWmU0Ymc0?=
 =?utf-8?B?b05vdk03dE1DcUtRVVp5Y0FSYW4zZ0NqWjJ4Qy9SMDQ5NE5WczYxc2Q5cFll?=
 =?utf-8?B?a3VWVWpPcG16UlB5dUJwaERiU2IxbGR3UGh0NmhkRjdRWmZDRHFpdkZOVVBX?=
 =?utf-8?B?SENvNUVPNzNmcmhwU1U2RHdoTUc5N0crcUJKNHUyOXhlMXdFRVlQVklLRXgx?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: softathome.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB4452.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d6a33c-b219-47fb-9027-08dd9c223d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 06:55:03.0620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aa10e044-e405-4c10-8353-36b4d0cce511
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ms6RkYdbCKzy++P+TJ9SluiaKiQ4Y+ooz0Rk87rzZJnWlMf8h8diyA7+998+fFK92d+MgyDGPu1VJ5M/awDcjkGOsBQBHMrnzy1KkHEPgZmlrv7osya5olZC3PSJYRdr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4722
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

SGVsbG8gSmFzb24sDQoNCkkgaW5kZWVkIHRlc3RlZCBpdC4gVGhlIHBlZXIgaXMgaW5kZWVkIHJl
bW92ZWQgYnV0IGlzIHRoZW4gYWRkZWQgaW4gYSBzdGVwIGxhdGVyIChpZiBJIHJlbWVtYmVyIGNv
cnJlY3RseSkgc28gaXQgcHJvZHVjZXMgdGhlIHByb3BlciByZXN1bHQgaW4gdGhlIGVuZC4gQXQg
bGVhc3QgaXQgbG9va2VkIGNvcnJlY3QgZnJvbSBteSBwb2ludCBvZiB2aWV3Lg0KDQoNClAuSC4N
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogSmFzb24g
QS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+DQpTZW50OiAyMyBNYXkgMjAyNSAyMDoyOA0K
VG86IFBhdHJpY2sgSEFWRUxBTkdFIChFWFQpIDxwYXRyaWNrLmhhdmVsYW5nZV9leHRAc29mdGF0
aG9tZS5jb20+DQpDYzogd2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbSA8d2lyZWd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHdnOiBzeW5jY29uZjogYWxzbyBoYW5k
bGUgcHNrIGNoYW5nZXMNCg0KDQpUaGlzIE1haWwgY29tZXMgZnJvbSBPdXRzaWRlIG9mIFNvZnRB
dEhvbWU6IERvIG5vdCBhbnN3ZXIsIGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KDQpZb3VyIHBhdGNoIGlzIHdyb25nOyBkaWQgeW91IHRlc3QgaXQ/IFdoZW4gaXQgZGV0ZWN0
cyBhIG1pc21hdGNoIGluDQpQU0ssIGl0IHJlbW92ZXMgdGhlIHBlZXIsIHJhdGhlciB0aGFuIHJl
bW92aW5nIHRoZSBQU0suDQoNCkkgaW1wbGVtZW50ZWQgYSBkaWZmZXJlbnQgZml4Og0KaHR0cHM6
Ly9naXQuengyYzQuY29tL3dpcmVndWFyZC10b29scy9jb21taXQvP2lkPTc4MDE4MmUzN2QyYjU5
ODExNzE3NjZiOGYzMWJjZWZkNjRkYTdhNDMNCkl0IHNlZW1zIHRvIHdvcmsgZm9yIG1lLCBidXQg
cGxlYXNlIHRlc3QgdGhpcyBhbmQgbGV0IG1lIGtub3cuDQoNCkVpdGhlciB3YXksIHRoYW5rcyBm
b3IgdGhlIGJ1ZyByZXBvcnQuDQoNClRoYW5rcywNCkphc29uDQotLSBUaGlzIG1lc3NhZ2UgYW5k
IGFueSBhdHRhY2htZW50cyBoZXJlaW4gYXJlLCB1bmxlc3Mgb3RoZXJ3aXNlIHN0YXRlZCwgY29u
ZmlkZW50aWFsLCBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSBhZGRyZXNzZWVzIGFuZCBhcmUgU29m
dEF0SG9tZeKAmXMgb3duZXJzaGlwLiBBbnkgdW5hdXRob3JpemVkIHVzZSwgcmVwcm9kdWN0aW9u
IG9yIGRpc3NlbWluYXRpb24gaXMgcHJvaGliaXRlZCB1bmxlc3MgZm9ybWFseSBhZ3JlZWQgYmVm
b3JlaGFuZCBieSB0aGUgc2VuZGVyLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgYWRkcmVz
c2VlIG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGltbWVkaWF0ZWx5IGRlbGV0ZSBpdCBhbmQgYWxs
IGl0cyBhdHRhY2htZW50cyBmcm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVtIGFuZCBub3RpZnkgdGhl
IHNlbmRlci4gU29mdEF0SG9tZSByZXNlcnZlcyB0aGUgcmlnaHQgdG8gbW9uaXRvciBhbGwgZW1h
aWwgY29tbXVuaWNhdGlvbnMgdGhyb3VnaCBpdHMgbmV0d29ya3MuIEFueSB2aWV3cyBvciBvcGlu
aW9ucyBwcmVzZW50ZWQgYXJlIHNvbGVseSB0aG9zZSBvZiBpdHMgYXV0aG9yIGFuZCBkbyBub3Qg
bmVjZXNzYXJpbHkgcmVwcmVzZW50IHRob3NlIG9mIFNvZnRBdEhvbWUuIFRoZSBpbnRlcm5ldCBj
YW5ub3QgZ3VhcmFudGVlIHRoZSBpbnRlZ3JpdHkgb2YgdGhpcyBtZXNzYWdlLiBTb2Z0QXRIb21l
IG5vdCBzaGFsbCBiZSBsaWFibGUgZm9yIHRoZSBtZXNzYWdlIGlmIGFsdGVyZWQsIGNoYW5nZWQg
b3IgZmFsc2lmaWVkLiBXaGlsZSB3ZSB0YWtlIGFsbCByZWFzb25hYmxlIHByZWNhdXRpb25zIHRv
IGVuc3VyZSB0aGF0IHZpcnVzZXMgYXJlIG5vdCB0cmFuc21pdHRlZCB2aWEgZW1haWxzLCB3ZSBy
ZWNvbW1lbmQgdGhhdCB5b3UgdGFrZSB5b3VyIG93biBtZWFzdXJlcyB0byBwcmV2ZW50IHZpcnVz
ZXMgZnJvbSBlbnRlcmluZyB5b3VyIGNvbXB1dGVyIHN5c3RlbS4gU29mdEF0SG9tZSBpcyBhIEZy
ZW5jaCBTb2Npw6l0w6kgQW5vbnltZSB3aXRoIGEgQm9hcmQgb2YgRGlyZWN0b3JzLCBoYXZpbmcg
YSBjYXBpdGFsIG9mIDYgNDUwIDY5OSBFdXJvcyBoYXZpbmcgaXRzIHJlZ2lzdGVyZWQgb2ZmaWNl
IGxvY2F0ZWQgYXQgOS0xMSBydWUgZHUgZMOpYmFyY2Fkw6hyZSDigJMgOTI3MDAg4oCTIENvbG9t
YmVzIOKAkyBGcmFuY2Ug4oCTIFRlbCArIDMzICgwKTEgNTcgNjYgODggODgg4oCTIEZheCArIDMz
ICgwKTEgNTcgNjYgODggODkgLSBSQ1MgTmFudGVycmUgQiA1MDAgNDQwIDgxMyDigJMgSW50cmEt
Q29tbXVuaXR5IFZBVDogRlIgMDQ1MDA0NDA4MTMgLS0gQ2UgbWVzc2FnZSBldCB0b3V0ZXMgbGVz
IHBpw6hjZXMgam9pbnRlcyBxdWkgeSBzb250IGluY2x1c2VzIHNvbnQsIHNhdWYgaW5kaWNhdGlv
biBjb250cmFpcmUsIGNvbmZpZGVudGllbHMsIGRlc3RpbsOpcyB1bmlxdWVtZW50IGF1eCBkZXN0
aW5hdGFpcmVzIGV0IHNvbnQgbGEgcHJvcHJpw6l0w6kgZGUgU29mdEF0SG9tZS4gVG91dGUgdXRp
bGlzYXRpb24gbm9uIGF1dG9yaXPDqWUsIHJlcHJvZHVjdGlvbiBvdSBkaWZmdXNpb24gZXN0IGlu
dGVyZGl0ZSwgc2F1ZiBhY2NvcmQgZm9ybWVsIHByw6lhbGFibGUgZGUgbCdleHDDqWRpdGV1ci4g
U2kgdm91cyBuJ8OqdGVzIHBhcyBsZSBkZXN0aW5hdGFpcmUgcHLDqXZ1IGRlIGNlIG1lc3NhZ2Us
IHZldWlsbGV6IGxlIHN1cHByaW1lciBpbW3DqWRpYXRlbWVudCBhaW5zaSBxdWUgdG91dGVzIHNl
cyBwacOoY2VzIGpvaW50ZXMgZGUgdm90cmUgc3lzdMOobWUgaW5mb3JtYXRpcXVlIGV0IGVuIGlu
Zm9ybWVyIGwnZXhww6lkaXRldXIuIFNvZnRBdEhvbWUgc2UgcsOpc2VydmUgbGUgZHJvaXQgZGUg
c3VydmVpbGxlciB0b3V0ZXMgbGVzIGNvbW11bmljYXRpb25zIHBhciBlLW1haWwgdmlhIHNlcyBy
w6lzZWF1eC4gTGVzIG9waW5pb25zIGV4cHJpbcOpZXMgZGFucyBjZSBtZXNzYWdlIHNvbnQgY2Vs
bGVzIGRlIGxldXIgYXV0ZXVyIGV0IG5lIHJlcHLDqXNlbnRlbnQgcGFzIG7DqWNlc3NhaXJlbWVu
dCBjZWxsZXMgZGUgU29mdEF0SG9tZS4gTOKAmUludGVybmV0IG5lIHBlcm1ldHRhbnQgcGFzIGTi
gJlhc3N1cmVyIGzigJlpbnTDqWdyaXTDqSBkZSBjZSBtZXNzYWdlLCBTb2Z0QXRIb21lIGTDqWNs
aW5lIHRvdXRlIHJlc3BvbnNhYmlsaXTDqSDDoCBjZSB0aXRyZSwgZGFucyBs4oCZaHlwb3Row6hz
ZSBvw7kgaWwgYXVyYWl0IMOpdMOpIGFsdMOpcsOpLCBkw6lmb3Jtw6kgb3UgZmFsc2lmacOpLiBQ
YXIgYWlsbGV1cnMgZXQgbWFsZ3LDqSB0b3V0ZXMgbGVzIHByw6ljYXV0aW9ucyBwcmlzZXMgcG91
ciDDqXZpdGVyIGxhIHByw6lzZW5jZSBkZSB2aXJ1cyBkYW5zIG5vcyBlbnZvaXMsIG5vdXMgdm91
cyByZWNvbW1hbmRvbnMgZGUgcHJlbmRyZSwgZGUgdm90cmUgY8O0dMOpLCBsZXMgbWVzdXJlcyBw
ZXJtZXR0YW50IGQnYXNzdXJlciBsYSBub24taW50cm9kdWN0aW9uIGRlIHZpcnVzIGRhbnMgdm90
cmUgc3lzdMOobWUgaW5mb3JtYXRpcXVlLiBTb2Z0QXRIb21lIGVzdCB1bmUgU29jacOpdMOpIEFu
b255bWUgZnJhbsOnYWlzZSDDoCBDb25zZWlsIGTigJlBZG1pbmlzdHJhdGlvbiBheWFudCB1biBj
YXBpdGFsIGRlIDYgNDUwIDY5OSBldXJvcywgZG9udCBsZSBzacOoZ2Ugc29jaWFsIGVzdCBzaXR1
w6kgYXUgOS0xMSBydWUgZHUgZMOpYmFyY2Fkw6hyZSAtIDkyNzAwIC0gQ29sb21iZXMgLSBGcmFu
Y2UgLSBUZWwgKyAzMyAoMCkxIDU3IDY2IDg4IDg4IC0gRmF4ICsgMzMgKDApMSA1NyA2NiA4OCA4
OSBSQ1MgTmFudGVycmUgQiA1MDAgNDQwIDgxMyAtIFRWQSBpbnRyYWNvbW11bmF1dGFpcmUgOiBG
UiAwNDUwMDQ0MDgxMw0K
