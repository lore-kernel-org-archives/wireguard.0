Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2b603ca
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Oct 2017 12:14:19 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8979e93d
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Oct 2017 12:14:18 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
In-Reply-To: <CAHmME9rpVS84KzU4a76tKLPVQ0MfjegvQhLzrF6z=F5Um8128g@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
 <87ineze3x2.fsf@fifthhorseman.net>
 <CAHmME9rpVS84KzU4a76tKLPVQ0MfjegvQhLzrF6z=F5Um8128g@mail.gmail.com>
Date: Mon, 30 Oct 2017 13:16:22 +0100
Message-ID: <87inewde5l.fsf@fifthhorseman.net>
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
Content-Type: text/plain

On Sun 2017-10-29 23:06:31 +0100, Jason A. Donenfeld wrote:
> By the way, the program you wrote introduces a trivial local privilege
> escalation vulnerability into Debian, since not all available
> providers of the resolvconf binary set PATH themselves. Always clear
> environment variables yourself before exec'ing anything in an suid
> executable.

Thanks for this report, it should be fixed in resolvconf-admin 0.3.
This is a bad failure in the filtering that resolvconf-admin is supposed
to provide.

I note that the privilege escalation vulnerability was for any code that
would normally have been running as root anyway without resolvconf-admin
-- so it leaves systems no worse than they'd been without
resolvconf-admin (since no user is added to the resolvconf-admins group
by default).  But it's definitely a bad failure mode, given the design
and intent of resolvconf-admin.

I appreciate the catch!  Please don't hesitate to report any other
similar problems.

Regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAln3GBcACgkQFJitxsGS
MjeI8A//dGEwWZQMyBD5MMsGIFaw0e7BgaMWJy25UgqgCJzok/h5VocwviiH+0oY
MDKANi7w5fTm/guN2OOBVViweypK0jI6S0pYQTuJNAbHUqWZbHI/0006NlVfgfa5
ceoBKyUw16z7Aq0rlQ4/CDuYO8BuwSBNNw6NJZUqr+5DNeFgp63sA0bhrQr9lC2O
cbgr40F7yW1jUap3N2al461BeDpJGiUUb+watnMRKo8j3Y86jKUkiwuYRFqaoC6B
6OoFsUZJxg7k1ldjXh1v+oQGNDo2ZfQeG7iKJXgI7HoUpVgrsVwiYUSZvkOb0pQ/
uPCviL+xHNtW7tdEU3zAfeB2FH5aJRXlHCFoQsa0vUP4KGGwkehXwMMBavJOObBm
eQKnD0xP0KK/wtQkT3DmPvYRTenv45UCJq2Hm0YVFEGWI/WsWeNsNa7c9g1LDGhv
g2Vk8kwSK7WpXCIzXP7IdtGyyfKZPaFIcElCF/BZsUsUBo5YoYXUTRGSA/RuTnB+
pxsS5hY0k5wLqA199wXbVAcs+ZlUHh8KjDHEhJj0ylf5W1Um6XcORpsC8faG7L8W
EHQM92k8I7dV7LSJnOAkAOW9gVKXlvL0Z2qt3/G4KHvCDWUZ+Famqb+rzd7mes+i
R5iq2ZsDLxnvpR/mTDA8hXnu3w+Si8cM2LYh7UFPCV2mol+QFOQ=
=HRoU
-----END PGP SIGNATURE-----
--=-=-=--
