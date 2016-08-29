Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e994a5f
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 19:17:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f10ee666
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 19:17:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b546ae15
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 19:17:12 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id l89so108046542lfi.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 12:24:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Aug 2016 21:23:57 +0200
Message-ID: <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
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

Hi again,

So I implemented a first stab of this, which I intend to refine with
your feedback:

    https://git.zx2c4.com/WireGuard/commit/?id=a2dfc902e942cce8d5da4a42d6aa384413e7fc81


On the way out, the ECN is set to:

outgoing_skb->tos = encap_ecn(0, inner_skb->tos);

where encap_ecn is defined as:

u8 encap_ecn(u8 outer, u8 inner)
{
        outer &= ~INET_ECN_MASK;
        outer |= !INET_ECN_is_ce(inner) ? (inner & INET_ECN_MASK) :
                                          INET_ECN_ECT_0;
        return outer;
}

Since outer goes in as 0, this function can be reduced to simply:

outgoing_skb->tos = !INET_ECN_is_ce(inner_skb->tos) ? (inner_skb->tos
& INET_ECN_MASK) : INET_ECN_ECT_0;

QUESTION A: is 0 a good value to use here as outer? Or, in fact,
should I use the tos value that comes from the routing table for the
outer route?


On the way in, the ECN is set to:

if (INET_ECN_is_ce(outer_skb->tos))
        IP_ECN_set_ce(inner_skb->tos)

I do NOT compute the following:

        if (INET_ECN_is_not_ect(inner)) {
                switch (outer & INET_ECN_MASK) {
                case INET_ECN_NOT_ECT:
                        return EVERYTHING_IS_OKAY;
                case INET_ECN_ECT_0:
                case INET_ECN_ECT_1:
                        return BROKEN_SO_LOG_PACKET;
                case INET_ECN_CE:
                        return BROKEN_SO_DROP_PACKET;
                }
        }

QUESTION B: is it okay that I do not compute the above checks? Or is
this potentially very problematic?


I await your answer on questions A and B.

Thanks,
Jason
