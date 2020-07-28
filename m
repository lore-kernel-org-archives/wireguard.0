Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC0EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 16:30:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 989B12074F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 16:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 989B12074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d5125c8;
	Tue, 28 Jul 2020 16:06:49 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e6878cbd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 16:06:47 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 8B3C21E304D;
 Tue, 28 Jul 2020 12:30:14 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-81.om.om.cox.net
 [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 6FEB21E305D;
 Tue, 28 Jul 2020 12:30:14 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: Confused about AllowedIPs meaning?
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
Date: Tue, 28 Jul 2020 11:30:13 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1FE03242-7EE7-427B-878F-F2D84898A4E1@lonnie.abelbeck.com>
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
To: Gunnar Niels <gunnar.s.niels@gmail.com>
X-Mailer: Apple Mail (2.3445.104.14)
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



> On Jul 26, 2020, at 5:57 AM, Gunnar Niels <gunnar.s.niels@gmail.com> =
wrote:
>=20
> The simplicity of the wireguard config is one of the best features =
about it,
> but the only thing I'm unclear about here is: exactly what is the =
"AllowedIPs"
> field configuring? I'm not sure how to configure these fields for my =
use-case.

Possibly this link will help you:

Cryptokey Routing
https://www.wireguard.com/#cryptokey-routing

"At the heart of WireGuard is a concept called Cryptokey Routing,
which works by associating public keys with a list of tunnel IP =
addresses that are allowed inside the tunnel.
..."

