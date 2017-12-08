Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4064d67b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:17:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87b60536
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:17:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 408e99b5
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:17:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c629917
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:17:41 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id j17so6341346oih.3
 for <wireguard@lists.zx2c4.com>; Thu, 07 Dec 2017 18:24:47 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 03:24:46 +0100
Message-ID: <CAHmME9rsH12J7CAtt26=vj7UdUw8NBYLW6Vj9qSpJM_EKLOaBA@mail.gmail.com>
Subject: Cipher Agility [Re: WireGuard Upstreaming Roadmap (November 2017)]
To: Stefan Tatschner <rumpelsepp@sevenbyte.org>
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

On Thu, Dec 7, 2017 at 11:22 AM, Stefan Tatschner
<rumpelsepp@sevenbyte.org> wrote:
> I have a question which is related to the involved crypto. As far as I
> have understood the protocol and the concept of wireguard, there is no
> crypto agility in the design. That means we cannot easily replace the
> underlying cryptographic primitives without breaking things. Please
> correct me if I am wrong.
> Assuming I am right according the crypto agility, what's the upgrade
> path if any of the involved cryptographic algorithms will be declared
> insecure/broken? From my point of view wireguard tries to stay as
> simple as possible and in general that's a good idea. I am just a bit
> worrying about the possible lack of a clear upgrade path once
> wireguard is mainlined.
> What's your opinion on this?

Have you read the paper?

https://www.wireguard.com/papers/wireguard.pdf

The basic answer is that WireGuard has message type identifiers, and
the handshake also hashes into it an identifier of the primitives
used. If there's ever a problem with those primitives chosen, it will
be possible to introduce new message type identifiers, if that kind of
"support everything even the broken garbage" approach is desired by
misguided people. However, a better approach, of course, is to keep
your secure network separate from your insecure network, and to not
allow insecure nodes on secure segments; when you mix the two,
disaster tends to strike. So, in other words, both approaches are
possible, in this fantasy wireguardalypse. Take note, though, that
neither one of these approaches (support new and retain old protocol
too for old nodes, or only support new) are "agile" or are anything at
all like the 90s "cipher agility" -- the user still is not permitted
to choose ciphers.

Hope this satisfies your curiosity.

Regards,
Jason
