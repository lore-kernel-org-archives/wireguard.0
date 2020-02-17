Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768BEC35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC33217F4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walker.earth header.i=@walker.earth header.b="TGimhcLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC33217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=walker.earth
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f95dd91;
	Sun, 23 Feb 2020 10:27:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ff78091
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 15:42:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70137.outbound.protection.outlook.com [40.107.7.137])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b3c8ab3
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 15:42:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZsTT+W5TE1ylpQavKaaEtQ+e/BCZE6VMIi24N3WTPbXh7jQ8MDJnBc//cbKdQqNizbblYu8nalk6I/jW5NywqyyohB3A+K8VJ8QqyntJib4jGS4e5j5JwYqM+DnSgB7c060dyPkrewyvFeTZ/JiCKs5o8Ylwlg4uR21/zVObbxTwJ+r1stLT98HiGCQNjjFUy4mCBhrqh0WCAIG+EDm7FIZ7rchqsVJYkWQGw73+FZstFW1fqlRyH3EH/zDZ15uNxeUFtz9/7iYt6Is8Ko3DCd/gnaE+HlNYzcUsLMmOUges+3TN47b+iuYDSnvj3KlmtspAFwUrqOQyHTQv0LMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jOkmU1VKU90j7tJL9QZOpY/SN6mh/qRgvW9yi+8MD4=;
 b=SKm8O+l5rMnEKzYnXxOJ6xhB3W/dPoDiVppXdd12db2MBRnKCEOwaB+yMLlNZ5I8R3OH+zoLKCEvMN7wYHqzAsfFzQho1vJWfBq9MIZk7hdlowiFOmnKJvvUahQb8Oyz5wYi0/LHv+ywGCNAvOGaY9UWxcWkQyaBciQE4DGH8Lpxf/qHkevIb3bNWorx2X/uv1IKfsANqBzkklNXhJoLnw9u4pQm4jc5iN3cU/r6NBZxPDxJ35r3PpT6arfBY+7xLVzg66xcqmpog+h0iFl/Ft2l1J106J2snGX/DAU9NqlqyuJR9ILKj0E9h2gn5d6CrFxt1nSTUqGyWW7pAmF9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=walker.earth; dmarc=pass action=none header.from=walker.earth;
 dkim=pass header.d=walker.earth; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walker.earth;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jOkmU1VKU90j7tJL9QZOpY/SN6mh/qRgvW9yi+8MD4=;
 b=TGimhcLHbdXqX1eQsLaR/SL/HQWkH6hUiUbES0s9fvRU9sOUfbrTbKB4AFHrykdfMmOnYjsbc+d1AJewVlv/HWUk8WQZcG83OLdIx2o6AVZwTN48WUmNO1Rqy6wPGRoe7d7wonyUGjr4UGvda/4WMJkQLK3IFvDWOYi1zuFP4Ao=
