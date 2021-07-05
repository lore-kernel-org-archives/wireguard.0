Return-Path: <SRS0=kL7G=L5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82C5C07E99
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Jul 2021 15:21:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F270B61946
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Jul 2021 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F270B61946
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16ac78e0;
	Mon, 5 Jul 2021 15:21:37 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5fa76112
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Jul 2021 15:21:34 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1625498493; bh=Stz0UtNurAYOHXsqyBYzo1b9g+bLJGOf7L6W0iSI4Sc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=W+6Po7W8xUNghVR/d0QSwtG4/MI1PCibpSPwRKcqMHjxJMiGZSW4RUTAhix0IVPuG
 J2cOrfjSWKumuhLH1+3Y7haEKMtUROrpJrdlGSkCU1NAb3ChDG30RcD6gh0NS8t5rW
 flcqyYw5GwVhFqtYtJ5YKmFkn+eOLQYQCHgo381Gdh+KeO0vNO8WvR7kp7rm9w5kF9
 DD3sjTSvE+3ogsvWjFpvxFKXiRPW5WStvqNju44tmdmRewetW598qpa0qa28tDVXmG
 P62xouQBAOoa0ocyj2MoEV6xYYWgA06GBgZ+arRv4F2z1rY+q7irFFvwlqbmyi7llF
 IBZcgxytKShkA==
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Florent Daigniere
 <nextgens@freenetproject.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <YOHCdnZoAKBhNIF8@makrotopia.org>
References: <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
 <YNCHs1wKWEoNxUyX@makrotopia.org> <877dinths3.fsf@toke.dk>
 <YNyopHsKX2m5HSRr@makrotopia.org> <87h7hf139u.fsf@toke.dk>
 <YOHCdnZoAKBhNIF8@makrotopia.org>
Date: Mon, 05 Jul 2021 17:21:25 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87zgv0yefe.fsf@toke.dk>
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
> thank you for the ongoing efforts and support on this issue.

You're welcome! :)

> On Wed, Jun 30, 2021 at 10:55:09PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Daniel Golle <daniel@makrotopia.org> writes:
>> > ...
>> >> >
>> >> > In terms of toolchain: LLVM/Clang is a very bulky beast, I gave up =
on
>> >> > that and started working on integrating GCC-10's BPF target in our =
build
>> >> > system...
>> >>=20
>> >> I saw that, but I have no idea if GCC's BPF target support will suppo=
rt
>> >> this. My tentative guess would be no, unfortunately :(
>> >
>> > Probably you are right. When building the BPF object with GCC, the
>> > result is:
>> > root@OpenWrt:/usr/lib/bpf# preserve-dscp wg0 eth0
>> > libbpf: elf: skipping unrecognized data section(4) .stab
>> > libbpf: elf: skipping relo section(5) .rel.stab for section(4) .stab
>> > libbpf: elf: skipping unrecognized data section(13) .comment
>> > libbpf: BTF is required, but is missing or corrupted.
>> > Couldn't open file: preserve_dscp_kern.o
>>=20
>> Hmm, for this example it should be possible to make it run without BTF.
>> I'm only using that for the map definition, so that could be changed to
>> the old format; you could try this patch:
>>=20
>> diff --git a/preserve-dscp/preserve_dscp_kern.c b/preserve-dscp/preserve=
_dscp_kern.c
>> index 24120cb8a3ff..08248e1f0e41 100644
>> --- a/preserve-dscp/preserve_dscp_kern.c
>> +++ b/preserve-dscp/preserve_dscp_kern.c
>> @@ -9,12 +9,12 @@
>>   * otherwise clean up stale entries. Instead, we just rely on the LRU m=
echanism
>>   * to evict old entries as the map fills up.
>>   */
>> -struct {
>> -       __uint(type, BPF_MAP_TYPE_LRU_HASH);
>> -       __type(key, __u32);
>> -       __type(value, __u8);
>> -       __uint(max_entries, 16384);
>> -} flow_dscps SEC(".maps");
>> +struct bpf_map_def SEC("maps") flow_dscps =3D {
>> +       .type           =3D BPF_MAP_TYPE_LRU_HASH,
>> +       .key_size       =3D sizeof(__u32),
>> +       .value_size     =3D sizeof(__u8),
>> +       .max_entries    =3D 16384,
>> +};
>>=20=20
>>  const volatile static int ip_only =3D 0;
>>=20
>
> That change gives me the next error:
> libbpf: map '' (legacy): static maps are not supported
>
> Also speaks for itself...

Ah, right, the ip_only config also needs to be moved to an old-style
map, then...

>> > Using the LLVM/Clang compiled object also doesn't work:
>> > root@OpenWrt:/usr/lib/bpf# preserve-dscp wg0 eth0
>> > libbpf: Error in bpf_create_map_xattr(flow_dscps):Operation not permit=
ted(-1). Retrying without BTF.
>> > libbpf: map 'flow_dscps': failed to create: Operation not permitted(-1)
>> > libbpf: permission error while running as root; try raising 'ulimit -l=
'? current value: 512.0 KiB
>> > libbpf: failed to load object 'preserve_dscp_kern.o'
>> > Failed to load object
>> >
>> > Probably Kernel 5.4.124 is too old...?
>>=20
>> Here I think the hint is in the error message ;)
>
> Yep, I realized I had to increase it to ulimit to 2048...
> With that at least the LLVM/Clang generated BPF object seems to load
> properly, and I can load and unload it as expected.

