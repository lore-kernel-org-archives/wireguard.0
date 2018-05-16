Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0cce358
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 11:09:00 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 030900ff
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 11:09:00 +0000 (UTC)
Subject: Re: Need for HW-clock independent timestamps
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Axel Neumann <neumann@cgws.de>, wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de> <87k1s7wx30.fsf@toke.dk>
 <1FB166DA-4390-47BD-9CB0-8408C0691AC1@cgws.de> <87h8n8ym7k.fsf@toke.dk>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <6c3c44fd-f4a4-63a5-5df0-ddcb537d9235@urlichs.de>
Date: Wed, 16 May 2018 13:08:46 +0200
MIME-Version: 1.0
In-Reply-To: <87h8n8ym7k.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 16.05.2018 11:38, Toke Høiland-Jørgensen wrote:
> No I meant DOS if you fail to save state properly. I.e., I send seqno
> 100000, lose my state, reboot, and re-initialise to seqno 100.
So don't do that then. Your saved state needs to be substantially higher
than any seqno you could possibly send, which is why I advocated adding
a trillion or so to the state you write to disk (NOT to the state you
actually use!). The timestamp field is large enough for that to work.
> You'd need to not only save your own seqno, but also the last seen seqno
> from every peer. Otherwise you're vulnerable to a replay attack after
> rebooting. And if you lose that state you are, well, vulnerable to a
> replay attack after rebooting 

If that were the case you'd be vulnerable to such an attack right now,
as there is no check whatsoever that the timestamp you get corresponds
to any notion of current time, and nothing saves your peers' state at
reboot.

So let's look at what a replay attack can possibly accomplish after a
reboot – essentially, this requires Eve to store a bunch of Alice's
crypto setup packets and then feed them all to Bob after she detects
that he has rebooted. He'll respond to each of those and the attack ties
up one of his CPUs , but Eve doesn't know his private key thus can't do
anything with the replies. Meanwhile either Alice or Bob will send a new
setup packet to each other, which causes all further of Eve's packets to
be ignored.


-- 
-- Matthias Urlichs
