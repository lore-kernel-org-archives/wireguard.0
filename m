Return-Path: max@principal.rfc2324.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 688e30b2
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Sep 2017 00:46:36 +0000 (UTC)
Received: from mail.rfc2324.org (mail.rfc2324.org [31.172.8.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73bec3e1
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Sep 2017 00:46:36 +0000 (UTC)
Received: from rfc2324.org ([31.172.8.84] helo=principal.rfc2324.org)
 by mail.rfc2324.org with esmtp rfc2324.org Mailserver
 id 1dsfBs-00004x-UV
 for <wireguard@lists.zx2c4.com>; Fri, 15 Sep 2017 03:13:09 +0200
Date: Fri, 15 Sep 2017 02:52:55 +0200
From: Maximilian Wilhelm <max@sdn.clinic>
To: wireguard@lists.zx2c4.com
Message-ID: <20170915005255.GA5107@principal.rfc2324.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Subject: Wireguard and VRFs?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

I just stumbled across wireguard and really like it!

While reading the docs and seeing the notes on network name spaces I
started wondering if there's any support for Linux VRFs? [0]

What I'd like to do is builing a VPN tunnel using VRF "external" and
terminate the tunnel within the main VRF. For OpenVPN this required a
patch [65] for the setsockopt() but then works fine. Is something like
this already possible with Wireguard?

And if not would you be open to adding it or merging a patch for it?
I didn't look through the code yet, but I would suggest an option for the
tun interface which will then trigger a setsockopt() call. Like a
parameter for iproute for type wireguard interfaces.

Thanks a lot!
Best
Max

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/vrf.txt
[65] https://github.com/OpenVPN/openvpn/pull/65
-- 
"I have to admit I've always suspected that MTBWTF would be a more useful
 metric of real-world performance."
 -- Valdis Kletnieks on NANOG
