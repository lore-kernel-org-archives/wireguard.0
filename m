Return-Path: najoll@posteo.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d756360a
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 00:24:53 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 673477ba
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 00:24:53 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id B2BEC20DDE
 for <wireguard@lists.zx2c4.com>; Fri,  2 Mar 2018 01:33:40 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3zsqzR67BXz9rxt
 for <wireguard@lists.zx2c4.com>; Fri,  2 Mar 2018 01:33:38 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Nicholas Joll <najoll@posteo.net>
Subject: Exempting two things from WireGuard tunneling
Message-ID: <d98b43d3-b847-c1c5-931a-5c3164061058@posteo.net>
Date: Fri, 2 Mar 2018 00:33:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Dear List

I'd like to exempt two things from WG: (1) some samba shares, accessed
via autofs, which give me enough trouble without having VPN dropouts
(courtesy of my VPN provider and/or my ISP) as well, (2) Netflix (which
I run via a Chrome app). The samba shares all have fixed IPs and most of
them are on a single Windows machine, on my home network, and another
share is to router-attached USB storage (and only works on Samba
protocol version 1, for some reason; the other shares work on version 3).

I imagine many people will want to do each of these things. There was
something on the list a long time back, I think, about 2, but it was too
technical for me to understand. (My VPN and Wireguard knowledge is
minimal, though I have Bash scripts that put WG up and take it down, and
tell it which servers(s) to use.)

With thanks,

N
