Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c39edca9
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:07:46 +0000 (UTC)
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
 [209.85.213.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adb8c973
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:07:46 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id i15so6893338ybk.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 09:14:26 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <191f960d-1375-10c6-b97f-beedda2b33be@gmail.com>
Date: Mon, 4 Dec 2017 17:14:23 +0000
MIME-Version: 1.0
In-Reply-To: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
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

On 04/12/17 16:52, Lonnie Abelbeck wrote:
> Hi,
> 
> Has anyone thought about a standardized WireGuard IPv6 ULA
> generated from the PublicKey ?
> 
> WireGuard Unique Identifier (WUI) allowing a host to assign iteslf
> a unique 64-Bit IPv6 interface identifier (WUI-64) ?
> 
> Possibly picking off bits of a hash of the PublicKey ?
> 
> For mass deployments, could this be a useful standard ?

Mass deployments are likely to use some form of centralised and
automated configuration management/provisioning solution already,
which can take care of performing the calculations and assignments you
are suggesting.

Regards,
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaJYJsAAoJEIrwc3SIqzASaAYP/RJMae43IXsvgtJd33/awnPD
Aam6tUWHgISo2SeM3syrXNr1kIpTTca4PwyLfm5w8sxy/Zw0RF0Ux1lx3PH9NAd4
OT0f+UR9jpzLmncUS1t3I5z2g398kWr3Z5Fud1y8kvWgjbhp1dAjRv1FOwzXeQqM
Zfk9it3qBVNpu3bzuXwNimT13Z3uYXh6BCyI++gyui9glq2eOUoGRQv5Rw1pXnkY
2VthV9pnJVjn5crvSyNw5Y0SZisE5BnDxVvy72sXTO//Hx6Gg7bnPYt/2mNOQTNG
KUL2r7XJ4zm2IdqohOfSmjvCnlkh1KEg9ZPbrrrzSammwPVuMxCxKcy6GG+ETGSn
yGj4gIYAW1x3HjbhG+1j0jTAh3jelayp4iHMf0gaFo2KY8jxbzXnBRAFiGGKJxIk
mdIBI64Nog9lIm/hI3wNxkFGKfqMqDP9qVG3jPj2b4ACFLvsy4B8rySc2PjZIaKv
D+MfSeiB8culswELDgIZH1U4SRks6Kec5qV81wkP/1t1g2t9zspc3rnBahGvMhgs
lNWLfeFADe5bR7wqeBDzx52XvhvrGWqRD/eJney7THLQj05CVTB0cikPJ25AFnNA
FfzThVEDIsGrGbzSMAq82Brj6bAs81F8Vz/Lnrmba8ejLsI0QsOjNfncEzte1VBz
4cbh8sSBh+udO4cItEM3
=Nvi/
-----END PGP SIGNATURE-----
