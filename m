Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c34b684
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 09:36:10 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15cea8bd
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 09:36:09 +0000 (UTC)
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fFcaM-000JYL-2m
 for wireguard@lists.zx2c4.com; Mon, 07 May 2018 11:37:34 +0200
Subject: Re: WG interface to ipv4
To: wireguard@lists.zx2c4.com
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net> <874ljk24jh.fsf@toke.dk>
 <6c7b92f1-bf66-811a-e571-9ea9b891b55d@gmx.net>
 <1uNBxmuVD4KO09MZhPvQ1xzIIpYoI-Z0AcrIP2sy2mGbSoPeWeUXq74U3YDaaJi1QmtPgujzFL6I6YDfZtJ1DGX-Dcy4qinOBT8R518GbIo=@protonmail.ch>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <715f859b-940e-a20d-5569-d24539595706@urlichs.de>
Date: Mon, 7 May 2018 11:37:25 +0200
MIME-Version: 1.0
In-Reply-To: <1uNBxmuVD4KO09MZhPvQ1xzIIpYoI-Z0AcrIP2sy2mGbSoPeWeUXq74U3YDaaJi1QmtPgujzFL6I6YDfZtJ1DGX-Dcy4qinOBT8R518GbIo=@protonmail.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Sgf03qela20T1oQ5vK3QZkZ5rXOfh0xhb"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Sgf03qela20T1oQ5vK3QZkZ5rXOfh0xhb
Content-Type: multipart/mixed; boundary="7vyb9cQPxAthDUzpajkkPjl7SAxlZmZg5";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <715f859b-940e-a20d-5569-d24539595706@urlichs.de>
Subject: Re: WG interface to ipv4
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net> <874ljk24jh.fsf@toke.dk>
 <6c7b92f1-bf66-811a-e571-9ea9b891b55d@gmx.net>
 <1uNBxmuVD4KO09MZhPvQ1xzIIpYoI-Z0AcrIP2sy2mGbSoPeWeUXq74U3YDaaJi1QmtPgujzFL6I6YDfZtJ1DGX-Dcy4qinOBT8R518GbIo=@protonmail.ch>
In-Reply-To: <1uNBxmuVD4KO09MZhPvQ1xzIIpYoI-Z0AcrIP2sy2mGbSoPeWeUXq74U3YDaaJi1QmtPgujzFL6I6YDfZtJ1DGX-Dcy4qinOBT8R518GbIo=@protonmail.ch>

--7vyb9cQPxAthDUzpajkkPjl7SAxlZmZg5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-CH

On 07.05.2018 10:41, Jordan Glover wrote:
> Pointing to go and rust implementations which are being
> worked on will be much better.
They still run in userspace.

That being said, I still don't see any reason for doing something in WG
for which (a) there's no threat model, (b) a perfectly adequate and
well-tested solution already exists, no matter whether the
implementation is userspace, kernelspace, or inside a network card's
firmware (well =E2=80=A6).

Yes, ssh has a config option for that, but ssh runs on systems without
kernel-level IP filters. Using WG on a machine that will forward IP
packets but cannot do any firewalling is not a credible use case.

--=20
-- Matthias Urlichs



--7vyb9cQPxAthDUzpajkkPjl7SAxlZmZg5--

--Sgf03qela20T1oQ5vK3QZkZ5rXOfh0xhb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEe156i1ZztbbthlARBsCEUtiHyJYFAlrwHlYACgkQBsCEUtiH
yJbrZQ/9HGa5qOCbBJT4YIpvmHpgcjZbHLKSmh7u9TngtUX3wThltcNLvRdzC3fg
ep5qyY5VPAGtSpyTTgWUqZ9ZbEQJZt60cJQLh8NXIIrsZA6s+i67BxbL6By46OKg
dqb7qXvRneKlJv2OiBNaivSa1R60MI2QyuZD14tfg4tdXt4l2X0DObe1fGUAkuqO
c37sHNB9SzuRISqDA9+upqRP9TQTLUtng93prPERgozyMap+EVQ9mALKr31U6zHE
DDcIYitwPjbfTNdZQ4TQ5xnxzfOkwEJ5mRTU5Dc4BuHVgslSgJTWmG+DnnHtkNYE
f7Q7Akngy42m0RIfVnWvAoQqI8/VQa7JtIJslY6nEh7M2vnM1JWaKZVCYWSAAHLJ
Wle+B1t9IBNrGIQBYnJ9FF643KCpSgO8eb+/RT5LkU9t10E5+auwWqkpTkb5cyEN
su9s2JmLlNyh2Ioj4i3rP8wP+CK81HX1Bt6oKkcGbjFkiFHj0hTBT0jW1Ny62aJ3
I0WcSNwM4dnAMsjtkLPXGWtP2wzkR0vHKPKUSF4ypNHIB8Gt4uxlK+zIwJnDGzPs
MNRwrF+1Fu5uEKJUyeKbrMSMIYL5V2c7uOKh3x7OQKbVFK7sXsGe31Wo+4mP8kpV
h/Cidl8Flb5xi333LBUJYuMjJk95gAcai+EGdCJdizjo2ei3vZ0=
=i12/
-----END PGP SIGNATURE-----

--Sgf03qela20T1oQ5vK3QZkZ5rXOfh0xhb--