Awesome!

>> >> An alternative to getting LLVM built as part of the OpenWrt toolchain=
 is
>> >> to just use the host clang to build the BPF binaries. It doesn't
>> >> actually need to be cross-compiled with a special compiler, the BPF b=
yte
>> >> code format is the same on all architectures except for endianness, so
>> >> just passing that to the host clang should theoretically be enough...
>> >
>> > I believe that having a way to build BPF objects compatible with the
>> > target built-into our toolchain would be a huge step forward.
>> > And given that gcc already get's pretty far, I think it'd be worth
>> > fixing/patching what ever is missing (I haven't even tried GCC-11 yet)
>>=20
>> For this example that might work (as noted above), but for other things
>> BTF is a hard requirement, and I don't believe GCC supports that at all,
>> sadly :(
>
> It looks like this has changed very recently:
>
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dd5cf2b5db325fd5c053ca=
7bc8d6a54a06cd71124

Uhh, exciting! Will be interesting to see how compatible this will be;
and how BPF upstream will deal with multiple compilers :)

>> > Find my staging tree including 'preserve-dscp' ready to play with:
>> >
>> > https://git.openwrt.org/?p=3Dopenwrt/staging/dangole.git;a=3Dshortlog;=
h=3Drefs/heads/gcc10-bpf
>> >
>> > Select 'Enable experimental features by default', but note that toolch=
ain
>> > doesn't build when selecting Linux 5.10 for x86, so you need to un-sel=
ect
>> > 'Use testing Kernel' if building for x86.
>> > And have a look at the patch for allow building bpf-examples BPF objec=
ts
>> > with GCC in package/network/utils/bpf-examples/patches
>> >
>> >
>> >>=20
>> >> > In terms of kernel support: recent kernels don't build yet because =
of
>> >> > gelf_getsymshndx, so we got to update libelf first for that. Recent
>> >> > libelf doesn't seem to be an option yet on many of the build hosts =
we
>> >> > currently support (Darwin and such).
>> >> >
>> >> > In terms of library support: our build of libbpf comes from Linux
>> >> > release tarballs. There isn't yet a release supporting bpf_tc_attac=
h,
>> >> > the easiest would be to wait for Linux 5.13 to be released.
>> >>=20
>> >> I used the libbpf TC loading support for convenience, but it's possib=
le
>> >> to load it using 'tc' as well without too much trouble (right now the
>> >> userspace component sets a config variable before loading the program,
>> >> but it can be restructured to not need that).
>> >>=20
>> >> Alternatively, the bpf-examples repository is setup with a libbpf
>> >> submodule that it can link statically against, so you could use that =
for
>> >> now?
>> >
>> > I've updated to 5.13 + patches on top, so now it builds :)
>>=20
>> Alright, that works.
>>=20
>> > Library-embedding is a no-go for OpenWrt. Having different ABI-versions
>> > of libraries installed simultanously works, so we can just ship with
>> > a more recent version of libbpf.
>>=20
>> Yeah, I wasn't suggesting it as a permanent solution, just so you could
>> test it out :)
>
> In the long run it would be great to have a somehow standardized and
> reproducible way to build packages containing targetted BPF objects.
> As having LLVM/Clang built-into OpenWrt has shown to be a huge amount
> of work, I'm looking forward to GCC-12 which will support BTF from how
> it looks by now...
>
>>=20
>> >> > I (of course ;) also tried and spend almost a day looking for a
>> >> > quick-and-dirty path for temporary deployment, so I could at least =
give
>> >> > feedback -- bpf-examples also isn't exactly made to be cross-compil=
ed
>> >> > manually, so I have failed with that as well so far.
>> >>=20
>> >> Heh, no, it isn't, really. Anything in particular you need to make th=
is
>> >> easier? We already added some bits to xdp-tools for supporting
>> >> cross-compilation (and that shares some lineage with bpf-examples), so
>> >> porting those over should not be too difficult.
>> >
>> > I found my way around, see the packaging for bpf-examples in the tree
>> > (link above, at path stated above)
>>=20
>> Right, I see.=20
>
> I have managed to test your solution and it seems to do the job.
> Remaining issues:
>  * What to do if there are many tunnels all sharing the same upstream
>    interface? In this case I'm thinking of doing:
>    preserve-dscp wg0 eth0
>    preserve-dscp wg1 eth0
>    preserve-dscp wg2 eth0
>    ...
>    But I'm unsure whether this is indented or if further details need
>    to be implemented in order to make that work.

