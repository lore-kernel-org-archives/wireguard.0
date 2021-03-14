Return-Path: <SRS0=wF/V=IM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6157CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 23:06:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447B164DE4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 23:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447B164DE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ka-fi.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c48b3693;
	Sun, 14 Mar 2021 23:06:16 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.98])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6a68d45
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Mar 2021 21:07:39 +0000 (UTC)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4DzBvv207Nz6PcM
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 22:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ka-fi.de; s=key2;
 t=1615756059; bh=N8fJCJLcjZYPQNzXJNydvIp+ktpYNDJV5Kz3vBKC9vc=;
 h=From:To:Subject:Date:Reply-To:From;
 b=Tu2fu6YX5LXqOHSSYPdt+akXqA4xZ1boiycAbYHwwVrIpWv8qLJXp+sm1n0rkqZ66
 oJBpu3Njes1/AHzcQpXAWLkJLUtiseHMWO3F3p2uvJ6g/fjcj2maJrQvxGEJuDR1Yx
 CocdugYu8QZKjTRQpsL9cNRaWce2kQgAb2LjPKEPUppt11xMH3+WBgxOgCqftbEFKP
 tvTC/sk1FAnp/7DtO/qCqcNWxw1qyBBZtKuL0GfRAjWz1DhG9CqnYe8JldlfAtZkzX
 d6PWjYYvcX1VWiT9kIjsf5Vft8iywcDNbPFxtsmBVwbHB0TO+wc6/H3mUHwc2Tfdbe
 Fpjz4W9IvJCTg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4DzBvv1Rmjz53F2
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 22:07:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mx2e48.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4DzBvt5hGyz8tGH
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 22:07:38 +0100 (CET)
Received: from [192.168.1.6] (unknown [134.3.119.75])
 by mx2e48.netcup.net (Postfix) with ESMTPSA id 5C6461C18D7
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 22:07:38 +0100 (CET)
Authentication-Results: mx2e48;
 spf=pass (sender IP is 134.3.119.75) smtp.mailfrom=web@ka-fi.de
 smtp.helo=[192.168.1.6]
Received-SPF: pass (mx2e48: connection is authenticated)
From: "Kai Fischer" <web@ka-fi.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Kernel module backend on Android 11 ignores custom DNS entry
Date: Sun, 14 Mar 2021 21:07:37 +0000
Message-Id: <eme0e3cfd7-7c4a-48f3-9178-6d1e00e406cb@desktop-o34nbdo>
User-Agent: eM_Client/8.0.2802.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <161575605857.11259.5208776685962489667@mx2e48.netcup.net>
X-PPP-Vhost: ka-fi.de
X-NC-CID: F4cOSRjSwnteXRpCftnlZOb75vpVlALWx3Yp4g==
X-Mailman-Approved-At: Sun, 14 Mar 2021 23:06:15 +0000
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
Reply-To: Kai Fischer <web@ka-fi.de>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

When using the official Wireguard app on Android 11 with kernel module=20
backend , Wireguard ignores the DNS that I set  and routes DNS through=20
my phone LTE/Wifi carrier internet DNS.  When using Userspace backend,=20
the same config works fine and all DNS queries are routed properly.
Affected kernel module backend version: 1.0.20210219

Anyone noticed this?

