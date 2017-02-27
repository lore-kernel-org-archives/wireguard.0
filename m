Return-Path: spender@grsecurity.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5c0bd69
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 11:51:34 +0000 (UTC)
Received: from grsecurity.net (grsecurity.net [50.251.85.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec8756a
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 11:51:34 +0000 (UTC)
Date: Mon, 27 Feb 2017 06:53:08 -0500
From: Brad Spengler <spender@grsecurity.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: kernel warning with 0.0.20170223: entered softirq 3 NET_RX
 net_rx_action+0x0/0x760 with preempt_count 00000101, exited with 00000100?
Message-ID: <20170227115307.GA2499@grsecurity.net>
References: <5e4ad220-6009-7ec9-95eb-ddccb994bb9e@gmail.com>
 <CAHmME9pH5xbVR04b9JLqFfho=i_K-jod6N8tJt0ggDXPfqQ_LA@mail.gmail.com>
 <a80303ca-e841-77f1-5ea6-6833f69b6059@gmail.com>
 <CAApVa_kyD=KZYN3ABZU5yZGExNhC-34ryF+JZAPZ0JAKgmdJLw@mail.gmail.com>
 <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
In-Reply-To: <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
Cc: Pipacs <pageexec@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

=46rom looking at the code, this seems to have been introduced during
the port to 4.9.  In previous kernels (and in both the stable kernels)
a get_cpu was used to look at the per-cpu irq stack pointer value,
which was properly put in all cases.  When the code was reworked
for 4.9 to use some new upstream helper functions to identify the
various stacks (and one which uses this_cpu_ptr to identify the
irq stack) that single put_cpu() wasn't removed with the others.
We'll have this fixed in the next patch.

Thanks!
-Brad

On Mon, Feb 27, 2017 at 04:22:34AM +0100, Jason A. Donenfeld wrote:
> Hey Pipacs,
>=20
> I've been receiving reports of strange bugs from grsec users with
> WireGuard. The first set of bugs was a heisenbug crash, and I never
> found the root cause, but it seemed to happen in the rx path. Then
> today Timoth??e emailed another different bug from a grsec box, also
> along the rx path. This time it was related to the preemption count
> being wrong coming into and going out of the rx softirq. This kind of
> preemption mismatch, I figure, might account for the earlier bug I
> never solved.
>=20
> So armed with this new information, I went hunting. I followed the
> path inward, surrounding the body of each function with:
>=20
> int i =3D preempt_count();
> function_body...
> if (i !=3D preempt_count()) pr_err("LORDHAVEMERCY\n");
>=20
> Eventually I isolated the bug to an interesting situation like this:
>=20
> int i =3D preempt_count();
> other_function(...);
> if (i !=3D preempt_count()) pr_err("This will print out\n");
>=20
> void other_function(int a)
> {
> int vla[a];
> int i =3D preempt_count();
> function_body...
> if (i !=3D preempt_count()) pr_err("This will NOT print out\n");
> }
>=20
> Since I only got the outer print, I thought this was strange, so I rearra=
nged:
>=20
> void other_function(int a)
> {
> int i =3D preempt_count();
> int vla[a];
> if (i !=3D preempt_count()) pr_err("This will print out\n");
> function_body...
> }
>=20
> Yay, we found the bug. But wtf, what could possibly be changing the
> preempt_count there?
>=20
> So I went disassembling, and lo and behold the clever PaX stack leak
> plugin was adding calls to pax_check_alloca. Very nice! But still, why
> the preemption bug situation? I went hunting further:
>=20
> void __used pax_check_alloca(unsigned long size)
> {
>  ...
>        case STACK_TYPE_IRQ:
>                stack_left =3D sp & (IRQ_STACK_SIZE - 1);
>                put_cpu();
>                break;
>  ...
> }
>=20
> Do you see the bug? Looks like somebody snuck in a "put_cpu()" there,
> where it really does not belong. "put_cpu()" basically just jiggers
> the preempt_count. I can confirm that removing the erroneous call to
> "put_cpu()" fixes the bug.
>=20
> So, either this is by design, and there's some odd subtlety I'm
> missing, or this is a bug that should be fixed in grsec/PaX.
>=20
> In the case of the latter, I believe this introduces a security
> vulnerability, since it opens up a whole host of interesting race
> conditions that can be exploited.
>=20
> Thanks,
> Jason

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCgAGBQJYtBMcAAoJEETRwPglJf5J8xMP/2FpX9igUwzzb0FdevB/K/QM
7Mk6x8uzun9jiC0HI+NE6piYOD7l4oP55gIx1cQrmEuPDHewc1ak72B1464q6beO
rEwfqDKdGNxWZ9gX2mYQvXPKb/hFQPuyMAgRt5lZwKn0YykgU5/EUCR7WMFENz2n
CYLhBn+vRE+hmb61oYYUu7np34Ryiyq1l6vnaQBvwFqfo2G5VJ6BIhU8BEACN5uH
j9xcJqiCvaoViQK7h+1mAgfm/HggNtnUJChAwdVibLjNm0tcCRZjrvxxAUwHyAN3
4bWgUQAGlY17vq72O/Jzc0rkAgSbkk5x8EUIjfX9KCgv/B3pyHdF8vPL71+ezCNn
FKrMNEVjBR8ftbEptuaCgeWkDdUTo99gdOIJRkACaTaFdEkOHPeYufbUaSnrfukW
wya3gftFnGOZfePj6DAOHZak1+wklofTQ5JdHqeQRRJUI7cynIFIaNDl+fR1ihmt
fv8+n2FfQDTUWppP6D8+9+iD2KHPy82VUNFM1+Xt4vk9x/pbmdVRWfB7eK3bKQ6D
fXSVwl1ehoVHG0m+ECGViHPk1T2aRUfmyfdKMjIQ9K/hu3w4CyMypRR0pSGdHI5l
u8z97e80R/al+zl/jQO6Fxhl4Gf5N5Cys1T4SYMnSrnp4EDfO7vENx7g16i5Hgmj
7FgLJ0A06fwM6xI2Nzg9
=DW7e
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
