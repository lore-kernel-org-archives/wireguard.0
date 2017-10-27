Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cebff5a
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 22:24:36 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 908f5fb5
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 22:24:36 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Joe Doss <joe@solidadmin.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
In-Reply-To: <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
Date: Fri, 27 Oct 2017 18:06:50 -0400
Message-ID: <87she4fdol.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri 2017-10-27 19:15:08 +0200, Jason A. Donenfeld wrote:
> (Daniel and Egbert seem mostly okay with the butchered resolvconf in
> their distros; at least they don't see any reason to change things,
> since it mostly works, and users there at least have the choice of
> somehow installing openresolv need be.)

fwiw, i'm *not* ok with resolvconf.  I tried to help co-maintain it for
several years and stepped back from it in disappointment.  I don't even
remember the details at this point, but I'm not convinced that it's
particularly architecturally sound.  I haven't looked at openresolv
myself.

I personally think that the hatchet is an unfortunate distraction from
wireguard.  If Jason decides to ship it upstream, i'll include it in the
debian packages as part of his decision.  However, i suspect it will
break some people's DNS resolution in ways that they don't know how to
recover from besides a reboot (maybe it'll come back after a reboot too?
yikes).  I suspect this will raise even worse noise and abuse than
"Rodney"'s silliness.  And this time, they'll be (at least partly)
right, because the experimental networking tool that they installed will
have done bizarre things to their filesystem mount points(!) and
hijacked an important system configuration file out from under whatever
was maintaining it in the first place.

=2D-----

So I think wireguard is better off with a light touch here.  If Jason
just wants to maintain the current openresolv hook, then any wg-quick
invocation that tries to set DNS can just warn on non-openresolv
systems.  something liike:

    you asked me to set up the DNS but i only know how to do that with
    openresolv installed.  Please install openresolv and try again!

This isn't as magic as the hatchet, but it means wireguard is not
responsible for breaking the user's name resolution.

And if folks want to integrate it with other /etc/resolv.conf managers,
they can write, test, and propose patches themselves.

=2D----

As for what the right solution looks like on a modern GNU/Linux system:

A sensible approach (which i think should be the default on machines
running systemd) is to use systemd-resolved as a local resolving cache.
The easiest way to do that permanently is:

    systemctl enable --now systemd-resolved
    ln -sf /lib/systemd/resolv.conf /etc/resolv.conf

If your networking is configured by systemd-networkd, then everything
else JustWorks=E2=84=A2


On systems that use network-manager, you should tell nm to just inform
resolved when it learns about new DNS servers:

    cat > /etc/NetworkManager/conf.d/use-resolved.conf <<EOF
    [main]
    dns=3Dsystemd-resolved
    EOF
    systemctl restart NetworkManager

On a system configured with systemd-resolved (with or without
network-manager), i'd want wg-quick to just inform systemd-resolved that
it has a new DNS resolver available.  This is probably some ungodly dbus
invocation that i don't know what it is, but would likely not be an
impossibility to figure out.

    https://www.freedesktop.org/wiki/Software/systemd/resolved/

If someone has the fortitude to wade through that, i'd happily ship such
a patch in debian (and encourage Jason to take it upstream alongside his
openresolv hook), but i'm scattered to too many places to do that myself
today.

all the best,

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlnzrfoACgkQFJitxsGS
MjdwFg//atzUpC8CyynJ7Lg9S2RAZ4M6ZufCP8BbFLCgA3MJZd4niCD5OKGxffhi
gm1L88IX6G0pPqhhUz6qK3TFWqG818T42EjXQoe6ACpypUTYKKnPcMoVbG9aiG/Q
LSofmd/8YXtFoe7RUfeHogtLLDTl0Y+4wMIg04X+F3RCH0O1ILWAO0wlrcKReWuK
TwhMnGoEXE6rFabNckC/Qw0SM1v3R/qJNk2X92W5hjPvqnqYMY9q5rgZo9XZAtaO
ZM6J16MzSAcMl2ukfxuiUWnk380+ZgO70KFyYAV4oMovVKrBbuBa7DXvyFtJDnQl
Gqqd+pintFhUPbsxcRoVbMINwMUzvx+H83ZUbKfu0YCw3+kxjk7BlLBxSPTsW7bA
+mnbYH4qgZnpulPnU0XP7NNQyfkkpRnYsSer3lLdg+1bS0Z0rryQWRLC+E9ZSHvs
UPG/HxjKzdZLSbVzzatTVAvTtGVbgQDdvc6uoRHQjKFLhdH1fFcnieMPTjx3Icx2
O82TPd9RNlpWkW8pEFuiVsMtN1ExKEeU19OoTvsLIunmcdhEPKAKBvfEF6ZBdVE9
hhAfxxh6/SCsWu01sU5fDa7odm+mjQSHj05ZDBxyFGgYi9yAwl/zfKf+MCq5bTlZ
bK+xFrR553/MOJPW+Leo30GT6VBWnBJC7Wyo3k3HbSBQKy59G7w=
=m+C3
-----END PGP SIGNATURE-----
--=-=-=--
