Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD549C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 778A46056B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 778A46056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shahaya.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b770373;
	Sun, 8 Aug 2021 22:57:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 20602b1f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 06:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLrJFuxSRyIlYa422lfZhU2FjEmiyZwPNUZ3SfLzYczV0o6tbrJM3V7nKQlkvd3HFNMCqQ4crxdUum7G53j9PK3PwKaa0AeOAkdeyewr6jM/FjVWZeHZa+LSAq/EvfnoWsVvHt9TyAc/2fEobJqROZ0FoYGhsnnW/t3B86r1V1yUyBRpzss5Q/amyhIAcN4NAmWz6MD8F8ViQNFxrRE/+PqSWRhEmvdS2RknECw5rCKgMGO/wEwexRZox1ZoPmKBgoCTSVLMYePAMmVa8ojYEI/vrQa6dwVjPoZ82KVfK1Nno+XSIQYTbfsvRRXG7cGqS3OmSCtPP9x1lgiEAKpbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VD0vIMlx8KdTqMeDdXhVq0tjvanLkrClsNeXDqbTrY=;
 b=j9E/X0gCe9BTTqYmqZneWvkNdROnHMQk5Sd2KHE0QJwbod8C4+3kvVW/BenJOxPoL8sepi6/pFLZCgiHEAF/Sx1Zrm/Oxe+aQq/kJQLsLFsZdU4DCiTOlMzBbMIbDdEM7EmZfjNek/eLQJJKrFtqtNnmwvo9c6HI+UEBr2fXdVdfIfXFgy8FCRjtKp5ZeYsd5o1L5HJXL7HjKcpZ/xfL57mkeLxrT0g3Rp8qVUhMMr4V+qHRy8iWXzKwIHQ46d69+FuIfF9BWAKXs4UDrgiHAcwcYkGNC4pMulMcAH7YI1bLxBJqIfVh227471qdo8rRYverYtkbQAxN3dMWU7Pb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=shahaya.com; dmarc=pass action=none header.from=shahaya.com;
 dkim=pass header.d=shahaya.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kideray.onmicrosoft.com; s=selector2-kideray-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VD0vIMlx8KdTqMeDdXhVq0tjvanLkrClsNeXDqbTrY=;
 b=ahM8tyteELcoPm6EKWRn6Byt+9UyDVb4Ss7XgkMALlgn1HV/U1Pkh5gGXk47Cq/5pe9yg5RZyfKNRlgNmcuS596ypuBVXcmZ3C6xgRfL1fwNKQTp9JLdjOq0OTWc+BUIWzM4jdzxkzq0cOpQy5Vd7BXOQMxgW1fJXQoPtDzdhts=
