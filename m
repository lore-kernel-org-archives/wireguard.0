Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03C9C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jan 2019 00:20:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8344A206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jan 2019 00:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8344A206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fdbd62d;
	Thu, 17 Jan 2019 00:16:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a37e7f0
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 00:16:41 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54c765a1
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 00:16:40 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1gjvQa-0006h3-Te; Thu, 17 Jan 2019 00:21:00 +0000
Date: Thu, 17 Jan 2019 00:21:00 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: pdub <pdub@pdub.net>
Subject: Re: WireGuard roaming behind a load balancer
Message-ID: <20190117002100.GA24923@matrix-dream.net>
References: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
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

Wireguard isn't completely stateless. It has connections and state,
even though it is comparably small and transient.

Wireguard roaming supports changing IPs. An authenticated
packet updates the ip and all works well. Changing hosts requires
a rekey (to re-establish transient keys), and that won't be
automatically triggered by unauthenticated gibberish, so plain
switching won't work immediately.

If you don't mind a relatively short outage when switching,
it should work fine.


In your setup, where H,A,B are wg nodes, and
  (H)A - B
is switched to
  (A)H - B

B->HA traffic will be lost (considered junk) until either

 - B's timer expires and a B->H rekey is issued (maybe 10s of seconds?)
 - H->B traffic and/or timer initiates a H->B rekey

If HA can initate traffic to B, you may be able to rig a rekey soon,
with a <1s outage, or even lossless in some circumstances, but you are
going against the design of a host-to-host "stateless" vpn.

Real hot-standby HA VPNs with transparent lossless switching
on the HA side usually share their ephemeral keys.

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
