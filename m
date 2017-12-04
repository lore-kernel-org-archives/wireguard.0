Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9eeae842
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:45:50 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6af8fa9f
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:45:50 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 2F9A611658
 for <wireguard@lists.zx2c4.com>; Mon,  4 Dec 2017 11:52:30 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id ACC4A11657
 for <wireguard@lists.zx2c4.com>; Mon,  4 Dec 2017 11:52:29 -0500 (EST)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain; charset=us-ascii
Subject: Standardized IPv6 ULA from PublicKey
Message-Id: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
Date: Mon, 4 Dec 2017 10:52:28 -0600
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Has anyone thought about a standardized WireGuard IPv6 ULA generated =
from the PublicKey ?

WireGuard Unique Identifier (WUI) allowing a host to assign iteslf a =
unique 64-Bit IPv6 interface identifier (WUI-64) ?

Possibly picking off bits of a hash of the PublicKey ?

For mass deployments, could this be a useful standard ?

Lonnie