Received: from DB7PR09MB2460.eurprd09.prod.outlook.com (2603:10a6:10:27::18)
 by DB8PR09MB4012.eurprd09.prod.outlook.com (2603:10a6:10:129::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 06:18:00 +0000
Received: from DB7PR09MB2460.eurprd09.prod.outlook.com
 ([fe80::f19f:266c:416f:7e41]) by DB7PR09MB2460.eurprd09.prod.outlook.com
 ([fe80::f19f:266c:416f:7e41%4]) with mapi id 15.20.4242.023; Tue, 6 Jul 2021
 06:18:00 +0000
From: Denis Brodbeck <denis@shahaya.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: wireguard-windows: client forgets after restart that there was a
 activated tunnel before and won't activate said tunnel anymore
Thread-Topic: wireguard-windows: client forgets after restart that there was a
 activated tunnel before and won't activate said tunnel anymore
Thread-Index: AQHXci6dYBM0LevpaUyA+8WGVTOCRA==
Date: Tue, 6 Jul 2021 06:18:00 +0000
Message-ID: <DB7PR09MB24606350B108C7CB8DA140BFAB1B9@DB7PR09MB2460.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=shahaya.com;
x-originating-ip: [2a02:8070:8892:9300:1531:9a66:300e:aade]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4450f66d-37a7-433a-1a89-08d94045cdf6
x-ms-traffictypediagnostic: DB8PR09MB4012:
x-microsoft-antispam-prvs: <DB8PR09MB4012923AE8558674E370C43EAB1B9@DB8PR09MB4012.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/TGhi0uT+cNiV2SlPD3lPR3W0F9pSeB25yyHAZQRTkYkbetoiFOsiwu4f2FjW61C9TsCQvqq26sP59bt/V0PVSy+FLlh503MY9ab+dW5BzEwSIvcUmUk6bUCAH2X0H5KodKxcWa5OF4Knq9oxDblyziCx2UvWOiklEffz/R2D422trqaZPnkyawQPd6+L+UVYm6oTVaQaq3l9PqC5DGZwvCrKl30PALKZqrQ01GU4tFlbZAyqIKswECAIXz/SBD0IuCax55xxM61AzEtabMXWn5PvGCpnhXqX2q1qhfVdm/IbXoL3Ud+S99/jAjLo/YAF7ThsP5cCfbGBviR4kXsV2FeCC2iuQzuUTxs6dwdpbozr4HuDGaGhoZKy1Fc/SvUy/Ya+UlflSw+Lvrgm1C8yUiwwgdMNQo1RC9LEbN0U+2WUAOCtWJT9rxUfSQH0nnkeDl7jmHPuRR8J5XhFu3QWywqKpbbXoV1dfelcG1umPJLoAexCII0iIpNFONZyonoUFEVQeVwcrz0rdeZrGosfu8XWXX/5Zxs9dZPqNgiFDLB6bNpBEuvQqZD7SiOej1GodKO7jXbmbeJXQoekgGuu/ArrFRUN/gIdy8xUje02QIHIrE0v5+nrlJlfkSM4uw3OG3BDmDXEAg19u5MAcOmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR09MB2460.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39830400003)(346002)(376002)(136003)(366004)(5660300002)(8676002)(186003)(6916009)(33656002)(7696005)(71200400001)(6506007)(2906002)(66556008)(55016002)(64756008)(66476007)(66446008)(76116006)(478600001)(83380400001)(316002)(38100700002)(122000001)(52536014)(66946007)(8936002)(86362001)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vNisJFTBUMealZuvGRpDf4d3jmn12Nv7zzpTykOx0Dp/2O5sC28vjUA1Xl?=
 =?iso-8859-1?Q?0Xcdmksx4gsaiLrWuJZQrSlYw2pGqKeq0Yj/SP2LW/RaaDJgU3hHiiV3s5?=
 =?iso-8859-1?Q?PXUqsxCamaZFZYS0/FFbR9WQonkrUV2BqXkkA6DbTAT2tlZGx2Qf2g4Zm8?=
 =?iso-8859-1?Q?4MrF2Z/1e1A12g5h39ypYIMxIvsXRL5be5UXN/vY23VWzStldO326GKRYl?=
 =?iso-8859-1?Q?zjDD9mCEnKz0ns29ozpxUhSvngvj8T8T5qVtBeaB0K8w1VTg6p+w79vkUF?=
 =?iso-8859-1?Q?9OnhglCHhMNa0Lxlc9gd9FzSvlWvGQlBihtDpLHW5nuSxR1GGP+oEW/DKS?=
 =?iso-8859-1?Q?yseQPpIzFlI+9qxvWN7WuhdDB1TfGWwusLzi/yDnEM2drMXyPT/yRke09O?=
 =?iso-8859-1?Q?B+AEO4HNnbk5vH0TW30fZHaCNc0LxgPKmSwmGFhDyiHdZ1aYkW833FQX+u?=
 =?iso-8859-1?Q?BFm/w2ZUVMXESkmu5jUVs8X1NysJt+YTv2sIfvJy+WL5K5oRC68BZzR2LQ?=
 =?iso-8859-1?Q?vPwHN1NQTr+OSgELE7Muki7s9VzHDMBmS0K6y7gQKYEK2iG4UGXPsaMP7u?=
 =?iso-8859-1?Q?cr4/vtM6mDuntXh1B4yzkIqhNrc1UYVbo3Um/O6akhh5pWfJJdlh4ZtTE4?=
 =?iso-8859-1?Q?nvbLL/S3i+isth9hdE9McNoi/1DeykynuLLhA7fcAhBUjcxx6f2RXfzHN1?=
 =?iso-8859-1?Q?NInEFuZDamhFrxrwScOhywvJvEvdUtogTGbvUwLv2Xi6mbF3LZIILiKw5K?=
 =?iso-8859-1?Q?gnGWd1gQS/zoD9oWBLM7cxzqb8g6st2pG5bYVYTNGxFe/LB7hy3z0xvhFp?=
 =?iso-8859-1?Q?S66hN3f8jzQhGmvFb80rqEDTYSdfKhALS4ZmRfo6+A9yVpaFWl9PWtr1D4?=
 =?iso-8859-1?Q?0EBSeyHla5lwRid40VXK/t5l6tkem5UFe7A5HawweRRAJOVlLQVMMpXxSg?=
 =?iso-8859-1?Q?ADZhxFfh3z/TUvCA7e8F4whGUTOCGTQXzceyELzGPaRagdbKxVUOfS5Lep?=
 =?iso-8859-1?Q?0/tnT9Ha8EQBSh9pTGUblOdkWMRXPrwEcG23Ze5T9A59Zs9Gu422QQhkUr?=
 =?iso-8859-1?Q?SFSZ3ASIxbvt4vS6hN8nf5zLfRaEGWtDTp2I1Z65RWk0Q10/03rQBLvCD9?=
 =?iso-8859-1?Q?CKoiH0/myn4wR1E7zia6t29uLsC3WJcMOZz+X+/+KBw7ahj8wnCXb7369s?=
 =?iso-8859-1?Q?H6DnWu4O9uiLSX2qUh19rQNeK1V/hc7mStq4OL0j4XQfODDzTNOaTdkE6o?=
 =?iso-8859-1?Q?qA1u8CsMEeqNoW7+popPUXMWMf8sKyEC3Y+swuBR7yCtlb/ufAoOJLZPED?=
 =?iso-8859-1?Q?UCTFIImzcUeVep0hO8jPu8UMPdDhj31P2/U/nyboo7EslCrZdh2x3M0hJ1?=
 =?iso-8859-1?Q?vYhQj4fDkrZicu/mc1b2nOCewmbIlPHbIsEc5ze4RGt3cxyyalXFM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: shahaya.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR09MB2460.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4450f66d-37a7-433a-1a89-08d94045cdf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 06:18:00.0935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7352dc2f-349a-4141-b1b4-09efbb1831cc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJC/v7umkp1ykx1i2Zl3JVdO77pOTa3oCWmhCErNwdHtT0vPudS3bn35YBwqWFWY+i0eFDGjK0mA+bQixnTrug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4012
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:57:21 +0000
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