Hmm, not sure whether that will work out of the box, actually. Would
definitely be doable to make the userspace utility understand how to do
this properly, though. There's nothing in principle preventing this from
working; the loader should just be smart enough to do incremental
loading of multiple "ingress" programs while still sharing the map
between all of them.

The only potential operational issue with using it on multiple wg
interfaces is if they share IP space; because in that case you might
have packets from different tunnels ending up with identical hashes,
confusing the egress side. Fixing this would require the outer BPF
program to know about wg endpoint addresses and map the packets back to
their inner ifindexes using that. But as long as the wireguard tunnels
are using different IP subnets (or mostly forwarding traffic without the
inner addresses as sources or destinations), the hash collision
probability should not be bigger than just traffic on a single tunnel, I
suppose.

One particular thing to watch out for here is IPv6 link-local traffic;
sine wg doesn't generate link-local addresses automatically, they are
commonly configured with (the same) static address (like fe80::1 or
fe80::2), which would make link-local traffic identical across wg
interfaces. But this is only used for particular setups (I use it for
running Babel over wg, for instance), just make sure it won't be an
issue for your deployment scenario :)

>  * Once a wireguard interface goes down, one cannot unload the
>    remaining program on the upstream interface, as
>    preserve-dscp wg0 eth0 --unload
>    would fail in case of 'wg0' having gone missing.
>    What do you suggest to do in this case?

Just fixing the userspace utility to deal with this case properly as
well is probably the easiest. How are you thinking you'd deploy this?
Via ifup hooks on openwrt, or something different?

>> >> See: https://github.com/xdp-project/xdp-tools/pull/78 and
>> >> https://github.com/xdp-project/xdp-tools/issues/74
>> >>=20
>> >> Unfortunately I don't have a lot of time to poke more at this right n=
ow,
>> >> but feel free to open up an issue / pull request to the bpf-examples
>> >> repository with any changes you need :)
>> >
>> > I guess I'll just go ahead then and package xdp-tools :)
>>=20
>> That would be awesome! xdp-tools will definitely need BTF, though, so
>> I'm afraid it'll need to be compiled with LLVM at this stage...
>
> I'll probably move on doing other things for a while then and get back
> to it once GCC-12 has been released...

OK, SGTM.

-Toke
