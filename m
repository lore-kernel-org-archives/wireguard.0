Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8DAC282D7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 19:54:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C96920989
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 19:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C96920989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ea1d1a3;
	Wed, 30 Jan 2019 19:48:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18c0c0bf
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 19:48:43 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 248fa2ef
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 19:48:43 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 100331E3049;
 Wed, 30 Jan 2019 14:54:44 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-174-76-218-225.om.om.cox.net
 [174.76.218.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id D0B621E3043;
 Wed, 30 Jan 2019 14:54:43 -0500 (EST)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Wed, 30 Jan 2019 13:54:43 -0600
Subject: wg setconf: ignore Endpoint= DNS failure
Message-Id: <B9EB3ADC-C243-4414-AD97-E68E61BF9325@lonnie.abelbeck.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3445.102.3)
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

Hi Jason and list,

I would like to discuss changing WG's current handling of an Endpoint= DNS failure with "wg setconf ...".

Currently)
"Configuration parsing error",  the configuration is aborted, keeping WG from starting.

Proposed)
Ignore the DNS error, do not change the "endpoint", and continue parsing the configuration so WG can be started.
The current stderr DNS error message will continue to be generated.
Optionally, some users may want to call "reresolve-dns.sh" [1] or similar at a later time(s) to update the DNS derived "endpoint".


I have tested this trivial patch to accomplish the proposed change:
Note: The config.c parse_endpoint() function provides additional sanity checking, only the DNS failure would allow parsing to continue.

--- wireguard-0.0.20190123/src/tools/config.c.orig	2019-01-30 09:02:53.685777217 -0600
+++ wireguard-0.0.20190123/src/tools/config.c	2019-01-30 09:03:44.253387871 -0600
@@ -241,7 +241,7 @@
				timeout >= 90000000) {
			free(mutable);
			fprintf(stderr, "%s: `%s'\n", ret == EAI_SYSTEM ? strerror(errno) : gai_strerror(ret), value);
-			return false;
+			return true;
		}
		fprintf(stderr, "%s: `%s'. Trying again in %.2f seconds...\n", ret == EAI_SYSTEM ? strerror(errno) : gai_strerror(ret), value, timeout / 1000000.0);
		usleep(timeout);


This change effects:
--
wg setconf ...
wg addconf ...
wg set ... endpoint <ip>:<port> ...
--

I propose this will make WireGuard configuration more robust, minimizing the effect of an Endpoint= DNS failure.


Lonnie

[1] https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns/reresolve-dns.sh


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
