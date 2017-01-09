Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e32af7ce
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 02:28:24 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bbab6d6
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 02:28:24 +0000 (UTC)
Subject: Re: [RFC] Handling multiple endpoints for a single peer
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9129c738-3c36-ebf7-5ce0-c8efbc570835@sholland.org>
Date: Sun, 8 Jan 2017 20:37:55 -0600
MIME-Version: 1.0
In-Reply-To: <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 01/08/17 16:49, Jason A. Donenfeld wrote:
> However, this doesn't shine any light on the hardest problem: how to
> update the list of addresses in a memory-bounded fashion. Right now,
> if you receive an encrypted packet, the endpoint of that peer is
> updated to the src address of that packet. With multi-endpoint,
> which endpoint is updated? Is it simply appended to an ever-growing
> list of recent endpoints? How to keep this clean and manageable?

I think there should be a distinction between endpoint addresses
provided in explicit configuration and those discovered through roaming.
Presumably, users put those addresses in the configuration file because
they expect them to be relatively stable. So I think those endpoints
should always be remembered.

As for addresses learned from roaming, a simple solution is some form of
aging. If the endpoint is changing because the machine is physically
moving (e.g. to a different wireless network), it's not likely that
previous address:port combinations will work again in the future, except
for a few common locations (home, work). So there's not much reason to
remember more than the last few. On the other hand, consider a
fixed-location user whose IP only changes when the router reboots every
few months. In that case, there's no chance of even the last one or two
endpoints being reused. So a time-based aging seems more appropriate.
Assuming (for illustration) you pick an endpoint every handshake, then
"this endpoint hasn't been chosen in the last 50 handshakes" means it's
okay to forget about.

So: 1) always keep manually added endpoints, and 2) only keep a few
roaming endpoints, and drop them when they are unused for a while.


As a separate point, I have a use case that I haven't seen discussed
yet. I have a WireGuard peer at Site A with a public IP. I have two
peers, a desktop and a laptop, at Site B, both behind NAT. Both of them
are configured with the machine at Site A as their only peer. Often I
take the laptop offsite, and then traffic between the desktop and laptop
goes through Site A. Good. However, when I have them on the same local
network, I'd like them to communicate directly (avoiding the round trip
to Site A).

The problem is that, if I add the desktop and laptop as peers to each
other, they stop sending traffic through Site A at all. Thus, when they
are _not_ on the same network (so behind two different NATs, as opposed
to no NAT) they cannot communicate at all.

It would be nice to get the desktop and laptop able to directly
communicate (which is what we're discussing mostly in this thread), but,
as a fallback, it would be nice to be able to say "if you can't
handshake with the peer for this internal IP, send their traffic through
the peer with the next larger enclosing subnet of allowed IPs. Then the
peer with the public IP and the allowed IPs of 0.0.0.0/0 could act as a
hub for peers behind stricter NATs.


Thanks,
Samuel
