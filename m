Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D62C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 May 2022 23:31:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c5c539f9;
	Fri, 13 May 2022 23:31:29 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7a74044a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 May 2022 20:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXbOYZ9qwbnf3hPchDDjJWJZAV2Ngow6QCl0G54qXgXrF2ebQxkiMz0lrDwL85eYVE4uziRhuYdyiiFYVq9KNuqShdo4UqGQhIuZbqqAx9a39HGfkPBg/VhvELczvsBLHqwx1/djP0jDAWEBOWqxNfcZNUO43F6q6WadDP3Hg0frCbu/p+AIUWScllckoNI1o0HFgmvCN1o+qR4H9IlWMCW7gXiooLWqh+Ltpcjy+/n1ClrrQXP74GtIzla45Hm+MzrU+XUwElTqIjLJBp/oD7wjENG0yDbM0VuB7PPjUANMJipSrjVR4Z/rb+jPmQ1eqBgBnw/VlOe8PJHd6QJHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyQec/50jpSkjgiLSGVtR7vdbtnXZwXBUtTGVQyxxlk=;
 b=ay+QksYM7Q8Yh6SJarZOL0H2hYMMLasUEYfmuKmW/P8COLv0ZzuRiz7IV8hsgL/T1B1FosQ3s93tqumpgFib7hB4xc4GwOf3aJcgMBALadAPkmBxaClOebiR6zgbb2RSNwdp7BjH3kCEfhT5P5atu31aRYkVRiaqpTjUEHfAdau8HP7v+SJZSMY5lJFr1qqTjD6GqREzZ+LewcbLrfwnDSKDhdjMgki52JEzHeI2XytTRbnsSh5RJa3qBPMnJLD6MRaqFIxuZ3Ln35IFc8tXmfTUwzGtUZbZrL0yj09qobELFP/RDwesmGlmcMTZDqmajPGQKKq+oLxc/QzHARDLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=limelogic.be; dmarc=pass action=none header.from=limelogic.be;
 dkim=pass header.d=limelogic.be; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=limelogic.be;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyQec/50jpSkjgiLSGVtR7vdbtnXZwXBUtTGVQyxxlk=;
 b=KmOxWghnGckTCSBOqVjTktlbER2O3h0cPLjoX45Jzlzz1d65+CGgJdO5zlFT4ISR1Bme0uqbLAbgc+Pooyd0prrEfAaU5xEPdQXFhY5p8tDZzI2sk9q+5ADJohSyXNb23Kop0DR21pOgzu2fYLtW+DYa8zf/n9YOxk8K5mDMlcI=
