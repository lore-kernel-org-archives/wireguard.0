Return-Path: <SRS0=XOuh=6M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E303BC83002
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 01:42:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DAB8206D9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 01:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DAB8206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gndrsh.dnsmgr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 303460ac;
	Tue, 28 Apr 2020 01:30:36 +0000 (UTC)
Received: from gndrsh.dnsmgr.net (br1.CN84in.dnsmgr.net [69.59.192.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cc6a1b3
 (TLSv1:AES256-SHA:256:NO) for <wireguard@lists.zx2c4.com>;
 Tue, 28 Apr 2020 01:30:34 +0000 (UTC)
Received: from gndrsh.dnsmgr.net (localhost [127.0.0.1])
 by gndrsh.dnsmgr.net (8.13.3/8.13.3) with ESMTP id 03S19Txe001752;
 Mon, 27 Apr 2020 18:09:29 -0700 (PDT)
 (envelope-from ietf@gndrsh.dnsmgr.net)
Received: (from ietf@localhost)
 by gndrsh.dnsmgr.net (8.13.3/8.13.3/Submit) id 03S19SCY001751;
 Mon, 27 Apr 2020 18:09:28 -0700 (PDT) (envelope-from ietf)
From: "Rodney W. Grimes" <ietf@gndrsh.dnsmgr.net>
Message-Id: <202004280109.03S19SCY001751@gndrsh.dnsmgr.net>
Subject: Re: [PATCH net] wireguard: Use tunnel helpers for decapsulating ECN
 markings
In-Reply-To: <87d07sy81p.fsf@toke.dk>
To: "Toke H?iland-J?rgensen" <toke@redhat.com>
Date: Mon, 27 Apr 2020 18:09:28 -0700 (PDT)
CC: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller <davem@davemloft.net>,
 Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>,
 "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
X-Mailer: ELM [version 2.4ME+ PL121h (25)]
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII
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

Replying to a single issue I am reading, and really hope I
am miss understanding.  I am neither a wireguard or linux
user so I may be miss understanding what is said.

Inline at {RWG}

> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> 
> > Hey Toke,
> >
> > Thanks for fixing this. I wasn't aware there was a newer ECN RFC. A
> > few comments below:
> >
> > On Mon, Apr 27, 2020 at 8:47 AM Toke H?iland-J?rgensen <toke@redhat.com> wrote:
> >> RFC6040 also recommends dropping packets on certain combinations of
> >> erroneous code points on the inner and outer packet headers which shouldn't
> >> appear in normal operation. The helper signals this by a return value > 1,
> >> so also add a handler for this case.
> >
> > This worries me. In the old implementation, we propagate some outer
> > header data to the inner header, which is technically an authenticity
> > violation, but minor enough that we let it slide. This patch here
> > seems to make that violation a bit worse: namely, we're now changing
> > the behavior based on a combination of outer header + inner header. An
> > attacker can manipulate the outer header (set it to CE) in order to
> > learn whether the inner header was CE or not, based on whether or not
> > the packet gets dropped, which is often observable. That's some form

Why is anyone dropping on decap over the CE bit?  It should be passed
on, not lead to a packet drop.  If the outer header is CE on an inner
header of CE it should just continue to be a CE, dropping it is actually
breaking the purpose of the CE codepoint, to signal congestion before
having to cause a packet loss.

> > of an oracle, which I'm not too keen on having in wireguard. On the
> > other hand, we pretty much already _explicitly leak this bit_ on tx
> > side -- in send.c:
> >
> > PACKET_CB(skb)->ds = ip_tunnel_ecn_encap(0, ip_hdr(skb), skb); // inner packet
> > ...
> > wg_socket_send_skb_to_peer(peer, skb, PACKET_CB(skb)->ds); // outer packet
> >
> > We considered that leak a-okay. But a decryption oracle seems slightly
> > worse than an explicit and intentional leak. But maybe not that much
> > worse.
> 
> Well, seeing as those two bits on the outer header are already copied
> from the inner header, there's no additional leak added by this change,
> is there? An in-path observer could set CE and observe that the packet
> gets dropped, but all they would learn is that the bits were zero

Again why is CE leading to anyone dropping?

> (non-ECT). Which they already knew because they could just read the bits
> directly from the header.
> 
> Also note, BTW, that another difference between RFC 3168 and 6040 is the
> propagation of ECT(1) from outer to inner header. That's not actually
> done correctly in Linux ATM, but I sent a separate patch to fix this[0],
> which Wireguard will also benefit from with this patch.

Thanks for this.

> 
> > I wanted to check with you: is the analysis above correct? And can you
> > somehow imagine the ==2 case leading to different behavior, in which
> > the packet isn't dropped? Or would that ruin the "[de]congestion" part
> > of ECN? I just want to make sure I understand the full picture before
> > moving in one direction or another.
> 
> So I think the logic here is supposed to be that if there are CE marks
> on the outer header, then an AQM somewhere along the path has marked the
> packet, which is supposed to be a congestion signal, which we want to
> propagate all the way to the receiver (who will then echo it back to the
> receiver). However, if the inner packet is non-ECT then we can't
> actually propagate the ECN signal; and a drop is thus the only
> alternative congestion signal available to us.

You cannot get a CE mark on the outer packet if the inner packet is
not ECT, as the outer packet would also be not ECT and thus not
eligible for CE mark.  If you get the above sited condition something
has gone *wrong*.


> This case shouldn't
> actually happen that often, a middlebox has to be misconfigured to
> CE-mark a non-ECT packet in the first place. But, well, misconfigured
> middleboxes do exist as you're no doubt aware :)

That is true, though I believe the be liberal in what you accept
concept would say ok, someone messed up, just propogate it and
let the end nodes deal with it, otherwise your creating a blackhole
that could be very hard to find.

> 
> >> +               if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
> >> +                                        ip_hdr(skb)->tos) > 1)
> >> +               if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
> >> +                                        ipv6_get_dsfield(ipv6_hdr(skb))) > 1)
> >
> > The documentation for the function says:
> >
> > *  returns 0 on success
> > *          1 if something is broken and should be logged (!!! above)
> > *          2 if packet should be dropped
> >
> > Would it be more clear to explicitly check for ==2 then?
> 
> Hmm, maybe? Other callers seem to use >1, so I figured it was better to
> be consistent with those. I won't insist on that, though, so if you'd
> rather I use a ==2 check I can certainly change it?
> 
> >> +ecn_decap_error:
> >> +       net_dbg_ratelimited("%s: Non-ECT packet from peer %llu (%pISpfsc)\n",
> >> +                           dev->name, peer->internal_id, &peer->endpoint.addr);
> >
> > All the other error messages in this block are in the form of: "Packet
> > .* from peer %llu (%pISpfsc)\n", so better text here might be "Packet
> > is non-ECT from peer %llu (%pISpfsc)\n". However, do you think we
> > really need to log to the console for this? Does it add much in the
> > way of wireguard internals debugging? Can't network congestion induce
> > it in complicated scenarios? Maybe it'd be best just to increment
> > those error counters instead.
> 
> The other callers do seem to hide the logging behind a module parameter
> specifically for this purpose. I put in this log message because the use
> of net_dbg() indicated that these were already meant for non-production
> error debugging. But if you'd rather avoid the logging that's fine by me.
> 
> >> +       ++dev->stats.rx_errors;
> >> +       ++dev->stats.rx_length_errors;
> >
> > This should use stats.rx_frame_errors instead of length_errors, which
> > is also what net/ipv6/sit.c and drivers/net/geneve.c do on ECN-related
> > drops.
> 
> Oops, that's my bad; copied the wrong error handling block it seems
> (didn't even notice they were incrementing different counters). Will
> fix.
> 
> -Toke
> 
> [0] https://lore.kernel.org/netdev/20200427141105.555251-1-toke@redhat.com/T/#u
> 
> 
> 

-- 
Rod Grimes                                                 rgrimes@freebsd.org
