Return-Path: rm.wg@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5ac266a
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 07:51:47 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 679409d8
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 07:51:47 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e9:9eff:fe8f:1bcf])
 by rin.romanrm.net (Postfix) with SMTP id 0A3ED405A2
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 08:02:22 +0000 (UTC)
Date: Fri, 16 Mar 2018 13:02:22 +0500
From: Roman Mamedov <rm.wg@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: Include directive to support "conf.d/*" and the like
Message-ID: <20180316130222.3a9d0611@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I would like to be able to split the [Interface] and [Peer] parts of the config
file into separate files. The reason is that currently I manage configurations
of my various hosts at a central location, then push out common configs to all
hosts.

This becomes problematic with current WireGuard, as it stores both the
host-specific part, and the part common to the entire network, in the same
single file.

While it would be nice if WireGuard had a "hosts/" directory like Tinc uses
(basically storing its equivalents of WG's [Peer] sections each in a separate
file), I feel the most flexible way to support such scenarios would be to have
a generic "Include" directive. That way I could do
"Include /etc/wireguard/peers/*.conf" and then not only store each peer
information in its own file, but also roll-out or fetch and
add/remove/overwrite those files from a central repository.

Also distros could use it by default to enable the often-used "conf.d/*"
mechanism.

Is there anything planned along these lines? Is there a workaround that I
could use with WG in its today's form?

-- 
With respect,
Roman
