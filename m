Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed4c46a2
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 09:26:51 +0000 (UTC)
Received: from mail-ot0-x231.google.com (mail-ot0-x231.google.com
 [IPv6:2607:f8b0:4003:c0f::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b64e096
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 09:26:51 +0000 (UTC)
Received: by mail-ot0-x231.google.com with SMTP id l13-v6so27097161otk.9
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 02:28:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Sat, 5 May 2018 11:28:35 +0200
Message-ID: <CAKXLc7dZD1Qzx1q1fPPikXPvu+vAgCpKnBBiP_hKSiJOtTbxng@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol <vtol@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, May 5, 2018 at 10:18 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <v=
tol@gmx.net> wrote:
> I like to keep things neat/controlled and any necessary open socket is on=
ly
> sticking out like a sore (wondering why it is opened when not wanted for)=
.
> It would certainly instill more confidence in network security/control if=
 it
> would be possible to define which sockets are opened by WG, like other ap=
ps
> do.
>
+1 !

> Which brings up the next point, I have asked previously twice about -
> wildcard ip 0.0.0.0 . How to bind WG to a particular iface/subnet, as  a
> another matter of network security?
>
It is not possible AFAIK. I am not sure in the intrinsic workings, may
be it is not possible by design?

Hmm, should be, given that it only listens to UDP on a single IP
address (as configured on the wgX interface).
Well, one can configure multiple addresses to a single interface, but still
What about when we have more than one wgX interface, do they share memory?

Certainly, the source lists it is binds to any interface:
https://git.zx2c4.com/WireGuard/tree/src/socket.c#n330
unconditionally.

So I guess we can use (from `man 7 socket`)

       SO_BINDTODEVICE
              Bind this socket to a particular device like =E2=80=9Ceth0=E2=
=80=9D, as
specified in the passed interface name.  If  the
              name  is an empty string or the option length is zero,
the socket device binding is removed.  The passed
              option is a variable-length null-terminated interface
name string with the maximum size of IFNAMSIZ.  If
              a socket is bound to an interface, only packets received
from that particular interface are processed by
              the socket.  Note that this works only for some socket
types, particularly AF_INET sockets.  It  is  not
              supported for packet sockets (use normal bind(2) there).

              Before  Linux  3.8,  this socket option could be set,
but could not retrieved with getsockopt(2).  Since
              Linux 3.8, it is readable.  The optlen argument should
contain the buffer size available to receive  the
              device name and is recommended to be IFNAMSZ bytes.  The
real device name length is reported back in the
              optlen argument.

Just a wild guess.

Cheers,
Kalin.
