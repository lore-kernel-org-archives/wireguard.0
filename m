Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 927010df
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 14:56:34 +0000 (UTC)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
 [209.85.218.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e500f30
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 14:56:34 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id p23so453925oie.9
 for <wireguard@lists.zx2c4.com>; Sat, 18 Nov 2017 07:01:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Sat, 18 Nov 2017 16:01:10 +0100
Message-ID: <CAKUy5ayySemw3Yct425deiLmqSLNLDTS-2Q2GAYp9y8aJabOhg@mail.gmail.com>
Subject: Re: Roaming Mischief
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

@matthias


On 15 November 2017 at 23:03, Aaron Jones <aaronmdjones@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> On 15/11/17 18:38, Markus Woschank wrote:
>> I don't see the point in allowing other IPs to connect if an
>> endpoint IP has been specified - more confusing then helpful IMO.
>
> Endpoint is also used so that this machine can initiate sessions with
> the peer. WireGuard is not a client-server architecture; by removing the
> endpoint, you are preventing this peer from initiating. This is only
> useful if you're using it *as* a server, in which case roaming is
> usually what you want, but not always.
>
> - --
> Aaron Jones
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>
> iQIcBAEBCAAGBQJaDLm9AAoJEIrwc3SIqzASbN4P/iPQ3lMU48ehqDG7g3bOyxzV
> qPGdipvtjslsykZaEPV5ZaL+olg1IvV3fG0eXuYny1pU55TMS+eJzQcc2Y1C6ovv
> Qdm0C82GQahuy8GaPH5KTMMxTpw5M1rP/ffpW5tujzegLnoCY/zov3gs0ejsahU4
> fEABmagk/d6k8ct2bJvFoKLvVr1PQel0gMv1D2LY1wdZBus6P6xbM7uVH346CJU7
> Y5Gx/qo2e++PNtPJLNuXEWqaB/GvuCNsnYyZwec1J9h2ZHEhaaJOl+tQvFf/dHCk
> BMj/OEopN8+7u00N8LTQdsUiG6Pb6klIZyKN3fuLNhTmIaox+Gwi7mgEzOOYmGgn
> ft8YiwFumBbU+E9P0DCwScOC+6jPKPFsYUfXtWqAjKGPsJRfeBaRk//v9weqqt6p
> jNpyfOCk5GxtG26U9gYqBldAMdl3OdlEYeN7ve1FXpoT4CbhuDfm7XzPFkMzirON
> EjXyqLaqhRW7Jd1yAnp585FLuQ/tXw284hQFSimVSZ+WuWwnm21IL/7JfRMIPXUa
> B3wbNIAmpFwBZKdO8mcgZjakt7pVheT7aVbIJpWOuWpFvJvCltI/jQvY1O9V+ZcU
> sRAF6bK2m+4eupFe6Wex3s692sLnaX942gCWZvzZIx01ZRCITqYsdyabdwVxtb3X
> z3FPheigDitxgt15oMKP
> =61HN
> -----END PGP SIGNATURE-----
