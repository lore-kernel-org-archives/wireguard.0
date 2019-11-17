Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B76C43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:43:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4893920678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=localdomain.pl header.i=@localdomain.pl header.b="OGdikMFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4893920678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=localdomain.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54693b96;
	Wed, 27 Nov 2019 09:43:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0058a95
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2019 13:59:38 +0000 (UTC)
Received: from smtp.megiteam.pl (smtp.megiteam.pl [31.186.83.105])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 460b2256
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2019 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=localdomain.pl; s=megiteam; h=Message-Id:Date:Subject:To:From;
 bh=GWiE1I9rbtM1L2cfM47q8lzzGcxYoe60akhn6ohNP7U=; b=OGdikMFj0FYVBo0WjgnrlpHhDB
 Mqy4vsw+I57Qvgg/dN/ia9KpYO2RcaUMY2WPu73tMHBe4NNDHu4sgY6MbluqILeIzhWdtpP7/PyLq
 9Bgv0WFn6pOI0LvGqItxLsJxW0AtwqwFmzFmabQSPsjBW3TWuMcVxAo7obVbK/LPFCdTrONenyvpv
 J54MQDNS3+nyZuGMJ6YLQXUpNmLyUqTb9bY8yTHiNRVa8i1B9W5E8LtgTCwpklyPsxB2Ig69BxK8p
 QLCgOT3mYwr5FhjNXm+ZhS5dlxPW12WZbMxRGnpxsUhxlK1fWk4oqTslWhHF7kZp7lX4IbP6mjLwV
 7i9wSKpg==;
Received: from [93.159.154.34] (helo=ubuntu1804.localdomain)
 by smtp.megiteam.pl with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86.2_XX) (envelope-from <root@localdomain.pl>)
 id 1iWL5O-0005Ew-PG
 for wireguard@lists.zx2c4.com; Sun, 17 Nov 2019 14:59:31 +0100
From: Grzegorz Nosek <root@localdomain.pl>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Don't delete peers if not needed on `setconf`
Date: Sun, 17 Nov 2019 05:59:27 -0800
Message-Id: <20191117135928.3349-1-root@localdomain.pl>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:43:00 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Disclaimer: this patch has received only very light testing. Consider it
an invitation to discussion rather than battle-tested production code.

Disclaimer 2: I'm not subscribed, so please CC all replies.

Disclaimer 3: this is the first email ever I'm sending via git-send-email,
so please excuse any etiquette breaches :)

Without this patch, `wg setconf` causes a brief outage on the wg interface
since all peers are removed and have to be readded and redo the handshake.
I'm running WireGuard in a highly dynamic environment where peers come
and go and the reloads are frequent enough that the downtime is noticeable
(several seconds of downtime per minute isn't really acceptable for me).

Right now I'm working around by using `addconf` instead of `setconf`
and a bash one-liner in cron to clean the dead peers once in a while[*].

Still, I took a look at the driver code and it looks like it would be pretty
easy to not remove the peers unless they're really going away:
1. Mark all peers for potential deletion instead of removing them outright
2. Unmark any peer touched by set_peer (i.e. present in the netlink message)
3. Remove all marked peers

My patch basically does just that.

Please take a look and let me know what you think.

Thanks,
 Grzegorz Nosek

* Here's the one-liner if anyone cares :)

#!/bin/bash

INTERFACE=${1:-wg0}

diff -u <(wg showconf $INTERFACE | grep PublicKey | sort) <(grep PublicKey /etc/wireguard/$INTERFACE.conf | sort) | grep ^-PublicKey | awk '{ print $3 }' | xargs -iPEER wg set $INTERFACE peer PEER remove


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
