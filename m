Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2512C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:28:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6713E208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6713E208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c107fd73;
	Fri, 8 Mar 2019 15:17:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05e420f4
 for <wireguard@lists.zx2c4.com>; Thu, 7 Mar 2019 11:49:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3eb8397
 for <wireguard@lists.zx2c4.com>; Thu, 7 Mar 2019 11:49:32 +0000 (UTC)
Received: from [172.17.1.81] ([91.66.121.114]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lev1D-1gjdBR1WHf-00qgvA for
 <wireguard@lists.zx2c4.com>; Thu, 07 Mar 2019 13:00:06 +0100
From: telsch <telsch@gmx.de>
Subject: ppa for ubuntu 16.04
To: wireguard@lists.zx2c4.com
Message-ID: <9d1eb144-eeea-096f-5027-f70906985038@gmx.de>
Date: Thu, 7 Mar 2019 13:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: de-DE
X-Provags-ID: V03:K1:tf7VKyt1XcSw9jsKhcI8arH+TAbd8sfMehjekqHeOPpCwGFzZwu
 uGVQwgmOKwGpdcf3j3HjpKUHcAnDTmcsOGWmHLjAhgSH/NyinbD8JHfzaZ8qcf5dKlhyjEA
 q6giuqpkCr7JSaBC10qqLzbJs/7BJ+u7dFyKsO7sOQgH491S0NqVwknp6vcgfYPla5Pp1Xl
 3zwpu1E5df0kKSVZ37DYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQpWfwhDU+Y=:7XrcdK5gVVR6ddHHef8F5+
 bNjQi5aZIhBuDGwxTdlOca/EmvWWmb/lekv/CkPsruC005eNF1rcdYsQVbxWZaShcWOtiPjTk
 0z2C1l8rYYM7Ez2m4r10/cHsAowRrwQF+ahTXY1mpmWRQqT2CtBxcmuH+wLpIrUw9jh8mccst
 krRO4k9i+NZGjoMIdc0Z7UyKAj0R/bmcPsQdc+lFP4gYnjc/DbiSVzryyac2A7n7+cp2c+Tns
 MLBpXL8XqE/MgN0ceAqlkXcajh8pr6uCjlUtSlhN26RQKK3LGtnRjrDKGCcjGgnYsDZQ077i9
 JLF7nOiuZR65nM3ktfNN1sa6scD3pKTMaEmjbK+4xR0I93ltKw5deLi3rLvN6VwHbnD8DuIKR
 6lfZphjkSRhTty/KivDoxFWLkW0SuhaUubWA4UA25VVnoE697xqdu1CYgwpo2Subsp1qUTd1i
 6zA76NVHN48jt1UqsU4jURwvIbu+ARQvSL8R58Ai6E2zoU6fhE/Rlt0xy92BY9n8kG0KvO0AB
 ZYuK8zYnUmReGkwdXX0uugyNGlsyRHzZaNgPhj2b8nvT2ZrUbJdsn65mv3bAHmVQQiaZg3Hxm
 omxU3xFmXM7nyuI6DKKHu1Hjo7hr4nnX89vGbKw/ZY5DBlV9KJ2ma12nyYWaj46JVv6uRl6xd
 ouAC0G5xZMqqCPQOA5mU+adbdOkCSBcdZmCZO0efyYecgyfXPUdKKbwrfylrrlDvtdtujDw7w
 YOxswaXsbU9vqXssco2A9/DJ/OVAIG6iD6WhbFrWaERd8gRpelaUrfeCrkbYJtWYc6ZeXfyDm
 lXyadpRAUC+thmiWiAlbP4JFcrPr4p7wwEu/CD5yrPXZ004anVwQf1cD6BZvPER9FDRl8dpxz
 tsNvsL7StxuBTaEQOOUBreUxQJVT5A7DznzAqP8M0eU7dQ5S8NIEXPRVZEFo0X
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:17:54 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

can't load wireguard module from ppa for ubuntu 16.04

uname -a
Linux vs1 4.4.0-142-generic #168-Ubuntu SMP Wed Jan 16 21:00:45 UTC 2019 
x86_64 x86_64 x86_64 GNU/Linux

modinfo wireguard
filename:       /lib/modules/4.4.0-142-generic/updates/dkms/wireguard.ko
alias:          net-pf-16-proto-16-family-wireguard
alias:          rtnl-link-wireguard
version:        0.0.20190227
author:         Jason A. Donenfeld <Jason@zx2c4.com>
description:    WireGuard secure network tunnel
license:        GPL v2
srcversion:     E1E93C9FFF84235A6B04701
depends:        udp_tunnel,ip6_udp_tunnel
vermagic:       4.4.0-142-generic SMP mod_unload modversions

dmesg:

wireguard: version magic '4.4.0-142-generic SMP mod_unload modversions ' 
should be '4.4.0-142-generic SMP mod_unload modversions retpoline '
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
