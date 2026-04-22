Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F30CD3427
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 May 2026 20:10:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2de385e8;
	Sun, 10 May 2026 20:10:47 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazolkn19013071.outbound.protection.outlook.co
 [52.103.20.71])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 357675a0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Apr 2026 11:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcGEfkwEEvPoWRmqqf97fjVakcNqwsRkFP4KJT2gzpsU2ktoUAIpy0/vmPABf+M7oyzBIi2g1xSdMvYUE0kSq8GFaj+Dn8bQKsW7XjRMuSFlV8pfDecw82Jy8pHee5hGqbFg772SBjtDXoiAsm3OkzcmOcAO2ZxCtqZ/h0abj8OJEc+0ePFQKEv0iK76emj/dxEePQu6UJ9spI8cYfQ6JfwHdE8JO4WgciTC6YqyrYgWAghz+3S294YRLEbJk06UJojKjZ7blTn3K3VsERrFZWzTyMPJ9j0n5fqJvOmUsX83QpqzICi3XjQH004wds6V0KBSdnpMnutPfmiNmH2uKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NxnSZdKlQZ4yUx+Mpp3ayaLcMFUYWKy4Ot5puaancg=;
 b=gT9qkc0QB4yStR10g6JKhXRRzMFfeJ2yz/x4TkN1rWEFNU3dUBWRMujgX6QXrkhoOSUjp3B45KQ/POyg8i4tRuPiNc/CIAl5z17xRZG9OF9Z2V4WkOzjdHpzrs+IuBpyUOPWoJu6QgjbEHCPbacJfgAg1cSpwf0HWlhaO4UmtnQbELGIBK/utjj5Zp2DpCWUGLygCWjgq+UF+fBtD5rfRRO3a0alc/i6Rjcw2SqC6Vd1BI0ZMRicQkUIUxh7lHI0/fNcjk/G6GQgp0bb1yRkqwY+SG4yRmgYAOavzNPaJaRxfofBnoJ2Igi/XcoMbk1dJeBFWh8pxLmx9PlJobOngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NxnSZdKlQZ4yUx+Mpp3ayaLcMFUYWKy4Ot5puaancg=;
 b=mjYn7HR7k+aACkrqf+adehxGmm8hvZ4IyXgSqCM9heOHfkz7Dz4fOPBB0ldRFb8XnbBsvRISRs3o4vlsx+QNr+kDFrUcDQFqktQsFUkBh4edaHtTjxXwkB07Lfwb7VYBjt0fChtG33ADqX6YByCNLTDlaOFgjEsNXVOBUM1MjTVVnqK8meAY1Lf41V+WIbDsMxt5JAysFgGr6hxFjJzZyyKiqTJ3nmI0UmowOU+XvcsgvA2Y3HZTBtopn4mKRx1VRvFt0VTN0wfNWRToke/seRQzfRDf8j9nA+8XP39sQwfhx7daMoWk2nV79Ay1mwI6qRkWiFVs4QCxp+aCm9BQiQ==
