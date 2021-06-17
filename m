Return-Path: <SRS0=yhX4=LL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7550CC2B9F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 23:05:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E301461042
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 23:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E301461042
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bd68e21;
	Thu, 17 Jun 2021 23:04:58 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81523e17
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jun 2021 23:04:57 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1623971096; bh=DF7gEjz6hJhfstDNtXOcm/QklfJxVxbOzxpPWD8guro=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mYGk3uScsZsMxppoMbbUtcyofqCfEL/Y2F9GmLOGI+GvPn4T0+N2B7FrvhJOzrhFn
 2hH6YmHm4C926M5oNKXU/NMHOCsXGKs13GxyEC2lsXsMYFmMcr6MTfnMLmRrrSsv9Q
 PKOuCz11EC2/ELFFXks40UmKqsSju3eqfnCC5Cow44NB7R+YNSVz9blGyzJhBq2GBg
 3Ah4ohEwC/wQmbwxYPvehieqTQDqJpyLZxp4sUZQMqGZv1osYH3xJpb4+cKESewn0P
 zb6rEVAyi+J4RXj7I/moFVTZAdfUZQOWqiFgG8L7lEQElSkfs8I8u1ddNPVBG9mr0l
 fD3DspqUbJtBw==
To: Daniel Golle <daniel@makrotopia.org>, Florent Daigniere
 <nextgens@freenetproject.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <87sg1gptky.fsf@toke.dk>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
Date: Fri, 18 Jun 2021 01:04:55 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <877disdre0.fsf@toke.dk>
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

Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:

> Daniel Golle <daniel@makrotopia.org> writes:
>
>> Hi Florent,
>>
>> On Thu, Jun 17, 2021 at 07:55:09AM +0000, Florent Daigniere wrote:
>>> On Thu, 2021-06-17 at 01:33 +0200, Toke H=C3=B8iland-J=C3=B8rgensen wro=
te:
>>> > Daniel Golle <daniel@makrotopia.org> writes:
>>> >=20
>>> > > Hi Jason,
>>> > >=20
>>> > > On Wed, Jun 16, 2021 at 06:28:12PM +0200, Jason A. Donenfeld wrote:
>>> > > > WireGuard does not copy the inner DSCP mark to the outside, aside
>>> > > > from
>>> > > > the ECN bits, in order to avoid a data leak.
>>> > >=20
>>> > > That's a very valid argument.
>>> > >=20
>>> > > However, from my experience now, Wireguard is not suitable for
>>> > > VoIP/RTP
>>> > > data (minimize-delay) being sent through the same tunnel as TCP bulk
>>> > > (maximize-throughput) traffic in bandwidth constraint and/or high-
>>> > > latency
>>> > > environments, as that ruins the VoIP calls to the degree of not
>>> > > being
>>> > > understandable. ECN helps quite a bit when it comes to avoid packet
>>> > > drops
>>> > > for TCP traffic, but that's not enough to avoid high jitter and
>>> > > drops for
>>> > > RTP/UDP traffic at the same time.
>>> > >=20
>>> > > I thought about ways to improve that and wonder what you would
>>> > > suggest.
>>> > > My ideas are:
>>> > >  * have different tunnels depending on inner DSCP bits and mark them
>>> > >    accordingly on the outside.
>>> > >    =3D> we already got multiple tunnels and that would double the
>>> > > number.
>>> > >=20
>>> > >  * mark outer packets with DSCP bits based on their size.
>>> > >    VoIP RTP/UDP packets are typically "medium sized" while TCP
>>> > > packets
>>> > >    typically max out the MTU.
>>> > >    =3D> we would not leak information, but that assumption may not
>>> > > always
>>> > >       be true
>>> > >=20
>>> > >  * patch wireguard kernel code to allow preserving inner DSCP bits.
>>> > >    =3D> even only having 2 differentl classes of traffic (critical =
vs.
>>> > >       bulk) would already help a lot...
>>> > >=20
>>> > >=20
>>> > > What do you think? Any other ideas?
>>> >=20
>>> > Can you share a few more details about the network setup? I.e., where
>>> > is
>>> > the bottleneck link that requires this special treatment?
>>>=20
>>> I can tell you about mine. WiFi in a congested environment: "voip on
>>> mobile phones". WMM/802.11e uses the diffserv markings; most commercial
>>> APs will do the right thing provided packets are marked appropriately.
>>>=20
>>> At the time I have sent patches (back in 2019) for both the golang and
>>> linux implementation that turned it on by default. I believe that
>>> Russell Strong further improved upon them by adding a knob (20190318 on
>>> this mailing list).
>>
>> Thank you very much for the hint!
>> This patch is exactly what I was looking for:
>> https://lists.zx2c4.com/pipermail/wireguard/2019-March/004026.html
>>
>> Unfortunately it has not received a great amount of feedback back then.
>> I'll try forward-porting and deploying it now, because to me it looks
>> like the best solution money can buy :)
>
> I think you can achieve something similar using BPF filters, by relying
> on wireguard passing through the skb->hash value when encrypting.
>
> Simply attach a TC-BPF filter to the wireguard netdev, pull out the DSCP
> value and store it in a map keyed on skb->hash. Then, run a second BPF
> filter on the physical interface that shares that same map, lookup the
> DSCP value based on the skb->hash value, and rewrite the outer IP
> header.
>
> The read-side filter will need to use bpf_get_hash_recalc() to make sure
> the hash is calculated before the packet gets handed to wireguard, and
> it'll be subject to hash collisions, but I think it should generally
> work fairly well (for anything that's flow-based of course). And it can
> be done without patching wireguard itself :)

Just for fun I implemented such a pair of eBPF filters, and tested that
it does indeed work for preserving DSCP marks on a Wireguard tunnel. The
PoC is here:

https://github.com/xdp-project/bpf-examples/tree/master/preserve-dscp

To try it out (you'll need a recent-ish kernel and clang version) run:

git clone --recurse-submodules https://github.com/xdp-project/bpf-examples
cd bpf-examples/preserve-dscp
make
./preserve-dscp wg0 eth0

(assuming wg0 and eth0 are the wireguard and physical interfaces in
question, respectively).

To actually deploy this it would probably need a few tweaks; in
particular the second filter that rewrites packets should probably check
that the packets are actually part of the Wireguard tunnel in question
(by parsing the UDP header and checking the source port) before writing
anything to the packet.

-Toke
