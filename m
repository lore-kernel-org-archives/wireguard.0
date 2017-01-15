Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d8d03d0
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:02:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d721a88c
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:02:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62916753
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:02:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a16eadae
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:02:40 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id j15so86466871oih.2
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 02:13:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9129c738-3c36-ebf7-5ce0-c8efbc570835@sholland.org>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
 <9129c738-3c36-ebf7-5ce0-c8efbc570835@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Jan 2017 11:12:59 +0100
Message-ID: <CAHmME9oCNERj8UrEp-6S_2kOUaUwZnkLKJSh8WZrMsJrrLmjjg@mail.gmail.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jan 9, 2017 at 3:37 AM, Samuel Holland <samuel@sholland.org> wrote:
> I think there should be a distinction between endpoint addresses
> provided in explicit configuration and those discovered through roaming.
> Presumably, users put those addresses in the configuration file because
> they expect them to be relatively stable. So I think those endpoints
> should always be remembered.
>
> As for addresses learned from roaming, a simple solution is some form of
> aging. If the endpoint is changing because the machine is physically
> moving (e.g. to a different wireless network), it's not likely that
> previous address:port combinations will work again in the future, except
> for a few common locations (home, work). So there's not much reason to
> remember more than the last few. On the other hand, consider a
> fixed-location user whose IP only changes when the router reboots every
> few months. In that case, there's no chance of even the last one or two
> endpoints being reused. So a time-based aging seems more appropriate.
> Assuming (for illustration) you pick an endpoint every handshake, then
> "this endpoint hasn't been chosen in the last 50 handshakes" means it's
> okay to forget about.
>
> So: 1) always keep manually added endpoints, and 2) only keep a few
> roaming endpoints, and drop them when they are unused for a while.

I don't like the complexity of adding that kind of distinction,
between explicit and learned addresses. I think in the end that will
prove to be confusing. But I like the idea of keeping track of metrics
and cycling out based on that.

> As a separate point, I have a use case that I haven't seen discussed
> yet. I have a WireGuard peer at Site A with a public IP. I have two
> peers, a desktop and a laptop, at Site B, both behind NAT. Both of them
> are configured with the machine at Site A as their only peer. Often I
> take the laptop offsite, and then traffic between the desktop and laptop
> goes through Site A. Good. However, when I have them on the same local
> network, I'd like them to communicate directly (avoiding the round trip
> to Site A).
>
> The problem is that, if I add the desktop and laptop as peers to each
> other, they stop sending traffic through Site A at all. Thus, when they
> are _not_ on the same network (so behind two different NATs, as opposed
> to no NAT) they cannot communicate at all.
>
> It would be nice to get the desktop and laptop able to directly
> communicate (which is what we're discussing mostly in this thread), but,
> as a fallback, it would be nice to be able to say "if you can't
> handshake with the peer for this internal IP, send their traffic through
> the peer with the next larger enclosing subnet of allowed IPs. Then the
> peer with the public IP and the allowed IPs of 0.0.0.0/0 could act as a
> hub for peers behind stricter NATs.

Right now the cryptokey routing is very strict. All entries must work
one-to-one, and they're always enforced and active when present. What
you're suggesting here is that the cryptokey routing table entries
would sort of "disappear" when there isn't a current handshake. That's
interesting; I'll give it some thought.

One thing that comes to mind is how to detect when the local LAN peer
comes back online there. Should wireguard just be trying to initiate a
new handshake _always_, and eventually it will succeed and promote the
cryptokey routing table entry to "active"?
