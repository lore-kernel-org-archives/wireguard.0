Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e0282fe
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:13:48 +0000 (UTC)
Received: from smtp01.bhosted.nl (smtp01.bhosted.nl [94.124.121.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e2cadcf
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:13:48 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com [192.168.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 3F84D11B5166
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 13:30:08 +0200 (CEST)
Date: Mon, 26 Jun 2017 11:30:11 +0000
Message-ID: <20170626113011.Horde.LnrakzTxipAs-PhMdgApTF3@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: Hash fix commit by Sultan Alsawaf.
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jason,

Did you notice this commit [1] from Sultan Alsawaf?

[1] ratelimiter: fix hashing and hashmap searching for ipv4 addresses;  
https://git.zx2c4.com/WireGuard/commit/?h=sa/20170623&id=8da15aa96cdf918d8a98cf2caaefb475cadee355

Greats,

René van Dorst.
