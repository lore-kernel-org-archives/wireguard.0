Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2ed63a0
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 10:41:10 +0000 (UTC)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a55b16d
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 10:41:10 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r190so46605300wme.1
 for <wireguard@lists.zx2c4.com>; Sun, 23 Apr 2017 03:49:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
References: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Sun, 23 Apr 2017 12:49:32 +0200
Message-ID: <CANTUoec0_rYvwAO4QF0LjQOVrw+eWkne45vWC=j8rHSP44rXsg@mail.gmail.com>
Subject: Re: potential preshared-key changes
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi everyone,

Jason, you already know my opinion on this, but I will restate it here
for the sake of discussion.

Summary:
Yes, we should make the change so that Pre-Shared Keys are per-peer.
The benefits of per-peer PSKs vastly outweigh the disadvantages.

Premises:
A. The current (or proposed) implementation of Wireguard should not be
used post QC
B. Tunnel traffic from the current (or proposed) implementation of
Wireguard should optionally be protected even post QC
C. A PSK shared between all peers is much more likely to leak than a
PSK shared only between individual peers.

Conclusion:
Because of B and C I'm in favor of changing the handshake to enable
PSKs that are (potentially) unique to every peer. The negative
security impact of the change is also probably quite limited as
discussed below.

The only relevant security impact I see from the change is that in a
post QC world an attacker who has saved the handshakes will be able to
learn S(pub,i), assuming it already knows S(pub,r).

In some situations it's certainly likely that the attacker has
previous knowledge of S(pub,r). One such example would be a public VPN
service. However, in the context of a publicly available VPN service,
if the attacker has taken actions to learn S(pub,r) she will almost
certainly also know the PSK, because the VPN service will provide it
as part of the configuration package. In that case, the identity
hiding is broken anyway, so it's merely a question of whether
historical traffic remains confidential or not.

Furthermore, consider that the IP addresses of the peers will most
likely be available to the attacker.

Finally, I suspect that in practice in a situation where the attacker
has knowledge of S(pub,r) it will also have knowledge of the PSK.

The change would in other words only have a negative security impact when:
1. The attacker somehow knows S(pub,r) but not the PSK
2. The attacker gains an advantage by knowing S(pub,i) which is not
gained by already available metadata (such as the IP addresses)

Discussion of pros and cons:

On Sun, Apr 23, 2017 at 12:22 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Pros of per-interface preshared-keys (current method):
>
>   * Simplicity.
Operators can still choose to set the same PSK for all users. The
change merely offers the option of making it per-peer.

>   * That's how things work now.
Wireguard is still in the development phase. Protocol incompatibility
should not be a concern.

>   * The preshared-key protects the identity hiding in a post-quantum
>     setting.
The identity is still protected assuming S(pub,r) is not known. See above.

>   * The preshared-key contributes to the DoS MACs and the cookie
>     encryption.
This only makes a difference in situations where the attacker knows
S(pub,r) but not the PSK. See above.

> Cons of per-peer preshared-keys (proposed method):
>
>   * The identity hiding is no longer protected in a post-quantum setting.
It is if S(pub,r) is not known to the attacker. See above.

>   * The DoS MACs and cookie encryption no longer benefit from using the
>     preshared-key.
In practice the attacker will probably know the PSK if it has gained
knowledge if S(pub,r). See above.


Finally, thank you again for developing Wireguard.

Regards,
Fredrik Stromberg
