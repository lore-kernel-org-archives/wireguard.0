Return-Path: <SRS0=u9qp=37=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA27C352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Feb 2020 13:59:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3712086A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Feb 2020 13:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=inuits.eu header.i=@inuits.eu header.b="IDkzW6+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3712086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=inuits.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c7ec44c;
	Tue, 11 Feb 2020 13:57:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d546ca89
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 13:57:31 +0000 (UTC)
Received: from zimbra88.inuits.eu (zimbra88.inuits.eu [176.31.37.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bed63f1
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 13:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra88.inuits.eu (Postfix) with ESMTP id 529407C07AD;
 Tue, 11 Feb 2020 14:59:13 +0100 (CET)
Received: from zimbra88.inuits.eu ([127.0.0.1])
 by localhost (zimbra88.inuits.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id EayPZYr4DlSg; Tue, 11 Feb 2020 14:59:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra88.inuits.eu (Postfix) with ESMTP id B138D7C07DD;
 Tue, 11 Feb 2020 14:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra88.inuits.eu B138D7C07DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inuits.eu;
 s=E845565C-8838-11E9-A43F-52B5C8A0861E; t=1581429551;
 bh=ywEh4alKK2N6EmCcmalFA4Wwv/A8eNBaxfD4KgdmTqs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=IDkzW6+CsbJMWCiu9hTLut63f8ORrdZjMpj15h19k2A2+fhqDyICAy3U24shWkfoT
 GX4FkNgCx4+vVsZkW118TORQ9KNEtsNrn5cPV7hfLywz2rTaqA18Aa1VgjtbYXcxLC
 16ChKco/9wWFbS/4Dz4o2YrBkD6y7w6HxhYCdeRSWZ/zxJw0ATK/0LgBnm42jCDOVo
 aK0ndp9lF1LWNGOdL/rLJvM+Noq1Bo0PM7A+1lCAz1rRJixJ+JuGpZ3hmXKNS9oG2l
 rXLGpiEfyJvyLEXUdjiEajSV4diVpyTkG3vUZBkWpOUGK5loeVT6eETbalfWnebqmx
 4IawSABo1cp+g==
X-Virus-Scanned: amavisd-new at zimbra88.inuits.eu
Received: from zimbra88.inuits.eu ([127.0.0.1])
 by localhost (zimbra88.inuits.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A6zgSddH0ssM; Tue, 11 Feb 2020 14:59:11 +0100 (CET)
Received: from zimbra88.inuits.eu (zimbra88.inuits.eu [10.0.228.250])
 by zimbra88.inuits.eu (Postfix) with ESMTP id 954E27C07AD;
 Tue, 11 Feb 2020 14:59:11 +0100 (CET)
Date: Tue, 11 Feb 2020 14:59:11 +0100 (CET)
From: Christophe Vanlancker <carroarmato0@inuits.eu>
To: smith151@ngs.ru
Message-ID: <1037620993.52462.1581429551465.JavaMail.zimbra@inuits.eu>
In-Reply-To: <web-43707088@mx61.intranet.ru>
References: <web-43707088@mx61.intranet.ru>
Subject: Re: Enable default route after establishing connection only
MIME-Version: 1.0
X-Originating-IP: [10.0.228.250]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - FF72 (Linux)/8.8.12_GA_3794)
Thread-Topic: Enable default route after establishing connection only
Thread-Index: PNtQ9mhtOhMYsi9QzCcVjllybCsaSw==
Cc: wireguard@lists.zx2c4.com
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

I think it's better to solve this at another level.

I use WireGuard on my phone, and I would rather have connections fail and me being aware of that rather than my connections working and falsely believing they are going through the tunnel.

----- Original Message -----
From: smith151@ngs.ru
To: wireguard@lists.zx2c4.com
Sent: Tuesday, 28 January, 2020 09:50:23
Subject: Enable default route after establishing connection only

I am using default route on wireguard. And sometimes 
remote server is not acceptable. The reasons may differ - 
planned maintenance of server, internet troubles, blocked 
IPs of server by country black list an so on.

In case when wireguard server is not reachable wireguard 
client always setting default route via wg0 peer. And all 
internet traffic is not available in this case. How can I 
set up wireguard to enable default route after 
establishing connection only?

I am using wireguard v.20200121 on Debian 10 buster. The 
config file of client is very simple:

```
[Interface]
Address = 1.2.3.2
PrivateKey = ClientPrivateKey=

[Peer]
PublicKey = ServerPublicKey=
Endpoint = 1.2.3.1:51820
PersistentKeepalive = 25
AllowedIPs = 0.0.0.0/0,::/0
```
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
