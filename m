Return-Path: <SRS0=VioZ=LY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6710C11F65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jun 2021 20:55:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E3A61407
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jun 2021 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E3A61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f070a3b4;
	Wed, 30 Jun 2021 20:55:12 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 44ce1315
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jun 2021 20:55:10 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1625086510; bh=pRkjg7oahWhVAerj6g1v61CkBDSEojIK+AqlRtNKNzA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Iq8KXE9s14b4x7l2jMI06lsVTOGYoxZvMHY1cFPbXuVTs8eEaoyBj5sR7J6tX08zi
 EHX2oi/PxLF+RLXoh668mb2eBlF05Rcnpm5JTc1JPIIbJP2ylkAnXmqsyDXQTNBaJG
 9XeMJBLGp3FQbqbfcOAeyzh77ujGs30XGazbUyIBlVrAt+jv4PBkiWLf6JcCXIP9gY
 KtM9S1zuxhLcBHxWa33t7Oy0nBG9Hf2LYyKYkLCb1IeOhPxBa9dvbX9mUFsQaqCqVp
 hhNER/20zt+G8DT7zPXPpc4ueSWvUCuDDdIh9ICA5hxAP5wwzZkkxsVcMas9ocf4ct
 LlvPfam9gLkgw==
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Florent Daigniere
 <nextgens@freenetproject.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <YNyopHsKX2m5HSRr@makrotopia.org>
References: <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
 <YNCHs1wKWEoNxUyX@makrotopia.org> <877dinths3.fsf@toke.dk>
 <YNyopHsKX2m5HSRr@makrotopia.org>
Date: Wed, 30 Jun 2021 22:55:09 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87h7hf139u.fsf@toke.dk>
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

