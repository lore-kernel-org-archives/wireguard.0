Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2019AC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 11:27:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72b351d3;
	Fri, 21 Jun 2024 11:25:26 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 419fee4d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 11:25:25 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 9FF4420DC1
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jun 2024 13:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1718969125;
 bh=KWxlmU2X3+ufMrHzvTiKBUzRyriR7qcJqKro8A4TEOk=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=j57EGtQewj5X2lCm+kPj1wrrx0A2YdsAGisMj75VCdNhb5S9ktCoH7s2nj0WC+tEn
 Yx0sPyJbUvUE0vFro9eQ3bithDiW9JAWutkmunt0xWq2oHfpP9v0G5/tQlMtwE3+Ur
 69QNHw9J1IcK+0iEdLPaU4jvMbdVFYjBIkxJ5Pr1tNPX17pp0aLaih/ou9y0ekGlVi
 rrL3htj0cPOY0zp5y2A4xLqnwJIAvSyLtWBKVg3+yL+s97TAW/7dckKghiGZPXR7V0
 SWKHfIw3y/iFAL+1YZ7tQn6w37bKe965FCWgR+hCQDVkk+begChQP7OFFcbLYiqJJ1
 l9v8A829jXH3A==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id B63D81A6A2B4; Fri, 21 Jun 2024 13:24:47 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard uses incorrect interface - routing issue
In-Reply-To: <878qyyim5k.fsf@ungleich.ch> (Nico Schottelius's message of "Fri, 
 21 Jun 2024 13:13:27 +0200")
References: <878qyyim5k.fsf@ungleich.ch>
Date: Fri, 21 Jun 2024 13:24:47 +0200
Message-ID: <874j9milmo.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


p.s.: the route lookup looks correct on the machine, when selecting the
source IP:

[11:15] server141.place10:~# ip r get 194.187.90.23
194.187.90.23 via inet6 fe80::3eec:efff:fecb:d81a dev eth0 src 192.168.1.149 uid 0 
    cache 
[11:16] server141.place10:~# ip r get 194.187.90.23 from 192.168.1.149
194.187.90.23 from 192.168.1.149 via 192.168.1.254 dev eth1 table 42 uid 0 
    cache 

wireguard still uses the wrong interface:

11:20:13.115154 eth0  Out IP 192.168.1.149.60031 > 194.187.90.23.4000: UDP, length 148


-- 
Sustainable and modern Infrastructures by ungleich.ch
