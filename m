Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f68a342e
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:12:03 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb278799
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:12:02 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Multicast over a wireguard link?
References: <87fuli7itj.fsf@toke.dk>
 <CAHmME9o-0qccmg2zbM62fhi_KuEjtDoXZfBFPtf3yyhUKwtfiA@mail.gmail.com>
Date: Tue, 20 Dec 2016 19:19:03 +0100
In-Reply-To: <CAHmME9o-0qccmg2zbM62fhi_KuEjtDoXZfBFPtf3yyhUKwtfiA@mail.gmail.com>
 (Jason A. Donenfeld's message of "Tue, 20 Dec 2016 17:29:24 +0100")
Message-ID: <8737hiqx9k.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hi Toke,
>
> Right now, no, there's no multicast. But it wouldn't be that hard to
> add the ability to add the same allowed-ips entry to multiple peers,
> and have WireGuard duplicate the message to all of them.

The multicast destination address is known, so that should work. Would
also serve as a kind of ACL, I guess.

> It's not complicated in theory, but I wonder if this would be
> genuinely useful, and whether or not it'd open up a wormhole of
> potential issues.

Well, I would certainly limit it to multicast addresses. But other than
that it sounds like an excellent idea.

Can wireguard handle routed traffic to an endpoint. I.e. if endpoint A
has address 10.0.0.1/32 and endpoint B has a route 'ip route add
10.10.10.1/24 via 10.0.0.1 dev wg0', would the traffic go where it's
supposed to?

-Toke
