Return-Path: ferris@ferrisellis.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 506a9003
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 14:06:22 +0000 (UTC)
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17b278d9
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 14:06:22 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id y187so5117661ywd.12
 for <wireguard@lists.zx2c4.com>; Sat, 02 Dec 2017 06:12:46 -0800 (PST)
Return-Path: <ferris@ferrisellis.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: Rolling keys without service interuption
From: Ferris Ellis <ferris@ferrisellis.com>
In-Reply-To: <CAHmME9q2h_QedDGfmbk-eaniAqB1DV7JUJZ0r36fYmM0Jr8Vow@mail.gmail.com>
Date: Sat, 2 Dec 2017 09:12:44 -0500
Message-Id: <1CF77718-1E9B-4947-852F-930B6784F068@ferrisellis.com>
References: <2185653B-D592-4179-96D6-2CFC16F3E0B1@ferrisellis.com>
 <CAHmME9q2h_QedDGfmbk-eaniAqB1DV7JUJZ0r36fYmM0Jr8Vow@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jason,

Awesome! That=E2=80=99s exactly what I needed :) I=E2=80=99ll try it out and=
 post a follow up if I have any issues.

Cheers,
Ferris

> On Dec 2, 2017, at 8:31 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Ferris,
>=20
> Firstly, WireGuard already has forward secrecy, which means every new
> session (negotiated every 2 minutes) has fresh keys that are
> forgotten, so old recorded traffic cannot be compromised.
>=20
> It sounds like, however, you want to rotate the long term static
> "identity" keys. This is possible to do gracefully. If you change the
> private key of an interface, it won't actually be used until the next
> handshake occurs, which means you can rollover gracefully. Likewise
> you can add new peers (via public keys) dynamically at runtime. Moving
> a distinct allowed IP from one peer to another is an atomic operation
> as well.
>=20
> Hope this helps!
>=20
> Regards,
> Jason
