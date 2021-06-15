Return-Path: <SRS0=zGfa=LJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2068C48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 13:24:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35536145D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 13:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C35536145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cbe3a90;
	Tue, 15 Jun 2021 13:24:03 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b6b769cc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 13:24:01 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id E1EA31E3112;
 Tue, 15 Jun 2021 09:23:59 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id C40651E310F;
 Tue, 15 Jun 2021 09:23:59 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: wg syncconf (and setconf) error when one or more endpoints is
 unresolvable
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9qKqGkBp=JjQa0JdQGYa-YSZjdKADZ7k7KwZa1E4+FOOA@mail.gmail.com>
Date: Tue, 15 Jun 2021 08:23:59 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B86BC46E-BBD1-4C0F-9193-7E6F31513E69@lonnie.abelbeck.com>
References: <CADTMz0Kfxc3pQAM=KNstz-dZeHfYDWeqz360pPZLC1RvrW6+pw@mail.gmail.com>
 <CAHmME9qKqGkBp=JjQa0JdQGYa-YSZjdKADZ7k7KwZa1E4+FOOA@mail.gmail.com>
To: Christian McDonald <rcmcdonald91@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
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


> On Jun 15, 2021, at 5:52 AM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> This is intended behavior. DNS resolution happens at config parsing =
time.

Christian,

While I appreciate Jason's strict DNS requirement, for the last 2.5 =
years our project has implemented a trivial patch [1] to ignore endpoint =
DNS failure.  On a DNS failure, essentially ignoring the (optional) =
Endpoint=3D dns-hostname peer entry.

This has worked well for our use case.  WireGuard always starts.

Lonnie

[1] Ignore endpoint DNS failure
=
https://github.com/astlinux-project/astlinux/blob/master/package/wireguard=
-tools/wireguard-tools-0001-ignore-endpoint-dns-failure.patch

