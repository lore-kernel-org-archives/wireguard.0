Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EC8C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 06:23:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481956113D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 06:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 481956113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c795c2fb;
	Wed, 20 Oct 2021 06:21:09 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 030c245c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Oct 2021 12:54:54 +0000 (UTC)
Date: Tue, 19 Oct 2021 12:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1634648094;
 bh=kRB5E2yLdW02J3WvBqjyBaOczB/lovnw87hS59ihTeA=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=X8XjhzxC5FEwEdhJsdCuSawzWHUKHnz58kVnB+BeNwfYVdesICU2xzNn8nFSbcAJk
 mqE8GK7RYeushpkPx34n29FnngEhv6hXF0nB+0hUHQULLRNP7eYSki+7jnwvAtZgFo
 WjJLpNEBry2nj/GszOE/bhxmamnjcx53zbWkmG7Q=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Mindaugas Veblauskas <mindaugas.veblauskas@protonmail.com>
Subject: Access violation exception on windows
Message-ID: <XcnYGCQFb8CjcIVfX4jdbb9vwXO0M2pth9Laor075LAPBtKtgQnb-D-NbmvnhEZL-BJfsTIR8V78CAVgJkcy7iN3WUecL78NssgR53axTEo=@protonmail.com>
In-Reply-To: <PUlmptu_AouCBnZfF_b_qSr6iE0vwNlZcQ_cB0u6vFmJ4i5zhrYhKm6LCU5z7-0VU36m-8CsjgP2pkdpymQ9B0oPyZIkvVlb3_4tjYAzN5o=@protonmail.com>
References: <PUlmptu_AouCBnZfF_b_qSr6iE0vwNlZcQ_cB0u6vFmJ4i5zhrYhKm6LCU5z7-0VU36m-8CsjgP2pkdpymQ9B0oPyZIkvVlb3_4tjYAzN5o=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Oct 2021 06:21:06 +0000
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
Reply-To: Mindaugas Veblauskas <mindaugas.veblauskas@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

whenever WireGuardTunnel$xxxx service stops, it exits with the following ex=
ception:

Exception thrown at 0x0000000000E12A88 in wireguard.exe: 0xC0000005: Access=
 violation reading location 0x0000000000000000.

The behavior can be reproduced by attaching visual studio debugger on the s=
ervice process and then disconnecting/deactivating tunnel on the client.

I wonder where this exception is coming from and what's the impact of it to=
 the system.
