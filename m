Return-Path: <SRS0=8LIe=UI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569D2C28EBD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jun 2019 19:59:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD2D206C3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jun 2019 19:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD2D206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 312bc70e;
	Sun, 9 Jun 2019 19:59:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da38ca2e
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jun 2019 19:59:03 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af95158b
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jun 2019 19:59:03 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 1F5B41E3053
 for <wireguard@lists.zx2c4.com>; Sun,  9 Jun 2019 15:59:03 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-81.om.om.cox.net
 [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id E79051E302F
 for <wireguard@lists.zx2c4.com>; Sun,  9 Jun 2019 15:59:02 -0400 (EDT)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: RFC: wg syncpeers wg0 wireguard.conf
Message-Id: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
Date: Sun, 9 Jun 2019 14:59:01 -0500
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
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

Hi List, Request For Comments:

I would find it useful if "wg" would support a "syncpeers" subcommand.
--
Usage: wg syncpeers <interface> <configuration filename>
--
Available subcommands:
  syncpeers: Synchronizes a configuration file of peers to a WireGuard interface
--

Given:
- A user creates a wireguard.conf file.

- Uses "wg setconf wg0 wireguard.conf" to apply the configuration.

Request:
- Later, a user edits a wireguard.conf file: adds peers, deletes peers, and/or edits peers.

- Use "wg syncpeers wg0 wireguard.conf" to synchronize the configuration file of peers with the current state.

- Synchronize changes with minimal impact, determine peer differences and leave unchanged settings alone.

- Basically internally using "wg set wg0 ..." to make the minimum changes.

- If the [Peer] Endpoint is a DNS hostname, the Endpoint will be resolved and IP updated.

Note: Interestingly, "wg setconf wg0 wireguard.conf" *almost* performs as requested except for a 17 second interruption of the tunnel *if* PersistentKeepalive is 0.  Even if PersistentKeepalive is 3600, a "wg setconf wg0 wireguard.conf" will not effect an active tunnel except for resetting traffic counters.

I understand a script could be created to perform this as well, but adding it to "wg" lowers the hurdle for many users.

If the 17 second interruption of active tunnels while using "wg setconf wg0 wireguard.conf" could be eliminated, this request may be moot.

Comments please.

Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
