Return-Path: <SRS0=KLTL=LP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7CDC4743C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Jun 2021 12:36:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB76601FC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Jun 2021 12:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB76601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6af3e37f;
	Mon, 21 Jun 2021 12:36:19 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [2a07:2ec0:3002::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9c523ae5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Jun 2021 12:36:18 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lvJ9v-0001xP-1t; Mon, 21 Jun 2021 14:36:11 +0200
Date: Mon, 21 Jun 2021 14:36:03 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 Florent Daigniere <nextgens@freenetproject.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
Message-ID: <YNCHs1wKWEoNxUyX@makrotopia.org>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
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

On Fri, Jun 18, 2021 at 02:24:29PM +0200, Jason A. Donenfeld wrote:
> Hey Toke,
> 
> On Fri, Jun 18, 2021 at 1:05 AM Toke Høiland-Jørgensen <toke@toke.dk> wrote:
> > > I think you can achieve something similar using BPF filters, by relying
> > > on wireguard passing through the skb->hash value when encrypting.
> > >
> > > Simply attach a TC-BPF filter to the wireguard netdev, pull out the DSCP
> > > value and store it in a map keyed on skb->hash. Then, run a second BPF
> > > filter on the physical interface that shares that same map, lookup the
> > > DSCP value based on the skb->hash value, and rewrite the outer IP
> > > header.
> > >
> > > The read-side filter will need to use bpf_get_hash_recalc() to make sure
> > > the hash is calculated before the packet gets handed to wireguard, and
> > > it'll be subject to hash collisions, but I think it should generally
> > > work fairly well (for anything that's flow-based of course). And it can
> > > be done without patching wireguard itself :)
> >
> > Just for fun I implemented such a pair of eBPF filters, and tested that
> > it does indeed work for preserving DSCP marks on a Wireguard tunnel. The
> > PoC is here:
> >
> > https://github.com/xdp-project/bpf-examples/tree/master/preserve-dscp
> >
> > To try it out (you'll need a recent-ish kernel and clang version) run:
> >
> > git clone --recurse-submodules https://github.com/xdp-project/bpf-examples
> > cd bpf-examples/preserve-dscp
> > make
> > ./preserve-dscp wg0 eth0
> >
> > (assuming wg0 and eth0 are the wireguard and physical interfaces in
> > question, respectively).
> >
> > To actually deploy this it would probably need a few tweaks; in
> > particular the second filter that rewrites packets should probably check
> > that the packets are actually part of the Wireguard tunnel in question
> > (by parsing the UDP header and checking the source port) before writing
> > anything to the packet.
> >
> > -Toke
> 
> That is a super cool approach. Thanks for writing that! Sounds like a
> good approach, and one pretty easy to deploy, without the need to
> patch kernels and such.
> 
> Also, nice usage of BPF_MAP_TYPE_LRU_HASH for this.
> 
> Daniel -- can you let the list know if this works for your use case?

Turns out not exactly easy to deploy (on OpenWrt), as it depends on an
extremely recent environment. I will try pushing to that direction, but
it doesn't look like it's going to be ready very soon.

In terms of toolchain: LLVM/Clang is a very bulky beast, I gave up on
that and started working on integrating GCC-10's BPF target in our build
system...

In terms of kernel support: recent kernels don't build yet because of
gelf_getsymshndx, so we got to update libelf first for that. Recent
libelf doesn't seem to be an option yet on many of the build hosts we
currently support (Darwin and such).

In terms of library support: our build of libbpf comes from Linux
release tarballs. There isn't yet a release supporting bpf_tc_attach,
the easiest would be to wait for Linux 5.13 to be released.

I (of course ;) also tried and spend almost a day looking for a
quick-and-dirty path for temporary deployment, so I could at least give
feedback -- bpf-examples also isn't exactly made to be cross-compiled
manually, so I have failed with that as well so far.


In general I still believe this is a great approach and I would really
like to use it as soon as possible, even just to give you feedback.


Cheers


Daniel
