Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94cb3eb6
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 12:48:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e83e77e
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 12:48:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4b3354f
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 13:07:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77c5dbe1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 13:07:21 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 199so2517943oii.11
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 06:15:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF75rJB=GcvNFmiaySZQhxvkWSo+THpS5s0nePwnWiOThqFYPA@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
 <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
 <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
 <CAF75rJB_eToq4bTqRzqsB7ncObVo2SpsMFKOZFNzoenzkMnJDg@mail.gmail.com>
 <CAHmME9ocbeTDKDoVp-ZRu7E9pw5zp-6QnTSffu-F-JjwW5n63Q@mail.gmail.com>
 <CAF75rJB=GcvNFmiaySZQhxvkWSo+THpS5s0nePwnWiOThqFYPA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Sep 2017 15:15:32 +0200
Message-ID: <CAHmME9qTkXm2rb79Pk6DDx=DpsFZ-e0HNva=YeRMA0C4nKG-0Q@mail.gmail.com>
Subject: Re: Multihomed server issue
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey again,

It turns out that our new semantics -- of rejecting only if the src IP
doesn't belong to _any_ interface, as opposed to the specific
interface -- nicely map to Linux's PKTINFO interface for userspace. In
working with Mathias on the Go implementation, I produced the
following code snippet that shows this sticky-socket technique using
pure-userspace facilities:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/sticky-sockets/sticky-sockets.c

Just FYI, if anybody is curious.

Jason
