Return-Path: <SRS0=Qs4S=6N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715E3C83004
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Apr 2020 08:22:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E275E208E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Apr 2020 08:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E275E208E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gndrsh.dnsmgr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8a94f8e;
	Wed, 29 Apr 2020 08:10:38 +0000 (UTC)
Received: from gndrsh.dnsmgr.net (br1.CN84in.dnsmgr.net [69.59.192.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 114a4b4f
 (TLSv1:AES256-SHA:256:NO) for <wireguard@lists.zx2c4.com>;
 Wed, 29 Apr 2020 08:10:35 +0000 (UTC)
Received: from gndrsh.dnsmgr.net (localhost [127.0.0.1])
 by gndrsh.dnsmgr.net (8.13.3/8.13.3) with ESMTP id 03T8MCmK008080;
 Wed, 29 Apr 2020 01:22:12 -0700 (PDT)
 (envelope-from ietf@gndrsh.dnsmgr.net)
Received: (from ietf@localhost)
 by gndrsh.dnsmgr.net (8.13.3/8.13.3/Submit) id 03T8MBOL008079;
 Wed, 29 Apr 2020 01:22:11 -0700 (PDT) (envelope-from ietf)
From: "Rodney W. Grimes" <ietf@gndrsh.dnsmgr.net>
Message-Id: <202004290822.03T8MBOL008079@gndrsh.dnsmgr.net>
Subject: Re: [PATCH net] wireguard: Use tunnel helpers for decapsulating ECN
 markings
In-Reply-To: <CAHmME9o1binUdw40Uxw7+RU6pDse7k0bw5seNy2CHZ3hw+Pw3Q@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Apr 2020 01:22:11 -0700 (PDT)
CC: Dave Taht <dave.taht@gmail.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
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

> On Tue, Apr 28, 2020 at 12:52 PM Dave Taht <dave.taht@gmail.com> wrote:
> >
> > On Tue, Apr 28, 2020 at 2:10 AM Toke H?iland-J?rgensen <toke@redhat.com> wrote:
> > >
> > > "Rodney W. Grimes" <ietf@gndrsh.dnsmgr.net> writes:
> > >
> > > > Replying to a single issue I am reading, and really hope I
> > > > am miss understanding.  I am neither a wireguard or linux
> > > > user so I may be miss understanding what is said.
> > > >
> > > > Inline at {RWG}
> > > >
> > > >> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> > > >>
> > > >> > Hey Toke,
> > > >> >
> > > >> > Thanks for fixing this. I wasn't aware there was a newer ECN RFC. A
> > > >> > few comments below:
> > > >> >
> > > >> > On Mon, Apr 27, 2020 at 8:47 AM Toke H?iland-J?rgensen <toke@redhat.com> wrote:
> > > >> >> RFC6040 also recommends dropping packets on certain combinations of
> > > >> >> erroneous code points on the inner and outer packet headers which shouldn't
> > > >> >> appear in normal operation. The helper signals this by a return value > 1,
> > > >> >> so also add a handler for this case.
> > > >> >
> > > >> > This worries me. In the old implementation, we propagate some outer
> > > >> > header data to the inner header, which is technically an authenticity
> > > >> > violation, but minor enough that we let it slide. This patch here
> > > >> > seems to make that violation a bit worse: namely, we're now changing
> > > >> > the behavior based on a combination of outer header + inner header. An
> > > >> > attacker can manipulate the outer header (set it to CE) in order to
> > > >> > learn whether the inner header was CE or not, based on whether or not
> > > >> > the packet gets dropped, which is often observable. That's some form
> > > >
> > > > Why is anyone dropping on decap over the CE bit?  It should be passed
> > > > on, not lead to a packet drop.  If the outer header is CE on an inner
> > > > header of CE it should just continue to be a CE, dropping it is actually
> > > > breaking the purpose of the CE codepoint, to signal congestion before
> > > > having to cause a packet loss.
> > > >
> > > >> > of an oracle, which I'm not too keen on having in wireguard. On the
> > > >> > other hand, we pretty much already _explicitly leak this bit_ on tx
> > > >> > side -- in send.c:
> > > >> >
> > > >> > PACKET_CB(skb)->ds = ip_tunnel_ecn_encap(0, ip_hdr(skb), skb); // inner packet
> > > >> > ...
> > > >> > wg_socket_send_skb_to_peer(peer, skb, PACKET_CB(skb)->ds); // outer packet
> > > >> >
> > > >> > We considered that leak a-okay. But a decryption oracle seems slightly
> > > >> > worse than an explicit and intentional leak. But maybe not that much
> > > >> > worse.
> > > >>
> > > >> Well, seeing as those two bits on the outer header are already copied
> > > >> from the inner header, there's no additional leak added by this change,
> > > >> is there? An in-path observer could set CE and observe that the packet
> > > >> gets dropped, but all they would learn is that the bits were zero
> > > >
> > > > Again why is CE leading to anyone dropping?
> > > >
> > > >> (non-ECT). Which they already knew because they could just read the bits
> > > >> directly from the header.
> > > >>
> > > >> Also note, BTW, that another difference between RFC 3168 and 6040 is the
> > > >> propagation of ECT(1) from outer to inner header. That's not actually
> > > >> done correctly in Linux ATM, but I sent a separate patch to fix this[0],
> > > >> which Wireguard will also benefit from with this patch.
> >
> > I note that there is a large ISP in argentina that has been
> > mis-marking most udp & tcp traffic
> > as CE for years now and despite many attempts to get 'em to fix it,
> > when last I checked (2? 3?)
> > months back, they still were doing it.
> >
> > My impression of overall competence and veracity of multiple transit
> > and isp providers has been sorely
> > tried recently. While I support treating ect 1 and 2 properly, I am
> > inclined to start thinking that
> > ce on a non-ect encapsulated packet is something that should not be dropped.
> >
> > but, whatever is decided on that front is in the hooks in the other
> > patch above, not in wireguard,
> > and I'll make the same comment there.
> 
> Thanks for pointing this out. We're going to drop the dropping
> behavior in wireguard, especially in light of the fact that folks like
> to use wireguard for working around issues with their broken ISP or in
> other weird circumstances.

Thank you!  

-- 
Rod Grimes                                                 rgrimes@freebsd.org
