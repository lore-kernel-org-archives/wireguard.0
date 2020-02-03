Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C955C35247
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:35:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBEAB2087E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=firemail.cc header.i=@firemail.cc header.b="pxSFrnLn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBEAB2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=firemail.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 995e701c;
	Mon, 3 Feb 2020 17:33:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6ba82c5
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 00:44:40 +0000 (UTC)
Received: from cock.li (cock.li [IPv6:2a06:1700:0:b::c0cc])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed7d1984
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 00:44:40 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firemail.cc; s=mail;
 t=1580690714; bh=ON3kMkfK5/Pg4c7Tqjtd7jFqIIXoCtb3xxf1OWw80PI=;
 h=Date:From:To:Subject:From;
 b=pxSFrnLnO5H7CTSwc8jr/FIJn6td+zINqovZApOVAZXsA71DRMDegMGL1k092mHny
 oqJ1hZegpUG2mTw9Wzowi2UOzjBT14TZ+/Ep3Klgpl9mrNm4DT9g8NE2wxKMDjf/0L
 fQZsp+LUeZowd7Ui6dgsqIdqsfwOE3wso9zBsbhADyw/AlyXqY9i7N6c6XckfFIF3d
 fDNAHrml2ABFWUn9WjKVO4xp2t0VcWL8AL1eltwvPXIh/YFvBiOhRQFBajFfhgy+6d
 PXNFsHTG6lOrvmO6GTmqrUOVsaF4dNKomJYf6NG+B5/w9fAXIl4Yy5BDpDSqYAEs8E
 H6/jIuRAF6bSg==
Date: Mon, 03 Feb 2020 00:45:14 +0000
From: magicmuffin@firemail.cc
To: wireguard@lists.zx2c4.com
Subject: DNS Client dependency glitch in Windows binaries
Message-ID: <4a39f476622c4535167787faf3c9fad5@firemail.cc>
X-Sender: magicmuffin@firemail.cc
User-Agent: Roundcube Webmail/1.3.10
X-Mailman-Approved-At: Mon, 03 Feb 2020 18:33:16 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Windows the Wireguard client will halt activating a tunnel if:
-The DNS Client service is disabled
-The DNS Client service is enabled, but the hosts file of the operating 
system has sufficiently many entries that it causes the DNS Client to 
lag, which causes a timeout in Wireguard that brings the tunnel down. 
This usually happens when the hosts file is a few megabytes large.

Workarounds:
-Ensure the DNS Client service is not disabled
-Rename the hosts file before bringing the tunnel up
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
