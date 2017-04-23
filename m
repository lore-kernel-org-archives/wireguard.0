Return-Path: crasm@wireguard.1.email.vczf.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9851939
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 18:57:23 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dad2ef23
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 18:57:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AAC7209F6
 for <wireguard@lists.zx2c4.com>; Sun, 23 Apr 2017 15:05:50 -0400 (EDT)
Message-Id: <1492974349.3561563.953531152.63E71A3E@webmail.messagingengine.com>
From: crasm@wireguard.1.email.vczf.io
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
References: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
 <1492931136.3430679.953148112.4F826684@webmail.messagingengine.com>
 <CANTUoefkd_GaS2TPD-T3sAYiGxjdXOy3=YtQ2iEsWeCsj810CA@mail.gmail.com>
Date: Sun, 23 Apr 2017 15:05:49 -0400
In-Reply-To: <CANTUoefkd_GaS2TPD-T3sAYiGxjdXOy3=YtQ2iEsWeCsj810CA@mail.gmail.com>
Subject: Re: potential preshared-key changes
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Apr 23, 2017, at 06:49 AM, Fredrik Str=C3=B6mberg wrote:
> [...]
> Furthermore, consider that the IP addresses of the peers will most
> likely be available to the attacker.
> [...]
> 2. The attacker gains an advantage by knowing S(pub,i) which is not
> gained by already available metadata (such as the IP addresses)

At least in my case, my IP addresses are pretty closely linked to my
identity. I don't change my VPSs as often as I should and I'm fairly
sure my residential IP is the same as it was months ago.

But isn't the public key of the initiator sure proof of identity if the
handshake is completed? An IP address would only be circumstantial and
would require extra information, like a log/account request to the ISP,
before they'd know with certainty.

In the context of a public VPN and per-user PSKs, a user's usage can be
tracked by a global adversary even if they hop networks. And their
location or movement can also be estimated. I believe interface PSKs
could prevent that if every user was trusted (private VPN?), but that
seems impossible for a public service, since someone malicious could
simply sign up for the service to get the PSK.

On Sun, Apr 23, 2017, at 07:13 AM, Fredrik Str=C3=B6mberg wrote:
> Hi! :)

Hello!

> In practice this is equivalent to the discussed change, and "Peer PSK"
> would be the real key, for that peer.

Ah, so that would be an implementation detail for how the keys are
generated.
