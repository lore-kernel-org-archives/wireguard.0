Return-Path: rektide@voodoowarez.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7e8f6a0
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2016 06:01:26 +0000 (UTC)
Received: from mx.eldergods.com (eldergods.com [192.73.236.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 897dcc73
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2016 06:01:26 +0000 (UTC)
Received: from pdebuildx-amd64.voodoowarez.com (unknown [108.31.103.208])
 by mx.eldergods.com (Postfix) with ESMTPSA id 32F273180003
 for <wireguard@lists.zx2c4.com>; Fri, 30 Dec 2016 01:09:43 -0500 (EST)
Date: Fri, 30 Dec 2016 01:09:41 -0500
From: rektide <rektide@voodoowarez.com>
To: wireguard@lists.zx2c4.com
Subject: Compression support- zstd, &c
Message-ID: <20161230060941.u4bwzdmforghluhz@pdebuildx-amd64.voodoowarez.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Greetings. Compression would be a great feature for WireGuard & it's roadmap. Perhaps the latest high compression & high throughput, very tuneable Zstd from Cyan4793? I think it'd make a fine complement to the other very nice modern technologies WireGuard has adopted.
http://facebook.github.io/zstd/

IPSec has a decent if not very modern history of compression with deflate, lzs, and lzjh support via IP Compression packets. That shows that there's some precedent for this feature. More recently OpenVPN has added LZ4 support.

Regards. Looking forward to this projects great future,
-rektide
