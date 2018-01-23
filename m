Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9b227b8
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jan 2018 18:51:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 393a89fb
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jan 2018 18:51:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f0422d4
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jan 2018 18:42:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4a28488
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jan 2018 18:42:21 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id m83so1074887oik.8
 for <wireguard@lists.zx2c4.com>; Tue, 23 Jan 2018 10:55:20 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 Jan 2018 19:55:18 +0100
Message-ID: <CAHmME9pCYuxNqYV2thPm1su31sO2=-Eug8aVCEDUc7YsjwrXUA@mail.gmail.com>
Subject: New Computational Proof Results of WireGuard Protocol from Dowling
 and Paterson
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

Hey folks,

Two researchers -- Ben Dowling and Kenny Paterson, who you might know
from their work on Signal and TLS 1.3, among other research areas --
have written up a by-hand game hopping proof in the computational
model of the WireGuard protocol. The paper is worth a read:

https://eprint.iacr.org/2018/080.pdf

The findings are very interesting.

One design goal of WireGuard is to simplify the state machine as much
as possible, by keeping the handshake portion of the protocol as only
two messages -- there (message 1) and back (message 2) -- so that if
something goes wrong, the state machine can just start over at the
beginning again, without having to take into account intermediate
states. The original WireGuard paper [1] writes that after the
initiator receives message 2 from the responder, the initiator must
send the first transport data message to the responder, not the other
way around, to act as a handshake _confirmation_ message. By putting
the confirmation message as part of the transport layer, it means that
_any_ transport message that arrives will suffice as confirmation, as
opposed to relying on a special handshake-layer message, which could
be dropped (we're UDP remember), thereby complicating the state
machine. This is a fairly nifty trick that allows us to write simpler
and more reliable implementations, and it's specified as part of how
the Noise Protocol Framework [2] works.

It turns out, however, that traditional computational security models,
such as the eCK model used in this paper, were designed for a
different era of protocols, where the handshake was one thing, and the
transport was another, and different handshakes could be put together
with different transports, in a nicely stackable fully modular way.
Certainly IPsec-era protocols, for example, were interested in this
kind of layer-separation -- IKE is a good example. These computational
security models simply don't take into account what it means when a
transport message is used as an essential part of ensuring the
handshake security properties.

Other protocols have had similar traits -- TLS 1.2, for example -- and
researchers came up with a different security model called ACCE [3],
in order to prove (or disprove!) things about them. But generally
speaking, the go-to model for researchers interested in trying to do
computational proofs is eCK.

Thus, Dowling and Paterson tried to fit the verbatim protocol into
this computational model, and were not able to, due to WireGuard's
reliance on the first transport message as part of its handshake
properties (which we consider a feature, not a bug). Fortunately, the
authors didn't stop there. They then went on to modify their
description of the WireGuard protocol to put that confirmation message
essentially as part of the handshake layer, which would not be
feasible for real WireGuard, but is a sufficiently interesting
modification to prove things about. Finally, they showed that that
modified construction is secure.

I interpret this as further positive confirmation of WireGuard and the
Noise Protocol Framework, as it is easy to argue that their modified
WireGuard protocol -- which fits into their security model -- is
"morally equivalent" to the real WireGuard protocol. I also look
forward to advancements in the tools and models available to
computational proof researchers.

Enjoy the papers!
Jason


[1] https://www.wireguard.com/papers/wireguard.pdf
[2] https://noiseprotocol.org/noise.pdf
[3] https://eprint.iacr.org/2011/219.pdf
