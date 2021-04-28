Return-Path: <SRS0=Dn24=J2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6671C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Apr 2021 01:58:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D9C61419
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Apr 2021 01:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D9C61419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=limelogic.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c9cf27d;
	Thu, 29 Apr 2021 01:56:14 +0000 (UTC)
Received: from mail.calldesk.be (mail.calldesk.be [212.166.55.180])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 038fa30b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Apr 2021 15:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.calldesk.be (Postfix) with ESMTP id 0E84D600BF
 for <wireguard@lists.zx2c4.com>; Wed, 28 Apr 2021 17:24:22 +0200 (CEST)
Received: from mail.calldesk.be ([127.0.0.1])
 by localhost (pan.limelogic.be [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ppXpWjPg2MMZ for <wireguard@lists.zx2c4.com>;
 Wed, 28 Apr 2021 17:24:22 +0200 (CEST)
Received: from flouff.lpl.grp (flouff.lpl.grp [10.74.1.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.calldesk.be (Postfix) with ESMTPS id 010C1600AF
 for <wireguard@lists.zx2c4.com>; Wed, 28 Apr 2021 17:24:22 +0200 (CEST)
Received: from flouff.lpl.grp (10.74.1.15) by flouff.lpl.grp (10.74.1.15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 28 Apr
 2021 17:24:21 +0200
Received: from flouff.lpl.grp ([fe80::84ec:c7b4:b019:55f6]) by flouff.lpl.grp
 ([fe80::84ec:c7b4:b019:55f6%3]) with mapi id 15.01.2176.012;
 Wed, 28 Apr 2021 17:24:21 +0200
From: Jean Cardona <Jean.Cardona@limelogic.be>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard for windows: routes are added even if remote server not
 reachable
Thread-Topic: Wireguard for windows: routes are added even if remote server
 not reachable
Thread-Index: Adc8QcCRil4z7PJeRqGJr4CUongBjA==
Date: Wed, 28 Apr 2021 15:24:21 +0000
Message-ID: <eaf535ec1f0c48649e1a24878e0c18e1@limelogic.be>
Accept-Language: fr-FR, fr-BE, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.195.200]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Apr 2021 01:56:13 +0000
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

Hello,=20

When wireguard on windows cannot reach the server, it still sets up the rou=
tes defined in allowedIPs, with a very large priority because the windows w=
ireguard virtual interface is configured as a 100GB interface.
This is an issue for us, because when one of our user is in the office, the=
 VPN cannot connect but windows still tries to use it to reach some interna=
l subnets and those subnets are thus unreachable.

Is there a way to remove the routes if the VPN cannot come up?

Best regards,=20

--=20
Jean Cardona

