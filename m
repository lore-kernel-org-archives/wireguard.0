Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d59e12f
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Aug 2018 13:49:43 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net
 [IPv6:2001:1608:10:3::a:8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b4e757f
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Aug 2018 13:49:42 +0000 (UTC)
Date: Tue, 14 Aug 2018 15:01:31 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Wireguard Security Specification
Message-ID: <20180814140127.GA1382@matrix-dream.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I have read the wireguard submission, read or skimmed most
of the website and whitepaper, but I have not found any
firm commitment on its high-level security characteristics.
It is good to know high-level characteristics when choosing
a solution to a problem. What does wireguard do, what does
it provide, under what assumptions and what are the limitations?

To illustrate, if evaluating from an infrastructure/sysadmin/
devops/whatever perspective, I would come up with:
Wireguard claims to be a fast <marketing> secure .. tunnel,
mentions a bunch of keywords, it's trendy, explains how
it has a good development methodology and someone proved
some aspect of it to be "secure". No disrespect intended.

It would be very helpful to know what secure tunnel
means in the context of what wireguard provides.
E.g.

Assuming a wireguard connection A <-> B.
1) What can a passive observer see (or deduce)?
  - is it a apparently a wireguard connection? -> yes?
  - packet
    - count -> yes?
    - size -> byte level?
    - timing -> ? no/hardware limit?
    - classification -> data vs. protocol, message type?
    - transported(inner) header/data bits -> 2?
  - other info
    e.g. host name/software/version/architecture/speed/..

2) What can an active attacker do?
  - malleability
    - transported header/data -> limited?
    - wg protocol packets -> ?
    - outer headers -> no protection
        IP source -> temporarily deflects traffic?
  - replay
   ..
  - spoofing
  ..

3) What does B learn about A? (e.g. if B is a service provider)
  - all listed in (1)
  - pubkey? should be random
  ..


Regards,
Ivan Labáth
