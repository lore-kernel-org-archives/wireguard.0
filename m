Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21868f19
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 18:07:43 +0000 (UTC)
Received: from mail5.protonmail.ch (mail5.protonmail.ch [185.70.40.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 791eb87c
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 18:07:42 +0000 (UTC)
Date: Sun, 06 May 2018 14:09:52 -0400
To: "vtol@gmx.net" <vtol@gmx.net>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: WG interface to ipv4
Message-ID: <7qQvJLeSZV3rJnkg9rIdA6yznDPzhIFVR_qUa0hBhmCdr_onJsjzXvKVIlp-ovJiRaX1eENGmtrtcZ_7xsHY7heX2qOvouN8pXTt_J3RurQ=@protonmail.ch>
In-Reply-To: <dfcc55c3-795b-dfa2-7034-74b537519ea4@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net>
 <874ljk24jh.fsf@toke.dk>
 <dfcc55c3-795b-dfa2-7034-74b537519ea4@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On May 6, 2018 6:33 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.n=
et> wrote:

> Depends perhaps a bit of what the (long term) aim/goal of the WG is -
>=20
> whether to be a niche product for enthusiasts (only guessing here that
>=20
> this is the current state) or to make it into the
>=20
> mainstream/corporate/commercial arena. I doubt that server
>=20
> administrators will take to it with no control over WG's socket/iface
>=20
> exposure. Probably time will tell and/or I am wrong with that
>=20
> perspective already.

Several people described to you that there is no exposure as every invalid
packet will be silently dropped and you still insist there is a flaw in WG
which will hurt it's adoption. For constructive discussion I propose this:
present us PoC which will show that listening on 0.0.0.0 and ::1 can be
exploited with WG and binding it exclusively to x.x.x.x will help to mitiga=
te
it. At least try to describe such scenario. That would move this discussion
forward and may even lead to WG code improvements.

=E2=80=8BJordan
