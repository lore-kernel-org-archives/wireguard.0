Return-Path: <SRS0=U3rm=N5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B91C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Sep 2021 17:03:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC8561090
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Sep 2021 17:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEC8561090
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=giurgiu.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7475ce46;
	Tue, 7 Sep 2021 17:03:23 +0000 (UTC)
Received: from mx.giurgiu.io (mx.giurgiu.io [163.172.159.53])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 41e746e7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Sep 2021 11:35:16 +0000 (UTC)
Authentication-Results: mx.giurgiu.io; auth=pass (plain)
From: Alex Giurgiu <alex@giurgiu.io>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: architectural question regarding the use of wireguard
Message-Id: <55393D98-0B32-4F8F-948A-C7AA1B5BF096@giurgiu.io>
Date: Tue, 7 Sep 2021 14:35:10 +0300
To: wireguard@lists.zx2c4.com
Received: from localhost (Unknown [127.0.0.1])
 by mx.giurgiu.io (Haraka) with ESMTPSA id
 1F61E076-A0F6-49EC-A3FB-9CBA7EB6768A.1
 envelope-from <alex@giurgiu.io> (authenticated bits=0)
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 07 Sep 2021 11:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256;
 bh=veJTtZNFlhfRjsxTGcrYsxFCh4xeD3c5tuN4d84OlfA=; c=relaxed/simple;
 d=giurgiu.io; h=from:subject:date:message-id:to:mime-version; s=s20160626846;
 b=MTD+zr7hZX89guYxidu9nAuabFEOCplhcXqGq3RRSNxHFksEei2vIB97bvhytRxug4X9eBGRY0pGbJSUG/gg25/Bba5oKmAAtLgeSMxkySxCpu6T2keEa65s7qcb7DEZdxhis4t1QTlfIWLcKAwjKS0NOxuXRh5iVWKawzQ852zCycBlA2ACveKzD4QD7wrHFPPdHyKdIX/1/NCVCo112K+DBD2J02Ztgip86/0NhCEFDKUUqvz6uPC11LnA6s/E3Pt7tHw4uHgXJjW7gfcBnWn1+EfA7yI6racUKdMmogoM5AMbLxaRFDz2wp1UF89s5uZK5fIjHlbouxLBn3+Rfg==
X-Mailman-Approved-At: Tue, 07 Sep 2021 17:03:22 +0000
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

Dear wg list,

First of all, thank you for this wonderful piece of software!

I am working on a software project which manages Linux containers on one =
or multiple machines, and I would like to implement a networking model =
where a Wireguard interface is created for every application that runs =
on this platform. Each application will be identified by a wg key + an =
IPv6 address deterministically derived from that key (similarly to what =
yggdrasil does).

Do you think this approach makes sense and will it scale from wg's point =
of view for situations where there are thousands of applications and =
hundreds of users each having one or two devices, with a complex matrix =
of permissions between the users and the applications? The key mapping =
and synchronisation between users and apps seems straightforward to me =
but I can't figure out if using wg for this scenario makes sense.

Thanks!

Alex=
