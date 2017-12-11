Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0a49afc
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 04:05:15 +0000 (UTC)
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
 [209.85.216.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df643319
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 04:05:15 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f2so35372244qtj.4
 for <wireguard@lists.zx2c4.com>; Sun, 10 Dec 2017 20:12:44 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Reading configuration from stdin
To: =?UTF-8?Q?Manuel_Sch=c3=b6lling?= <manuel.schoelling@gmx.de>
References: <1512909832.1336.19.camel@gmx.de>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <ebc466dc-a1b7-6de9-2e3b-fb94e63f60a6@gmail.com>
Date: Mon, 11 Dec 2017 04:12:41 +0000
MIME-Version: 1.0
In-Reply-To: <1512909832.1336.19.camel@gmx.de>
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

On 10/12/17 12:43, Manuel Schölling wrote:
> Hi,
> 
> Would it make sense (aka be secure) if we make it possible to call
> 'wg setconf wg0 -' so the wg tool does not read the configuration
> from a file but from stdin? Same for 'wg set wg0 private-key -' and
> 'wg set wg0 psk -'?

This should already be possible via `wg setconf wg0 /dev/stdin', no?

Regards,
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaLgWzAAoJEIrwc3SIqzASBtsQAK2rF9J9+Ex7/hu98bLXoeKG
fXR6sU0254Ddre51EA/71Z4QBEFjAROqJyZMnwZE/KkNIRdpX2Xp/lt7w4s/N2zI
btBRydqnsefQlVlbni6Q6Px5F6WjDFLXERXbwTonV0U1f1iel+i55nKs5Ups/WM5
nBlWNepYCO3qZ7ni87C0GO68Z29sEiIPlgS69B4sPeBFg+UW+91TeBh3Cb1Q+JYA
KJhKNrrjMyIpduSF7Rasuu0/LMCF3RwJe1JcO/m+8ftlmu+lzIPfB3z6NMyVBftU
RkcPIuFo09RTsfvBXZRQGJUBXSnNeKJgk0ji25xakwhkTw/LQb3y2uddKRHXIclr
27qnOd1lRPMOYs2co04RiOHMr7yA/+f7bkQfpKQJNyIHtMp2LKZpgDHDnEuOl16n
GrGlaFCiDDWPeO6suOsAmHJMOqLAVgj+L2bAWdO3o5kz6nSsF5Zn3NQLlqwjV+pV
NhvHJgPshGJKin0Styyi+M9Sn1KwXhgoWx9EMZY9mnP58QPl9HxswpBOlZ+Alv5n
aQJqLU/i7wAYotbPREr6EIu/RlaWDYJuTOuoRZU4Hb2TTPnVocjP2nvsH7Mz3AkO
fwe2TfyloUt+DhcIFarjneovqF/Bwasv9C0TAZIeB6nfTfuCrzdbi0cipK2m+y9Y
rC2vzKK0LsSjjpWCsEoF
=03ZW
-----END PGP SIGNATURE-----
