Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71030391
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 15:19:19 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2001:470:dc45:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6a1da39
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 15:19:19 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: vtol@gmx.net
Subject: Re: WG interface to ipv4
In-Reply-To: <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net>
Date: Sun, 06 May 2018 17:21:38 +0200
Message-ID: <874ljk24jh.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

=D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> writes:

> For that matter it is pretty easy in ssh to limit its socket and
> iface/ip range exposure. Is it due to the inferior design of ssh that
> such security hardening features are made available/considered? If you
> keep the ssh keys safe that should be all that matters, should it not?

SSH is different for two reasons: It runs over TCP, and it runs in
userspace.

Because it runs over TCP, it will react to unauthenticated packets,
perform a handshake and exchange quite a bit of traffic before its gets
to the point where it can authenticate its peer. Wireguard does not
exhibit this behaviour: Instead, every data packet is authenticated
individually, and if it doesn't match it is simply dropped. So an
attacker that doesn't know the private key can't even discover that a
host is running wireguard.

Secondly, because SSH runs in userspace, a lot of the processing (such
as the TCP handshake) is done by the kernel on the application's behalf.
So the only way the application has of telling the kernel not to do
this, is by setting the listen address. Wireguard lives directly in the
kernel and so can perform the authentication directly after receiving
the packet, without suffering a context switch to userspace.

The first reason is obviously more important than the second one. Either
way, the decision about whether to add a configuration knob is a
tradeoff; where any possible security gains have to be weighed against
the added complexity (which includes maintaining the extra code, the
risk of misconfiguration, and the cognitive load on the user who has to
deal with more options). Wireguard, in general, tries very hard to avoid
configuration knobs that are not absolutely necessary; and since in this
case the security gains are lower than in many other cases (to the point
where they are mostly theoretical), this decision does make sense :)

-Toke
