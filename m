Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB935C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 17:33:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A232075C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 17:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB/AZPKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A232075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3512002c;
	Wed, 27 Nov 2019 17:33:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5c961ba
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 17:33:16 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aedefde7
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 17:33:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b18so27661530wrj.8
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 09:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zyQwGuDsBzsLozJukmLwsNqWUrd+YBClq4/wSkVv5M0=;
 b=bB/AZPKlfWf24/1lvYR2HFo9X04HCD4wirfeRAZVIYNIbxagyRXRIfMLMroCkBYErY
 HPeMbrKIAOKHlDtdmmoyec6YZZSkU+HWUjeZ7RvqCLUUlOuzm14061p8FeZ42ibqlIGP
 sYimjcYY4rRjGAOi4K/NlMhdQM1haIoYjAQo5DLuu5gvi/7PiKPg0LQ1AIsaiI3OWsWT
 zg0cjHlUjX4PdYol3nmWKwYnH+dro/Ore/sm8N/6gle4TlGNe5J+4QaU7SmnTbYw5fXT
 QCydWkp4leVEmVnNQvv2hrBJ3EyI5RDgUls/5aDMjUFUzI/GxoDe8owjXcZ7fY4Et4eN
 WjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zyQwGuDsBzsLozJukmLwsNqWUrd+YBClq4/wSkVv5M0=;
 b=EUcWlmX0dJZSi2SLIx5aDtsJW4xG3a87OsAtCpRH2jyWW9UidOS/i+VmnuOHrXmYGf
 pjhzfJAX1e06TVsMK2F7fkgMY/TmitJiiJkjfw/9zrTAl+aQMPkhN3axF4srtrAF9o2f
 CGeYVSo3akvXo7+o1RoRNshIXOC/mAIWEgpBwY8m9nF35D0nyb7hq7yawdKSaqRsMzkA
 WeIQ2ctTADX9SMqPTMJSvkyaBKx6twSmuJmkauMiXVy1NOfu95pSP+eFJEjAfsNLp4FJ
 nAsWljjWeic8tJt8FJ7vnM9g9R0JDxclKDxPshbYt8VyRpCK699HGre6VNTtjdCCRFI0
 Kovw==
X-Gm-Message-State: APjAAAWWRBQW5yz0tG+0yZ0Icm13yA1hC+BPgtaFrxh8g+YE+MT7dhdh
 rAvhIEd05eEcep3wBp79WEw=
X-Google-Smtp-Source: APXvYqxCO9D93/sWcEcTLDVovbREPnLQJXF79zEa41beHUNZ6N3z0zeDd7R5iwltTLphjl2q0fHnaQ==
X-Received: by 2002:adf:e944:: with SMTP id m4mr8788410wrn.49.1574875994988;
 Wed, 27 Nov 2019 09:33:14 -0800 (PST)
Received: from localhost (h082218209156.host.wavenet.at. [82.218.209.156])
 by smtp.gmail.com with ESMTPSA id k4sm7955991wmk.26.2019.11.27.09.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 09:33:14 -0800 (PST)
Date: Wed, 27 Nov 2019 18:33:12 +0100
From: Tharre <tharre3@gmail.com>
To: David Weinberger <cubicalpie@protonmail.com>
Subject: Re: Status on wg-dynamic?
Message-ID: <20191127173312.GA6929@xultrabook>
References: <F4cyz6k03CpTVXGL3ROFHAL3FwuPZg8wyyVKgvCVeufcJMCycqMAlqbnPh2H3EU-GnR3GlAjUMbYlPDirGS3hYoNIhOFfn6vd00_SUvud2A=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <F4cyz6k03CpTVXGL3ROFHAL3FwuPZg8wyyVKgvCVeufcJMCycqMAlqbnPh2H3EU-GnR3GlAjUMbYlPDirGS3hYoNIhOFfn6vd00_SUvud2A=@protonmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============7316392659263300562=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============7316392659263300562==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey there,

On 11/13, David Weinberger wrote:
> Hi,
>=20
> Is wg-dynamic more like a proof of conception right now? I tried to use i=
t, but found a few issues:
>=20
> 1. Does its dependency on libmnl and epoll etc mean it can only work for =
linux clients now?

For the first release this will be true, support for other platforms for
clients will be added later.

> 2. It doesn't seem to hook into wg-quick as mentioned in idea.md? I check=
ed wg-quick's source code, no where does it spawn wg-dynamic it seems.
> 3. Its Makefile by default only builds server and not client, and "make i=
nstall" fails because its dependency is wg which doesn't exist.
>=20
> And it hasn't been updated for 2 months. I wonder what's its status now?

Yeah it's WIP at the moment, but don't worry there will be something
useable you can try out in the first week of december.

Regards,

Thomas

--=20
PGP fingerprint: 42CE 7698 D6A0 6129 AA16  EF5C 5431 BDE2 C8F0 B2F4

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEsuhqARgBY035sVClY1a5mXdUZMYFAl3es1YACgkQY1a5mXdU
ZMa0pAf9EB35ecIb07X4+36F38vlPG5VRyTKVf9pGUuuATRdLnk4tYiYrdR8hlLL
92LlEtke1ZYhrQ/FpC2BxHJBrr9t/BgikT72/CyOI64La+BVOmRr+qpVoEmIU9Ry
hp3auyz7w+pU/G5Y87347p2wvYBxd7KEN7+eISAh4fgHd5yZPivglNxJKQUg368y
amhVhiljFFSHjmvoAzQWu478sfiNpZgnKrKFpWMq1+0wAWno83OWgOnLnfH71NFn
uuvV9futQjJLCufqTX4/5DQnYhACfd1ABBDH8ynj5+5/2oQv71ej+JhOM83DsSYC
nRKXJklJoaf1HcjrT3RWL9FzOGepSQ==
=mEnQ
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============7316392659263300562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7316392659263300562==--
