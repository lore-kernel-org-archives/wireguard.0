Return-Path: <SRS0=+4rF=LD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F5AC48BCF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jun 2021 09:59:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A7C6128A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jun 2021 09:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A7C6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c1f724b;
	Wed, 9 Jun 2021 09:59:36 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 44225484
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jun 2021 19:11:07 +0000 (UTC)
Received: from smtpclient.apple (unknown [77.198.18.111])
 (Authenticated sender: frederic.deghetto@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 97BD2B04754
 for <wireguard@lists.zx2c4.com>; Tue,  8 Jun 2021 21:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1623179467;
 bh=l+lCxtEo790CPDMmja/jCxOiqxcovZWzNGJ9OL71Slg=;
 h=From:Subject:Date:To:From;
 b=px3XxU0eorHQl73GEZQQTZelNKyMVYXBTtz80JALfWT7DjceGmYOfs3+IUeGc6kqK
 I42V0i136jeavIiyfZ39eicisyELqnXxwrdec7Fgy43zfX01BYdO1oCoe/sKZ1lbS+
 j9ISGCKIvhPK+RK66sok5MKjUyIjTbm+TE2qFhi+Se8VBpW0HIBWIbsnNO4KrxQ/yx
 uUgqVOdPeF1E7FBm5fZf5XdCwVye3FK4Q9M4FW4bAnpVHzHjjPUeRUrlxkXLZ9ja/1
 zpmPmz904VRdhqDZOvnFgxbPnWnjUd0Q1xVTbceBR3xXK3QeDo53JLmr4RKpVXWJae
 7CZ9Nt0ZiYetQ==
From: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Deghetto?= <frederic.deghetto@free.fr>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Wireguard active but no routing to the remote host
Message-Id: <DBC312A8-47E5-40AC-8029-F86C9843DCCB@free.fr>
Date: Tue, 8 Jun 2021 21:11:06 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Wed, 09 Jun 2021 09:59:35 +0000
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


Hi,

I have two raspberry's at different locations with wireguard on it =
(installation carried out thanks to pivpn). If I use wireguard to be =
connected to the remote raspberry from my macbook or iPad, the =
connection if activated but I am still on my local network.
If I do the same with my android phone : I am on the network where the =
remote raspberry is.
On my MacBook/iPad, If I stop the wireless connection to my internet =
provider (which is the same than the one of the remote raspberry), and =
connect trough my phone by access point, then it works.

Any idea how I can troubleshoot this ?

Many thanks,
Frederic=
