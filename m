Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61cbc546
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:29:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edda229c
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:29:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 537d3582
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:29:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75e07469
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:29:29 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id h4so24979180oib.3
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 03:40:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGzienGKsqkmpGtn7tfunhzRQex9YdN87+tQKwdjzEXOSnmuJg@mail.gmail.com>
References: <CAGzienGKsqkmpGtn7tfunhzRQex9YdN87+tQKwdjzEXOSnmuJg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 May 2017 12:40:06 +0200
Message-ID: <CAHmME9oodMR-wSA6LfMkaDP5Mk2dGMc989G96Y87iO5iBrJB9A@mail.gmail.com>
Subject: Re: Ability to enable catch all allowed-ips on all peers
To: Damian Kaczkowski <damian.kaczkowski@gmail.com>
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

Hi Damian,

At the moment, you can't give multiple peers the same allowed-ips.
There has been some interesting discussion about doing this to support
broadcast messages -- zing a single message out to several peers
having the same matching allowed-ips entry -- but this is different
than the use case you speak of.

I'm not sure I totally understood what you meant in your description
of your multihomed setup. Could you describe in a bit more detail? The
guarantee of WireGuard is that it gives you a strong binding between a
particular IP address (or several IP addresses) and a particular
public key. Wikipedia has a nice diagram for this --
https://en.wikipedia.org/wiki/Surjective_function#/media/File:Surjection.svg
-- with IP addresses being the Xs on the left and public keys being
the Ys on the right. (I should probably make a similar diagram on the
documentation to describe this concept better.) If you're trying to
setup a network such that this binding is problematic, then in all
likelihood, your design has authenticity/spoofing problems. So maybe
you can describe more generally what you're going for, and then we can
try to see how WireGuard fits into this? It's always interesting to
hear about different network setups, anyhow.

Jason
