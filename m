Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33055CD3427
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 May 2026 20:10:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b30f97ab;
	Sun, 10 May 2026 20:10:52 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazolkn19012021.outbound.protection.outlook.com [52.103.11.21])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6d6e1b83
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Apr 2026 04:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1fIu2LVdNYQhw7hOKqgCHL/bLkI/3mEHdI2Uko85MkJcQB6pMf4BWO7gmRJG4TfPf7Zr4L3TpRvx1STUxs3pHNmaVv/UjTS4RYyz9XZKMx31pAJ9mkrLZvkYG8Sj0eAgmyK4P1OgniWBg9OvMWWrkZ1xDvCGXKLc4ujhTlJRsI4BYfyGHeAxC6gTn42/i7MtMs80W6wvWGfkHQJ8REEOqqrXms15pBRll1mKn515QRCO+BKHHwdwz6xUb9rPwpkVsMpAIFvngN/GYnk6DijksirULqt0bpv0RWpcXDRDDYQOQVY6imhYnl/NY4C5fSOS3R6gXtW5wMshJZ+7qmG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WO3Oveb1PrIAAvLGhV3v2kWgI6ezdkZBb3d/EzbtUnI=;
 b=jL2wcTyJYt025G3CUwVlJPpq2nvcq3Hb172by9sIPDvxV4jennjqjBvQip7fmTBN2KUhV55I/3drb88Sssvh4veUsKuG9epnt8lZ5frFK15NgCLDQwSriMxBpKJu+jRzTf6pJRWgtxyrzYDPnpUe0socSee4Wun0kVusdnIBvYL8UUpXsMUu5MdOmME8p2IMRxI94AnOkuy9oL5w4RkBbp/3jYjEntw956EiuZAFBa7xmaEBENfVd0yMEwJTbcBPC9ii9lefVpUoieWOuZQzku3wLv36dFCdChEYcf6367lrXC42s6JSnompdAsw+CEDHNJa236bJo7TtpitUSyy7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WO3Oveb1PrIAAvLGhV3v2kWgI6ezdkZBb3d/EzbtUnI=;
 b=HZCrbY8fny6vZzonD2pXQtLE9mN3WnY6vBRqDVnDjWxgBLG1dGdJGg6VGzTe2qVIOHFU95EYuOSj/VrH7KXahNzNoUtUt4nYAF+cx51ik6b9CQlx29ZJCiqAAydgBv/MomLJ5O0X3uvrEYNeFXWdAYtVu55mSfaFtOUsfHLCfPeVKjGlLwQCcukFwjDIeQwIx9rd1yS/dSbmFrgXbr1gwKHKX49t0GgKTyFM10AzsEOgMH34QIbUNgFGfqqtjQinE8NE2/w+imrAIUn+/vkugzWCxP6nPsNf3TS7aOFqSAHKZqocnB4/qbAMQ9CFSs5TCPfDxX7QUCJUlOmCUc9qbA==
Received: from LV5PR01MB994148.prod.exchangelabs.com (2603:10b6:408:35d::8) by
 PH0PR01MB7270.prod.exchangelabs.com (2603:10b6:510:108::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.25; Sun, 26 Apr 2026 04:50:52 +0000
Received: from LV5PR01MB994148.prod.exchangelabs.com
 ([fe80::3cdd:3f63:acf:ece4]) by LV5PR01MB994148.prod.exchangelabs.com
 ([fe80::3cdd:3f63:acf:ece4%6]) with mapi id 15.20.9846.025; Sun, 26 Apr 2026
 04:50:52 +0000
Message-ID: <LV5PR01MB9941488AF3542FDC61728406C8D2292@LV5PR01MB994148.prod.exchangelabs.com>
Subject: Re: WireGuard obfuscation & active probing: staying virtuous under
 pressure
From: Ian Chen <free122448@hotmail.com>
To: Leonid Evdokimov <leon@darkk.net.ru>, wireguard@lists.zx2c4.com
Date: Sun, 26 Apr 2026 12:50:46 +0800
In-Reply-To: <1fa035ae8cbcf09df9bd196228f5a3d6cc1a6faa.camel@hotmail.com>
References: <CAB-U=tBRwE+CkfF4XF1C9yiYLRLzHQsnXdEeVR=bs9jqCAwwYw@mail.gmail.com>
 <1fa035ae8cbcf09df9bd196228f5a3d6cc1a6faa.camel@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
X-ClientProxiedBy: PH7P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::32) To LV5PR01MB994148.prod.exchangelabs.com
 (2603:10b6:408:35d::8)
