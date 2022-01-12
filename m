Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3642DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jan 2022 18:42:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a812c0db;
	Wed, 12 Jan 2022 18:35:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 92c099da
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 18:35:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DD0C616C1;
 Wed, 12 Jan 2022 18:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44133C36AE5;
 Wed, 12 Jan 2022 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642012540;
 bh=zP4n5siVZnpIyHLJdzM1lw+loF13BYSmPiQZisa6tuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHNf8poxGDbn8OXvXbyU/lgYy4gLXmPWkzVfGXNfqOB2rXeXy/W1Var/4aL2lIAvB
 OhuzmRV/vQbjXdyFojxfOEPhVrR9nkVSbjivDRo+1CtuXg/pmXXu84/qkp1bL/K8nR
 0KRfwxpeQLAAqjIL5feVPmbMOQ5F6ThYGoVMz9+L2n1+nOy4eIxtdgwxD9ii5ucviE
 GJFvN2dVy5lhY8b7rcUtXYfjQW+x51XYSVsJ/LOzt/VsioJZLT4nARhyAhMADVRtKW
 sbGW18ON579dWzPLEKzGOOONxjB0AxJkMXYZKNrn1qsNZHeuPvWeuMU1TdFM4g0/uy
 Ic9DHW18rj0xA==
Date: Wed, 12 Jan 2022 10:35:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, geert@linux-m68k.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, jeanphilippe.aumasson@gmail.com,
 ardb@kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH crypto 2/2] lib/crypto: blake2s: move hmac construction
 into wireguard
Message-ID: <Yd8fevK3n5aACJMF@gmail.com>
References: <CAHmME9qbnYmhvsuarButi6s=58=FPiti0Z-QnGMJ=OsMzy1eOg@mail.gmail.com>
 <20220111134934.324663-1-Jason@zx2c4.com>
 <20220111134934.324663-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111134934.324663-3-Jason@zx2c4.com>
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

On Tue, Jan 11, 2022 at 02:49:34PM +0100, Jason A. Donenfeld wrote:
> Basically nobody should use blake2s in an HMAC construction; it already
> has a keyed variant. But for unfortunately historical reasons, Noise,
> used by WireGuard, uses HKDF quite strictly, which means we have to use
> this. Because this really shouldn't be used by others, this commit moves
> it into wireguard's noise.c locally, so that kernels that aren't using
> WireGuard don't get this superfluous code baked in. On m68k systems,
> this shaves off ~314 bytes.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: wireguard@lists.zx2c4.com
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric
