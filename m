Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31fa3150
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 21:59:32 +0000 (UTC)
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47ea3ef4
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 21:59:32 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id k3so17740318ywk.8
 for <wireguard@lists.zx2c4.com>; Wed, 15 Nov 2017 14:03:48 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Roaming Mischief
To: Markus Woschank <markus.woschank@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
Date: Wed, 15 Nov 2017 22:03:45 +0000
MIME-Version: 1.0
In-Reply-To: <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 15/11/17 18:38, Markus Woschank wrote:
> I don't see the point in allowing other IPs to connect if an
> endpoint IP has been specified - more confusing then helpful IMO.

Endpoint is also used so that this machine can initiate sessions with
the peer. WireGuard is not a client-server architecture; by removing the
endpoint, you are preventing this peer from initiating. This is only
useful if you're using it *as* a server, in which case roaming is
usually what you want, but not always.

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaDLm9AAoJEIrwc3SIqzASbN4P/iPQ3lMU48ehqDG7g3bOyxzV
qPGdipvtjslsykZaEPV5ZaL+olg1IvV3fG0eXuYny1pU55TMS+eJzQcc2Y1C6ovv
Qdm0C82GQahuy8GaPH5KTMMxTpw5M1rP/ffpW5tujzegLnoCY/zov3gs0ejsahU4
fEABmagk/d6k8ct2bJvFoKLvVr1PQel0gMv1D2LY1wdZBus6P6xbM7uVH346CJU7
Y5Gx/qo2e++PNtPJLNuXEWqaB/GvuCNsnYyZwec1J9h2ZHEhaaJOl+tQvFf/dHCk
BMj/OEopN8+7u00N8LTQdsUiG6Pb6klIZyKN3fuLNhTmIaox+Gwi7mgEzOOYmGgn
ft8YiwFumBbU+E9P0DCwScOC+6jPKPFsYUfXtWqAjKGPsJRfeBaRk//v9weqqt6p
jNpyfOCk5GxtG26U9gYqBldAMdl3OdlEYeN7ve1FXpoT4CbhuDfm7XzPFkMzirON
EjXyqLaqhRW7Jd1yAnp585FLuQ/tXw284hQFSimVSZ+WuWwnm21IL/7JfRMIPXUa
B3wbNIAmpFwBZKdO8mcgZjakt7pVheT7aVbIJpWOuWpFvJvCltI/jQvY1O9V+ZcU
sRAF6bK2m+4eupFe6Wex3s692sLnaX942gCWZvzZIx01ZRCITqYsdyabdwVxtb3X
z3FPheigDitxgt15oMKP
=61HN
-----END PGP SIGNATURE-----
