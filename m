Return-Path: <SRS0=D0CK=O6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E5AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 Oct 2021 05:55:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F3760F92
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 Oct 2021 05:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88F3760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fala.red
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b316bfa6;
	Sun, 10 Oct 2021 05:55:11 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 294b40f5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Oct 2021 10:27:01 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 97768240003
 for <wireguard@lists.zx2c4.com>; Sat,  9 Oct 2021 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1633775220; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=Hb8gOkQWPBbb01QI2x6W5jNe3okirFydbQrtf4pnKzM=;
 b=Jx+LOZ/hXnrSK0uZ/F15UloLdINhhXdlvdDswh5QeXTJdNKguzt4/DYnfg3TP+6tGNMrQB
 6+DelgrzHM8SKoJVcdGS+p4FiLq44WPBdSnx/sFU7oA9y/qdeD73aBzCx9+txSqa1ntlwM
 NyO4xn2V/UisSHz1aGfIDDBt1pr/XoTi5T5OR5QXedEiKQu8vul4iS+fxNhKAeaCc/higi
 YNbp5sGY1GcSPND17/+6VoCcW5/SH+7iW4ezpyMmN/UQQwjq00TcIsnRsr0Fb5rB0jpSNO
 BB0AV2DxQR399gLAQ7+Jcd+M5GV+06szoDrriQRswG8wcgWGNNl/YVfNSBxGZg==
Date: Sat, 9 Oct 2021 12:26:59 +0200
From: Faustin Lammler <faustin@fala.red>
To: wireguard@lists.zx2c4.com
Subject: Build wireguard-linux-compat on SLES15 (s390x)
Message-ID: <YWFuczOf1dM3B4Pt@falared>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="el9HuoytLQFZ+/cZ"
Content-Disposition: inline
User-Agent: Mutt/2.1.2 (9a92dba0) (2021-08-24)
X-Mailman-Approved-At: Sun, 10 Oct 2021 05:55:09 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Reply-To: faustin@fala.red
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--el9HuoytLQFZ+/cZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I am trying to compile wireguard-linux-compat on SLES15 (s390x) without
success. Maybe I should try to install it directly from packages but I
am not expert with SLES and I did not find how so far.

I managed to install wireguard-tools but the kernel does not provide
the wireguard module, see bellow:
| $ uname -r
| 5.3.18-24.83-default
| $ lsmod | grep wireguard
| $ sudo wg-quick up /etc/wireguard/wg0.conf
| [#] ip link add wg0 type wireguard
| Error: Unknown device type.
| Unable to access interface: Protocol not supported
| [#] ip link delete dev wg0
| Cannot find device "wg0"

Here is the build error:
| $ cd /tmp && git clone https://git.zx2c4.com/wireguard-linux-compat
| $ make -C wireguard-linux-compat/src -j$(nproc)
| make: Entering directory '/tmp/wireguard-linux-compat/src'
|   CC [M]  /tmp/wireguard-linux-compat/src/main.o
|   CC [M]  /tmp/wireguard-linux-compat/src/noise.o
|   CC [M]  /tmp/wireguard-linux-compat/src/device.o
|   CC [M]  /tmp/wireguard-linux-compat/src/peer.o
|   CC [M]  /tmp/wireguard-linux-compat/src/timers.o
|   CC [M]  /tmp/wireguard-linux-compat/src/queueing.o
|   CC [M]  /tmp/wireguard-linux-compat/src/send.o
|   CC [M]  /tmp/wireguard-linux-compat/src/receive.o
|   CC [M]  /tmp/wireguard-linux-compat/src/socket.o
|   CC [M]  /tmp/wireguard-linux-compat/src/peerlookup.o
|   CC [M]  /tmp/wireguard-linux-compat/src/allowedips.o
|   CC [M]  /tmp/wireguard-linux-compat/src/ratelimiter.o
|   CC [M]  /tmp/wireguard-linux-compat/src/cookie.o
|   CC [M]  /tmp/wireguard-linux-compat/src/netlink.o
|   CC [M]  /tmp/wireguard-linux-compat/src/crypto/zinc/chacha20/chacha20.o
|   CC [M]  /tmp/wireguard-linux-compat/src/crypto/zinc/poly1305/poly1305.o
|   CC [M]  /tmp/wireguard-linux-compat/src/crypto/zinc/chacha20poly1305.o
| In file included from <command-line>:
| /tmp/wireguard-linux-compat/src/compat/compat.h:859:31: error: expected i=
dentifier or =E2=80=98(=E2=80=99 before =E2=80=98{=E2=80=99 token
|   859 | #define genl_dumpit_info(cb) ({ \
|       |                               ^
| /usr/src/linux-5.3.18-24.83/include/net/genetlink.h:138:1: note: in expan=
sion of macro =E2=80=98genl_dumpit_info=E2=80=99
|   138 | genl_dumpit_info(struct netlink_callback *cb)
|       | ^~~~~~~~~~~~~~~~
| make[3]: *** [/usr/src/linux-5.3.18-24.83/scripts/Makefile.build:282: /tm=
p/wireguard-linux-compat/src/netlink.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[2]: *** [/usr/src/linux-5.3.18-24.83/Makefile:1655: _module_/tmp/wir=
eguard-linux-compat/src] Error 2
| make[1]: *** [../../../linux-5.3.18-24.83/Makefile:179: sub-make] Error 2
| make: *** [Makefile:26: module] Error 2
| make: Leaving directory '/tmp/wireguard-linux-compat/src'

Any help would be really appreciated.
Cheers!

--=20
Faustin
GPG: F652 BCD1 1AA8 8975 F010 48A5 390A 2F27 832A 5C79

--el9HuoytLQFZ+/cZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmFhbnMACgkQOQovJ4Mq
XHkQ9A//RllpQKfcZhYulIKjhc4KCSagyrvhXanNi6kk2FtsXoZfXO2hX3/QUNH8
hAa5wUyZcKR6MQ5EvRlIFUVEsc1MCKtP/2Lf/cUCmzQvTgA17a4cYIQ5XojiW6KE
FJ4YpWFaqX/Y5KAT6LZ4gcckznRJrdZISJtliy46QvTUxLJKbwS6l6nvgYtsY14N
HYKfbnR/FeNkgFKu/u3zJZSCs7flSoZ3CWcaw/GiC083tD9zoKJcwMKXVwF3YwWx
E6W1PN11YKULD1RpM7TEtddrPKsoS/cm5pBVCpVQVHjG33KGIGpydjQ2Zzgp5dRY
mXE+3DOTIIrBg2blApPVZ9nfVLGU80BUtcOJXORp4BbGXIxRvDEz8/we49edZa2U
2iTku8zwZbP2QCVfGUkFjizTJxRq2dMuSMTFAZHkpljDgC6ulTwDqEX5heYcSRiR
ohsyKQ8piVUaxm7OlZTUCUfMxzaCPHD29MSLI8B5C2l4XL39NnWoNEPTPnGzKdXB
cWDcim0vnHEOx2DeFtypOD9PkRvgK3VizPfDLXE66WHzfEwsjg7sXFkNJ3MLpmJz
ouFll1olfc1omgk06mo12KtV+qONHEreamMkCVscPYj6I44RBjx0dDNFT7x7bQij
r5M8HROSAuzjZVqH8pwn14nV12TCWMYsy7z/rFUI9LdQymphBhA=
=kPl5
-----END PGP SIGNATURE-----

--el9HuoytLQFZ+/cZ--
