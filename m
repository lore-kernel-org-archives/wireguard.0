Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AFFC43219
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jan 2022 22:05:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 71c32f6a;
	Tue, 11 Jan 2022 22:05:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 79558a8a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jan 2022 22:05:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3F39B81D61;
 Tue, 11 Jan 2022 22:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE47AC36AE9;
 Tue, 11 Jan 2022 22:05:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Otbpq+tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1641938716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Cdvgb4D8xjNM3H+eoQR37WQXKMdUq8WCPEoF9YXne4=;
 b=Otbpq+tuY/czAeOvirwPCnRnA5W1Z0lop+JXW67s7Lz46Zl9pDHR+jP7TrsEUbDBLPjOzC
 3Q4vPoPAEXPaKVdGLtVNmtZtOhZSAjLTLll/ETmNDw58C/ABxgECsIcTogKlySB1cl/Heg
 /Lt96wXjiFZB1UVNbp/75PYhacTxhcI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f2775939
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 11 Jan 2022 22:05:15 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, geert@linux-m68k.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, jeanphilippe.aumasson@gmail.com,
 ardb@kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH crypto v3 0/2] reduce code size from blake2s on m68k and other
 small platforms
Date: Tue, 11 Jan 2022 23:05:04 +0100
Message-Id: <20220111220506.742067-1-Jason@zx2c4.com>
In-Reply-To: <20220111181037.632969-1-Jason@zx2c4.com>
References: <20220111181037.632969-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

Geert emailed me this afternoon concerned about blake2s codesize on m68k
and other small systems. We identified two effective ways of chopping
down the size. One of them moves some wireguard-specific things into
wireguard proper. The other one adds a slower codepath for small
machines to blake2s. This worked, and was v1 of this patchset, but I
wasn't so much of a fan. Then someone pointed out that the generic C
SHA-1 implementation is still unrolled, which is a *lot* of extra code.
Simply rerolling that saves about as much as v1 did. So, we instead do
that in this patchset. SHA-1 is being phased out, and soon it won't
be included at all (hopefully). And nothing performance-oriented has
anything to do with it anyway.

The result of these two patches mitigates Geert's feared code size
increase for 5.17.

v3 improves on v2 by making the re-rolling of SHA-1 much simpler,
resulting in even larger code size reduction and much better
performance. The reason I'm sending yet a third version in such a short
amount of time is because the trick here feels obvious and substantial
enough that I'd hate for Geert to waste time measuring the impact of the
previous commit.

Thanks,
Jason

Jason A. Donenfeld (2):
  lib/crypto: blake2s: move hmac construction into wireguard
  lib/crypto: sha1: re-roll loops to reduce code size

 drivers/net/wireguard/noise.c | 45 ++++++++++++++---
 include/crypto/blake2s.h      |  3 --
 lib/crypto/blake2s-selftest.c | 31 ------------
 lib/crypto/blake2s.c          | 37 --------------
 lib/sha1.c                    | 95 ++++++-----------------------------
 5 files changed, 53 insertions(+), 158 deletions(-)

-- 
2.34.1

