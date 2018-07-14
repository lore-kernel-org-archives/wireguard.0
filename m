Return-Path: jugs@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f42b4e2
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jul 2018 17:55:10 +0000 (UTC)
Received: from mail-1857040130.protonmail.ch (mail-1857040130.protonmail.ch
 [185.70.40.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0291796
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jul 2018 17:55:10 +0000 (UTC)
Date: Sat, 14 Jul 2018 14:02:58 -0400
To: "stunnel@attglobal.net" <stunnel@attglobal.net>
From: jugs <jugs@protonmail.ch>
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
Message-ID: <4T5B-J-USwNbZveJ1mRtq4Mh9Ih8P2yAgR-uqecHysgG0JEw4GpUZwpWRAo8I5WdUihhGnot-qByAePKl7_xiA==@protonmail.ch>
In-Reply-To: <2e6b4759-1acd-ddd3-2471-14ce932ac82a@attglobal.net>
References: <2e6b4759-1acd-ddd3-2471-14ce932ac82a@attglobal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: jugs <jugs@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I don't get an IPv6 link local address address on my wg interface. Do you u=
se network manager?


=E2=80=8B-jugs=E2=80=8B

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On July 10, 2018 10:20 PM, Eddie <stunnel@attglobal.net> wrote:

> =E2=80=8B=E2=80=8B
>=20
> Not sure if this is intended behaviour, or not.
>=20
> Every time I start an interface using wg-quick with the SaveConfig =3D
>=20
> true it reloads all the previous, saved, IPv6 link-local addresses plus
>=20
> generates a new one.=C2=A0 So the first time the interface is started the=
re
>=20
> is 1 link-local address.=C2=A0 The next time, 2.=C2=A0 Then 3. Then 4, et=
c. etc.
>=20
> Cheers.
>=20
> WireGuard mailing list
>=20
> WireGuard@lists.zx2c4.com
>=20
> https://lists.zx2c4.com/mailman/listinfo/wireguard
