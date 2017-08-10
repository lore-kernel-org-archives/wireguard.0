Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d1b1253
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 23:28:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3645b32
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 23:28:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfb06f2e
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 23:47:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d5f2a4f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 23:47:34 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 77so20948758itj.1
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 16:50:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170810221606.GC30478@lud>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
 <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
 <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
 <20170810221606.GC30478@lud>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 11 Aug 2017 01:50:38 +0200
Message-ID: <CAHmME9o7Z4L+UrzeLgnetdJ_LWO-XbJE-kcM8W_r76QB7JT_aA@mail.gmail.com>
Subject: Re: Multihomed server issue
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Baptiste,

On Fri, Aug 11, 2017 at 12:16 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> This is essentially a difference of weak vs. strong host model, see
> https://tools.ietf.org/html/rfc1122#page-61
>
> The RFC is quite clear:

Wow, thank you so much for knowing about this / finding this. Exactly
the kind of "actual knowledge" I was hoping would emerge on the
thread. Super appreciated.

> However, a system with a strong host model would drop the incoming packets
> in the first place, still from the RFC:
> But Linux has adopted the weak host model, see for instance the documentation
> for "arp_filter" and "arp_announce" in Documentation/networking/ip-sysctl.txt.

That's a useful way of distinguishing it. WireGuard's external
endpoint has always aimed to be as _weak_ as possible, always
listening on ::/0 and 0.0.0.0/0, and always accepting the most packets
in the most permissive way, because it can rely on solid
cryptographically verified authenticators to verify that the packet is
legitimate, and because it stays silent anyway in response to
illegitimate packets. For this reason, in terms of ingress, I think
following the weak model makes sense.

It's therefore useful to know that the egress decision can directly
follow from the ingress decision, according to your reasoning and that
of the RFC.

> So I think your proposed change makes sense, you should use the
> destination address of the request as source address, even if this address
> is not assigned to the outgoing interface.

Okay, I'll most likely roll with that. I will still check, however,
that the source address belongs to one of the interfaces in general.
If the source address belongs to no interfaces, it will then use the
default one from the routing table. Otherwise, the socket won't react
to changes at all, what I've been calling "overly sticky" in the test
suite and commits, and connections won't gracefully resume when
changing interfaces around. Doing it this way has the added benefit
that I can check for address interface inclusion before doing a
routing lookup, rather than after and then retrying, which is a nice
optimization.

There is one thing, though, that occurred to me. The reason it was
like this originally -- checking to see if the outgoing source address
belonged to the interface it was going out on -- was because I very
frequently change between wifi and ethernet on my laptop, and each
interface has a different IP address. When I'm on wifi, and then I
connect to ethernet, the ethernet's default route gets a lower (higher
priority) metric than the wifi, and so packets that were formerly on
wifi now go through ethernet. I wanted this same change-over to happen
with wireguard too -- where changing to ethernet would result in
ongoing wireguard packets now having the source address of the
ethernet interface. However, this wasn't happening, since wireguard
was "remembering" the previous source address of the wifi, from the
ingress. Therefore, I added the check to see if that source address
was still on the routed egress interface, and if it wasn't, resetting
it to 0 (choose the default) and trying again.

So, if I'm going to go the route of the weak model, I'll need a
different check to see when I should drop the source address to 0.
Perhaps comparing the ingress device with the routed egress device is
in fact the proper way to do it. The "remembered" source address would
only be used if the egress packet is going out of the same interface
as the ingress packet, and otherwise the default source address would
be used. This seems superior to what we have now. What do you think?

In any case, coding this will likely wait until I'm back from holiday
in a few weeks, so there's plenty of time to think carefully about it.

Jason
