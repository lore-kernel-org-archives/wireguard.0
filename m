Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B853C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Feb 2023 19:07:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54d011b3;
	Thu, 16 Feb 2023 19:07:50 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [2001:41d0:1:8b3b::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40272bff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2023 19:07:48 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by len.romanrm.net (Postfix) with SMTP id 2DEAD4038F
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2023 19:07:48 +0000 (UTC)
Date: Fri, 17 Feb 2023 00:07:47 +0500
From: Roman Mamedov <rm@romanrm.net>
To: <wireguard@lists.zx2c4.com>
Subject: Force a specific IP for outgoing WG traffic with SNAT?
Message-ID: <20230217000747.0825b2e9@nvm>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hello,

I'm trying to move all my WG communication with peers to a non-primary IP of my server.

It has IPs added like this:

    inet6 2001:db8::ca6c/128 scope global deprecated 
       valid_lft forever preferred_lft 0sec
    inet6 2001:db8::1/128 scope global nodad 
       valid_lft forever preferred_lft forever

What I tried:

  ip6tables -t nat -I POSTROUTING -d 2000::/3 -p udp --dport 51820 -j SNAT --to-source 2001:db8::ca6c

Also tried to filter by --sport, and also briefly without a port filter at all.

This has zero effect, as shown by tcpdump all the WG traffic still originates from 2001:db8::1

Does anyone have an idea why is that? Thanks

-- 
With respect,
Roman
