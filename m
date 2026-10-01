Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F6CA5FB3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2026 04:13:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 531f590b;
	Thu, 1 Oct 2026 04:13:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 158ff675
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2026 04:13:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 003C560A55;
 Thu,  1 Oct 2026 04:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A081F0089B;
 Thu,  1 Oct 2026 04:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790827979;
 bh=Z9zRtXHe/J1k/4/9wAeq1n+PwAt+ioXmV3zyjSNrjDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PcFG0Cwqmnc5kO+Ob37GXSkROkBoqftjQhbxHgtKwwifpRTViJZ3Li8BAKiGoO3f7
 57vPD/7pc6ngYPdpzvjHv6ThAxcDrPBukL4Rl3Ysq4/IE1ECzuHRg+ryb95hPu3Edd
 8IdDm6PKuvE7hJMO2HJIe143jA2JQIti6Dg9Hgjmfh3iQEfSAjhbeJe+NlJX01b5az
 dTzk8ubq3FwFc4Bv5xq6DDca9+QhmvI5+S2b1dIylidCNVOnlYpO+r3YECFsuNvz9B
 dJZrQzPwXFuicUtcAe5cgJqFIrbFArOTpn21a+/NCD8LItE+Sm7xLYYr79X7KVQnxn
 QKQujhqW/qpiA==
From: netdev-bot+sinfo@kernel.org
To: quantumvoid <quantumvoid0@proton.me>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH] wireguard: allowedips: prevent stack overflow without
 DEBUG
Date: Thu, 01 Oct 2026 04:12:58 +0000
Message-ID: <179082797895.31693.1113127384991730242@kernel.org>
In-Reply-To: =?utf-8?q?=3CTaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4?=
 =?utf-8?q?Xtksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=3D=40pr?=
 =?utf-8?q?oton=2Eme=3E?=
References: =?utf-8?q?=3CTaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4X?=
 =?utf-8?q?tksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=3D=40pro?=
 =?utf-8?q?ton=2Eme=3E?=
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
