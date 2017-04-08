Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0daffa1d
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2017 09:33:27 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6490050
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2017 09:33:27 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
Date: Sat, 8 Apr 2017 11:39:54 +0200
Message-Id: <E60CF446-DDB2-4C66-B221-FBDCA346E461@danrl.com>
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Juliusz Chroboczek <jch@irif.fr>,
 =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 =?utf-8?Q?Dave_T=C3=A4ht?= <dave@taht.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi everyone,

I am very excited that we have this discussion, as I am one of those =
IPv6-first/IPv6-only guys who like poking the topic.
I try to keep it short:

- Scalability: I agree with what George said. Broadcast does not scale =
nicely, and IPv6 multicast is intended to help scaling things by =
reaching exactly the node that need to get a copy of a particular =
packet. Downgrading IPv6 multicast to broadcast hurts scalability and I =
for one, would rather not see multicast in WireGuard if it does not =
scale. I am afraid it would be counterproductive to the goal of having a =
widely accepted and used protocol.

- Multicast is not the everyday use case, so if multicast requires an =
extra knob or an extra option, that would be fine I guess. I am in favor =
of intentionally enabling multicast. I am still wrapping my head around =
static vs. dynamic (read: magic) configuration of multicast addresses =
and groups. Will let you know once I end up with something worth =
sharing. In the meantime, I think "solicited node multicast =
addresses/groups" are the one thing that comes with the least amount of =
trouble. Especially if IPv6 LL addressing is also there.

- IPv6 link-local addressing: For me it is a perfect example for "the =
right amount of magic". It would make (at least my) life so much easier. =
Filling the neighbor cache would require WireGuard to provide (simulated =
or real) solicited node multicast addresses routing, right? Or is it =
feasible to fill the neighbor cache based on the peer configuration? The =
last thing sounds wrong to me.

So much for my first thoughts.

Cheers,

Dan=