Received: from LV5PR01MB994148.prod.exchangelabs.com (2603:10b6:408:35d::8) by
 SJ0PR01MB6304.prod.exchangelabs.com (2603:10b6:a03:297::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.20; Wed, 22 Apr 2026 11:32:18 +0000
Received: from LV5PR01MB994148.prod.exchangelabs.com
 ([fe80::3cdd:3f63:acf:ece4]) by LV5PR01MB994148.prod.exchangelabs.com
 ([fe80::3cdd:3f63:acf:ece4%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 11:32:18 +0000
Message-ID: <LV5PR01MB9941483EF4AD106F533F88964DD22D2@LV5PR01MB994148.prod.exchangelabs.com>
Subject: Re: WireGuard obfuscation & active probing: staying virtuous under
 pressure
From: Ian Chen <free122448@hotmail.com>
To: Leonid Evdokimov <leon@darkk.net.ru>, wireguard@lists.zx2c4.com
Date: Wed, 22 Apr 2026 19:32:13 +0800
In-Reply-To: <CAB-U=tBRwE+CkfF4XF1C9yiYLRLzHQsnXdEeVR=bs9jqCAwwYw@mail.gmail.com>
References: <CAB-U=tBRwE+CkfF4XF1C9yiYLRLzHQsnXdEeVR=bs9jqCAwwYw@mail.gmail.com>
Autocrypt: addr=free122448@hotmail.com; prefer-encrypt=mutual;
 keydata=mDMEXtBrbxYJKwYBBAHaRw8BAQdAa9gvMh14krPTOqHsW73dssLoBAYfuWEpKz7cKVuv8
 zO0MUlhbiBDaGVuIChkYXRhYmFzZTY0MTI4KSA8ZnJlZTEyMjQ0OEBob3RtYWlsLmNvbT6IkAQTFg
 gAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBE3O0V40bikjuTHW9xyidUa+24sBBQJmFUZ
 AAAoJEByidUa+24sBfmIBAK94hUoE4ozwGPORh5hnuNH9Th4cNuVwpllnm4Pd5lPdAP9EZmDS4FtW
 18TPL7Hz+ANSzTlsCIuTWLr0BKYSWRgVBw==
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-61PfsPedgxCq7Z3hufzk"
User-Agent: Evolution 3.60.1 
X-ClientProxiedBy: PH7PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:510:323::7) To LV5PR01MB994148.prod.exchangelabs.com
 (2603:10b6:408:35d::8)
X-Microsoft-Original-Message-ID: <1fa035ae8cbcf09df9bd196228f5a3d6cc1a6faa.camel@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR01MB994148:EE_|SJ0PR01MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a63c63d-5fcb-4f7f-a126-08dea062cf28
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|39105399006|5072599009|20031999006|461199028|25031999004|12121999013|23021999003|7072599006|15080799012|41001999006|8060799015|24071999003|40105399003|440099028|3412199025|10035399007|19111999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkdBZHFwTXN6OUlOWk1mS01yVytRbEp3SlRtNVVaYUFlaFJ2aFhzNlJidnhk?=
 =?utf-8?B?UVhBMUcvb1AyMkVtNGhkcy92NzEzZ2dhZ1Y1VlppOFc0OS9kZktkdkJCMDJS?=
 =?utf-8?B?dXllZmpkQ2JDbHljT1ZCSnBTa2orUTJ1cCtmaWFBaUdCd21BTTlzUG4ydW1Z?=
 =?utf-8?B?Z0JhVXVJTy92S2Z2WEFncnlXbmNoK0lSWTQ0K3hSSy9QY0pEWkU5N1dRbmZF?=
 =?utf-8?B?UDltWlc3RXBxZ2xmZXhBWmRnRDFsYjl6VTBiN2d3Nm1TR2VOUzU4UHFRb0Jl?=
 =?utf-8?B?cjRsZnpYRzVIOHlwVittNnIvd2NYWndjWGZielhWMU1ZYmVoQmdSaWpaWVUw?=
 =?utf-8?B?eVlaTitDM0JJTGRnNVV0TTVCWE5sWTYxdGM0akM2K0xnWURnM2RoZm4zNmRz?=
 =?utf-8?B?eWExL0kzalBocTN6enlQNXdGOGk2S0lvUm10Z3lveWZLODU1VWVLRU9XTUJq?=
 =?utf-8?B?K2tYSWxyNDk1VWF5MStib005eVVjTUx4bFJlR3pjS2g2d3ZQV0JtRHczN0Fn?=
 =?utf-8?B?UGZYNkJ3N0dxVDZ2RWh4N2RvbUR0NFpIdmFnZzZQd3htUFNBWWVZTExFYWtI?=
 =?utf-8?B?MnREWGVFUG4yYWFRYTkra1BQL2dCRlNQN0cydDYzMFB2WjBmc0cvRzFld0Ez?=
 =?utf-8?B?bVlhd0p5UU1ZSnc3a01NRjZZVTdJbGhTRTRkL2toa0lNUVVwQzkvYkxiaFBH?=
 =?utf-8?B?ZndCcGxvVml1UGFLUFBLNFRPdDdyS1NXTURFWEdMeGdWSEY0TUVhUnJBeXY0?=
 =?utf-8?B?dG13ejlzRG8wRVVSM0FxVUttNGxlQ1UwU05aOW1CVFFnb0ZGUWV5MkhKMTB5?=
 =?utf-8?B?L3pPV0NhdmsrMklLWWllalUwaENwb1huQTRPMzJqQTZZTVBOeXgzNndoenA5?=
 =?utf-8?B?dExqMHM3Wkw5ZXlReWY3aXBUd2thYmxCUFdxUm9tOW1KdUUzMW41cnNyMEhB?=
 =?utf-8?B?bXhrRGlpLzF6YUl1aVpVakoxOVcyQTNOYVJuMENLZER4RzBxM3F0blkwRyt6?=
 =?utf-8?B?M2tBSHIrSElzMnJCaGJoSTBqc2hJT01zd281MDRpNGdxTmZlazlLb0hZcWp1?=
 =?utf-8?B?M1VoU3llcTcxd1NhdStVM0dhVnBZTmdVSFQ4c3Q2VWJlTXJuaDhLR2Y5NkRQ?=
 =?utf-8?B?dEpYQWdCRGJ6blB4akVlZmNnN2JQVElpc3FmcVptcDFQNmN4NlpsWks2MlIx?=
 =?utf-8?B?aTN3YnI5blpubWRicmNRcTVwV0E0bDViUWRrUlNKbllvV3pCY0F1L1Z1SlRJ?=
 =?utf-8?B?UXFLMUpRYWV4MEZXSWdkZkRrRFdzTjdyVEZDdHp4N2RZamNHZWY0cGErUmhX?=
 =?utf-8?B?YkhRTkdQRVNyOGR3RWpLcklVV1NMa0JjTGJDQTZWTlJET2VndExxTG5HK3JG?=
 =?utf-8?B?YkZFSzN6M3NmNjB0QjY4dHBFelVYSEJxWmJkM2tJa1Y3MHlrakZtOUU2WC9Y?=
 =?utf-8?B?c002aU0xSmJ6OFBwNjlwRHFORFowcU00T0ttakd2TVpPZ2ZVZ1dYMlJDb1Rt?=
 =?utf-8?B?dkpHVlJkZzFMVTlXQWVUcUJiTWVuMVJmbDRvUzJySWtseGU2Ky90WjNhdTFu?=
 =?utf-8?Q?yVgcH/foXxa8YJWOwQh3DZPLw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THJNd29FR3ExVHpQeG1uY2ZaMDVYVlFwaGpPSllHZHFoUjRtM1AvclBGU1lX?=
 =?utf-8?B?N29NVU0vNWFFd3pjbEtLZEZaRmROZERGM3VKT000MVM0cENnUlNBbmNodEtO?=
 =?utf-8?B?Wk5hQlFoTkFFUDBOYnpmUGhZai9HNmZuTDFZcitQQVBFYW1LMS9DNmw5cTVE?=
 =?utf-8?B?MzMvSEZiZ1NzaHVUVkRoY1JpUFZ0MGlJbWJsaEVxOE5uc0NYZ3BpY0tjUmpL?=
 =?utf-8?B?ZC9KMm1xMStPQUhETGVSL2YzZ1R5SEJvVEd0NzlVRmhtd3RPRktCWFNoajV4?=
 =?utf-8?B?SVh4MTc1RXJIL1JwVEJnU3NZRXdHMXk1QWdWazFUY2pNR09Eb0JPR2UrTmtZ?=
 =?utf-8?B?eTMxK1FqUldrV3JoZ3RTM0E4QmVwR3hBMFYrY2h6ZTlmci9VQ1JwNVZ6MXpy?=
 =?utf-8?B?RDRzUU1ENmNQNytUQk8rMEJsV0s2QmFaM2VhMTBPUkhHY1k5U2RkSEdoL1lo?=
 =?utf-8?B?ZGx3QmU3N3phQ2tWOVM4V1RrbjJyZjE2WFpPejJQRkpFMHpLS3JCQVBEUVBN?=
 =?utf-8?B?M0xCKzRiUmV1cFNwRkovdHBDaTNIblVlODcydG9pdURSZ1h0VXVwUkxWQ0Fp?=
 =?utf-8?B?YU80bjRicVJNVDhkMlNFL1dycCtOU1BmUGlUNDdrcUxyeHZudUpzMkF1VEJ5?=
 =?utf-8?B?d3J0QnJ3Z0t3UjZpK3FaZVRyenBuNmtMTHMxQUtPbi8wcEMyVlhxVnZJL1Nl?=
 =?utf-8?B?RFdzVG1HYmhSa05nTDNUQlg5eW5HR0MrMm11QzVNd09QcWtsdkhWazhmVHln?=
 =?utf-8?B?NDZlaTZOTjZHMElUcThSd0wyME1XellFbGFCV1k4VEg3K1JwVmxpOWd5ZThG?=
 =?utf-8?B?L3lRNW52ZXNNYkxLQzJwcTc3Vk0zRUhidS9pQVpPQndIVUh0N1VvTE4zSTYx?=
 =?utf-8?B?S1FXanZ0by9NRlNFMjNrSDFSRlFCQXZTUFVqZlYwUGM4UUJHMWNJTDByQ3dR?=
 =?utf-8?B?MmdWZkp4TmdJUkJWT2FnQmsvMFR2VU9pOGpPQ3Q2aXJTQ0RPaDkxQU5PQk5S?=
 =?utf-8?B?QkV3U0x0U092MHN5WC9VcHQydFlYTnl2NUdYS0tGK1c4QU9tQlBwdWR2djRR?=
 =?utf-8?B?V21KNHpWMFpGUGdQRit1RXJBckxpQWMwUE95MVBtOWJySXdrT1VIM1VoOW42?=
 =?utf-8?B?TUdEdGYyZGFLR0FBSnBzYTl4QW1vSFZyQWhzTjd4YkFXdkJUaHpnSWdnczUz?=
 =?utf-8?B?ekU4bS9YenVkWEVIZGFjZ29lRnBDOHBwNDNRU0cvL2ViemxTK3NuM2dhMC9W?=
 =?utf-8?B?RHlxQlRKdE9aalFqTFlNcWd5VFU0WGZkcVFMYUhQWm82K1IybnQyY0dOcEI2?=
 =?utf-8?B?WStJejBudjBKQ0lYOFQxYXAvbTlMdEdhTVI2YjlBQnF4bWR5cHZzeGJWM2hP?=
 =?utf-8?B?Y0VmdXo2VWtUWnpCYUIxZG1mL2xtcEIwWmlldjJyZEdHT05xQWoyNTRCRmVl?=
 =?utf-8?B?aG13YTJwMWJDRDhodjNRdkVHYTlyVk84ZUtBcXpRaGF3bks3SXpxbUJIVDBW?=
 =?utf-8?B?dmdrYk1oUFhFcVJDYjJEV3pKcmJqYVFwbys1RTNOZFpFZU9WNEZkNHdMSDBZ?=
 =?utf-8?B?QTQvaXhYTm9SU25zS2lNMVBuOS8xOHNYdCtic09EQW9ZWFAzVFhuSzlLK2JL?=
 =?utf-8?B?aEpOdHpzR0FMM3pFY2krWTFaVSt5Z1k3dUFmZEhLUjdpMmJudmlVeXRXNHVN?=
 =?utf-8?B?WE5IdVdYRVlTUTJpaEJ2U3ZNQmRhMFRENHNObzVyR3VpalNZbTh2TTg1UkRh?=
 =?utf-8?B?NmFVVHlXczduV3Y1WHlZU210Slk2S3FPRVZBaWNPeWM2REc0Q2l3U2lKQWxT?=
 =?utf-8?B?ZWZUd3JzYmY0MDJhcVNOZTNqMGNKaG0zeVFZNnhiU1BsVFE2eG5FT0ZXOWhU?=
 =?utf-8?B?OWlMeFVtYzQydzRKQldTVU5SMXdTUDFoYTAwZE9WVWpTZUhnK3RkRGVnS0E1?=
 =?utf-8?Q?Q9R6xN+t0KY21gSdgW3efFz8P8ghGTdy?=
X-OriginatorOrg: sct-15-20-9412-6-msonline-outlook-af14e.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a63c63d-5fcb-4f7f-a126-08dea062cf28
X-MS-Exchange-CrossTenant-AuthSource: LV5PR01MB994148.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:32:18.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6304
X-Mailman-Approved-At: Sun, 10 May 2026 20:10:46 +0000
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

--=-61PfsPedgxCq7Z3hufzk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> WireGuard over Shadowsocks-2022
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>=20
> TL;DR: Too much crypto + deployment challenges.
>=20
> Shadowsocks is a good solution against censor, but it strips 40 more
> bytes from MTU and AEADs data twice: XChaCha20-Poly1305 of
> Shadowsocks +
> ChaCha20-Poly1305 of WireGuard burning twice as much carbon credits.
> Performance matters: e.g. Mullvad introduces LWO claiming performance
> improvement over Shadowsocks.

I developed swgp-go around the same time I wrote the spec for
Shadowsocks 2022. At the time, I intentionally left replay protection
out of swgp-go, because I thought WireGuard wouldn't need it.

Thanks to your work, I now understand that this assumption was wrong!
So I added it into swgp-go:
https://github.com/database64128/swgp-go/commit/207a055ab0a1058579f299fc102=
1cc64c95b21db

The new "zero-overhead-2026" and "paranoid-2026" modes provide replay
protection for handshake packets. Replayed packets are dropped by
checking the nonce and an encrypted unix epoch timestamp, similar to
how Shadowsocks 2022's TCP construction does it.

This won't address the "DoSer" scenario, but should provide enough
protection against censors without knowledge of the OBFSK.

--=-61PfsPedgxCq7Z3hufzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRNztFeNG4pI7kx1vcconVGvtuLAQUCaeixvQAKCRAconVGvtuL
AcOLAP4vwbRgxwmRRXqlD6YGd8ofZb7ci4IoeV83LuSlQjvKwwEAsnkeAlBsS48e
vmoNxxAv0k4xwiH03nuBSn2fY6r1ggI=
=l3zh
-----END PGP SIGNATURE-----

--=-61PfsPedgxCq7Z3hufzk--
