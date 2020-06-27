Return-Path: <SRS0=xwVK=AI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F29C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 21:44:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DAB8206D7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 21:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc9x3DX9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DAB8206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac5afb94;
	Sat, 27 Jun 2020 21:25:10 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [2a00:1450:4864:20::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6082773a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 21:25:08 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e4so13923403ljn.4
 for <wireguard@lists.zx2c4.com>; Sat, 27 Jun 2020 14:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0o2hOG+x6X38sZKVzpP4q6CShr5R4cIzur0TQuWlZg4=;
 b=Zc9x3DX95wPdIFjsygJkKtMCuTVMDOcjQKLsu1icdCgX9qcfh8HdHvrpikTDoLEj5U
 Mx3MSWDLQ4KR9kr3/5q4Nw/AhB2offlxO6m/nXf8EYOVKgtQky9TnChVkDUdn9vxncof
 KTIFJCpuMj/bQbtZ3lpPeAKKm9X+b6oPvmW/M8LRRll1uEBXuhf2jY/5OAcSVnCWFBH5
 QXdbvbVdke6e4+ZnKojRRPQzWaFhtA+oRsoo7ygXrv5EWzG5aNAXkISRBXZD0++QZuie
 dbxgT2qUWvHmnCaxV5pV1LDTwOwomn0Tlvtsasdjp57nemlQTn0+t7+c4pKlkAMwWZd1
 18FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0o2hOG+x6X38sZKVzpP4q6CShr5R4cIzur0TQuWlZg4=;
 b=PfEryesURQBcXt/N0VikWgnplFu4EbSAj2y9SHIb66gigHzSq2Ubflz7Eql/SVCB41
 9Obew5lTs9aWNc8Ji0JTHwgODfN2T+2/zDq2hcBMrpcliywDpxMBeBKBmKKuchRsnCI+
 SdrK2TubPA2G3uYWKc01UtS1lXgrb6wIstZPyH6BEKwH/MLpYryVrgeVVnSVtmig6VQo
 oOSys1ffnw/81JuViUFABLEYdgF08wHkGjLXYdzIfIVNE1eaGvmo1FlCzH8AHP/TaMC+
 J7NPGbTQ28XWcvTmITIGsbOq3iLXM/Rm30vdfB22FkOWm/eVtgEw+ED5YRtt4ZCvFzer
 bM3Q==
X-Gm-Message-State: AOAM530h3hOH50q9CB/nnIzeWmdOF5OwZLOFNQxDeyIovQjUJbX0QFpE
 9yFMY9dz0YfLJwO/IOWmJqSoh8E6G/cR1m1OUUCxYjqd
X-Google-Smtp-Source: ABdhPJzFxjy+kxWvkNctonqcsPTpnR45dfyfvjYwzKqE3cYkEMgiI6kGqXmUaI8ifdZHVXTwzPwVKEEfIKZ1s0xc660=
X-Received: by 2002:a2e:a495:: with SMTP id h21mr4642611lji.436.1593294273008; 
 Sat, 27 Jun 2020 14:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
In-Reply-To: <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Sat, 27 Jun 2020 17:43:56 -0400
Message-ID: <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: ch@ntrv.dk
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I've been working on this a bit from a completely independent
perspective: bootstrapping embedded systems which have a persistent
keypair, but no persistent storage for stuff like `AllowedIPs`
assignments. In my usecase, the by-convention assignment of an IPv6
link-local address to each WireGuard peer allows a gossip-style
protocol to update a newly-joined node with a (signed) set of
configuration parameters, including the `AllowedIPs` entries that
enable more comprehensive communication.

The fact that the assignment of cryptographically-bound IPv6 LLAs has
independently occurred to multiple parties now is not lost on me --
it's usually a sign of good design! I also agree that this type of
thing makes a lot more sense in the context of `wg-quick` than the
kernel module or `wg` tools themselves. However, care should be taken
to make sure that all potential implementations can adopt it without
extra overhead. For this reason, I'm biased towards simplicity in the
specification, not necessarily simplicity of implementation as part of
`wg-quick`. I would caution that the decision of how to generate and
assign addresses from public keys should be treated as a layer-3
problem. Each IPv6 network device is *required* to have a link-local
address by the RFC -- even if you can get away without one in practice
this makes it clear that the proper conceptual home of LLA assignment
is in the realm of bits and bytes, rather than strings and pipes --
even if its appropriate place in the architecture of the *reference
implementation* is in a optional shell script.

One more point of clarification: ULAs are in the `fc00::/7` space,
while LLAs are in `fe80::/10`. LLAs are what we want, because they are
explicitly interface-scoped -- and that means that they can be counted
on to be always be bound to the peer, no matter what the specific
network configuration of the node might be. Sending a packet to
`fe80::dead:beef%wg0` will always refer to a specific peer on the
`wg0` interface, and provides a guarantee that the contents of that
packet will be transmitted securely; whereas sending to
`fc00::dead:beef` *might* be on the `wg0` interface, but to be sure
you'd have to know that you didn't have a route to that address via
any other interface. This might be true on some -- or most -- nodes,
but it's not something that can be assumed. This makes
cryptographically-derived ULAs much less useful than
cryptographically-*bound* LLAs.

# OK, so how do we do it?
The general idea of using a hash to generate an IPv6 LLA is fairly
straightforward (and obvious, given that several people have come up
with it independently), but there are still some points that require
standardization. I think I have an exhaustive list of the points of
divergence that must be addressed; I will discuss each of them and my
perspective.

## What netmask should be used?
**fe80::/10.**

The IPv6 RFCs separate the address into a subnet and interface
identifier, which would seem to indicate that something like
`fe80::/64` should be used instead; however, by their very nature
link-local addresses are not part of a subnet. In addition, it is
desirable that each address be bound as strongly as possible to the
key it is derived from -- 118-bit security is a lot closer to 128-bit
than 64-bit security.

## Should the subnet identifier be concatenated with the results of
the hash, or should leading bits of the hash be dropped?
**(SUBNET & MASK) | (HASH & ~MASK)**

Binary math is good, cheap, and obvious, whereas concatenation is only
straightforward if the netmask is a whole number of bytes. Otherwise
you have to bitshift everything and it just gets messy. Besides, it's
a net*mask* -- seems like you should use it to *mask* things.

## Should the hash be taken over the key itself, or the Base64
encoding of the key?
**The key itself.**

While the tools are fairly consistent in the use of the Base64
encoding in user-facing scenarios, it's important to consider that
there's nothing fundamental about the WireGuard protocol itself that
requires the use of Base64 anywhere. I argue that it would be
inappropriate to introduce a dependency on it at such a low level --
especially since you can just do `base64 -d` inside `wg-quick`.

## What algorithm should the hash be done with?
**Blake2s with 32 bytes of output**.

This is simply the `HASH()` function in the WireGuard protocol
specification, and I think that using the same hash function as the
Noise construction makes a lot of sense. Even though output length is
a tunable parameter of the Blake2s function and an LLA will never use
more than 16 bytes, I feel that being consistent and obvious is
important. (Also, note that Blake2 tunes output length by truncation
internally; the only difference between taking a 16- or 32-byte long
digest is flipping a couple of bits during the setup phase. The
performance characteristics are exactly the same.)

That said, most of the attempts at implementing a IPv6 LLA assignment
scheme I've seen simply depend on `sha256sum` and call it a day,
because there's not a widespread CLI tool that does Blake2s for you.
There *are* a couple of different tools named `b2sum` -- the one made
by the Blake2 authors is fine, but the identically-named GNU coreutils
utility, which most people will get if they install their distro's
`b2sum` package, only does Blake2b (and takes a different set of flags
to boot).

 Still, like I mentioned above, we should be looking at this from a
protocol point of view, and requiring a whole extra crypto primitive
just for calculating an LLA seems wasteful. Implementing WireGuard
already requires that the Blake2s hash be available, and that it's not
easily accessible by the wg-quick tool is simply an unfortunate quirk
of the reference implementation. Think about a constrained environment
like a microcontroller -- SHA256 isn't a simple algorithm, and it
would probably cause a 50% increase in code size.

Luckily, Blake2s is a simple and elegant algorithm, and in an effort
to get some working code out there I've [implemented][1] it in ~100
lines of Bash script. (It's gotta be Bash because it needs array
support, but that's what `wg-quick` uses anyway.) It's slow compared
to a typical implementation, but it's not like we're mining
cryptocurrency here, and because WireGuard public keys are of a known,
fixed length the input will never be longer than a single block.
(Single-block hashes benchmark at around 50ms on my system, just for
reference.) I hope this helps accelerate the project, but I can
understand that a shell implementation might seem too janky for
long-term use: a potential solution would be to integrate the LLA
calculation into the wg tool, in a similar fashion to how the
Curve25519 public key calculation is handed by `wg pubkey`. I'm
imagining a `wg lla` command which takes in a Base64-encoded public
key and spits out a string of the form
`fe8b:5ea9:9e65:3bc2:b593:db41:30d1:0a4e` (which happens to be the LLA
associated with an all-zero public key under my proposed scheme).

[1]: https://gist.github.com/reidrankin/3a39210ce437680f5cf1ac549fd1f1ff

--Reid

On Wed, Jun 24, 2020 at 1:11 PM Chriztoffer Hansen <ch@ntrv.dk> wrote:
>
> On Wed, 24 Jun 2020 at 17:37, Florian Klink <flokli@flokli.de> wrote:
> > Deriving an IPv6 link-local address from the pubkey and adding it to the
> > interface should be a no-brainer and sane default, and already fix Babel
> > Routing (and most other issues) for "point-to-point tunnels"
> > (only one peer, both sides set AllowedIPs=::/0).
>
> An idea to implement as an option for e.g. wg-quick, rather than the
> base code-base itself?
>
> --
>
> Chriztoffer
