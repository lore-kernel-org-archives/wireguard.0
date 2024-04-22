Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D80D49229
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:13:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a63c4ef;
	Mon, 18 Nov 2024 12:45:10 +0000 (UTC)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 602885c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2024 09:21:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNKWS1hfjz4wyh;
 Mon, 22 Apr 2024 19:21:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: msuchanek@suse.de, herbert@gondor.apana.org.au, wireguard@lists.zx2c4.com,
 dtsen@linux.ibm.com
In-Reply-To: <20240328130200.3041687-1-mpe@ellerman.id.au>
References: <20240328130200.3041687-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/crypto/chacha-p10: Fix failure on non Power10
Message-Id: <171377768068.1735812.767688634260933265.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 19:21:20 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

On Fri, 29 Mar 2024 00:02:00 +1100, Michael Ellerman wrote:
> The chacha-p10-crypto module provides optimised chacha routines for
> Power10. It also selects CRYPTO_ARCH_HAVE_LIB_CHACHA which says it
> provides chacha_crypt_arch() to generic code.
> 
> Notably the module needs to provide chacha_crypt_arch() regardless of
> whether it is loaded on Power10 or an older CPU.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/crypto/chacha-p10: Fix failure on non Power10
      https://git.kernel.org/powerpc/c/69630926011c1f7170a465b7b5c228deb66e9372

cheers
