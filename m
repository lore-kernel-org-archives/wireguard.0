Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1357C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84835206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="OMPH8tUl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84835206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06a04403;
	Mon, 6 May 2019 20:31:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18b65476
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Apr 2019 22:09:55 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d07f5ab
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Apr 2019 22:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1556402993;
 bh=F7yOZ8lAcYxbEVp0jOvjmF1PnjZ9x6OYCMMfheoSvUc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=OMPH8tUllFIhw15FHm+3IyLUtvVlKGFcHH+8lIyJeeLNqDWlRI5XRfnbuikZn95Kq
 66NPP4JmqCSFKc9HEsrBYkzq5izKA18AlTwNE5KqZ92qsWRfWtyx/AxpgLyNyFCtJF
 NV6bzQALel/AdCw6q9DUeL/ebpqzXDL6hshQm4ao=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [46.223.1.199] ([46.223.1.199]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Sun, 28 Apr 2019
 00:09:53 +0200
MIME-Version: 1.0
Message-ID: <trinity-3b58a006-b523-456e-b159-9574a77bf74e-1556402993612@3c-app-gmx-bs16>
From: Garbage@gmx.de
To: wireguard@lists.zx2c4.com
Subject: How to work around the fact that a Wireguard Server is a single
 point of failure
Date: Sun, 28 Apr 2019 00:09:53 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:EVdEStZsSERh2/g/pVu8M6hAzNc8RvUg+35yzlah1kfd3Dbu/8r64Jjsg100KlVOcDfIn
 ofAg2lqvYebz2a3tAhxFeJ+cd7n14s0Axn5UCMJ+hSAh+mOoRSiLzIRfIUDx2hH8mOw4N4wwyXnq
 Yk1VTfp0MwskBzqxdMzePxzQSwYXq0qLgOKTpWfcbwAMzYogOfoUllV6zF0rTE/RzYV+4iek1Dio
 GUUdoqjH1HUSE6oJQI8isW4lpTSPp+cs/d5ByHHuQQ6RN4EJpCuqwHSAJ4++44rk97+9NngI5y5y
 WQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:gZJaIe4VQSg=:XmFk01I1vddPeSD6Ou91+e
 qMiETxKdihg2j0lTrab8wnLKi1m057yCPnwr7CEpAQbYFSmNY0RMhoNPcvneMoW9yXWLJ4yDj
 3lfkrAfekpyLs9CFzy/WNFMro8yLyj2gtrYf53e0xzCLG24QPJwZJU/7MebyC05bwX14iIRQq
 g7JsakN4zgvb1yuxLuAU6e4l7zXKQD3AzcGhASkIG3OGlkRxRQZS/AE+2kEG0nf/ZIQc8BscZ
 PpDkYLStzYRQoxlJV9lURJaWsNk6CLajXWagk82hmJGgY4H3XKfDraHNL/oZ49xe2WXFnoEwr
 f1O0N4bbjON7fRH77srcPLKFr/lCs+n7nIhHsi0Z5BkYUSVeQ5eLyE62phqOapE7AtRbXVRUA
 /KDRoraj9snHLmMbFMagbs6gqrGiMOd/igRzIbD9girms3yZcrBBT5EF+kRuIg5cs9xIsQScn
 +iocWASk+QrsvxQ6Ce2AYdYQvhCQxx3kFxUCPyrKeZt/A+FwXP9HSOe+Dr14hbnmUFFhuNqBV
 jbJP7kTaO+manSykw1eFqve+c43ZVY/1I1TgiMXS0/v19FXxZH3l/z0JgujRONebUOeNA2It6
 3hmaukxKMgeoqrwbwib6ExBTYUAdqreTc3osi1e4Y8GW6SMPM+kPWIGg==
X-Mailman-Approved-At: Mon, 06 May 2019 22:31:03 +0200
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

If I understood the architecture of Wireguard correctly the server is a single point of failure: when the server goes down no client will be able to communicate with another client.

I'm looking for a way to connect one or two hands full of low resource VPS from different providers and wireguard seems to be _the_ solution when it comes to ease of setup and performance. Looking for credible sources I only found this post: https://lists.zx2c4.com/pipermail/wireguard/2019-January/003788.html

Is there some documentation that describes how to set up a "high availability" or "hot standby" configuration ? The VPS will run Kubernetes and because I do not want to spend extra bucks for a loadbalancer service I decided that a DNS failover will suffice for my Kubernetes masters. So a comparable quality of service / duration of service interruption would be just fine for the Wireguard service too.

Will a DNS based failover work for Wireguard servers ? Or am I bound to a solution that uses a static IP (that of a "real" loadbalancer) and switches to the standby Wireguard server in case the first goes down ?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
