Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2af0fcf
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 17:01:13 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 571bd58e
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 17:01:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c13-v6so8943774wrt.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 10:12:37 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <20180810200346.0e9646ac@natsu>
 <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
 <CAKE2PDt5JNSP50bFcoai-pUYE1zeCtaRQKQZ6X+jH4yiNOcUBA@mail.gmail.com>
To: jungle Boogie <jungleboogie0@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <ef3a4875-25d2-8e05-2c75-bd77fa6d2828@gmail.com>
Date: Fri, 10 Aug 2018 17:12:33 +0000
MIME-Version: 1.0
In-Reply-To: <CAKE2PDt5JNSP50bFcoai-pUYE1zeCtaRQKQZ6X+jH4yiNOcUBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 10/08/18 16:40, jungle Boogie wrote:
> If someone already has my ssh key, I'd revoke it - regardless if
> they had the password or not. Same with the WG key - shutdown the
> tunnel, remove the affected peer and start it back up.

No need to interrupt the tunnel.

# wg set <interface> peer <publickey> remove

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAlttx3oACgkQivBzdIir
MBJTWw//dL9Te/8nfr18EQQEmWXRqgS7A6QrXh5lrAjTlHAHuzbfM2sp+mt5ML50
fmEHlsVHZqM4rG4l1+KiSrUb6n7hlzoCO2bwh36U/tdysXgf20vM9XN4vyhvWMbN
eOB6CNHfso02uMzx4TCAaK2ZcWnsqh1LvXceVwMQdJ6+E2FDpu637TYEiWJyIDPv
u/q5Qq+qZspFiqDTpAJ/scdLq+4AxnzeELs/OblfRYbvE+Hkc9VsunxXJImXvcKx
cN1NldPxwR+a4fWTvKgIqVReIKEggDl4OzYZk+wipFLRwQWASYW3aYQ+UeQEaUHa
TQqkfZ6PqvivKLPC+Ih3DVHYd4Xa4t+zC/gVtQYgAauhqcqtpH1Y0ZISohIR9x/t
2GMxOZPg7Q6x05qf0bKdWPgdH+lcENW1HYEhj/cWrKaCAoKgKOnGsfgUNEdvRXMb
i/RiLnJ5NH07sg4C/QRdVOXxx/TwBoEZPvgXUsxteadBc77LLOR4ERNVZ4zQrvhv
JhhLeckOL9dmywPuvvO4sc/cOZCvb2kaYSDD1Tn4iJaqWZwWdA8HNnGyBnl14mMF
9ER5qzSA0L9QRDXhyBkv1+ekDmshBnpyj6PN7kBJ5cl9WVZXLjIsUWcte9YXfbIM
MqwqhoGBdF0n5T41OP0zt4vT1DWLF9pGsOiUUq7GahpIXp1mPMo=
=T+rR
-----END PGP SIGNATURE-----
