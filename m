Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Jan 2022 16:09:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 566e4292;
	Tue, 25 Jan 2022 16:09:04 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id de3ec9f9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jan 2022 06:42:43 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1n9iCJ-0007NZ-N3; Tue, 18 Jan 2022 17:42:28 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 18 Jan 2022 17:42:28 +1100
Date: Tue, 18 Jan 2022 17:42:28 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: geert@linux-m68k.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, jeanphilippe.aumasson@gmail.com,
 ardb@kernel.org
Subject: Re: [PATCH crypto v3 0/2] reduce code size from blake2s on m68k and
 other small platforms
Message-ID: <YeZhVGczxcBl0sI9@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rxdksVZkN4DF_GabsEPrSDrKbo1cVQs77B_s-e2jZ64A@mail.gmail.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi, apana.lists.os.linux.kernel,
 apana.lists.os.linux.netdev
X-Mailman-Approved-At: Tue, 25 Jan 2022 16:09:01 +0000
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

Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Excellent, thanks for the breakdown. So this shaves off ~4k, which was
> about what we were shooting for here, so I think indeed this series
> accomplishes its goal of counteracting the addition of BLAKE2s.
> Hopefully Herbert will apply this series for 5.17.

As the patches that triggered this weren't part of the crypto
tree, this will have to go through the random tree if you want
them for 5.17.

Otherwise if you're happy to wait then I can pull them through
cryptodev.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