Received: from AM0PR03MB4354.eurprd03.prod.outlook.com (20.177.41.143) by
 AM0PR03MB4948.eurprd03.prod.outlook.com (20.178.22.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 15:44:59 +0000
Received: from AM0PR03MB4354.eurprd03.prod.outlook.com
 ([fe80::4538:1377:1440:9ae6]) by AM0PR03MB4354.eurprd03.prod.outlook.com
 ([fe80::4538:1377:1440:9ae6%6]) with mapi id 15.20.2729.025; Mon, 17 Feb 2020
 15:44:59 +0000
From: Maurice Walker <maurice@walker.earth>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
Thread-Topic: Re: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
Thread-Index: AdXlqSa7/FVTTgFITMCEUaPlYnxqoA==
Date: Mon, 17 Feb 2020 15:44:59 +0000
Message-ID: <AM0PR03MB4354F7720F30995B3615664DDC160@AM0PR03MB4354.eurprd03.prod.outlook.com>
Accept-Language: en-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maurice@walker.earth; 
x-originating-ip: [2a02:8071:31be:6201:5595:ca4b:476b:1cb6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7728216-18c4-4cd3-c050-08d7b3c05897
x-ms-traffictypediagnostic: AM0PR03MB4948:
x-microsoft-antispam-prvs: <AM0PR03MB4948791256981FB5E84C1FF5DC160@AM0PR03MB4948.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39830400003)(376002)(346002)(366004)(136003)(199004)(189003)(5660300002)(8936002)(2906002)(316002)(8676002)(81156014)(52536014)(4744005)(81166006)(71200400001)(7696005)(508600001)(6506007)(6916009)(55016002)(33656002)(66946007)(66446008)(66476007)(53546011)(66556008)(64756008)(86362001)(76116006)(186003)(9686003)(46492005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR03MB4948;
 H:AM0PR03MB4354.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: walker.earth does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RejRHlBz7zOftNWrZJ6RRAq8FQqVRQf0ERZrVzmvTvYyO1pjioE+iTnUDi04tVmTsLKG1uFDVBj6sAbA75Qd40eq9NBfTI7h8sbqMtQrM/8E0o6FR54Bvv+jQsEoxEE3kMBSsTgjhj7NIQfYPG+Em1Q3sbRNTsOwzv1Ociic2/xIMTr1gGR4cg3Xz11bdAO4qmSTLUNEBGp5cAwzhNNs4aHKvEjQoeEtaoZ618LRmZLlKQDWgYLWjpyS4NxEhb8YcplENRZwHZ4FQw/0LyA6AWCqBtGQnPuIKZp5LEKC7jrkziIibrmxUTnXE4MiCe9TOP5zRW50HqA0T2xvpr9D8HDKQliFxbM7oVfYsxLvUAP5ZAW93+qQy4iHqEXIzjWzsja1jCnslRoys+js3Xv2eyM/U+fSxsbP2IYsZ+kPoOjA1kAByDKHA3iHUP7VYfe+ihy64xaBXl8/2cK+To9PAePlTVOUbTbne8AxbkkVYpY0gIucsafSCR9FPONp4084
x-ms-exchange-antispam-messagedata: KSn0hBAuXWcJVAZ2+ipKF6/dXe4NuibLLMRkDd4IjvVjyjjHyPc6p7dFvV92py4DXUuVumUrbxdlCgt8tdrEVOLfX3UV3EEBnx6Pkm02W/EVK0kZuGxuXs3aSBN54XjfAvwQ0TYt7nLLCAd9w/NozD7U4zqm0oQeZoHm87ZMla2DhxTs/V5gLNgoFPW2JQaGB4/l8G0RhUKmNTRG7NDp1A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: walker.earth
X-MS-Exchange-CrossTenant-Network-Message-Id: b7728216-18c4-4cd3-c050-08d7b3c05897
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 15:44:59.6068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0547d8f4-2a6b-4582-bed6-f413072064c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DzXpVn3MYTe1jWcSAjZTkSUaRpZRg3VAQ+u2rGDPoF6w00Pi7dApmizjWJ7r68/XQ7EtD4Mz1PaBxeLzEkawA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4948
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

On Thu, Jan 2, 2020 at 09:40:53 CET, Siyuan Ren <netheril96@gmail.com> wrote:
> I am using WireGuard on my iPhone, and the endpoint is specified by a
> domain name that has both AAAA and A record. When I turn on WireGuard
> in a network with dual IPv6 and IPv4, I find out that WireGuard
> chooses IPv4 by executing "wg" on my server. If I explicitly set the
> endpoint as IPv6 address, WireGuard works just fine, so it is not a
> misconfiguration on my server.

The Android (v0.0.20200206) and Windows (v0.0.38) clients have the same bug.
This might be considered just bad behavior in dual-stack networks, but it
causes real issues in IPv6-only networks:
On Android, WireGuard uses IPv4 via 464XLAT (if available). This works, but
can result in decreased performance.
Windows doesn't have a CLAT [1], but WireGuard tries to use IPv4 anyway. This
results in the tunnel not working at all.

Cheers,
Maurice

[1] Well, it does, but only on mobile data, not on WiFi or Ethernet.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
