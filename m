Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3634EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 23:00:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FC9F20851
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 23:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FC9F20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b93fcead;
	Thu, 28 Feb 2019 22:50:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e103a2a9
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 22:50:46 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6af42f57
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 22:50:46 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1gzUfD-0007af-Jy; Thu, 28 Feb 2019 23:00:27 +0000
Date: Thu, 28 Feb 2019 23:00:27 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Bryce Allen <bryce@bda.space>
Subject: Re: bind to specific ip address
Message-ID: <20190228230027.GA27824@matrix-dream.net>
References: <20190205121658.1973fd89@msi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190205121658.1973fd89@msi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: wireguard@lists.zx2c4.com
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

Hi,

as has been noted on a thread by Tomas Herceg on 2018-06-22,
a workaround is to internally listen on a different port,
and use NAT so it appears as the desired port on the outside.

If you really wanted to, with some iptables magic (e.g. u32 match),
you could match and split wireguard traffic from normal dns traffic,
all on a single ip.


While Jason says the behaviour is by design, I would like to note
that there are legitimate use cases for listening only on specific
interfaces/IPs and (at least I) would expect such functionality
from serious server software.

Mentioned multiple services on different IPs requiring use of NAT
scenario is a good use case.

An undesired effect might be, for instance, if a server is serving
a wireguard tunnel on a specific ip, a potentially malicious peer
could use wireguard to confirm ownership of different IP on the
same server, or confirm server's access to a different network.
Also, faults and/or transient states could lead wireguard to
inadvertently leak other IPs to the peers, leak presence of wg
tunnels to other networks, or divert the path of wireguard
connection to an alternate path even when policy says it shouldn't.

A malicious network operator might even try delaying/dropping
initiation (or rather rekey) packets, forwarding them to different
IPs with possibly spoofed headers and use it to .. de-anonymize?

A properly configured firewall should filter all these undesired
packets and avoid the effects, but it rarely is.

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
