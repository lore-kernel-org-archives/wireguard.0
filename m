Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jul 2022 16:30:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bf901999;
	Wed, 13 Jul 2022 16:30:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [2001:4b98:dc4:8::227])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 825501ce
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2022 16:30:01 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F03820002;
 Wed, 13 Jul 2022 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1657729801; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dhgOlXki5DmvCBlELCC2iWNAi071cQlCpYfnRFTIrU4=;
 b=RO71mWXRCLiHitMq2LG921MKkxHcG5l6WM4KxNaGfAlhQgKGD0zqzNYQT3IKEo+oRc+Kwl
 nQLO0hZmW1c6UAT7KnmlNWHSdV0Gn5wUVAqNaqMVb/AG2FLK8C1HeLXzSYlfwRAyvJymoj
 hHj1arVJyEhdsaCQ1zTjUHP8ZsuIOXQnslkJrfa7T9nlgJXu6wrRDQSNnrUiFpUVJrjVxT
 Qh39COvbl142ulEW3dmboQMBk+Vh7DTxwflzTaC3ygx4z6t8JRay54NTTboiUMgTJ2vBDh
 tZ0wXpso6Lb1QkfridJ0GrzZ8h1Fhd1ocd7xR1mW31WZHoET3rooDUlxoQqemA==
Date: Wed, 13 Jul 2022 18:30:00 +0200
From: Faustin Lammler <faustin@fala.red>
To: Shen Red <darkranger_red@hotmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Update wireguard installation instructions for
 RHEL7/8-Centos8Stream
Message-ID: <Ys7zCA9oQH1uiQta@falared>
References: <SYBP282MB046024065A5CB3522AC577F4F2869@SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v+xqRvIptw63DzmK"
Content-Disposition: inline
In-Reply-To: <SYBP282MB046024065A5CB3522AC577F4F2869@SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM>
User-Agent: Mutt/2.2.6 (d1ee1314) (2022-06-05)
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


--v+xqRvIptw63DzmK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shen!

Shen Red <darkranger_red@hotmail.com>,
12/07/2022 =E2=80=93 06:31:47 (+0000):

> I think that the wireguard-linux-compat project doesn't officially
> drop CentOS 8 Stream support. The recent commit message just indicates
> that is no longer guaranteed to work, and it doesn't introduce any
> code changes that actually break the compatibility.

My understanding of the commit message and above all of [1] is that the
CI was disabled for C8S and IMO that should be mentioned in the
installation instruction since there is no more guarantee that wireguard
module will install successfully on recent C8S kernel (and that's the
case with 4.18.0-394).

> The recent breakage is caused by a code change in kernel 4.18.0-394
> instead. And that change could also be committed to RHEL8 eventually.

Yes exact.

> There is no proper instruction for C8S for now. The current workaround
> is do not update the kernel to 4.18.0-394. Or, if the kernel has been
> updated, try to build the wireguard module explicitly for the older
> kernel.

This is the kind of thing that I believe should be visible on the
installation instructions, it will save a lot of time to everyone...

[1]: https://lists.zx2c4.com/pipermail/wireguard/2022-June/007664.html

--=20
Faustin

--v+xqRvIptw63DzmK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmLO8wcACgkQOQovJ4Mq
XHmrSQ/+NmcumqCQei6AV2sGqgKFAZo2AViBKmhWa5O/PUWGG4YBK1HOMYtzXimZ
ye0YMjdUOfbC2f/tuXeO/HzrXs8YkZFi7yXbNTRJjdqty5FmRJ4Jo33sg7M1z8T8
rlRz4NoS+Pxdb87Uq2izZXWhgslEYynfky1cdQKbMdP4s0yqUWZYvV4qxlvwT32S
GxlzDdWCFx5LUGsIQ9sHc/AE/e4lIUsiP1LF0RQwhn84zzn1UaDBkmP5Z7q+8Bye
6vxCpfZJEaM5xOG8xXmVYt+yGzmn6hzDzy+ENBMPXA44/I2WdajMgAd3fZjQ2HIw
aPJfldlEL0GxgbvcW8DcZcR4Lvthk70+E8AtLprqIjxBIF4j0dV5l0rd5DK0/Y8T
kF3lWr1V3ZsZjG+jamfjKlSZetgbIIUKQ1Opsmgkn4T/eu6rn5JGCDs6TTxAIcAr
iiY4+Qm7+nbieGtf8fjF4bJIzpugyfr7TttQSBIwNRiHUEFpoiidRDrBO8Dy4KAP
S4DwZpvY9PyV7TWVwCSHjXN0t4WPaDO4gOYsQSXklZFIubNVO9jkuYxBbitz+3Gd
ukLpQ18DFVeNDTFZ/vbizo4CFh9EyXV5al3N4IxWWy0gD3ZMSNpaQ/jDRprp6YXF
2sfRXgE2KyYmeDZ/q6lTChsxQMvbkMlR6l0jrgMolDOc+dP7pAs=
=0QJU
-----END PGP SIGNATURE-----

--v+xqRvIptw63DzmK--
