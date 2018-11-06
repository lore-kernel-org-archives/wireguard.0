Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593D3C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 09:02:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BA12081D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 09:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3BA12081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc5bd19f;
	Tue, 6 Nov 2018 08:58:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 877eb29d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 08:58:22 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e57d30e0
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 08:58:22 +0000 (UTC)
Received: from fifthhorseman.net (dhcp-9fe9.meeting.ietf.org [31.133.159.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 8DE48F99B;
 Tue,  6 Nov 2018 04:02:41 -0500 (EST)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 26070200C5; Tue,  6 Nov 2018 14:16:59 +0700 (+07)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Fabian =?utf-8?Q?Gr=C3=BCnbichler?=
 <fabian.gruenbichler@student.tuwien.ac.at>
Subject: Re: wireguard dkms systemd
In-Reply-To: <20181105112744.zxe3kro53f2ez66a@uni>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
 <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
 <87sh0gdomi.fsf@fifthhorseman.net> <20181105112744.zxe3kro53f2ez66a@uni>
Date: Tue, 06 Nov 2018 14:16:56 +0700
Message-ID: <87bm72ekuv.fsf@fifthhorseman.net>
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3455842724927193320=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3455842724927193320==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon 2018-11-05 12:27:44 +0100, Fabian Gr=C3=BCnbichler wrote:
>>  * i'm leery of the "systemctl daemon-reload" approach in particular, as
>>    mentioned above.  if lots of packages did that in their postinst
>>    they'd be interacting weirdly with each other during a multi-package
>>    upgrade.
>
> I don't see how reloading systemd units too often can cause any kind of
> interference, and in fact debhelper already does this for both the
> 'restart in postinst' (default in compat 10+) and the 'stop in prerm,
> start in postinst' (default in compat <=3D 9) mode - unconditionally, on
> every upgrade of a package that ships an automatically (re)started unit.
>
> random data point: on this system with 1606 maintscripts in place, 93
> have some variant of systemctl daemon-reload in them (and 12 even have
> multiple calls in one maintscript). on a server running Stretch, the
> ratio is 72/597.

thanks for this analysis, Fabian.  I think you've convinced me that
while it might be a problem, it's at least a much larger problem that we
don't need to solve or avoid in the wireguard packaging specifically :)

> FWIW, I'd like to see some variant of transparent reloading integrated
> into the Debian packages (even if disabled by default).

if you want to propose a postinst that addresses the two other concerns
(i.e. using a debconf question, and not prompting the local admin if the
local package was able to successfuly handle the reload), i'd happily
review it, and include it if it looks good.

all the best,

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTTaP514aqS9uSbmdJsHx7ezFD6UwUCW+E/6AAKCRBsHx7ezFD6
UxO1AQC1053+8sfh2wAm8/dsD45u76A546AmAuVBMYZZhRCmvwD/fBKtHEqVxIvv
ulZu0FF6gx1za0l7ik03J+ZB0MjwRA4=
=si4F
-----END PGP SIGNATURE-----
--=-=-=--

--===============3455842724927193320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3455842724927193320==--
