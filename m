Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3a3e809
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 08:39:40 +0000 (UTC)
Received: from mail3.protonmail.ch (mail3.protonmail.ch [185.70.40.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb6ccc69
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 08:39:39 +0000 (UTC)
Date: Mon, 07 May 2018 04:41:53 -0400
To: "vtol@gmx.net" <vtol@gmx.net>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: WG interface to ipv4
Message-ID: <1uNBxmuVD4KO09MZhPvQ1xzIIpYoI-Z0AcrIP2sy2mGbSoPeWeUXq74U3YDaaJi1QmtPgujzFL6I6YDfZtJ1DGX-Dcy4qinOBT8R518GbIo=@protonmail.ch>
In-Reply-To: <6c7b92f1-bf66-811a-e571-9ea9b891b55d@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net>
 <874ljk24jh.fsf@toke.dk>
 <6c7b92f1-bf66-811a-e571-9ea9b891b55d@gmx.net>
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

On May 7, 2018 10:24 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.=
net> wrote:

> > SSH is different for two reasons: It runs over TCP, and it runs in
> >=20
> > userspace.
> >=20
> > Secondly, because SSH runs in userspace, a lot of the processing (such
> >=20
> > as the TCP handshake) is done by the kernel on the application's behalf=
.
> >=20
> > So the only way the application has of telling the kernel not to do
> >=20
> > this, is by setting the listen address. Wireguard lives directly in the
> >=20
> > kernel and so can perform the authentication directly after receiving
> >=20
> > the packet, without suffering a context switch to userspace.
> >=20
> > -Toke
>=20
> Perhaps worth noting this WG app (TunSafe) for WIN=C2=A0 "runs as a user-=
mode
>=20
> application and does not run inside of the kernel"
>=20
> https://tunsafe.com/user-guide

That's unfortunate example :)

It's closed source, unaffiliated  and was recommended against several times
here and on IRC. Pointing to go and rust implementations which are being
worked on will be much better.

=E2=80=8BJordan
