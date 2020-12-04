Return-Path: <SRS0=2MpC=FI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106C2C4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Dec 2020 08:34:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DDD22582
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Dec 2020 08:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06DDD22582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kilabit.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e55b5b1;
	Fri, 4 Dec 2020 08:27:30 +0000 (UTC)
Received: from b232-18.smtp-out.ap-southeast-2.amazonses.com
 (b232-18.smtp-out.ap-southeast-2.amazonses.com [69.169.232.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13c7a409
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Dec 2020 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=qmu7se5xgw2loqmc5cw3bpwkrcsxkwvr; d=kilabit.info; t=1607070851;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 bh=/V7/b6YX7Cqj9yjKq/lOvFomgapJzQSSHaSFkojU2Ls=;
 b=jBlcLVTN45rZhAqi4tL9QNYAJfm+4AbL8ObcHtEhXbvzFoD9xdJQ52XxNVKzL73Y
 eJ9dqnRuqMXVYlE4Rc5dbYemw0a6qnew41oOfLFluQ8bLxzg/rS40TwkdPwAwr4uzzJ
 oev6zviMDLR2ln5u/ECeM/X+gL2nFQa8kX/IU13I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ulrbq2zjesb42hdt6rpnifgor3epinsy; d=amazonses.com; t=1607070851;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
 bh=/V7/b6YX7Cqj9yjKq/lOvFomgapJzQSSHaSFkojU2Ls=;
 b=VhLZOY0Ly84il1Nz3n5SMWyMgUOKUANplYuJWyy/ejkYJr2xMOFqQnDx7DdLtlHn
 MoizI8+ZrLW/W6InK5q958VjCLckwtSvRZRd1l+YmLsSt5ebenViLzQACxtnPeXaU57
 kGtKUVraVV5er+gBeEwgO7xii5UQ0JkzpBWQXK4U=
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: dns wireguard
From: Shulhan <ms@kilabit.info>
In-Reply-To: <38259275-2f96-feb5-d3e8-70aafb862f41@gnumeria.fr>
Date: Fri, 4 Dec 2020 08:34:11 +0000
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-ID: <010801762ce31fbb-84ff5ca8-2674-451c-a4c7-b328af3e3a3f-000000@ap-southeast-2.amazonses.com>
References: <38259275-2f96-feb5-d3e8-70aafb862f41@gnumeria.fr>
To: Esteban <esteban@gnumeria.fr>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-SES-Outgoing: 2020.12.04-69.169.232.18
Feedback-ID: 1.ap-southeast-2.wp6P5VKgOE241tt9Uq95AupcmA4MgXmCsfiLYAGFntA=:AmazonSES
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



> On 3 Dec 2020, at 23.25, Esteban <esteban@gnumeria.fr> wrote:
>=20
> Hello, I take the liberty to contact you, I have a huge bug, and it's =
not me who is at fault, I prefer to specify it, some friends have =
exactly the same bug as me.
> I like wireguard because it's very easy to connect on several tunnels =
simultaneously but when, (I'll schematize)
> I have two wireguard customers
> In the configuration of the wireguard A server I will have in DNS
> 172.16.150.1
>=20
> And in the configuration of the wireguard server B I will have in DNS
> 172.16.155.1
>=20
> I start by connecting to the first client, the wireguard A server.
> I manage to ping the DNS of this server A.
>=20
> I keep the connection from server A and connect to server B.
> I can ping the DNS of server A but not the DNS of server B.
>=20

I think we need to see your configs, especially the AllowedIPs options, =
both on A and B (client and server).