Received: from AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6)
 by DB8PR04MB6410.eurprd04.prod.outlook.com (2603:10a6:10:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 20:04:32 +0000
Received: from AS1PR04MB9560.eurprd04.prod.outlook.com
 ([fe80::4d23:9058:69f0:3452]) by AS1PR04MB9560.eurprd04.prod.outlook.com
 ([fe80::4d23:9058:69f0:3452%6]) with mapi id 15.20.5186.021; Thu, 5 May 2022
 20:04:32 +0000
From: Eric Granados <Eric.Granados@limelogic.be>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard 0.5.3 on Windows - Huge performance issue when no network
 connection is up
Thread-Topic: Wireguard 0.5.3 on Windows - Huge performance issue when no
 network connection is up
Thread-Index: Adhgt+bh4vbb6XMFQZOFvrtRZQH73Q==
Date: Thu, 5 May 2022 20:04:32 +0000
Message-ID: <AS1PR04MB9560B0C367200847FBD20A2B80C29@AS1PR04MB9560.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=limelogic.be;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4be87ad-e5de-4564-249c-08da2ed2789a
x-ms-traffictypediagnostic: DB8PR04MB6410:EE_
x-microsoft-antispam-prvs: <DB8PR04MB6410B22DA22B788929AF7CDA80C29@DB8PR04MB6410.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nrUFP+puFU2eHrSkD4ERBJnvSd1SpIPfCqSDDsaWHb4SvzvSMjTJSq4U0A36LDoPGN1FwspChyweJBRwEs3M4HAHynNLJ2ZEKo58Ac2MNMotTfGkLDS+XRvHl/3qZJQBpKXXah4CpaA0ewntgmaV3o2blnbxy66xS5DieZOCHeY9SGGjjOipw49l5AEK+BHVGLyQY9SioxPQGVwNeowwqtwYN2i3ErmpaEtRePqqe7su6ymbBtYtRLERPb6jJoal2WblGH0lffAKQ5thm2y+wmI+6V6LXLHUSLzDnGgh/zNzvo1r6YmYHxsUxNYNZxdvlM1Te/3KelLUfmOaJkJPL6+ZLH1O0FXUkEmXjB8/pSL2EGmGZzdFoTv6Eq6FGL5qsaUs0HP07RNAwCQfg/81VRXDNqoz/tJOSzV1rkPUN6IUZ7/Myak9rSnABF6eJB4S3qJV6NwZQNMU4s+xBSBXako5z1JNXOqNFBKfzSaBhEk5RbtRQD4WjzOOhajupzYoEKebBwibOYJ5tL3TE8479zgniWUxcmA+YYO1DO2rWifeRRmqDXJ2vN5Qy9mt4cr+0udZtwvnhs40VtwWkKNNl2go9ZBhonRiETAr7Y5X0N5fuoyP/k2WTXI+8vQqP1BvNM0x+1tzzQ12drVwu4jsul+yJyyd8oW9umxhPA8TDParXT+aAMlJhr6eA8ugDP1MJGzhSCQPZFf4NHbsTx0xmEAPqjWYWPZdjBoH5X2HrFw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1PR04MB9560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(316002)(38070700005)(66476007)(38100700002)(86362001)(66446008)(64756008)(8676002)(66556008)(66574015)(122000001)(83380400001)(26005)(5660300002)(6506007)(66946007)(76116006)(7696005)(186003)(52536014)(71200400001)(55016003)(33656002)(6916009)(508600001)(8936002)(2906002)(14583001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Rk4Mzw92Sh0dU6Hxm6MjFHFb5Par8eWTOCvPQi2jS4hBi4OwcOaMjLVYRu1M?=
 =?us-ascii?Q?uoJGKX7OgOaESBJwVXhaFnHBoSST+ySDu/CHGiTEMm4z/9gyIMxUzoRiLo+W?=
 =?us-ascii?Q?ItgiKSUyXbMAE47Cg+JrwFxvNwQDgDW1LV6FW0/Ul8jDwGhwrMMY/QrvkdZQ?=
 =?us-ascii?Q?Tfgpwtfrm/0RHhRfWbsI2xo93ekoDxiVQndwAlsyIa1RtznQ7zTwjW3tWIm7?=
 =?us-ascii?Q?9pMVUAqZbjWBX0OQuU4SXsu9Ealis3dTCWYZphDekXQdRYhjCjYF8kakMb18?=
 =?us-ascii?Q?Wpk3nAsMawhXvt0YhGCk7CGNzLB4khQV2HLKDiriGCnUYMJ0XKMe8d2Sg2w9?=
 =?us-ascii?Q?2ybE32dkHh1qel94Za3sxUCpFwns3Qw9AvbgGQQanxRCw/QScgecQ8dsfFB8?=
 =?us-ascii?Q?1NrwwwSjDeq3BCcw5ojT+gVQn4IGLFKb093Jq4E4++5B8MbE3t/wFmuzCmwf?=
 =?us-ascii?Q?J1lCFaDZ/RFhF/2WblEN3dBuYzfIddIZBHv5/lyRadjY8VPbRUpNTNjjC/5o?=
 =?us-ascii?Q?zoStjtXHnMLaZXYZ3XttFHdL0q+3PkcL7cuTXBkAAZAaWGR3INYXuAkkGboj?=
 =?us-ascii?Q?nAddpD64Igy2FWJs77sJkCjIsn4Bo6KlqKaUYCArZXxXOq4OZRGxZo1SLd5u?=
 =?us-ascii?Q?M7+6MTffUMbZo90wmLgTBJ/UgYR/uND9GP7yPWPG/3Kd7eve/hfFHAAAXc5O?=
 =?us-ascii?Q?oBeUhYCHQASZvy8v0kpaBaCHcAL9wg8+GBxOzHC8dAJ9B3JRD2iemU25bAqF?=
 =?us-ascii?Q?liElrR/AMiuz/35CoOlSOM/QwbLK82kf6aZiTi2TPTHfg9M8KDdXgwLLNubk?=
 =?us-ascii?Q?/pa1PfyMbm/SpoaIkDa+B31PNy+N9blOG4DuwNoNzayu8kbyovFz6IHWuFsg?=
 =?us-ascii?Q?cps3xf6QruKRYUkyxhYQuItO1TPBc/K4VSfwIL+eNf7jEIL31XCTpe/2FKmo?=
 =?us-ascii?Q?+3FR2hZPZNgAiwzrxdO1xKKDwI8Y4MNK5dTKVq88iSP8wvtCjxr71Q+UR4vm?=
 =?us-ascii?Q?pFPMRpbZKGltB78KcGOuzrzNWhjHk65kT4nB+UMa62ncTj1o1xgQzOAQWahZ?=
 =?us-ascii?Q?iLYiajbDuWVM7uayu92B7ZWKaVkRjua1aBsR/rONS7DKI6UsokNrL1xOPPMn?=
 =?us-ascii?Q?ibGN0FWMsV2nx81fh6yuP+gIRu4bTXJ7qCzOe2pYpkqcmgUcvyUYng52XKkU?=
 =?us-ascii?Q?7x9qX1mJUACjYoJ6yE208i3jsbvMtGkl/QUqKccXovmyJV/vTrp4WpC5c4RT?=
 =?us-ascii?Q?eDy91A0dBufedtSbqZIAiKEF7qTx8bCJq+mr1bdOVd3sELOBZmIUMcQaMWUo?=
 =?us-ascii?Q?03Pg6G0qtsT/+XsZSD2IFIu/4FacpusyVUAHZMdVIsUZibAKVWcVCOtJjW2e?=
 =?us-ascii?Q?Jig5DI9c6r+j9gwIFuTAmyvJANZSl50dUD1INHuopgY4PzaMrwCMGPi4bvLh?=
 =?us-ascii?Q?ybdWFoCaCEUZJX0jWJ+fry7YW23jiF1PIbdBKeckvdSR5Lx7Gcnilf2quv2X?=
 =?us-ascii?Q?O9LlaiI/wcKGpxBG5ocwyiKvOC9BnxXJwyIUtc5UiWCnD5VFLJKdD8SEiMd0?=
 =?us-ascii?Q?6+6xCIH5D7rP6GDcOTjbVp7oRVPVjsGprbon/4ukn+c7VVHZzZHqK6I90LK7?=
 =?us-ascii?Q?d9333RvHDAYigaSMwF6uzdQixeeUg9RlOfrjuZDpDtBi442iAQ+j/AmSVwU9?=
 =?us-ascii?Q?gbbY4vtdGn/cnCmbutp26Sb20BQsfztRHrqjaF5KVkkxx/CXsZzMIxm9uuK7?=
 =?us-ascii?Q?vB5FISg/8ifZOkd0ygpUIVRC7rqX3f0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: limelogic.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4be87ad-e5de-4564-249c-08da2ed2789a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 20:04:32.7411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 735b4743-524a-407e-af89-10126b75f6cb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56R74lAH8Jz3pRFuLy08Kl8sd2MczORVhTHzUEhguHFZrfq1WCYzcZm/rPH02ZBUeZv/VDqLugnwLgqqgvHIW0hBNG1wP4k9AHXU/aCsi6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6410
X-Mailman-Approved-At: Fri, 13 May 2022 23:31:24 +0000
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

Hi Folks,

Having this issue in corporate environments, that I can reproduce at will. =
The scenario is as follows:
* Wireguard installed and properly configured
* Boot the computer with NO physical network connection active
* Open an Office document stored locally on the computer : takes between 15=
 seconds and up to 4 minutes
* As soon as a physical network adapter comes up, even for a few seconds, t=
he problem disappears and the same document opens in 1-2 seconds. The compu=
ter does *not* need to have internet access : "Upping" network card is enou=
gh.
* Once an adapter has been up, I can put it down again and the problem won'=
t appear again, until next computer reboot.
* If, instead of "upping" an adapter, I unbind Tcp/Ip from the Wireguard ad=
apter, the problem disappears; and reappears as soon as I bind again Tcp/Ip=
. Which is imho proof that Wireguard is causing this behaviour.

Of course I guess that the "root cause" is actually Ms-Office, probably try=
ing to reach something it can't reach (even though the document is local...=
) and waiting for a timeout. That would make sense, since in a way the Wire=
guard interface is "always up", Office probably "believes" that there is a =
network available. However, I sniffed the Wireguard adapter in this scenari=
o, and Wireshark only shows DNS requests being sent (which, of course, rece=
ive no answer).

In my case it is a big issue, because I have users who are trainers and, wh=
en they go to a customer site to give their trainings, they very often won'=
t have any network connection provided by their customer, and in many cases=
 are in locations where there is no mobile phone signal so they can't even =
share their mobile connection.

Right now, the ugly workaround I have found is the following :
* A scheduled task runs at computer startup, and disables the Wireguard Tcp=
/Ip binding
* Another scheduled task is triggered when the NCSI (Network Connectivity S=
tatus Indicator) event 4042 is fired, which happens when a physical network=
 adapter comes up, that re-enables the Tcp/Ip binding.

But it is indeed an ugly workaround, so I'm posting here in the hope that :
* Someone can look into this (I am no developer so totally unable to look a=
t the code)
* If not, at least hoping that my current workaround can be helpful to othe=
rs who may encounter the same issue.

I have a gut feeling that, due to the very nature of Wireguard ("always up"=
), there is no "structural" solution to this, but any suggestion is welcome=
.

Sorry for the long post but I could not find a shorter way to describe the =
issue accurately !