X-Microsoft-Original-Message-ID: <828f543ccb7319fb505aa691342507cb9788323a.camel@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR01MB994148:EE_|PH0PR01MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ac3b7c-7b8e-4872-ad1f-08dea34f6468
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|25031999004|19110799012|15080799012|8060799015|23021999003|5072599009|51005399006|6090799003|24021099003|7072599006|461199028|10035399007|440099028|3412199025|19111999003|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW5pSDFMVmJ5TVFXTVluc3FjVHFHNVJBWmh6bzdxNHUrcktnUm9wRVhwZHRM?=
 =?utf-8?B?bTliSHMzaE1MMG9BR3BoTkg0RnZwV3dFTGNnbEVvMXdyOEZBYkFWZm9MV2Jq?=
 =?utf-8?B?MjhjdCtEMmVpUDdFS3dDaTk4SUwvUm5nOTNON2V1RmNRSmtRdURCdVh2UUU3?=
 =?utf-8?B?NWhZdzVCckxTYWp4ZE5rZUNsSmVHcVV2cUJKSlZ4Vkl3cnBNbUFhWk0rUDZa?=
 =?utf-8?B?cVZTallNK1ZISVVQUUZna1dZbXNqK3Q4a1JqR1A0ZWVHbE5yY0NBbS8wNEVu?=
 =?utf-8?B?V1ViRS9YcmpMWVBVMzczaWFQc2pLQzB5UThJeWl5elFOVklFbzJWa0dka1dJ?=
 =?utf-8?B?NGRad2VMUnRDUkVzVWZKOWxic1FmV3VnR2F4cmx4UU1zejR3bWtzQjhHcElu?=
 =?utf-8?B?U3ZkSzAyRGpZMktlZTNWNkNzYVFvWFlSZHpDTUdGbUVReWFTY00zaVEyZnVO?=
 =?utf-8?B?ODZ3RzIzTUhxL3pDdTVmVGphcWlaLzIvaHArdVJGWjI1WUZCbWFmSWRBajM5?=
 =?utf-8?B?TWJqNlVWcGlRYjF5RUp3ZGdUSUpIc3F5ZmduNmNyK0s0UGxhdld0VnVDK3NG?=
 =?utf-8?B?QkxGS1MxeFRSQXM3RWY0NndTSlJaaVl2M1dQSmxQNFNQSmNaNUtBMUF1UXJh?=
 =?utf-8?B?VzQ2SmZ4NFFBOEgyZ0JUdzBEbXIxMWRVYU5BZTJKeUxqYit5bXhadTJBY2Zk?=
 =?utf-8?B?a3ZZaEd6Ukk1cjZlcnMyaHNKQk10eUdzNHBVM0grUG96VlVIVUlEcDZHZjlD?=
 =?utf-8?B?NzlSbXpwRXc4ZUI0MmY0a0ZiWFdVaytVV0hxSzNCNjM0ZlVrdUdaTGk2bVds?=
 =?utf-8?B?b1NXMWZ1bVdSNldvTW9SZEM3TGE1YnRXdXpXWmNqZG1HYW1rK01mb0d5Nkt5?=
 =?utf-8?B?NWlRVzhXVjNySGdqM0VyQk5tSEJyMVU5Z0tOMENQR3g1RjhJQlQyYzZtb3lP?=
 =?utf-8?B?ZmM0bTcxMS8wMERjZzM0ZG9CQzdIMTUxbFo4ejdoaGI3T3JLTUpoZ1ZUN3hX?=
 =?utf-8?B?WmhLcWVZWnlDMmU1OEdRZzhoQ1I1bVNuZld0ZVZxMmVuNnlOU1dTVXFpMC9E?=
 =?utf-8?B?VTdhM1pveFVrYUNCcURYWXBreHJLNURLWGlVSDBmL0R6KzNoK0Y5UTBhZ2xR?=
 =?utf-8?B?Z0IreTlWUGJsVExDQk9hSG53RThwd2owaUQ2eHpDRVRyRm81MXdEdWhYRHFF?=
 =?utf-8?B?K25YakMwTjFNN3I2NCtMN2dndGF6MFNWczZEYVlRQ0JiUm1xL3A0amJxSXJM?=
 =?utf-8?B?b3lwMDZaTHNRTUoyVXNTVmdTRXExWi9vRS9TTEpKYzBRbmVjSlZIRnIzNEly?=
 =?utf-8?B?citCaldGeitiTml1ZGJDM2tWaVdVN05mVnQwMStraDQzNUZId0w2R0txazVu?=
 =?utf-8?B?b0p0b2tybHBzVHZhSHpqR2N6ZFU4VmNPbnJLdXNnSzV1YVlrQU5JZnBPMFR3?=
 =?utf-8?B?Mi8zWHJNOXhRUzA2YWFCMUE1am9ETEgzbUl5RnVrOURvMDlwWVBpdGxIVWRa?=
 =?utf-8?Q?EOWV+kkqhcaK67ikN3JLhcwez0z?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEprQnBLeEE3V1pBcnBHZHNERUR3czlZRUc5RE0yWWpSRUZQVGNwQmQ4UE1F?=
 =?utf-8?B?NWI1SjFQOCt6RXRNemI4M2FGWW5OZHVUTFNaSWZZM1FyTFR2S0drSnI2VlY3?=
 =?utf-8?B?d0xNVTVCN0F4b2xMWWlWUTRiem02UU5vYWhEVmowaWdJVUhiSGwzK3JHUEwy?=
 =?utf-8?B?TWhjN1BRU3JkeGFVd1F6UEtMWXQ0cWpVV0F0VU8yTjlSekh0WmM0azJmMFRY?=
 =?utf-8?B?NXpzS2UvY3JQVWV2dnBYRVFFcVEycjBYZzBnbnF3eE92MVVlaGE3aEdpUjJs?=
 =?utf-8?B?UGJNMGZqSm5nekE3elRBNC96a29yQnl4M2U5cDR1aE1TaUpYaFJKTkJ2cGx3?=
 =?utf-8?B?Y3dXb3dzaXNUVHM5RllxMVVhelJrWVk0L3VWWjkvZjhpdVh5NEwwZ0diWjVa?=
 =?utf-8?B?UzFzRVA1RU5Zb3RBYmw2UFNHOWtwcHF6d2NIcUhPSG9VTDNWTldvamRYUDVk?=
 =?utf-8?B?YkR2L2xnYnlIcEJSSThOTFlkcmJYa1JJbiswaVZhVzFEQXBZUktEUmdqSCsy?=
 =?utf-8?B?RFpnZmxnZzZXeVhjSGhiRGhJZHFzVWd3am9MRFdOQS9SYmoxYlZWUVZWSmQ4?=
 =?utf-8?B?dUliUEpMdFdraU9HOXY3L2ZiQlZlUmI4MGsvK1NtQXRzM3V0eGRzOWF5dXY2?=
 =?utf-8?B?SmpIdFhzbGphMmNGa0NyVmMveXdPZER0V0hNeWdWQjZYSXhWVVhzVUxjb1lM?=
 =?utf-8?B?WTdCV2JDLzlJSE93UWdMQ3dFaXozbFdMYjEwQlAxV1hvM092azFrdFdmRGpO?=
 =?utf-8?B?UU9OOURZaGNRU3B0bGJ3aCtUbVhwbVNVMWxVNDJDZmQzQ1l0YUJ2MEtNQ0VI?=
 =?utf-8?B?eWtrQURkbjFYRS84R2NjMnMwZDdTemRRQmhJTG9vcS94TWsyU0dnOTNGdWx3?=
 =?utf-8?B?Z3dYWS8wb3pkY2V2MUJrNlFRcmRTQW5CNnhhUHNOem5XZTNWazZBMmRZSytD?=
 =?utf-8?B?eXVCNnFwQlhLRmJqV205bjUySlJpSEJ6M3VFYkltK3A3N1Y1eU1lLzVMaUZk?=
 =?utf-8?B?SEkzOXdVVEhIVTMwOXl2UTV1cFFrT0FOTmNVZ3dqS0VmaVFabWRQbGNQQ2dP?=
 =?utf-8?B?Sk5XQ2o5dGZkVUJxQXB6cS9yMGxYMzNIZ1NiVVBlRENLMStsYUtyMU5LZ2ts?=
 =?utf-8?B?bC9VenZmeTkzdHZjcFRJU1RiQ1RhVCtuZi9KM1BRZzh3Y0VrVWQ3S0I5bmxs?=
 =?utf-8?B?OWw2U255OEpjNkZLN0t2VkhzSXgvelU1eDFFQVlSaGRHZ2g5TTVwRDFFMCtZ?=
 =?utf-8?B?VXdwOVJsQnZwRFRZa2xXNjlEUkMvTjF5OFJCc3N5SzFQTk5TNW52ZWZFRTZ3?=
 =?utf-8?B?TUdwNnY4a0VOSXlML0hsajlNZjJhckpsUzJOU085TnhDbDBIY3ZjdlhwZE52?=
 =?utf-8?B?ZVc3VEVCWWt1dWNoQjNEdVlweWdPbHJUUmdNeFk0T3F3MDd6U2Z3QnhuKzZr?=
 =?utf-8?B?Y2k5Tm8xbjkxLzByL3ZQZTUva1haaWtpajRyZXFoSjJsQk41M0tORmtMd1RS?=
 =?utf-8?B?d0F3VmRnV2xtY29leTJZeUl2M1RmRjlQS1F3bE9KbUFFempBblZQR2E1TVpi?=
 =?utf-8?B?NDU4THNyaVp2MU1iYTBIRlpRUWhBZEpObkRRdDdHWW5NbG1aUWlGa0Vub1ht?=
 =?utf-8?B?S3hrbzBpYU81WHlCZWRyQlpkOWpzeERuWEpLSjl1V2JvM3NQM0c4alJWOUY0?=
 =?utf-8?B?aVJwMnlkYVd5VUhjYW1ZWEdkb3JaWnVUWVhjRmtPcm1STDI3MGJydkNnTlRS?=
 =?utf-8?B?UEMyZFplTUpsaUh1VEo2QTdPMVhNZkVVNlpzS1pWVWhHWVlWQXpKakIwOThN?=
 =?utf-8?B?ZWp4Q3JmaFBUczNxcG16OXh3VEhLVXIxODNsYkU5WWJjbXkxT3dVdnZ4aERU?=
 =?utf-8?B?V0M3d1BLOTFQb1BDYWlJZEdGSkc2ZVVZMDB1REc2NXJ3eDdLY043dTBqb2Zy?=
 =?utf-8?Q?75HaVC7lnQ19IXr3uz75vCQeQW8Q53X3?=
