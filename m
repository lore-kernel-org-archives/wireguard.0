Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24450C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 09:47:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C8F2168B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 09:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C8F2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unstable.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0aa19e9;
	Tue, 17 Nov 2020 09:42:29 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9977fc20
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 09:42:27 +0000 (UTC)
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 wireguard@lists.zx2c4.com,
 "open list:BPF JIT for MIPS (32-BIT AND 64-BIT)" <netdev@vger.kernel.org>,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 Antonio Quartulli <antonio@openvpn.net>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20201117021839.4146-1-a@unstable.cc>
 <CAMj1kXFxk31wtD3H8V0KbMd82UL_babEWpVTSkfqPpNjSqPNLA@mail.gmail.com>
From: Antonio Quartulli <a@unstable.cc>
Subject: Re: [PATCH cryptodev] crypto: lib/chacha20poly1305 - allow users to
 specify 96bit nonce
Message-ID: <5096882f-2b39-eafb-4901-0899783c5519@unstable.cc>
Date: Tue, 17 Nov 2020 10:45:52 +0100
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFxk31wtD3H8V0KbMd82UL_babEWpVTSkfqPpNjSqPNLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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


On 17/11/2020 09:31, Ard Biesheuvel wrote:
> If you are going back to the drawing board with in-kernel acceleration
> for OpenVPN, I strongly suggest to:
> a) either stick to one implementation, and use the library interface,
> or use dynamic dispatch using the crypto API AEAD abstraction, which
> already implements 96-bit nonces for ChaCha20Poly1305,

What we are implementing is a simple Data Channel Offload, which is
expected to be compatible with the current userspace implementation.
Therefore we don't want to change how encryption is performed.

Using the crypto API AEAD abstraction will be my next move at this point.

I just find it a bit strange that an API of a well defined crypto schema
is implemented in a way that accommodates only some of its use cases.


But I guess it's accepted that we will have to live with two APIs for a bit.


> b) consider using Aegis128 instead of AES-GCM or ChaChaPoly - it is
> one of the winners of the CAESAR competition, and on hardware that
> supports AES instructions, it is extremely efficient, and not
> encumbered by the same issues that make AES-GCM tricky to use.
> 
> We might implement a library interface for Aegis128 if that is preferable.

Thanks for the pointer!
I guess we will consider supporting Aegis128 once it gets standardized
(AFAIK it is not yet).


Best Regards,


-- 
Antonio Quartulli
