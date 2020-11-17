Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023A2C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 09:52:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220302464E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 09:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8JgK5rj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220302464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d14c2e5;
	Tue, 17 Nov 2020 09:48:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 395dc23a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 09:48:15 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF05D222EC
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605606769;
 bh=Rlig78Pb0uNLGtJ3Ok3/qbYM5Uv76h75XO55+CP1Hoc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b8JgK5rjS0eWIsAaQ5NJsimjam/qFv5MqW73dzOIHIyU01Hf5B+KNpAGmpEpbhKDm
 5e2u4lkx+KLqiYiq5pt0ujMlXVbdLW3L5LstK7M3puWPgG+V4HX2X5Xm9KZP5kIeZm
 2H+8ceHn3PRFWSYgHaipCnc6q4/FxG3L4QVJ/qT0=
Received: by mail-ot1-f41.google.com with SMTP id 79so18790353otc.7
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 01:52:49 -0800 (PST)
X-Gm-Message-State: AOAM532hRlOxovy1FuQwBqLHIs/uNKzwXcbZLn799ZiZi15SAHl8lwyG
 nf/7UTLI59DQiUawhT4lZCzNQgOb/qvmULIBLk8=
X-Google-Smtp-Source: ABdhPJyl1veztj6xiVYIvHL1ACH898Blx8LCS43ezyXrRZd/YpBL7x33Vt0bx7C4pNsMQ/C5ZZKBoeRcjHgC635KvDk=
X-Received: by 2002:a9d:62c1:: with SMTP id z1mr2396047otk.108.1605606768928; 
 Tue, 17 Nov 2020 01:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20201117021839.4146-1-a@unstable.cc>
 <CAMj1kXFxk31wtD3H8V0KbMd82UL_babEWpVTSkfqPpNjSqPNLA@mail.gmail.com>
 <5096882f-2b39-eafb-4901-0899783c5519@unstable.cc>
In-Reply-To: <5096882f-2b39-eafb-4901-0899783c5519@unstable.cc>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 17 Nov 2020 10:52:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGZATR7XyFb2SWiAxcBCUzXgvojvgR9fHczEu9zrpF9ug@mail.gmail.com>
Message-ID: <CAMj1kXGZATR7XyFb2SWiAxcBCUzXgvojvgR9fHczEu9zrpF9ug@mail.gmail.com>
Subject: Re: [PATCH cryptodev] crypto: lib/chacha20poly1305 - allow users to
 specify 96bit nonce
To: Antonio Quartulli <a@unstable.cc>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 wireguard@lists.zx2c4.com, 
 "open list:BPF JIT for MIPS (32-BIT AND 64-BIT)" <netdev@vger.kernel.org>,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Antonio Quartulli <antonio@openvpn.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 17 Nov 2020 at 10:47, Antonio Quartulli <a@unstable.cc> wrote:
>
> Hi,
>
>
> On 17/11/2020 09:31, Ard Biesheuvel wrote:
> > If you are going back to the drawing board with in-kernel acceleration
> > for OpenVPN, I strongly suggest to:
> > a) either stick to one implementation, and use the library interface,
> > or use dynamic dispatch using the crypto API AEAD abstraction, which
> > already implements 96-bit nonces for ChaCha20Poly1305,
>
> What we are implementing is a simple Data Channel Offload, which is
> expected to be compatible with the current userspace implementation.
> Therefore we don't want to change how encryption is performed.
>
> Using the crypto API AEAD abstraction will be my next move at this point.
>

Aren't you already using that for gcm(aes) ?

> I just find it a bit strange that an API of a well defined crypto schema
> is implemented in a way that accommodates only some of its use cases.
>

You mean the 64-bit nonce used by the library version of
ChaCha20Poly1305? I agree that this is a bit unusual, but a library
interface doesn't seem like the right abstraction for this in the
first place, so I guess it is irrelevant.

>
> But I guess it's accepted that we will have to live with two APIs for a bit.
>
>
> > b) consider using Aegis128 instead of AES-GCM or ChaChaPoly - it is
> > one of the winners of the CAESAR competition, and on hardware that
> > supports AES instructions, it is extremely efficient, and not
> > encumbered by the same issues that make AES-GCM tricky to use.
> >
> > We might implement a library interface for Aegis128 if that is preferable.
>
> Thanks for the pointer!
> I guess we will consider supporting Aegis128 once it gets standardized
> (AFAIK it is not yet).
>

It is. The CAESAR competition is over, and produced a suite of
recommended algorithms, one of which is Aegis128 for the high
performance use case. (Note that other variants of Aegis did not make
it into the final recommendation)
