Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCEFC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:17:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1840C608FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1840C608FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stha.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1398cb9;
	Wed, 14 Apr 2021 20:17:37 +0000 (UTC)
Received: from deponia.stha.de (deponia.stha.de [2001:8d8:1801:133::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0bb37264
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 18:43:44 +0000 (UTC)
Received: from mail.stha.de (mail.stha.de [IPv6:2a03:4000:24:7d0:100::15])
 by deponia.stha.de (Postfix) with ESMTPS id 169CC10FC4F
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 18:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: stefan)
 by mail.stha.de (Postfix) with ESMTPSA id 8673A184934
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stha.de; s=20200509;
 t=1618425821; bh=vAwbN2T7ruH7aLrLRnZLNovB5sZ8n9luA7dhXnEkINo=;
 h=Date:From:To:Subject:From;
 b=X+oC9Zq8gcPg1jnVLF9gMSVlUorRNaTDjKIpqUcewtXVooC+PEfpb+Je6ulK9ZjYk
 8tw+gDkhdFNHWCj+UejTYZhPaGaBVXntLgODrDy8l7XUO3FkjReFZfMSepf9lHGhf1
 tP3sp5R/uMrIX/jcAu3OU5lC7KsNoIicxSNqHkbeMQ4I3by4wmfQQ7MOMEaDN/02p/
 k6mMoTF9hxcdwuA7jM5rfYLp7vVEwwJ+UYslDdigAIj/upE2M2vqeY/mOEngDVXOMF
 HpX4pGRgeXhsIiuhqMmnNyTvDAyrQ+NTnPvH0XSkg4Ni48JwqJGL9fqRbXgAQ4cnCB
 RrjG94IGsAvKg==
Date: Wed, 14 Apr 2021 20:43:37 +0200
From: Stefan Haller <stefan.haller@stha.de>
To: wireguard@lists.zx2c4.com
Subject: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
Message-ID: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 14 Apr 2021 20:17:33 +0000
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

Hello everyone!

Today I tried switching to the if_wg kernel module. I observed that the
behaviour of the tunnel interface was changed to drop the POINTTOPOINT
and MULTICAST flags (8801509656e9).

For some reason the bird2 routing daemon is not picking up my interface
if there is only a /32 address configured and I manually add host routes
over the wg interface. This broke my wireguard mesh setup and I wanted
to find out ways to get it back into a working state.

Luckily, a look into the git history showed up change 0adab0e961c6e that
I find really useful (and also quite smart). I can simply say `ifconfig
wg0 link1` to get the POINTTOPOINT behaviour back.

Unfortunately, most routing protocols seem to rely on multicast traffic
(e.g. OSPF, Babel, at least with default settings). bird2 will not pick
up my interface, because the MULTICAST flag is missing.

I tested a simple change that you can also find at the end of this email. The
link1 flag will not only toggle the POINTTOPOINT flag, but additionally also
toggles the MULTICAST flag. I am not really experienced with kernel and network
stack code, but to me it makes sense to mark the interface as multicast capable
in a peer-to-peer setting (if you use this, you will most likely set AllowedIPs
to 0.0.0.0/0, ::/0 anyway). Is such a change sensible?

I tested the change for my specific use case and everything seems to be working
again (without broader changes to the configuration otherwise necessary).

I do not want to imply that the current behaviour is wrong, because I
simply don't know much about the topic. If someone else is using dynamic
routing protocols over p2p wireguard tunnels successfully, I appreciate
pointers into the right direction :)

Kind regards,
Stefan


diff --git a/src/if_wg.c b/src/if_wg.c
index ca54476..414a641 100644
--- a/src/if_wg.c
+++ b/src/if_wg.c
@@ -2910,9 +2910,9 @@ wg_ioctl(struct ifnet *ifp, u_long cmd, caddr_t data)
        case SIOCSIFFLAGS:

                if ((ifp->if_flags & IFF_LINK0) || !(ifp->if_flags & IFF_LINK1))
-                       ifp->if_flags &= ~IFF_POINTOPOINT;
+                       ifp->if_flags &= ~IFF_POINTOPOINT & ~IFF_MULTICAST;
                else if (ifp->if_flags & IFF_LINK1)
-                       ifp->if_flags |= IFF_POINTOPOINT;
+                       ifp->if_flags |= IFF_POINTOPOINT | IFF_MULTICAST;
                ifp->if_flags &= ~(IFF_LINK0 | IFF_LINK1 | IFF_LINK2);

                if (ifp->if_flags & IFF_UP)
