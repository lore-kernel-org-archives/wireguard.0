Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA662C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 13:02:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26700213A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 13:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26700213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06b1656f;
	Sat, 6 Apr 2019 12:59:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c5b1350
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 12:59:29 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4293fcb6
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 12:59:29 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id BDDC120243;
 Sat,  6 Apr 2019 13:01:55 +0000 (UTC)
Date: Sat, 6 Apr 2019 18:01:55 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: mesh VPN with wireguard?
Message-ID: <20190406180155.674f40bb@natsu>
In-Reply-To: <bf1d3b6ac8dc6a31c82042b363db3bf3@wpkg.org>
References: <bf1d3b6ac8dc6a31c82042b363db3bf3@wpkg.org>
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
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

On Thu, 28 Mar 2019 23:22:45 +0900
Tomasz Chmielewski <mangoo@wpkg.org> wrote:

> Does Wireguard allow to set up mesh VPN with "relative ease"?
> 
> Say, we have 10 servers with public IPs, we want them all to create a 
> VPN network with private subnet 10.11.12.0/24, and have all 10 servers 
> communicate directly with each other.
> Then a year later, expand it to 100 servers.

Sure.

But note that in this case unlike Tinc you cannot have some servers exit to
the outside world via some other servers (with AllowedIP 0.0.0.0/0). There has
to be just one such exit point per a WG network.

If it's purely for communication between servers, then of course no issue.

> Something in the line of: https://www.tinc-vpn.org/

Another limitation compared to Tinc is that Tinc will autoheal the partially
disconnected mesh and will have some nodes forwarding for the others, in case
direct communication between some of them gets cut (e.g. due to a peering or
routing issue on the underlying Internet -- this saved me a few times).

WG will do no such thing, and node-to-node communication working will depend
on both nodes always having direct connectivity to each other.

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
