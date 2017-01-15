Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48f68b85
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:30:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1773a95e
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:30:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed47ba0c
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:30:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf071693
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:30:31 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w204so86774463oiw.0
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 02:40:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
 <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Jan 2017 11:40:51 +0100
Message-ID: <CAHmME9prbSxXRK+MvZvfmF4EnzMST0o7gRtc6UqMUn+ZTJk2xg@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: Peter Dolding <oiaohm@gmail.com>
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

Hi Peter,

On Mon, Jan 9, 2017 at 2:43 PM, Peter Dolding <oiaohm@gmail.com> wrote:
> You example gets you a connection.   You example does not cope with IP
> change as that happens in NAT environments.

Yes, example only code.

> VPN detects connection lost triggers resolve again to check if the IP
> address/port it is using is still current and correct.

As mentioned elsewhere, at some point there will be userspace
notification for these sorts of events. I agree it's necessary for
this kind of detection.

> if you put a Wireguard Server behind a nat with a
> dynamic IP your example code completely fails.

Yea. This was similarly discussed in the other thread from Emmanuel.
That discussion veered toward a multiendpoint-like solution. What
you're suggesting, here, is a STUN-based solution, which depends on
userspace connectivity notification. Your suggestion indeed is
interesting to me.

> The reality is you cannot run resolve just once you are operating in
> dynamic IP address with NAT.

If the server is behind a dynamic IP firewalled situation, right.

> Relay is not exactly possible to performing with existing code.   From
> what I have seen of wireguard I cannot tell it to use a standard
> socket file.  Like /var/lib/mysql/mysql.sock with mysql.   Because
> when you are going to be relaying all packets you don't need a IP
> addressed port.   Ok now we have extra performance overhead and over
> expanded packet attempting to get into TURN effecting every packet
> sent by current Wireguard design.

I think you could set the WireGuard endpoint to be localhost pointing
to some TURN daemon to do it in userspace?

By the way, would that kind of hack be an acceptable way to go about
STUN for you? A userspace daemon that forwards packets to a
dynamically changing IP? Maybe that's simpler to implement than the
userspace state notification stuff I mentioned before.

> So current design would be rewriting all the packet headers to send
> wireguard to TURN.   This is why with TURN it would be way better
> built into the base design.

There's zero chance I'm going to incorporate TURN into the wireguard
core protocol, but I am amenable to discussing ways in which it could
be built on top in some nice composable fashion.

> STUN rfc goes and documents all the ways a resolve sever solution with
> NAT will hit brick walls.   So you want to design something for
> punching holes in NAT read the STUN rfc completely.
>  https://tools.ietf.org/html/rfc5389

Yes, I know what STUN is; I know what TURN is; I've read your linked RFC.

> Basically you have been doing NIH syndrome.

No I haven't. I made some quick example code as a PoC in a hundred
lines of C, so that somebody wanting to incorporate STUN later on
would have something concrete to visualize the design. Maybe that
person is you? Perhaps you'll be the one to contribute something
useful.

> My step one is somehow have wireguard support calling/registering with
> a userspace resolve program for when connection fails.

I'll work on this and give some thought about the cleanest solution.

> I am not going to write something that I know end users are going to
> have trouble with.   Both STUN/TURN mandates that resolve interface to
> be workable.

I don't understand your sentence. Are you writing these long rambling
emails because you intend to write some code? Or because you don't?
I'm a bit lost by your intentions.
