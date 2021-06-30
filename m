Return-Path: <SRS0=VioZ=LY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D6EC11F65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jun 2021 17:24:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF3961480
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jun 2021 17:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF3961480
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5173e53a;
	Wed, 30 Jun 2021 17:24:10 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [2a07:2ec0:3002::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7bdbb9ef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jun 2021 17:24:07 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lydwN-0000dW-3K; Wed, 30 Jun 2021 19:23:59 +0200
Date: Wed, 30 Jun 2021 18:23:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Florent Daigniere <nextgens@freenetproject.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
Message-ID: <YNyopHsKX2m5HSRr@makrotopia.org>
References: <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
 <YNCHs1wKWEoNxUyX@makrotopia.org> <877dinths3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877dinths3.fsf@toke.dk>
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

Hi Toke,

On Mon, Jun 21, 2021 at 04:27:08PM +0200, Toke Høiland-Jørgensen wrote:
> Daniel Golle <daniel@makrotopia.org> writes:
> 
> > On Fri, Jun 18, 2021 at 02:24:29PM +0200, Jason A. Donenfeld wrote:
> >> Hey Toke,
> >> 
> >> On Fri, Jun 18, 2021 at 1:05 AM Toke Høiland-Jørgensen <toke@toke.dk> wrote:
> >> > > I think you can achieve something similar using BPF filters, by relying
> >> > > on wireguard passing through the skb->hash value when encrypting.
> >> > >
> >> > > Simply attach a TC-BPF filter to the wireguard netdev, pull out the DSCP
> >> > > value and store it in a map keyed on skb->hash. Then, run a second BPF
> >> > > filter on the physical interface that shares that same map, lookup the
> >> > > DSCP value based on the skb->hash value, and rewrite the outer IP
> >> > > header.
> >> > >
> >> > > The read-side filter will need to use bpf_get_hash_recalc() to make sure
> >> > > the hash is calculated before the packet gets handed to wireguard, and
> >> > > it'll be subject to hash collisions, but I think it should generally
> >> > > work fairly well (for anything that's flow-based of course). And it can
> >> > > be done without patching wireguard itself :)
> >> >
> >> > Just for fun I implemented such a pair of eBPF filters, and tested that
> >> > it does indeed work for preserving DSCP marks on a Wireguard tunnel. The
> >> > PoC is here:
> >> >
> >> > https://github.com/xdp-project/bpf-examples/tree/master/preserve-dscp
> >> >
> >> > To try it out (you'll need a recent-ish kernel and clang version) run:
> >> >
> >> > git clone --recurse-submodules https://github.com/xdp-project/bpf-examples
> >> > cd bpf-examples/preserve-dscp
> >> > make
> >> > ./preserve-dscp wg0 eth0
> >> >
> >> > (assuming wg0 and eth0 are the wireguard and physical interfaces in
> >> > question, respectively).
> >> >
> >> > To actually deploy this it would probably need a few tweaks; in
> >> > particular the second filter that rewrites packets should probably check
> >> > that the packets are actually part of the Wireguard tunnel in question
> >> > (by parsing the UDP header and checking the source port) before writing
> >> > anything to the packet.
> >> >
> >> > -Toke
> >> 
> >> That is a super cool approach. Thanks for writing that! Sounds like a
> >> good approach, and one pretty easy to deploy, without the need to
> >> patch kernels and such.
> >> 
> >> Also, nice usage of BPF_MAP_TYPE_LRU_HASH for this.
> >> 
> >> Daniel -- can you let the list know if this works for your use case?
> >
> > Turns out not exactly easy to deploy (on OpenWrt), as it depends on an
> > extremely recent environment. I will try pushing to that direction, but
> > it doesn't look like it's going to be ready very soon.
> >
> > In terms of toolchain: LLVM/Clang is a very bulky beast, I gave up on
> > that and started working on integrating GCC-10's BPF target in our build
> > system...
> 
> I saw that, but I have no idea if GCC's BPF target support will support
> this. My tentative guess would be no, unfortunately :(

Probably you are right. When building the BPF object with GCC, the
result is:
root@OpenWrt:/usr/lib/bpf# preserve-dscp wg0 eth0
libbpf: elf: skipping unrecognized data section(4) .stab
libbpf: elf: skipping relo section(5) .rel.stab for section(4) .stab
libbpf: elf: skipping unrecognized data section(13) .comment
libbpf: BTF is required, but is missing or corrupted.
Couldn't open file: preserve_dscp_kern.o

Using the LLVM/Clang compiled object also doesn't work:
root@OpenWrt:/usr/lib/bpf# preserve-dscp wg0 eth0
libbpf: Error in bpf_create_map_xattr(flow_dscps):Operation not permitted(-1). Retrying without BTF.
libbpf: map 'flow_dscps': failed to create: Operation not permitted(-1)
libbpf: permission error while running as root; try raising 'ulimit -l'? current value: 512.0 KiB
libbpf: failed to load object 'preserve_dscp_kern.o'
Failed to load object

Probably Kernel 5.4.124 is too old...?


> 
> An alternative to getting LLVM built as part of the OpenWrt toolchain is
> to just use the host clang to build the BPF binaries. It doesn't
> actually need to be cross-compiled with a special compiler, the BPF byte
> code format is the same on all architectures except for endianness, so
> just passing that to the host clang should theoretically be enough...

I believe that having a way to build BPF objects compatible with the
target built-into our toolchain would be a huge step forward.
And given that gcc already get's pretty far, I think it'd be worth
fixing/patching what ever is missing (I haven't even tried GCC-11 yet)

Find my staging tree including 'preserve-dscp' ready to play with:

https://git.openwrt.org/?p=openwrt/staging/dangole.git;a=shortlog;h=refs/heads/gcc10-bpf

Select 'Enable experimental features by default', but note that toolchain
doesn't build when selecting Linux 5.10 for x86, so you need to un-select
'Use testing Kernel' if building for x86.
And have a look at the patch for allow building bpf-examples BPF objects
with GCC in package/network/utils/bpf-examples/patches


> 
> > In terms of kernel support: recent kernels don't build yet because of
> > gelf_getsymshndx, so we got to update libelf first for that. Recent
> > libelf doesn't seem to be an option yet on many of the build hosts we
> > currently support (Darwin and such).
> >
> > In terms of library support: our build of libbpf comes from Linux
> > release tarballs. There isn't yet a release supporting bpf_tc_attach,
> > the easiest would be to wait for Linux 5.13 to be released.
> 
> I used the libbpf TC loading support for convenience, but it's possible
> to load it using 'tc' as well without too much trouble (right now the
> userspace component sets a config variable before loading the program,
> but it can be restructured to not need that).
> 
> Alternatively, the bpf-examples repository is setup with a libbpf
> submodule that it can link statically against, so you could use that for
> now?

I've updated to 5.13 + patches on top, so now it builds :)
Library-embedding is a no-go for OpenWrt. Having different ABI-versions
of libraries installed simultanously works, so we can just ship with
a more recent version of libbpf.

> 
> > I (of course ;) also tried and spend almost a day looking for a
> > quick-and-dirty path for temporary deployment, so I could at least give
> > feedback -- bpf-examples also isn't exactly made to be cross-compiled
> > manually, so I have failed with that as well so far.
> 
> Heh, no, it isn't, really. Anything in particular you need to make this
> easier? We already added some bits to xdp-tools for supporting
> cross-compilation (and that shares some lineage with bpf-examples), so
> porting those over should not be too difficult.

I found my way around, see the packaging for bpf-examples in the tree
(link above, at path stated above)

> 
> See: https://github.com/xdp-project/xdp-tools/pull/78 and
> https://github.com/xdp-project/xdp-tools/issues/74
> 
> Unfortunately I don't have a lot of time to poke more at this right now,
> but feel free to open up an issue / pull request to the bpf-examples
> repository with any changes you need :)

I guess I'll just go ahead then and package xdp-tools :)


Cheers


Daniel

> 
> -Toke