> Hi Toke,
>
> On Mon, Jun 21, 2021 at 04:27:08PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Daniel Golle <daniel@makrotopia.org> writes:
>>=20
>> > On Fri, Jun 18, 2021 at 02:24:29PM +0200, Jason A. Donenfeld wrote:
>> >> Hey Toke,
>> >>=20
>> >> On Fri, Jun 18, 2021 at 1:05 AM Toke H=C3=B8iland-J=C3=B8rgensen <tok=
e@toke.dk> wrote:
>> >> > > I think you can achieve something similar using BPF filters, by r=
elying
>> >> > > on wireguard passing through the skb->hash value when encrypting.
>> >> > >
>> >> > > Simply attach a TC-BPF filter to the wireguard netdev, pull out t=
he DSCP
>> >> > > value and store it in a map keyed on skb->hash. Then, run a secon=
d BPF
>> >> > > filter on the physical interface that shares that same map, looku=
p the
>> >> > > DSCP value based on the skb->hash value, and rewrite the outer IP
>> >> > > header.
>> >> > >
>> >> > > The read-side filter will need to use bpf_get_hash_recalc() to ma=
ke sure
>> >> > > the hash is calculated before the packet gets handed to wireguard=
, and
>> >> > > it'll be subject to hash collisions, but I think it should genera=
lly
>> >> > > work fairly well (for anything that's flow-based of course). And =
it can
>> >> > > be done without patching wireguard itself :)
>> >> >
>> >> > Just for fun I implemented such a pair of eBPF filters, and tested =
that
>> >> > it does indeed work for preserving DSCP marks on a Wireguard tunnel=
. The
>> >> > PoC is here:
>> >> >
>> >> > https://github.com/xdp-project/bpf-examples/tree/master/preserve-ds=
cp
>> >> >
>> >> > To try it out (you'll need a recent-ish kernel and clang version) r=
un:
>> >> >
>> >> > git clone --recurse-submodules https://github.com/xdp-project/bpf-e=
xamples
>> >> > cd bpf-examples/preserve-dscp
>> >> > make
>> >> > ./preserve-dscp wg0 eth0
>> >> >
>> >> > (assuming wg0 and eth0 are the wireguard and physical interfaces in
>> >> > question, respectively).
>> >> >
>> >> > To actually deploy this it would probably need a few tweaks; in
>> >> > particular the second filter that rewrites packets should probably =
check
>> >> > that the packets are actually part of the Wireguard tunnel in quest=
ion
>> >> > (by parsing the UDP header and checking the source port) before wri=
ting
>> >> > anything to the packet.
>> >> >
>> >> > -Toke
>> >>=20
>> >> That is a super cool approach. Thanks for writing that! Sounds like a
>> >> good approach, and one pretty easy to deploy, without the need to
>> >> patch kernels and such.
>> >>=20
>> >> Also, nice usage of BPF_MAP_TYPE_LRU_HASH for this.
>> >>=20
>> >> Daniel -- can you let the list know if this works for your use case?
>> >
>> > Turns out not exactly easy to deploy (on OpenWrt), as it depends on an
>> > extremely recent environment. I will try pushing to that direction, but
>> > it doesn't look like it's going to be ready very soon.
>> >
>> > In terms of toolchain: LLVM/Clang is a very bulky beast, I gave up on
>> > that and started working on integrating GCC-10's BPF target in our bui=
ld
>> > system...
>>=20
>> I saw that, but I have no idea if GCC's BPF target support will support
>> this. My tentative guess would be no, unfortunately :(
>
> Probably you are right. When building the BPF object with GCC, the
> result is:
> root@OpenWrt:/usr/lib/bpf# preserve-dscp wg0 eth0
> libbpf: elf: skipping unrecognized data section(4) .stab
> libbpf: elf: skipping relo section(5) .rel.stab for section(4) .stab
> libbpf: elf: skipping unrecognized data section(13) .comment
> libbpf: BTF is required, but is missing or corrupted.
> Couldn't open file: preserve_dscp_kern.o

Hmm, for this example it should be possible to make it run without BTF.
I'm only using that for the map definition, so that could be changed to
the old format; you could try this patch:

diff --git a/preserve-dscp/preserve_dscp_kern.c b/preserve-dscp/preserve_ds=
cp_kern.c
index 24120cb8a3ff..08248e1f0e41 100644
--- a/preserve-dscp/preserve_dscp_kern.c
+++ b/preserve-dscp/preserve_dscp_kern.c
@@ -9,12 +9,12 @@
  * otherwise clean up stale entries. Instead, we just rely on the LRU mech=
anism
  * to evict old entries as the map fills up.
  */
-struct {
-       __uint(type, BPF_MAP_TYPE_LRU_HASH);
-       __type(key, __u32);
-       __type(value, __u8);
-       __uint(max_entries, 16384);
-} flow_dscps SEC(".maps");
+struct bpf_map_def SEC("maps") flow_dscps =3D {
+       .type           =3D BPF_MAP_TYPE_LRU_HASH,
+       .key_size       =3D sizeof(__u32),
+       .value_size     =3D sizeof(__u8),
+       .max_entries    =3D 16384,
+};
=20
 const volatile static int ip_only =3D 0;

> Using the LLVM/Clang compiled object also doesn't work:
> root@OpenWrt:/usr/lib/bpf# preserve-dscp wg0 eth0
> libbpf: Error in bpf_create_map_xattr(flow_dscps):Operation not permitted=
(-1). Retrying without BTF.
> libbpf: map 'flow_dscps': failed to create: Operation not permitted(-1)
> libbpf: permission error while running as root; try raising 'ulimit -l'? =
current value: 512.0 KiB
> libbpf: failed to load object 'preserve_dscp_kern.o'
> Failed to load object
>
> Probably Kernel 5.4.124 is too old...?

Here I think the hint is in the error message ;)

>> An alternative to getting LLVM built as part of the OpenWrt toolchain is
>> to just use the host clang to build the BPF binaries. It doesn't
>> actually need to be cross-compiled with a special compiler, the BPF byte
>> code format is the same on all architectures except for endianness, so
>> just passing that to the host clang should theoretically be enough...
>
> I believe that having a way to build BPF objects compatible with the
> target built-into our toolchain would be a huge step forward.
> And given that gcc already get's pretty far, I think it'd be worth
> fixing/patching what ever is missing (I haven't even tried GCC-11 yet)

For this example that might work (as noted above), but for other things
BTF is a hard requirement, and I don't believe GCC supports that at all,
sadly :(

> Find my staging tree including 'preserve-dscp' ready to play with:
>
> https://git.openwrt.org/?p=3Dopenwrt/staging/dangole.git;a=3Dshortlog;h=
=3Drefs/heads/gcc10-bpf
>
> Select 'Enable experimental features by default', but note that toolchain
> doesn't build when selecting Linux 5.10 for x86, so you need to un-select
> 'Use testing Kernel' if building for x86.
> And have a look at the patch for allow building bpf-examples BPF objects
> with GCC in package/network/utils/bpf-examples/patches
>
>
>>=20
>> > In terms of kernel support: recent kernels don't build yet because of
>> > gelf_getsymshndx, so we got to update libelf first for that. Recent
>> > libelf doesn't seem to be an option yet on many of the build hosts we
>> > currently support (Darwin and such).
>> >
>> > In terms of library support: our build of libbpf comes from Linux
>> > release tarballs. There isn't yet a release supporting bpf_tc_attach,
>> > the easiest would be to wait for Linux 5.13 to be released.
>>=20
>> I used the libbpf TC loading support for convenience, but it's possible
>> to load it using 'tc' as well without too much trouble (right now the
>> userspace component sets a config variable before loading the program,
>> but it can be restructured to not need that).
>>=20
>> Alternatively, the bpf-examples repository is setup with a libbpf
>> submodule that it can link statically against, so you could use that for
>> now?
>
> I've updated to 5.13 + patches on top, so now it builds :)

Alright, that works.

> Library-embedding is a no-go for OpenWrt. Having different ABI-versions
> of libraries installed simultanously works, so we can just ship with
> a more recent version of libbpf.

Yeah, I wasn't suggesting it as a permanent solution, just so you could
test it out :)

>> > I (of course ;) also tried and spend almost a day looking for a
>> > quick-and-dirty path for temporary deployment, so I could at least give
>> > feedback -- bpf-examples also isn't exactly made to be cross-compiled
>> > manually, so I have failed with that as well so far.
>>=20
>> Heh, no, it isn't, really. Anything in particular you need to make this
>> easier? We already added some bits to xdp-tools for supporting
>> cross-compilation (and that shares some lineage with bpf-examples), so
>> porting those over should not be too difficult.
>
> I found my way around, see the packaging for bpf-examples in the tree
> (link above, at path stated above)

Right, I see.=20

>>=20
>> See: https://github.com/xdp-project/xdp-tools/pull/78 and
>> https://github.com/xdp-project/xdp-tools/issues/74
>>=20
>> Unfortunately I don't have a lot of time to poke more at this right now,
>> but feel free to open up an issue / pull request to the bpf-examples
>> repository with any changes you need :)
>
> I guess I'll just go ahead then and package xdp-tools :)

That would be awesome! xdp-tools will definitely need BTF, though, so
I'm afraid it'll need to be compiled with LLVM at this stage...

-Toke
