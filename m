Return-Path: <SRS0=kL7G=L5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1297C07E99
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Jul 2021 16:05:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ABD1613AB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Jul 2021 16:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ABD1613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24e53c9e;
	Mon, 5 Jul 2021 16:05:56 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [2a07:2ec0:3002::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24883344
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Jul 2021 16:05:54 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1m0R6O-0004aZ-NT; Mon, 05 Jul 2021 18:05:45 +0200
Date: Mon, 5 Jul 2021 17:05:31 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Florent Daigniere <nextgens@freenetproject.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
Message-ID: <YOMtyz6GJdjJ4xuy@makrotopia.org>
References: <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
 <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
 <YNCHs1wKWEoNxUyX@makrotopia.org> <877dinths3.fsf@toke.dk>
 <YNyopHsKX2m5HSRr@makrotopia.org> <87h7hf139u.fsf@toke.dk>
 <YOHCdnZoAKBhNIF8@makrotopia.org> <87zgv0yefe.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgv0yefe.fsf@toke.dk>
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

On Mon, Jul 05, 2021 at 05:21:25PM +0200, Toke Høiland-Jørgensen wrote:
> Daniel Golle <daniel@makrotopia.org> writes:
> ...
> > I have managed to test your solution and it seems to do the job.
> > Remaining issues:
> >  * What to do if there are many tunnels all sharing the same upstream
> >    interface? In this case I'm thinking of doing:
> >    preserve-dscp wg0 eth0
> >    preserve-dscp wg1 eth0
> >    preserve-dscp wg2 eth0
> >    ...
> >    But I'm unsure whether this is indented or if further details need
> >    to be implemented in order to make that work.
> 
> Hmm, not sure whether that will work out of the box, actually. Would
> definitely be doable to make the userspace utility understand how to do
> this properly, though. There's nothing in principle preventing this from
> working; the loader should just be smart enough to do incremental
> loading of multiple "ingress" programs while still sharing the map
> between all of them.

You make it at least sound easy :)

> 
> The only potential operational issue with using it on multiple wg
> interfaces is if they share IP space; because in that case you might
> have packets from different tunnels ending up with identical hashes,
> confusing the egress side. Fixing this would require the outer BPF
> program to know about wg endpoint addresses and map the packets back to
> their inner ifindexes using that. But as long as the wireguard tunnels
> are using different IP subnets (or mostly forwarding traffic without the
> inner addresses as sources or destinations), the hash collision
> probability should not be bigger than just traffic on a single tunnel, I
> suppose.
> 
> One particular thing to watch out for here is IPv6 link-local traffic;
> sine wg doesn't generate link-local addresses automatically, they are
> commonly configured with (the same) static address (like fe80::1 or
> fe80::2), which would make link-local traffic identical across wg
> interfaces. But this is only used for particular setups (I use it for
> running Babel over wg, for instance), just make sure it won't be an
> issue for your deployment scenario :)

All this is good to know, but from what I can see now shouldn't be
a problem in our deployment -- it's multiple wireguard links which are
(using fwmark and ip rules) routed over several uplinks. We then use
mwan3 to balance most of the gateway traffic accross the available
wireguard interfaces, using MASQ/SNAT on each tunnel which has a
unique transfer network assigned, and no IPv6 at all.
Hence it should be ok to go under the restrictions you described.

> >  * Once a wireguard interface goes down, one cannot unload the
> >    remaining program on the upstream interface, as
> >    preserve-dscp wg0 eth0 --unload
> >    would fail in case of 'wg0' having gone missing.
> >    What do you suggest to do in this case?
> 
> Just fixing the userspace utility to deal with this case properly as
> well is probably the easiest. How are you thinking you'd deploy this?
> Via ifup hooks on openwrt, or something different?

Yes, I use ifup hooks configured in an init script for procd and have
it tied to the wireguard config sections in /etc/config/network:

https://git.openwrt.org/?p=openwrt/staging/dangole.git;a=blob;f=package/network/utils/bpf-examples/files/wireguard-preserve-dscp.init;h=f1e5e25e663308e057285e2bd8e3bcb9560bdd54;hb=5923a78d74be3f05e734b0be0a832a87be8d369b#l56

Passing multiple inner interfaces to one call to the to-be-modified
preserve-dscp tool could be achieved by some shell magic dealing with
the configuration...

We will have to restart the filter for all inner interfaces in case of
one being added or removed, right?

And maybe I'll come up with some state tracking so orphaned filters can
be removed after configuration changes...



Cheers


Daniel
