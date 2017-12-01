Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35d3bea1
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 13:38:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e99dde5
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 13:38:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04fa856f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 13:38:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a12f6ff9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 13:38:55 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id v21so9056801oth.6
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 05:45:11 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Dec 2017 14:45:09 +0100
Message-ID: <CAHmME9ru-yePxK2dEUNx25n32HzL1mtdBW4KcPBcW2butmqrJg@mail.gmail.com>
Subject: web browser javascript key generation and related brain disorders
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi everyone,

Some people have been asking me about delivering configurations to
users in the web browser. I usually try to keep sensitive crypto out
of the browser, and I don't really approve of JavaScript crypto, but
it struck me that in the absence of something better, commercial
providers might be tempted to generate private keys server side using
random(3) and send them to their poor users.

To preempt this mistake, I made this example code:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/keygen-html

It generates a private key in the browser, makes a request to the
server with the corresponding public key, and then creates a
downloadable configuration file for the user. It's extremely simple.
It's certainly better than generating keys server side, though it does
come with these caveats:

- Curve25519, for deriving the public key, is compiled using
emscripten. Who knows what kind of code this actually generates, or
what all those optimization options wind up doing.
- explicit_bzero(3) isn't really a thing in JavaScript.
- You have to trust window.crypto.getRandomValues(). If you don't, you
could always hash together one block each of output from
window.crypto.getRandomValues() and some /dev/urandom data delivered
by the server. Or do that hilarious thing where you're asked to shake
your mouse around inside a box to "make some randomness", but please
don't actually do this; the 90s called and wants its DHTML snow flake
mouse trails back.
- JavaScript crypto is a pretty dubious proposition.

On the plus side, one could imagine some pretty easy-to-use
interfaces. Buttons like:

[Download .zip of configurations for all locations]
[Download .conf of us1] [Download .conf of nl1] [Download .conf of se1]

So, it's there now. Do with it what you will.

Regards,
Jason
