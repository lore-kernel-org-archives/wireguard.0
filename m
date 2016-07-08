Return-Path: bjin@ctrl-d.org
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
 [209.85.215.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d784b79
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 06:56:57 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id w130so3849696lfd.2
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 23:57:15 -0700 (PDT)
MIME-Version: 1.0
From: Bin Jin <bjin@ctrl-d.org>
Date: Fri, 8 Jul 2016 08:56:53 +0200
Message-ID: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard@lists.zx2c4.com
Subject: [WireGuard] Options to obfuscate WireGuard traffic?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Jason,

Thanks for your work on WireGuard. I tried it and also read the
whitepaper. It looks really promising. Congratulations!

The reason I'm writing this email, is to learn how would WireGuard
work against traffic censorship from authority (particularly the
so-called deep packet inspection). Is it a goal or non-goal for
WireGuard to obfuscate the traffics and make them "indistinguishable"
from raw encrypted traffic?

Some background. Chinese government was doing disgusting things
against VPN (and other tunnelling protocols). OpenVPN and "ssh -D"
tunneling will easily be detected (by the their traffic pattern) and
interrupted (with server IP blocked for several hours). There are also
rumors saying that they are deploying machine learning techniques to
perform deep packet inspection for new protocols. The current most
widely used tunnelling program, Shadowsocks[1], relies sorely on
pre-shared key (and pre-agreed encryption method), and encrypt every TCP
and UDP packet with randomly generated IV (You can see [2]
for details). In this extreme way, it somehow works.

After reading the whitepaper, it's really a good signal to learn that
WireGuard is almost stateless, with state of the art authentication
and encryption. But I'm little worried that it's probably not enough
to work against really aggressive deep packet inspection:

1. The packet format is highly distinguishable. Particularly the
message type is limited to "0x01..04". The sender/receiver index,
timestamp and counter fields also have obvious pattern.

2. The handshake always happens first for once. But I understand it's
by design and we probably couldn't do anything about it.

I understand that it's not flexible to make major changes to the
protocol at this moment, as it's approaching to be finalized. Not
mention that such change will most likely hurt the performance badly.
I just want to know if it's flexible to extend the protocol in the
future. For example, add an option (disabled by default) to use
another pre-shared key to symmetrically encrypt the whole packet? It's
probably also necessary to make the size of the first three packet
types variable, but appending random number of random bytes to those
packets.

Thanks!

Regards,
Bin

[1]: https://shadowsocks.org
[2]: https://shadowsocks.org/en/spec/protocol.html
