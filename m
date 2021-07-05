Return-Path: <SRS0=kL7G=L5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7827AC07E99
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Jul 2021 16:59:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFCF61964
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Jul 2021 16:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEFCF61964
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3a9a8c6;
	Mon, 5 Jul 2021 16:59:17 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b649822
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Jul 2021 16:59:15 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1625504354; bh=e4ratuch0WrrMSyNBWApL9vRWgOrThrLG4WaYBXWWyg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dnUCbuYoX7dzs1XX8k0ACbKhmrDCGNsOblE4cINfqacZ/If46Z8WCKs7oW5rDjsm6
 pT6Ss//IuOUB5DKcFn96+PaHGkY4ZDtMpG0gV55fNboO8MTjne6e+4d1SyUAiN0E7y
 kBf7kl/i82TgbHXJGDQw6kQgmm+9zaE2na740rV2B+FGgossvZOgUlOAJbmpSbD+iq
 4JmNg/40Ug20yPfC75FltYjQ5H3iwR0Ttp+J6tsho5XYT9vufqza22T1R2aHvVGfUK
 9KU++0i0YQst/TX/tLl3KCywCYmdhIGzX/wy7EkorPm10O9wNs452Nd8hEn3UkPFBt
 AsuHIjYD06FCg==
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Florent Daigniere
 <nextgens@freenetproject.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <YOMtyz6GJdjJ4xuy@makrotopia.org>
References: <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
 <YNCHs1wKWEoNxUyX@makrotopia.org> <877dinths3.fsf@toke.dk>
 <YNyopHsKX2m5HSRr@makrotopia.org> <87h7hf139u.fsf@toke.dk>
 <YOHCdnZoAKBhNIF8@makrotopia.org> <87zgv0yefe.fsf@toke.dk>
 <YOMtyz6GJdjJ4xuy@makrotopia.org>
Date: Mon, 05 Jul 2021 18:59:10 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v95oy9wh.fsf@toke.dk>
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

> On Mon, Jul 05, 2021 at 05:21:25PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Daniel Golle <daniel@makrotopia.org> writes:
>> ...
>> > I have managed to test your solution and it seems to do the job.
>> > Remaining issues:
>> >  * What to do if there are many tunnels all sharing the same upstream
>> >    interface? In this case I'm thinking of doing:
>> >    preserve-dscp wg0 eth0
>> >    preserve-dscp wg1 eth0
>> >    preserve-dscp wg2 eth0
>> >    ...
>> >    But I'm unsure whether this is indented or if further details need
>> >    to be implemented in order to make that work.
>>=20
>> Hmm, not sure whether that will work out of the box, actually. Would
>> definitely be doable to make the userspace utility understand how to do
>> this properly, though. There's nothing in principle preventing this from
>> working; the loader should just be smart enough to do incremental
>> loading of multiple "ingress" programs while still sharing the map
>> between all of them.
>
> You make it at least sound easy :)

I'd say the implementation is relatively straight-forward for anyone
familiar with how BPF works; figuring out how it's *supposed* to work is
the hard bit ;)

>> The only potential operational issue with using it on multiple wg
>> interfaces is if they share IP space; because in that case you might
>> have packets from different tunnels ending up with identical hashes,
>> confusing the egress side. Fixing this would require the outer BPF
>> program to know about wg endpoint addresses and map the packets back to
>> their inner ifindexes using that. But as long as the wireguard tunnels
>> are using different IP subnets (or mostly forwarding traffic without the
>> inner addresses as sources or destinations), the hash collision
>> probability should not be bigger than just traffic on a single tunnel, I
>> suppose.
>>=20
>> One particular thing to watch out for here is IPv6 link-local traffic;
>> sine wg doesn't generate link-local addresses automatically, they are
>> commonly configured with (the same) static address (like fe80::1 or
>> fe80::2), which would make link-local traffic identical across wg
>> interfaces. But this is only used for particular setups (I use it for
>> running Babel over wg, for instance), just make sure it won't be an
>> issue for your deployment scenario :)
>
> All this is good to know, but from what I can see now shouldn't be
> a problem in our deployment -- it's multiple wireguard links which are
> (using fwmark and ip rules) routed over several uplinks. We then use
> mwan3 to balance most of the gateway traffic accross the available
> wireguard interfaces, using MASQ/SNAT on each tunnel which has a
> unique transfer network assigned, and no IPv6 at all.
> Hence it should be ok to go under the restrictions you described.

Alright, so the wireguard-to-physical interfaces is always many-to-one?
I.e., each wireguard interface is always routed out the same physical
interface, but there may be multiple wg interfaces sharing the same
uplink?

I'm asking because in that case it does make sense to keep separate
instances of the whole setup per physical interface to limit hash
collisions; otherwise, the lookup table could also be made global and
shared between all physical interfaces, so you'd avoid having to specify
the relationship explicitly...

>> >  * Once a wireguard interface goes down, one cannot unload the
>> >    remaining program on the upstream interface, as
>> >    preserve-dscp wg0 eth0 --unload
>> >    would fail in case of 'wg0' having gone missing.
>> >    What do you suggest to do in this case?
>>=20
>> Just fixing the userspace utility to deal with this case properly as
>> well is probably the easiest. How are you thinking you'd deploy this?
>> Via ifup hooks on openwrt, or something different?
>
> Yes, I use ifup hooks configured in an init script for procd and have
> it tied to the wireguard config sections in /etc/config/network:
>
> https://git.openwrt.org/?p=3Dopenwrt/staging/dangole.git;a=3Dblob;f=3Dpac=
kage/network/utils/bpf-examples/files/wireguard-preserve-dscp.init;h=3Df1e5=
e25e663308e057285e2bd8e3bcb9560bdd54;hb=3D5923a78d74be3f05e734b0be0a832a87b=
e8d369b#l56
>
> Passing multiple inner interfaces to one call to the to-be-modified
> preserve-dscp tool could be achieved by some shell magic dealing with
> the configuration...

Not necessary: it's perfectly fine to attach them one at a time.

> We will have to restart the filter for all inner interfaces in case of
> one being added or removed, right?

Nope, that's no necessary either. We can just re-attach the same filter
program to each additional interface.

> And maybe I'll come up with some state tracking so orphaned filters can
> be removed after configuration changes...

The userspace loader could be made to detect this and automatically
clean up the program on the physical interface after the last internal
interface goes away. At least as long as we can rely on an ifdown hook
this will be fairly straight-forward (just requires a lock to not be
racy). Detecting it after interfaces are automatically removed from the
kernel is a bit more cumbersome as it would require some way to trigger
the garbage collection.

-Toke
