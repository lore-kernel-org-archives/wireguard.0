Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F1D10F38
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 15:43:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b15a831;
	Mon, 18 Nov 2024 12:45:47 +0000 (UTC)
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7276bbc5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Mar 2024 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1710055365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h17KIwzOrUekHzB5+mlymxvuEPwRYsg3TcII5Vg/o+I=;
 b=HexphMuCuMRkyacOvdRVnTdMb4UJ4zokFC7urfUIJ4G2uYHkTJBURimHAcxJQ7L0KM9wUH
 5WpvsfQ67RUXDx8DUhMs4bAwqZpkRDn6ptC3IOKw0kV4EUyXu5neGSJcko/zI21HnFrYPE
 obtd/HCl4exokdEwOjpQdgUgcw45yYc=
From: Sven Eckelmann <sven@narfation.org>
To: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 jiri@resnulli.us, Jakub Kicinski <kuba@kernel.org>, Jason@zx2c4.com,
 mareklindner@neomailbox.ch, sw@simonwunderlich.de, a@unstable.cc,
 pshelar@ovn.org, andriy.shevchenko@linux.intel.com,
 wireguard@lists.zx2c4.com, dev@openvswitch.org
Subject: Re: [PATCH net-next 3/3] genetlink: remove linux/genetlink.h
Date: Sun, 10 Mar 2024 08:22:35 +0100
Message-ID: <4554322.LvFx2qVVIh@sven-l14>
In-Reply-To: <20240309183458.3014713-4-kuba@kernel.org>
References: <20240309183458.3014713-1-kuba@kernel.org>
 <20240309183458.3014713-4-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2320315.ElGaqSPkdT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:45:46 +0000
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--nextPart2320315.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 3/3] genetlink: remove linux/genetlink.h
Date: Sun, 10 Mar 2024 08:22:35 +0100
Message-ID: <4554322.LvFx2qVVIh@sven-l14>
In-Reply-To: <20240309183458.3014713-4-kuba@kernel.org>
MIME-Version: 1.0

On Saturday, 9 March 2024 19:34:58 CET Jakub Kicinski wrote:
> genetlink.h is a shell of what used to be a combined uAPI
> and kernel header over a decade ago. It has fewer than
> 10 lines of code. Merge it into net/genetlink.h.
> In some ways it'd be better to keep the combined header
> under linux/ but it would make looking through git history
> harder.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[...]
> diff --git a/net/batman-adv/main.c b/net/batman-adv/main.c
> index 75119f1ffccc..8e0f44c71696 100644
> --- a/net/batman-adv/main.c
> +++ b/net/batman-adv/main.c
> @@ -14,7 +14,6 @@
>  #include <linux/crc32c.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
> -#include <linux/genetlink.h>
>  #include <linux/gfp.h>
>  #include <linux/if_ether.h>
>  #include <linux/if_vlan.h>
> @@ -38,6 +37,7 @@
>  #include <linux/string.h>
>  #include <linux/workqueue.h>
>  #include <net/dsfield.h>
> +#include <net/genetlink.h>
>  #include <net/rtnetlink.h>
>  #include <uapi/linux/batadv_packet.h>
>  #include <uapi/linux/batman_adv.h>
> diff --git a/net/batman-adv/netlink.c b/net/batman-adv/netlink.c
> index 0954757f0b8b..9362cd9d6f3d 100644
> --- a/net/batman-adv/netlink.c
> +++ b/net/batman-adv/netlink.c
> @@ -15,7 +15,6 @@
>  #include <linux/cache.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> -#include <linux/genetlink.h>
>  #include <linux/gfp.h>
>  #include <linux/if_ether.h>
>  #include <linux/if_vlan.h>


Acked-by: Sven Eckelmann <sven@narfation.org>

Kind regards,
	Sven
--nextPart2320315.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmXtX7wACgkQXYcKB8Em
e0ZBNQ//fHhWrp8So5pa2gvNTn5gSGE8Jq/IIcyGWdk8bHyznaYbVxyJNteajKde
CdRlZ6I63j0si/FHk57YzT3Lcf1e5yhM7vDVlt3oMzySuVYl0Xc1MI9sNQ3SU6ZO
TyG4LLQQav7noOmtOm54Tousu8Bolp1aAS9wIg6jjECDkZpR+B9U3MGgq+owanhP
qvhMSrVH6O2I/9eNnE+zaTevEzOnpDY98rNG8LX3ju+ZTpxWFbTqzukoOZqz96IS
hG3vhBZkI20J9bxs0W6rd5NDPcWKe0Yo9KRGWH+klzMqwzK3giluog3EqdkmXjn8
272USZIl1ekhkF52reNVrTUh8RqqX6DclA+wcfwp7eRsm4NBBW0nYTAbKN9NCQvz
P5+Xj4y4LIjo5zkjIfCk/mcIxHx2x089NojbbBae5yUpZcOKvJCk1P8tAdmCgEeG
n+NYPZTzYRZloVE9X7F5wCceL+DgeeSGDAr/FEJlG1opoXwAguh3jVVTgHhtgaFr
jSpvVWzbZLhB2wo7TUq2FtS1LMG5U922XAbkRf04mNFr0oxHxoU1imMbzi+VniIT
hZED8QP3F08hM4LqEKjXmrZwHLx4+v5mz8QtyVEOSvbzWTHjSQhnWexwRS/1UVLy
kGdKTWyLiOLF+ROo7UXRbl6k3+Iqvpkm66w/oBXrBSoq+TbDiCs=
=BNz5
-----END PGP SIGNATURE-----

--nextPart2320315.ElGaqSPkdT--



