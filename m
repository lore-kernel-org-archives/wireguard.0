Return-Path: dave.taht@gmail.com
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
 [209.85.214.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd0f30de
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 20:08:27 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id e63so125994602ith.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 13:15:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
 <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 29 Aug 2016 13:15:15 -0700
Message-ID: <CAA93jw77n=zkgyney+=hJZDs-56YAeA7bZvfeoh7eedB=zw0ag@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

To try and answer your actual questions...

On Mon, Aug 29, 2016 at 12:23 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> Hi again,
>
> So I implemented a first stab of this, which I intend to refine with
> your feedback:
>
>     https://git.zx2c4.com/WireGuard/commit/?id=3Da2dfc902e942cce8d5da4a42=
d6aa384413e7fc81
>
>
> On the way out, the ECN is set to:
>
> outgoing_skb->tos =3D encap_ecn(0, inner_skb->tos);
>
> where encap_ecn is defined as:
>
> u8 encap_ecn(u8 outer, u8 inner)
> {
>         outer &=3D ~INET_ECN_MASK;
>         outer |=3D !INET_ECN_is_ce(inner) ? (inner & INET_ECN_MASK) :
>                                           INET_ECN_ECT_0;
>         return outer;
> }
>
> Since outer goes in as 0, this function can be reduced to simply:
>
> outgoing_skb->tos =3D !INET_ECN_is_ce(inner_skb->tos) ? (inner_skb->tos
> & INET_ECN_MASK) : INET_ECN_ECT_0;
>
> QUESTION A: is 0 a good value to use here as outer? Or, in fact,
> should I use the tos value that comes from the routing table for the
> outer route?

The outer routing table is read for where stuff comes in in the first
place from the packet to make the routing decision.

As in general dscp values are not preserved end to end and can cause
re-ordering when they are, it's best to use your own dscp value
consistently for the outer header and not vary it within the vpn flow
based on the inner header.

There is a keyword in the ip command (inherit) that can be applied to
switch on or off these behaviors.

Short answer is - stick with 0.

>
> On the way in, the ECN is set to:
>
> if (INET_ECN_is_ce(outer_skb->tos))
>         IP_ECN_set_ce(inner_skb->tos)

This is not correct. (I think my definition of in and out are different)

if (INET_ECN_is_ce(outer_skb->tos) && inner_skb->tos & 3 !=3D 0) //
sorry don't have the macro in my head
           IP_ECN_set_ce(inner_skb->tos)



>
> I do NOT compute the following:
>
>         if (INET_ECN_is_not_ect(inner)) {
>                 switch (outer & INET_ECN_MASK) {
>                 case INET_ECN_NOT_ECT:
>                         return EVERYTHING_IS_OKAY;
>                 case INET_ECN_ECT_0:
>                 case INET_ECN_ECT_1:
>                         return BROKEN_SO_LOG_PACKET;
>                 case INET_ECN_CE:
>                         return BROKEN_SO_DROP_PACKET;
>                 }
>         }
>
> QUESTION B: is it okay that I do not compute the above checks? Or is
> this potentially very problematic?
>
>
> I await your answer on questions A and B.
>
> Thanks,
> Jason



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
