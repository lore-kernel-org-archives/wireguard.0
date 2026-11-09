Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D8606A321
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2026 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZBBah3C
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 307610b7;
	Mon, 9 Nov 2026 15:21:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3dbe03c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Nov 2026 15:21:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C5DD463293;
 Mon,  9 Nov 2026 15:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30061F008A1;
 Mon,  9 Nov 2026 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794237659;
 bh=ZEDcgpZXv7tELS5BnebtNXmUzNMs+qj+jNMbQJ/Z9P0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=jZBBah3CEkuczstxqzX0W1hJaSHbQ6sNIED+xrfJzrJGbzEChuY2EKDdrLMgSbkx2
 ylxbq0P2ml//UkOYXNdWLTf7OEKwJLrIIOBBsQzmEMKCK3SqADe5F4WZETLTb7zA8A
 a47U9w+I1CUP434aQL5ZGT8Vpnc6yJmOdRqhXhE1Iq/NRtkx+EEHAd0RocqzRIYMTl
 KbOIaHSefN+6vUoujGxCFTKjtpG13FR2TIMuVE/85q7B5ZW6Yfpg1Cxw75XRB4/YbZ
 aSDJUlCg4uxrqcUu7EvPpseuAO5gOZeN0bVMBsX2ZeIaUMG0LsSovmxxkn3TATm6sj
 lFUrBAIRsOSNw==
Subject: Re: [PATCH net 2/2] wireguard: noise: recheck replay and flood under
 write lock on initiation
From: netdev-bot+sashiko@kernel.org
To: alex@badcode.im
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Mon, 09 Nov 2026 15:20:58 +0000
Message-ID: <179423765848.994134.12106914820524986319@kernel.org>
In-Reply-To: <20261105141006.95083-3-alex@badcode.im>
References: <20261105141006.95083-3-alex@badcode.im>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message names the response-side fix as `commit
  2a73c9b2c0ca ("wireguard: noise: reject response consumption after…

--

wireguard: noise: recheck replay and flood under write lock on initiation

This commit makes wg_noise_handshake_consume_initiation() run the replay
and flood checks a second time after taking handshake->lock for writing.
Without the second check, two copies of the same initiation processed in
parallel could both get past the read-locked check. The read-locked check
stays as a fast path for rejecting replays.

> This is the initiation-side counterpart of the response-side race fixed
> by:
> commit 2a73c9b2c0ca ("wireguard: noise: reject response consumption after intermediate initiation")

[Severity: Low]
Is this the right hash for the referenced commit? 2a73c9b2c0ca doesn't
resolve here. git log reports it as an unknown revision.

The commit with this subject appears to be:

commit d0305f8d9002 ("wireguard: noise: reject response consumption after intermediate initiation")

Running git blame on the response-side recheck under down_write() in
wg_noise_handshake_consume_response() also points to d0305f8d9002:

    if (handshake->state != state ||
        crypto_memneq(handshake->ephemeral_private, ephemeral_private, NOISE_PUBLIC_KEY_LEN)) {

Could the reference be changed to d0305f8d9002? This patch is tagged for
stable, so readers who follow the cited hash to the related fix would
find the right commit.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105141006.95083-1-alex%40badcode.im
