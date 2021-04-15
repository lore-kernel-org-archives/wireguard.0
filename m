Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C77C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 15:53:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9988610EA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 15:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9988610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ewol.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2015c38f;
	Thu, 15 Apr 2021 15:53:27 +0000 (UTC)
Received: from jax4mhob25.registeredsite.com (jax4mhob25.registeredsite.com
 [64.69.218.113])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 937ecd2d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 14:02:20 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.85])
 by jax4mhob25.registeredsite.com (8.14.4/8.14.4) with ESMTP id 13FE2HlM139854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <wireguard@lists.zx2c4.com>; Thu, 15 Apr 2021 10:02:18 -0400
Received: (qmail 7380 invoked by uid 0); 15 Apr 2021 14:02:17 -0000
X-TCPREMOTEIP: 208.85.15.155
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net)
 (sbrown@opensat.com@208.85.15.155)
 by 0 with ESMTPA; 15 Apr 2021 14:02:17 -0000
Received: from localhost (localhost [127.0.0.1])
 by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id B403715668C0
 for <wireguard@lists.zx2c4.com>; Thu, 15 Apr 2021 10:02:16 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at ewol.com
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
 by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrxC_gqqI_2G for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 10:02:14 -0400 (EDT)
Received: from [192.168.1.226] (unknown [192.168.1.226])
 by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id BC9B415668B2
 for <wireguard@lists.zx2c4.com>; Thu, 15 Apr 2021 10:02:14 -0400 (EDT)
Message-ID: <7a8e0f8f25c43effb17b01e6344678ba9c6462a6.camel@ewol.com>
Subject: Keep alive being sent when PersistentKeepalive = 0
From: Steve Brown <sbrown@ewol.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 15 Apr 2021 10:02:14 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 15 Apr 2021 15:53:26 +0000
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

I have no PersistentKeepalive set, but the peer gets sent a keep alive
every 60 seconds anyway.

This is verified by the both the wireguard log on the sending side and
firewall log on the receiving side. The peer is nat'd and sends its own
keep alive every 15 seconds. 

wg showconf <intf> doesn't show a keep alive value for the peer.

This isn't a problem other than a little noise in the log. The packet
gets dumped by the peer's firewall.

I'm running openwrt with kernel 5.10.23.

Steve




