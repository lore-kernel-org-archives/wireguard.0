Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A03C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E42522C9F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E42522C9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jots.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96074eb7;
	Sun, 24 Jan 2021 16:24:29 +0000 (UTC)
Received: from basidium.jots.org (basidium.jots.org [174.138.47.155])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e187782
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jan 2021 16:53:28 +0000 (UTC)
Received: by basidium.jots.org (Postfix, from userid 1002)
 id A1C8E7E032; Sat, 23 Jan 2021 11:52:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jots.org; s=mail;
 t=1611420776; bh=6eqrbG2ce91G9fvp8WdL4bereoVg1omVm/ei7bOVdJY=;
 h=Date:From:To:Subject;
 b=WTFB0QmNeF4WhSI0T1WTQbVsf4oZFCY/w0h5PDhR+9yvqS1mlSllujyGC8oM12iND
 58XkTpWwygONShi9pZu0tOpp4y5yT3+Lp8c8/Kw768qEbmQdYAh4Wy8SixrblhTSwL
 ruc4fwR/2dxFcTBG2Xfl5EZ2a4Nzo5DIqyYBEMIXm9GdD90uO+MKhFovD/mYYg67l8
 kszPazik6OXqEMkHcnJRVui/RD7j0OWxIAknEL8qMLOfGg8PG/NbROgK4M8Vxmdqjt
 ybDnnmEI8FRhZkxjAXOYOx23OJ8dYGpiRFKB3h6XrfJZwG/JZ13NS2P1QeoOoG5O4Z
 fB7ZjzoLtOEUQ==
Received: from webmail.jots.org (localhost [127.0.0.1])
 by basidium.jots.org (Postfix) with ESMTP id 3577C7E030
 for <wireguard@lists.zx2c4.com>; Sat, 23 Jan 2021 11:52:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jots.org; s=mail;
 t=1611420776; bh=6eqrbG2ce91G9fvp8WdL4bereoVg1omVm/ei7bOVdJY=;
 h=Date:From:To:Subject;
 b=WTFB0QmNeF4WhSI0T1WTQbVsf4oZFCY/w0h5PDhR+9yvqS1mlSllujyGC8oM12iND
 58XkTpWwygONShi9pZu0tOpp4y5yT3+Lp8c8/Kw768qEbmQdYAh4Wy8SixrblhTSwL
 ruc4fwR/2dxFcTBG2Xfl5EZ2a4Nzo5DIqyYBEMIXm9GdD90uO+MKhFovD/mYYg67l8
 kszPazik6OXqEMkHcnJRVui/RD7j0OWxIAknEL8qMLOfGg8PG/NbROgK4M8Vxmdqjt
 ybDnnmEI8FRhZkxjAXOYOx23OJ8dYGpiRFKB3h6XrfJZwG/JZ13NS2P1QeoOoG5O4Z
 fB7ZjzoLtOEUQ==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 23 Jan 2021 11:52:56 -0500
From: Ken D'Ambrosio <ken@jots.org>
To: wireguard@lists.zx2c4.com
Subject: Access subnet behind server.
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <4464b11ea233ea1e57f49d4a5d1a84d5@jots.org>
X-Sender: ken@jots.org
X-Mailman-Approved-At: Sun, 24 Jan 2021 16:24:12 +0000
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

Hey, all.  I'm relatively new to WireGuard, and have a RasPi at my house 
doing firewall duty.  Installed WG on it, and on a VPS, and am trying to 
get the VPS to access hosts on my home subnet.  So:

VPS <-192.168.50.0/24-> RasPi <--> [192.168.10.0/24]

And, clearly, I'm doing something wrong.

-----------------------------------------------------------
RasPi server/firewall:
[Interface]
Address = 192.168.50.1/24
SaveConfig = false
ListenPort = 51820
PrivateKey = XXX
[Peer]
PublicKey = XXX
AllowedIPs = 192.168.50.11/32

VPS:
[Interface]
Address = 192.168.50.11/24
PrivateKey = XXX
[Peer]
PublicKey = XXX
Endpoint = vpn.foo.bar:51820
AllowedIPs = 192.168.50.0/24,192.168.10.0/24
-----------------------------------------------------------

The client connects just fine, and it can talk to the server's VPN IP 
(192.168.50.1) as well as its internal interface (192.168.10.1).  
Likewise, the server can talk to 192.168.50.11.  But nothing gets inside 
to other 192.168.10.x hosts.  I do have forwarding set up for "all":

root@prouter:/proc# cat /proc/sys/net/ipv4/conf/all/forwarding
1

Note that the config files have gone through several permutations as I 
tried to figure this out, so there may be some dumb stuff, but totally 
open to suggestions right now.  I'm kinda stumped.  Note that a tcpdump 
on the RasPi shows the ping requests coming in, but not being forwarded 
to the internal interface, so I assume I'm just missing Something 
Dumb(tm) in WG land.

Thanks!

-Ken
