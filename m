Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E55C35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4FF214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walker.earth header.i=@walker.earth header.b="iPYJsCt3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4FF214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=walker.earth
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7ddaa32;
	Sun, 23 Feb 2020 10:27:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cd58055
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 21:21:46 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10108.outbound.protection.outlook.com [40.107.1.108])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d08fa04
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 21:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiXlMgWT0KzDZnaFMTFr8BH54uhJICRMYrM4u0rYB+hIpo3ZRd54pqC6uNSi1PLwFDiReD+rZJOPKbCmnsiwvy6zzSa3Vn54n2XwEOv5xN1KitDy38bygHn0IgSebzYv+uWKzDkUedk4PJPMCrxxJvTN5iEcBrKgXPu5b9vAOUjAONOoty6WOAGO70Rt6YbyaP7D3c5q/hGyJQGsjLT6qAuGN2ZWBy3N/EAXxwhOIlseNnawyxTKmvxLsoZou2d0WwK5BsiieE1PobzC9YlciXLrERJ4rtEzgsbVM1nA3jDQOWX7o6vl8qTsWcYfj+8KAUK71gGT+8SCnwTs09R2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRq+OAk1+Bt/zcS4ksm7J98HifYw9QZnMR4btUtTlQk=;
 b=DI2oeB33qyClhOPfaBZVVE71inRk5cYzixrJVfVIrLl30VvHXlO2+jYIN8GAh5schstifutSkXPsiTKB0wBh6ox1lfqotLrCjqxtiybyYpVbiJLvGff4GfVTwYow+24tPldDs3UCxikpOuF0WRMIhNrEwYFeX/J2QHaW077lM4PdywjOBRvUiLZUpZjfusM93lYM2Jkf1DTEmjE9UaiLEZNvMGhszrABLeP5YLG2UjuUXhUOX2+mlrxcaW+XxtpQuPfwk9tdjivj980Y7/oc3IKyY4iojofIclvDnHp3obRFc6SjbdqUmCJxbtaKvHEv3/xDYsW8KQ0cRvHpUpODWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=walker.earth; dmarc=pass action=none header.from=walker.earth;
 dkim=pass header.d=walker.earth; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walker.earth;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRq+OAk1+Bt/zcS4ksm7J98HifYw9QZnMR4btUtTlQk=;
 b=iPYJsCt3qkaP9cdwQ2S2/O7bar1lmVoT9aDv+mMTm8WO+IHER+JCuAEVr9uPjh9TBWsd+gaq6fkoX9J9lM9Cz4TdtKw5JRZDYRBMP0dkwBaKE0I8jV+zxIkde5S/jEs2rVQ9LLWKEn/hFJ+f2zBL8uA9q2LY6716i2O7C9EAKmQ=
