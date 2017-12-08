Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feefb7e3
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:38:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c2d3659
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:38:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5ec4feb
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:38:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f76bc0c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:38:21 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id y75so7787062oie.4
 for <wireguard@lists.zx2c4.com>; Fri, 08 Dec 2017 10:45:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
 <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 19:45:30 +0100
Message-ID: <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
Subject: Re: [patch] add support for peer names using a file in userspace
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Lonnie,

On Fri, Dec 8, 2017 at 2:42 PM, Lonnie Abelbeck
<lists@lonnie.abelbeck.com> wrote:
> The latest patch is reworked, disabled by default and requires WITH_PEERDATA=yes to be enabled.

Compile time switches for something that doesn't add a dependency?
Sounds like a bad idea, leading to all sorts of coderot and bloat down
the road.

> Yes, Jason, I think it is necessary.
>
> Consider a GUI showing a list of peers that you can click on to edit, there needs some sort of human-memerable "name" associated with each peer.

In this case, why wouldn't the GUI management logic handle this? Why
does this kind of thing need to be in the tiny building block tool,
wg(8)? This is a great example of a complete system where it perhaps
doesn't make to put it in wg(8).

> Additionally, the "wg show" output is sorted by "handshake time" (a good thing), so remembering your peer config order does not help identifying the peers.

That's a good reason, actually.

> While I would be happy with a compile-time option to support peer-names via a userspace file (per my patch), a kernel object would be better.

Noted, okay.

> 1) Support either [Peer] or [Peer-some_custom_name] in "wg setconf" configurations.
>
> 2) Make "wg showconf" parrot back any [Peer-some_custom_name] context names.

Absolutely not. If something like this lands, it will be called
"Description=" or the like, as another attribute of a peer. There's no
reason to make the section parser more complicated, when this is
essentially just another key value.

> 3) Make "wg show" display either "peer: orQ..." or "peer-some_custom_name: orQ..."
>
> 4) Any spaces in the "some_custom_name" text are ignored and truncated to 64 characters.

Yikes. I'm inclined to make Description or the like follow whatever
other plaintext rules the netfilter comment stuff has, not something
restrictive like "no spaces".

Jason
