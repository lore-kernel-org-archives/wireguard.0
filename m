Return-Path: <SRS0=KLTL=LP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D35C4743C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Jun 2021 14:27:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2631F600D4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Jun 2021 14:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2631F600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9c77e92;
	Mon, 21 Jun 2021 14:27:12 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f1616111
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Jun 2021 14:27:10 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1624285630; bh=8zEOAUsUO6o8FKGSdtWbv0pJ16kcCdWxWDjqb6XxVfI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=v+sxATNnVQbzgqj5warDceDsLTWfvmassInFrslQZKjYVDIK/iX28aFhLEGP/ubpg
 mJulFScMeXihYyMeZG5nZfCpKY8ceS3sXC63sX+vPgB7iieR5JDBulg/GomxIg4D//
 rdtTsnExRCF6s/AJB5q2ld14gkbVmcFGzkLjpdLJxzrt/CXaAP6d7EECYE3DS2lEUV
 /SUiGVuAVmaOPvl0U2Mkbt8YVF10Lu/35jVM5b3Iqa/YIIBqmZ/DRUrSXLkZqW5jOZ
 nz/bdSk1t2s5ycQqRyv7M/RqVSrhExc5zOYdgME4e5aXloOdvjge3SIUYvPMbh2RHX
 g3aE+uortY2qg==
To: Daniel Golle <daniel@makrotopia.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: Florent Daigniere <nextgens@freenetproject.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <YNCHs1wKWEoNxUyX@makrotopia.org>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
 <YNCHs1wKWEoNxUyX@makrotopia.org>
Date: Mon, 21 Jun 2021 16:27:08 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <877dinths3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Daniel Golle <daniel@makrotopia.org> writes:

> On Fri, Jun 18, 2021 at 02:24:29PM +0200, Jason A. Donenfeld wrote:
>> Hey Toke,
>>=20
>> On Fri, Jun 18, 2021 at 1:05 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@t=
oke.dk> wrote:
>> > > I think you can achieve something similar using BPF filters, by rely=
ing
>> > > on wireguard passing through the skb->hash value when encrypting.
>> > >
>> > > Simply attach a TC-BPF filter to the wireguard netdev, pull out the =
DSCP
>> > > value and store it in a map keyed on skb->hash. Then, run a second B=
PF
>> > > filter on the physical interface that shares that same map, lookup t=
he
>> > > DSCP value based on the skb->hash value, and rewrite the outer IP
>> > > header.
>> > >
>> > > The read-side filter will need to use bpf_get_hash_recalc() to make =
sure
>> > > the hash is calculated before the packet gets handed to wireguard, a=
nd
>> > > it'll be subject to hash collisions, but I think it should generally
>> > > work fairly well (for anything that's flow-based of course). And it =
can
>> > > be done without patching wireguard itself :)
>> >
>> > Just for fun I implemented such a pair of eBPF filters, and tested that
>> > it does indeed work for preserving DSCP marks on a Wireguard tunnel. T=
he
>> > PoC is here:
>> >
>> > https://github.com/xdp-project/bpf-examples/tree/master/preserve-dscp
>> >
>> > To try it out (you'll need a recent-ish kernel and clang version) run:
>> >
>> > git clone --recurse-submodules https://github.com/xdp-project/bpf-exam=
ples
>> > cd bpf-examples/preserve-dscp
>> > make
>> > ./preserve-dscp wg0 eth0
>> >
>> > (assuming wg0 and eth0 are the wireguard and physical interfaces in
>> > question, respectively).
>> >
>> > To actually deploy this it would probably need a few tweaks; in
>> > particular the second filter that rewrites packets should probably che=
ck
>> > that the packets are actually part of the Wireguard tunnel in question
>> > (by parsing the UDP header and checking the source port) before writing
>> > anything to the packet.
>> >
>> > -Toke
>>=20
>> That is a super cool approach. Thanks for writing that! Sounds like a
>> good approach, and one pretty easy to deploy, without the need to
>> patch kernels and such.
>>=20
>> Also, nice usage of BPF_MAP_TYPE_LRU_HASH for this.
>>=20
>> Daniel -- can you let the list know if this works for your use case?
>
> Turns out not exactly easy to deploy (on OpenWrt), as it depends on an
> extremely recent environment. I will try pushing to that direction, but
> it doesn't look like it's going to be ready very soon.
>
> In terms of toolchain: LLVM/Clang is a very bulky beast, I gave up on
> that and started working on integrating GCC-10's BPF target in our build
> system...

I saw that, but I have no idea if GCC's BPF target support will support
this. My tentative guess would be no, unfortunately :(

An alternative to getting LLVM built as part of the OpenWrt toolchain is
to just use the host clang to build the BPF binaries. It doesn't
actually need to be cross-compiled with a special compiler, the BPF byte
code format is the same on all architectures except for endianness, so
just passing that to the host clang should theoretically be enough...

> In terms of kernel support: recent kernels don't build yet because of
> gelf_getsymshndx, so we got to update libelf first for that. Recent
> libelf doesn't seem to be an option yet on many of the build hosts we
> currently support (Darwin and such).
>
> In terms of library support: our build of libbpf comes from Linux
> release tarballs. There isn't yet a release supporting bpf_tc_attach,
> the easiest would be to wait for Linux 5.13 to be released.

I used the libbpf TC loading support for convenience, but it's possible
to load it using 'tc' as well without too much trouble (right now the
userspace component sets a config variable before loading the program,
but it can be restructured to not need that).

Alternatively, the bpf-examples repository is setup with a libbpf
submodule that it can link statically against, so you could use that for
now?

> I (of course ;) also tried and spend almost a day looking for a
> quick-and-dirty path for temporary deployment, so I could at least give
> feedback -- bpf-examples also isn't exactly made to be cross-compiled
> manually, so I have failed with that as well so far.

Heh, no, it isn't, really. Anything in particular you need to make this
easier? We already added some bits to xdp-tools for supporting
cross-compilation (and that shares some lineage with bpf-examples), so
porting those over should not be too difficult.

See: https://github.com/xdp-project/xdp-tools/pull/78 and
https://github.com/xdp-project/xdp-tools/issues/74

Unfortunately I don't have a lot of time to poke more at this right now,
but feel free to open up an issue / pull request to the bpf-examples
repository with any changes you need :)

-Toke
