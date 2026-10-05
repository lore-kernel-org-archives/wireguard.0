Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99456CA5FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 04:26:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 86d42773;
	Mon, 5 Oct 2026 04:25:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bd637089
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Oct 2026 04:25:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id ABF4B43C3A;
 Mon,  5 Oct 2026 04:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4321F000FF;
 Mon,  5 Oct 2026 04:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791174353;
 bh=wGsAq8Av8hkcRTtIuwEPPVSfoWOz3RvyDwmn3cyaqok=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=EZdSj4JMZvsPfM3xR+bMKImk0D9m1I/+qNsbiEZHlB4Stop3zeKdCAYtnZPN7QdVi
 BRidQNP+6AvBXG08UjC6REQyf2JSHg9+7uA0xyIx3Sx5TVGgSudN2ePgENHR1ZQRg7
 Ls9qSBiczpt/d2li7SgWTYXk1v8ys0Pp9e8zdihY0g7fDT7uRK8D50pdL7KtoqRvPO
 mjkE2kurygkgxZ4KdvH6+5d/D15qmOWlySPJpp89Lktm1/M8g0MDb/GpT6HxX8tPG3
 qSwUTzEuB43ndLib/DyoFGNfjTRAVqwoXRBrV/TFXSxaN0H66uHqRfUgjiqqrKIn8K
 NLdoFLYPlaKLw==
Subject: Re: [PATCH] wireguard: allowedips: prevent stack overflow without
 DEBUG
From: netdev-bot+sashiko@kernel.org
To: quantumvoid0@proton.me
Cc: wireguard@lists.zx2c4.com, Jason@zx2c4.com, netdev@vger.kernel.org,
 kuba@kernel.org
Date: Mon, 05 Oct 2026 04:25:52 +0000
Message-ID: <179117435281.434549.17747961185403870914@kernel.org>
In-Reply-To: =?utf-8?q?=3CTaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4?=
 =?utf-8?q?Xtksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=3D=40pr?=
 =?utf-8?q?oton=2Eme=3E?=
References: =?utf-8?q?=3CTaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4X?=
 =?utf-8?q?tksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=3D=40pro?=
 =?utf-8?q?ton=2Eme=3E?=
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says production builds have "an unchecked
  stack[129] write" in push_rcu() (drivers/net/wireguard/allowedips.c),…
- [Low] The commit author is 'quantumvoid <quantumvoid0@proton.me>' but
  the Signed-off-by trailer says 'quantumvoid0 <quantumvoid0@proton.me>'.

--

wireguard: allowedips: prevent stack overflow without DEBUG

This commit changes push_rcu() so that the len >= MAX_ALLOWEDIPS_DEPTH
check is always evaluated and only the WARN is gated on DEBUG. The commit
message presents this as a fix for an unchecked stack[129] write in
production builds.

> push_rcu() only bounds-checked the traversal stack when
> DEBUG is defined. In production the check is compiled out,
> leaving an unchecked stack[129] write.

[Severity: Medium]
Is the stack[129] write actually reachable in the current tree? The trie
invariants seem to rule it out.

add() rejects a cidr larger than the address width:

    if (unlikely(cidr > bits || !peer))
        return -EINVAL;

On an exact prefix match, node_placement() reuses the existing node. When
a node is split, it gets this cidr:

    cidr = min(cidr, common_bits(down, key, bits));

That value is greater than the parent's cidr and smaller than the
children's cidr. So cidr strictly increases along every root-to-leaf path,
and a node with cidr == bits has no children. That caps any path at 129
nodes.

root_free_rcu() and root_remove_peer_lists() pop one node before pushing
at most two children. While a node at depth d is being handled, the stack
holds at most d + 2 <= 129 entries. A push with *len == 129 never happens,
so stack[129] is never written.

The DEBUG-only gating also looks deliberate. The selftest in
drivers/net/wireguard/selftest/allowedips.c builds a maximal-depth trie to
exercise this assertion. Commit 46622219aae2 ("wireguard: allowedips:
expand maximum node depth") sized the array to 129 for this reason and
fixed the real off-by-one there.

Could the commit message call this hardening of a debug-only invariant
check? The other option is to show a path that breaks the depth invariant.
As written, it reads as a fix for a reachable stack overflow, with no
trigger and no Fixes: tag.

> Signed-off-by: quantumvoid0 <quantumvoid0@proton.me>

[Severity: Low]
This isn't a bug, but the name in the Signed-off-by (quantumvoid0) does
not match the Author name (quantumvoid), even though the email is the
same. checkpatch.pl warns about this mismatch. Could the two be made
consistent?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/TaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4Xtksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ%3D%40proton.me