X-OriginatorOrg: sct-15-20-9412-6-msonline-outlook-af14e.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ac3b7c-7b8e-4872-ad1f-08dea34f6468
X-MS-Exchange-CrossTenant-AuthSource: LV5PR01MB994148.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 04:50:51.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7270
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

On Wed, 2026-04-22 at 19:32 +0800, Ian Chen wrote:
> > WireGuard over Shadowsocks-2022
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > TL;DR: Too much crypto + deployment challenges.
> >=20
> > Shadowsocks is a good solution against censor, but it strips 40
> > more
> > bytes from MTU and AEADs data twice: XChaCha20-Poly1305 of
> > Shadowsocks +
> > ChaCha20-Poly1305 of WireGuard burning twice as much carbon
> > credits.
> > Performance matters: e.g. Mullvad introduces LWO claiming
> > performance
> > improvement over Shadowsocks.
>=20
> I developed swgp-go around the same time I wrote the spec for
> Shadowsocks 2022. At the time, I intentionally left replay protection
> out of swgp-go, because I thought WireGuard wouldn't need it.
>=20
> Thanks to your work, I now understand that this assumption was wrong!
> So I added it into swgp-go:
> https://github.com/database64128/swgp-go/commit/207a055ab0a1058579f299fc1=
021cc64c95b21db
>=20
> The new "zero-overhead-2026" and "paranoid-2026" modes provide replay
> protection for handshake packets. Replayed packets are dropped by
> checking the nonce and an encrypted unix epoch timestamp, similar to
> how Shadowsocks 2022's TCP construction does it.
>=20
> This won't address the "DoSer" scenario, but should provide enough
> protection against censors without knowledge of the OBFSK.

I sent the previous email a few days ago, and it never showed up on the
mailing list archive, probably due to all that PGP signing stuff I
didn't turn off. Let's see if this one works.
