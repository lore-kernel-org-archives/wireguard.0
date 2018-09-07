Return-Path: bounce+1a9445.bb0-wireguard=lists.zx2c4.com@poorlab.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 564a5d30
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 08:49:59 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 642e0010
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 08:49:59 +0000 (UTC)
Sender: coder@poorlab.com
Received: by mail-qk1-f181.google.com with SMTP id f62-v6so7506988qke.2
 for <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 01:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
 <20180906094330.273b07be@T-200>
 <706D2A48-7DAA-436A-BB99-2AE80822B524@gmail.com>
 <CANTUoeduZaKnONmZ5tKBm0mCV98MSV4_o0kYJOxEkKo8-FW4sA@mail.gmail.com>
In-Reply-To: <CANTUoeduZaKnONmZ5tKBm0mCV98MSV4_o0kYJOxEkKo8-FW4sA@mail.gmail.com>
From: StarBrilliant <coder@poorlab.com>
Date: Fri, 7 Sep 2018 18:49:38 +1000
Message-ID: <CA+7UkwLcEdJ4zQCftfeaXhoK72qUF0UmF3DPfUr9=4VnyL9RKg@mail.gmail.com>
Subject: Re: Let's talk about obfuscation again
To: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Sep 7, 2018 at 1:20 AM Fredrik Str=C3=B6mberg <stromberg@mullvad.ne=
t> wrote:
> Using Pluggable Transports seem like a good solution. Simply divert
> WireGuard traffic to a local UDP port, which then sends it using a
> Pluggable Transport over the Internet to the other WireGuard peer.
>
> StarBrilliant: You indicated that some aspect of WireGuard ("solve the
> padding and timing problem so PT plugins can run on top of it")
> prevents Pluggable Transports from working. Please elaborate.


On Fri, Sep 7, 2018 at 2:11 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This is generally what I'd recommend too, but I'm not sure I follow
> the logic of the padding and timing. Should not a proper pluggable
> transport be doing this on its own already? Adding random padding to
> all packets, and delaying statistically similar ones randomly as well?
> Especially for the padding aspect, there's little reason why a
> pluggable transport should not already be doing this.


Hello everyone,

Thank you for your attention. I will address the two questions above togeth=
er.

We assume Pluggable Transport to be a universal plug-in. (I don't talk
of *a specific* Pluggable Transport program here, because as I already
knew, there aren't any PT that supports UDP yet. We will still need to
build a UDP-supported PT in the future.)

A Pluggable Transport can and should:
- Scramble the data so it looks like another protocol or random noise.
- Combine and split packets so 1 packet can be 2, 2 can be 1.
- Pad the data so the packet length is not identical to the original.
- Apply delay & jitter so packets does not follow a uniform temporal
pattern. (Sadly, experiments show reordering would terribly affect the
TCP performance in a VPN so we would not turn delay & jitter on by
default)

But a Pluggable Transport CAN NOT:
- Identify whether the inner protocol is Wireguard or SSH or Tor.
- Have knowledge that the "Client Handshake" length=3D148, the "Server
Handshake" length=3D92, the "Keep Alive" length=3D32.
- Swallow any of the packet based on the inside of the packet, except
for traffic shaping & rate limiting.
- Pad the packet too long. (e.g. don't expect 32 -> 1472)
- Delay a packets for minutes long, it can only operate on milliseconds lev=
el.

We know even on an idle connection, the "Client Handshake" is sent
every X minutes, immediately followed by a "Server Handshake". And
"Keep Alive" is sent every Y minutes (configurable by the user, used
for NAT scenarios).

I hope three changes applied to Wireguard:
- For "Client Handshake", "Server Handshake" and "Keep Alive", since
they can be pad to any length without affecting compatibility, why not
pad them to any length below 1472?
- For data packets, leave them as is and let PT do the padding.
- The rekey and keep-alive are sent in random(X-D, X) time, and the
server expect a rekey in a window of range(0, X). D can be as long as
minutes or as long as 50% of X.
- Allow Wireguard to bind to only one or more specific local addresses
(e.g. only ::1). Therefore we do not need to use complicated firewall
setup to prevent WG from directly expose to the Internet.


Best regards.
