Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B49C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 13:44:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6E82080D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B6E82080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a68a938;
	Sun, 3 Jan 2021 13:33:00 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b6b2cac
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 13:32:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=EbmfwgDv/cV4GcWbuIWvTWCdKujv2QopSghQTO2TtPHYlYPx6SeZE3ifVax3XwfBMEhGZR1dE9BCYXvrTBOO6rtXSZeel6OL5xitbXdz44mYujdfYaIdmUMUV0Haxb9t2AOJLpGSspeEfNygRFvlVVYK3GH2T1eVlKuiE6ynk9NjbBuXP2rBW0DyTIqKbZhZvox/bvOl8/mIIsydnQc2RWtC0eh/N68247yX1kxnt+0QkluRFAdW1V3aiXPIbkJfRxmikzRBoIg3XjGrdZbvMhj38ZiLfUgaC0wh6uGZAg76DKJZexzU+GQmdahIfhD/LiyiuB1ZlKVQG/cAbQUeOw==;
 s=purelymail2; d=msfjarvis.dev; v=1;
 bh=hfhQ+iHutD84tfdndCYQ4FNjctWMGk23cL5QUqtkYgs=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=H6r+taFT4l+7PSARxHQFaQxMYYaTqAY5EGVnA1oRshH7+4thHAWjL7X4/cj74+LNiufmJbbmfVrwIdMRUaC7RJs9JdhmABTYu+G9UlG2ylpj84EZ8fyY7X4un8QvZxUdwdf+ziaYDNjR1QCzjO7sFLeYgHHBMaTl6N0iCTzhbfTkBVUJwhEXusHJ+bt8eLU+Em9pfsKwSks/LvjnqkruSy3XCyV2Q66a35PwhowS9masZS/01qk2SIq0KXAWE4s8GhzkTP0STHvYZBxDUJJplFKn3h7u1vsny81LIKoPNx2+bBpknT8ECIawChuNGsMbALFX/dCEdEvOsAahOrFjxQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=hfhQ+iHutD84tfdndCYQ4FNjctWMGk23cL5QUqtkYgs=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-124.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -1038987641; Sun, 03 Jan 2021 13:43:19 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 03 Jan 2021 13:43:19 +0000
From: Harsh Shandilya <me@msfjarvis.dev>
To: =?UTF-8?Q?J=C3=A9r=C3=A9my_Prego?= <jeremy@pregonetwork.net>
Cc: wireguard@lists.zx2c4.com, team@wireguard.com
Subject: Re: Wireguard Android: the application is stopped unexpectedly
In-Reply-To: <85807215-9af1-ed2d-d96c-9c3c4a41ad2c@pregonetwork.net>
References: <85807215-9af1-ed2d-d96c-9c3c4a41ad2c@pregonetwork.net>
User-Agent: Purely Mail via Roundcube/1.4.7
Message-ID: <2eb5a0785205119f1ec1d82bcef84e80@msfjarvis.dev>
X-Sender: me@msfjarvis.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
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

Hey J=C3=A9r=C3=A9my,

On 2021-01-02 11:39, J=C3=A9r=C3=A9my Prego wrote:
> hello and happy new year,
>=20
> I have a problem with the wireguard application on my Xiaomi poco m3
> (Android 10 / miui 12.0.5). I have set all the correct permissions so
> that the application is not killed by miui, but it always ends up
> stopping anyway.
> In the attached log, I see some errors when stopping the application,
> around 11:30 am

The auditd lines are harmless, and the app itself seems to have no=20
information as to why its being killed. There are no crashes, and no=20
fatal errors being logged. I'm rather confident that this is MIUI's=20
doing, because I have a Samsung phone that has been running the same=20
WireGuard client for 14 days straight without failing or being force=20
closed. Is there a possibility that a new MIUI "optimisation" showed up=20
that you did not disable yet? I don't believe the reason for your issue=20
is a bug in the app.

>=20
> I remain available if you need more information
>=20
> thanks,
>=20
> Jerem

Cheers,
Harsh