Dear WireGuard-Community,=0A=
=0A=
TL;DR: wireguard forgets after restart that there was a activated tunnel be=
fore and won't activate said tunnel anymore unless an admin intervenes=0A=
=0A=
I've deployed wireguard-windows on 50 domain-joined Windows 10 (20H1 x64) n=
otebooks (WireGuard versions range from v0.3.14 - v.03.16) and need your as=
sistance resolving some mysterious behavior.=0A=
=0A=
Some of my users are experiencing random connectivity loses (this example h=
ere is the only time I witnessed said behaviour myself):=0A=
- admin setups and activates '20_EPNBLE-04' tunnel config=0A=
- service 'WireGuardManager' runs=0A=
- service 'WireGuardTunnel$20_EPNBLE-04' runs=0A=
- everything is fine for days/weeks -- users reboot usually daily=0A=
- user reboots / comes back from weekend=0A=
- service 'WireGuardManager' runs=0A=
- service 'WireGuardTunnel$20_EPNBLE-04' does not exist=0A=
- config '20_EPNBLE-04.conf.dpapi' under 'C:\Program Files\WireGuard\Data\C=
onfigurations' still exists, it's just not active any more=0A=
- config '20_EPNBLE-04.conf.dpapi' *stays* inactive (multiple reboots), unl=
ess an admin re-activates it via WireGuard UI=0A=
=0A=
My 99% windows environment:=0A=
- users have no admin privileges=0A=
- 'LimitedOperatorUI' is disabled, so users have no privileges to mess with=
 network or wireguard config or tunnel state=0A=
- all clients have the 'Windows Baseline Security' applied=0A=
- each notebook has a unique config file (above example: 20_EPNBLE-04)=0A=
- that config has been enabled via wireguard UI (before deployment by an ad=
ministrative account) and works=0A=
- that tunnel works 99%, but sometimes, just sometimes, the tunnel service =
is gone after reboot=0A=
- I can't spot a pattern to which or when a client looses connectivity=0A=
- Most clients have no issues whatsoever, but maybe 20% of those clients ha=
d the previously described vpn tunnel loss, but until now no client had thi=
s issue twice=0A=
- WireGuard log doesn't show anything interesting, because that config file=
 is obviously inactive, and after I click 'Activate' the tunnel works insta=
ntly=0A=
=0A=
I read (parts of) the source code and tried to understand how 'WireGuardMan=
ager' keeps tabs on which of the available vpn config needs to be reestabli=
shed after reboot, but I didn't grasp the business logic yet (I'm a longtim=
e Go developer myself, so reading is usually not the issue - but maybe I ne=
ed another coffee :/).=0A=
=0A=
Hope you have some pointers on how to resolve this.=0A=
=0A=
Cheers=0A=
D. Brodbeck=
