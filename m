Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 145028e1
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 13:35:23 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54f4602b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 13:35:23 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [patch] add support for peer names using a file in userspace
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
Date: Fri, 8 Dec 2017 07:42:30 -0600
Message-Id: <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On Dec 7, 2017, at 10:23 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Thanks for sending this to the mailing list. Indeed it got lost in the
> fold of disorganized email filters when you sent it to me directly
> twice earlier; sorry about that.

The latest patch is reworked, disabled by default and requires =
WITH_PEERDATA=3Dyes to be enabled.

> I'm not certain this is the right approach -- having wg(8) rely on
> fixed filesystem paths, and splitting peer configuration information
> across three places (original config file, peer data file, kernel).

I'm just trying to find a solution with traction.  My latest patch works =
perfectly fine on our Linux appliance, but alternate approaches could be =
a more general solution.

> I think the way forward for this kind of feature would be what I
> proposed in an earlier thread, of attaching it to the kernel object,
> just like ifalias does or netfilter's comment target. However, the
> question I'm still faced with is -- is this really necessary?

Yes, Jason, I think it is necessary.

Consider a GUI showing a list of peers that you can click on to edit, =
there needs some sort of human-memerable "name" associated with each =
peer.

Additionally, the "wg show" output is sorted by "handshake time" (a good =
thing), so remembering your peer config order does not help identifying =
the peers.

While I would be happy with a compile-time option to support peer-names =
via a userspace file (per my patch), a kernel object would be better.

Suggested configuration syntax:

1) Support either [Peer] or [Peer-some_custom_name] in "wg setconf" =
configurations.

2) Make "wg showconf" parrot back any [Peer-some_custom_name] context =
names.

3) Make "wg show" display either "peer: orQ..." or =
"peer-some_custom_name: orQ..."

4) Any spaces in the "some_custom_name" text are ignored and truncated =
to 64 characters.

Thanks for your consideration.

Lonnie