Received: from AM0PR03MB4354.eurprd03.prod.outlook.com (20.177.41.143) by
 AM0PR03MB5555.eurprd03.prod.outlook.com (20.179.253.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Thu, 20 Feb 2020 21:24:40 +0000
Received: from AM0PR03MB4354.eurprd03.prod.outlook.com
 ([fe80::4538:1377:1440:9ae6]) by AM0PR03MB4354.eurprd03.prod.outlook.com
 ([fe80::4538:1377:1440:9ae6%6]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 21:24:39 +0000
From: Maurice Walker <maurice@walker.earth>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
Thread-Topic: Re: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
Thread-Index: AdXoM3Wrf588CMRySJyo0UGoNWd5OQ==
Date: Thu, 20 Feb 2020 21:24:39 +0000
Message-ID: <AM0PR03MB435443830772BAE642BAF934DC130@AM0PR03MB4354.eurprd03.prod.outlook.com>
Accept-Language: en-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maurice@walker.earth; 
x-originating-ip: [2a02:8071:31be:6201:6c38:3fc0:d8cf:5386]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2fc1b51-6b54-4958-42ee-08d7b64b4b46
x-ms-traffictypediagnostic: AM0PR03MB5555:
x-microsoft-antispam-prvs: <AM0PR03MB55552BE918A19C1BDBA47395DC130@AM0PR03MB5555.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39830400003)(376002)(346002)(366004)(189003)(199004)(8936002)(7696005)(81166006)(52536014)(8676002)(71200400001)(186003)(81156014)(6916009)(55016002)(9686003)(4744005)(53546011)(5660300002)(316002)(64756008)(66946007)(66476007)(508600001)(66556008)(2906002)(33656002)(86362001)(76116006)(66446008)(6506007)(46492005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR03MB5555;
 H:AM0PR03MB4354.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: walker.earth does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pTZsWjqeqKuCC618dhmfqFjsFQWbHk2eQobeFP6e8AoCYojOmZcHJOCCHLPQDM/AVH1EAl72YxabXO7or/vTZ2kCU/3R4KSP5BHsouBFGGTtuYptLtA6tlvM6KTSaKQBiqbB2uImfnzLqOod1g1xLH6lq1H9ymXuEu68oQve2WP6/Hupna9VH5R8WHCYQ/+5BL5/pMh4dPF3krSbIXPtipya/DukHxbWoCrfhwrMBHNNPF1UoKsxZJvGQnF+Vyr7dPWiB5FRA4g5XYFiB/ZRHrGPv2YuzAZEOadCNTheP2fim6HN2hwqeSJq5PrH4twPEvY9ou3efquJQaQiGDC8oWL4Rg4qavNh5P1TMJWI0WPWScWBlwOzxpHYBcVehQ65qHj8940qg2BsOrlsh6pC9I/vd0nsJ5mTU875oQIAtyAP2RM/Nu7XoVSCXumJx/unsAI3M3JUUmnTMSgwgM7SoWXSDUmivj3yLRaF+G3ez8gsTznCFqvMjOT8HVC8LiAO
x-ms-exchange-antispam-messagedata: qJc0NHn2FfqjwaZ/sUrVmccT9SHazKzQLGrBZi2lx47BYS1JWMLZ6j2I/B9b5aUthKvUEe+aUlgiItgutJ2JhJdrHyK1H3FMAIJS83oQld2G9vLq9UHv3SmhARYSwWTTQPK+K4eEck+uJMInhc12X1eQXA9m5u6KhkTMWaqblF/UhiQcTGf76/L5j/FBMrdy5Bz45ELoZycSrelpEz7AOw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: walker.earth
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fc1b51-6b54-4958-42ee-08d7b64b4b46
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 21:24:39.6053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0547d8f4-2a6b-4582-bed6-f413072064c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agv006CWusBdGhBj/FhUJ3628lFQz89LTIjQlBQq028+EKYymWoWI8ZuJThbYEiRKFXwMN+xkZVVeb6w/YQWgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5555
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

On Thu, Jan 2, 2020 at 09:40:53 CET, Siyuan Ren <netheril96@gmail.com> wrote:
> I am using WireGuard on my iPhone, and the endpoint is specified by a
> domain name that has both AAAA and A record. When I turn on WireGuard
> in a network with dual IPv6 and IPv4, I find out that WireGuard
> chooses IPv4 by executing "wg" on my server. If I explicitly set the
> endpoint as IPv6 address, WireGuard works just fine, so it is not a
> misconfiguration on my server.

The Android (v0.0.20200206) and Windows (v0.0.38) clients have the same bug.

This causes severe issues in IPv6-only networks:
On Android, WireGuard uses IPv4 via 464XLAT (if available). This works, but
can result in decreased performance.
Windows doesn't have a CLAT [1], but WireGuard tries to use IPv4 anyway. This
results in the tunnel not working at all.

Can someone confirm this? Is there a better place to report it?

Cheers,
Maurice

[1] Well, it does, but only on mobile data, not on WiFi or Ethernet.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
