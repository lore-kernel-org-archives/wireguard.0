Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B3ACD98F2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2026 15:56:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 745d1da8;
	Fri, 19 Jun 2026 15:56:39 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d2a899c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jun 2026 15:56:37 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Authentication-Results: mail.toke.dk; dkim=none
To: wireguard@lists.zx2c4.com
Cc: netdev@vger.kernel.org
Subject: Wireguard head of line blocking when CPUs saturate
Date: Fri, 19 Jun 2026 17:56:34 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <874iiyfrrh.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

Hey everyone

I'm running Wireguard on my main gateway, which is a not-super-high
powered ARM box with eight cores (based on the NXP LS1088A SoC). The box
does, however, also have eight hardware queues for its networking, which
means regular network traffic can be spread nicely across the cores.

However, the per-core performance is limited, making it pretty trivial
to saturate a single core by just running a fat TCP flow through it. And
when this happens, Wireguard traffic just... stalls. I.e., no traffic
gets through the Wireguard interface until the (unrelated) flow
saturating one of the cores subsides.

I suspect what happens is that Wireguard spreads out traffic to all
cores for encryption, but has to wait for the respective CPUs to finish
encrypting the packets in order before they can actually be transmitted.
And because one CPU is now suddenly saturated in softirq context, the
Wireguard work queue never gets a chance to run on that CPU, stalling TX
progress for the Wireguard device entirely.

I'm sending this message to (a) see if anyone else is seeing the same
kind of stalling, and (b) to get input on whether the explanation
outlined above seems plausible. And, in the case of affirmative answers
to both (a) and (b), to hopefully start a discussion on what to do about
this :)

-Toke
