Return-Path: <SRS0=I5vT=PG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40882C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Dec 2018 14:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA69020855
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Dec 2018 14:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="BoiUL4nH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA69020855
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c98bc711;
	Sat, 29 Dec 2018 14:11:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 148f25c2
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Dec 2018 14:11:43 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34f5b9a6
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Dec 2018 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=9kFA0pUjdkVglPMzGN5LufPFMD5GyXUrX9cfmsP+DWM=; b=BoiUL4nHzKhMbq2Gle1NQVXIOn
 w++H8USruH2GBCaPu8Y66qBBtnuuDB1iyZ9mMUg22JZGdBv30gVEsUchS7UOLA2IL4P8deAioAAH0
 7K7AKB5IYAO9aAd7p2UHCUioT/+hwN/dQqhnczh0q2otcO0TbUjgNJEna0RcQtjA+Hf0qwMDaI2dQ
 Wvn+5yAc8sMiQIgnIzka4dM9L0MG8knM28mB0nsLoWv+k75y9h4jGO8EZNwC95HJGGvFobyl80otQ
 tOMJzVnyx5DASo8ojoNmrx+zxL5dkDKSqPyVMxrDJWaimW/pbf37PsAWkB+pX0iMu5VzWIxb32+gk
 c617/4AlgtS0GBSh8hP8ph94EolqzHip4xbfKGXvKD3ci3FxhNpeipSRC3iFuz7glY6sjDuuFYQLE
 f5XeQIh6wrOb4CVfLgicljfQJSDnEvULU8iL1Fee6oaQa4wJ6DHaOGK+Hna343Ft3YiccU6Oshwot
 TNNnj7cuMKTeBYQ0zp2gy7WX/uxF7oT9FP+fRVjEBseXxmLLjY8YjLPID4FNrrYTKRgpkE4KjAbrO
 JPXCvA8/BUyYKFhP9jnyR2NtxM3QpRc1VRmY82JFc0XQVu5GiRbG4WV1CRZ9C2hRWTS1b6Gm32aYV
 88PFwi+AM5mR5iLLvx0aPMjlL1k06+SfEmcROGhG8=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gdFMr-0002gk-O1
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Sat, 29 Dec 2018 15:13:35 +0100
To: wireguard@lists.zx2c4.com
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: wg-quick: Add option TableDefaultGW
Message-ID: <7f951f5b-eef5-9d3b-37e4-c48a5823b05f@bartschnet.de>
Date: Sat, 29 Dec 2018 15:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: de-DE
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

Hi,

We're in the situation in which we want to use the default routing table but need another routing table
for a policy-based routing of public static IP-Adresses with a wireguard default gateway in the VPN.
"Table <uint|name>" is no option as it would create all routes in the new table.

My current idea is to use

PostUp =  wg set %i peer <pubkey> allowed-ips ::/0, 0.0.0.0/0
PostUp =  ip -4 route add default dev %i table <uint|name>"
PostUp =  ip -6 route add default dev %i table <uint|name>"
PreDown = ip -4 route del default dev %i table <uint|name>"
PreDown = ip -6 route del default dev %i table <uint|name>"

and use "ip rule"-statements in PostUp/PreDown.

To simplify such a VPN setup with a default gateway I suggest a wg-quick option "TableDefaultGW <uint|name>"
which adds a routing table for the default gateway only.

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
