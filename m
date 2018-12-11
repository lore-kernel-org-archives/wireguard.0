Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF950C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 15:10:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92022081B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 15:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.noconroy.net header.i=@mail.noconroy.net header.b="smAJczmD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92022081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.noconroy.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a7999ce;
	Tue, 11 Dec 2018 15:01:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bd72e9d
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 13:15:56 +0000 (UTC)
Received: from mail.noconroy.net (mail.noconroy.net [108.61.103.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca421098
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 13:15:56 +0000 (UTC)
Received: from authenticated-user (mail.noconroy.net [108.61.103.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.noconroy.net (Postfix) with ESMTPSA id A6BC83F102
 for <wireguard@lists.zx2c4.com>; Tue, 11 Dec 2018 14:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.noconroy.net;
 s=mail; t=1544534683;
 bh=mcvId/Iaoif7bX+SGg0ZRihpxie8xXXZgXrVBxSZcbw=;
 h=Date:From:To:Subject:From;
 b=smAJczmDvstI0qg3FgDQQWqE1HNDAJw6BBaP2FOEqxLvJcWMzCdX8GSU1X/Ea2uwn
 CylT/8exp1O5oPcTwAzTAV5B51mt+eF1a9uxaRKcJmMoDXKyMor3oA/SKWN82GyM2I
 235HhDTDMvAAo4iS5asUMwrVJ0lESKlOC14I6mrxlcXCUFAxojHzSVfNfNmByzrdZa
 3UMZQQTyHDzBNxgjHiqT7qlQ+ddtwSbgU3mHuT86HGPSxbKF2F3eB4VMFE2dCvpzl1
 cZv8GewZg27Ie7utQEKFEwubNKjI1moMQEDVBVQ0K1QKJ5tJp9QJMOfvFW2zcQq0B/
 dYYK5lt9Qkn3Q==
Date: Wed, 12 Dec 2018 00:24:39 +1100
From: Matt <ncon@mail.noconroy.net>
To: wireguard@lists.zx2c4.com
Subject: OpenBSD kernel implementation
Message-ID: <20181211132437.cooi2kwvx2j3llem@vertex.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Info: Keep It Simple, Stupid.
X-Mailman-Approved-At: Tue, 11 Dec 2018 16:01:43 +0100
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

Hi all,

Below is a message sent to tech@openbsd.org discussing potential design
for a WireGuard kernel module. It is unedited, so keep in mind the
context.

----------------

For the last few weeks I have been playing with some kernel development
in my spare time, specifically writing a ground up implementation of
WireGuard [1]. In it's current state, it is compatible with the Linux
kernel module and wireguard-go, however it was not heading in the
direction I was hoping; clear code, simple implementation, and secure.

Those that are interested can see [2]

I've spent some time thinking if I want to continue, however at this
point I would like some validation whether this is something that is
desired or may be desired in the future.

Currently, I want to take all the code that doesn't need to be in the
kernel and move it to userspace, which is essentially the handshake
code, timeout timers and state machine functions. What is left is
essentially the transport function (IPSEC transform equivalent),
peforming simple crypto on incoming/outgoing packets. This design is
somewhat similar to how IPSEC is currently implemented in OpenBSD. I
believe this is a reasonable approach, but welcome comments on things I
may not have considered.

This is a rough diagram of the design outlined above:

+----------------------------------------------------------------------+
|                                                                      |
|  +--------------------------+   +-------------------------------+    |
|  |                          |   |                               |    |
|  |  +--------------------+  |   |  +-------------------------+  |    |
|  |  | wg(4)              |  |   |  | handshake proc          |  |    |
|  |  | - ioctl(2) control |<------->| - setup interface       |  |    |
|  |  | - passes handshake |<------->| - handle handshakes     |  |    |
|  |  |   packets over     |  |   |  | - passes key to iface   |  |    |
|  |  |   socket to user   |  |   |  |                         |  |    |
|  |  | - handles all      |  |   |  +-------------------------+  |    |
|  |  |   transport pkts   |  |   |               |               |    |
|  |  | - performs         |  |   |  +-------------------------+  |    |
|  |  |   cryptokey        |  |   |  | crypto proc             |  |    |
|  |  |   routing          |  |   |  | - handle crypto ops     |  |    |
|  |  |                    |  |   |  | - HSM-like              |  |    |
|  |  |                    |  |   |  | - esssentially stores   |  |    |
|  |  |                    |  |   |  |   private and psk       |  |    |
|  |  +--------------------+  |   |  +-------------------------+  |    |
|  |  Kernel                  |   |  User                         |    |
|  +--------------------------+   +-------------------------------+    |
|                      - priv-sep userspace code                       |
|   WireGuard OpenBSD  - minimal kernel code (use crypto(9))           |
|                      - hopefully more performant than pure userspace |
+----------------------------------------------------------------------+

The wg(4) is a tunnel network interface, with packet level encryption.
Packets will arrive at the interface, encrypted and routed to the
allocated peer.  Incoming packets will be decrypted, route verified and
pass in on the interface.  No crypto needs to be added to the kernel, as
crypto(9) provides CRYPTO_CHACHA20_POLY1305.  The interface will need to
perform routing for 'cryptokey routing' [3], however the interface that
/usr/src/sys/net/art.h provides is generic enough that the routing
requires minimal new implementation.

The wg(4) interface listens on a SOCK_DGRAM currently (using
socreate(9)), and that works fine for the current implementation,
however with the user-kernel separation, the handshake specific packets
will need to be passed from that socket into userspace. Does anyone have
a solid idea? Otherwise I'll play around with using a separate socket
for that.

The idea of having the handshake code in userspace allows for multiple
implementations, however ideally an efficient C implementation can be
included in base. The wg(4) interface configuration API will be
exceptionally stable and well defined.

Unfortunately, up until this point, I have not spoken to anyone already
involved in WireGuard development - however hopefully that changes soon.
I hope to have similar discussions with those who are more invested in
WireGuard than myself.

Any feedback in regards to design or if this is something that people
would welcome in OpenBSD would be much appreciated.

Best Regards,
Matt

[1] https://www.wireguard.com/

[2] https://noconroy.net/files/if_wg.tar.gz

[3] https://www.wireguard.com/papers/wireguard.pdf

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
