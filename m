Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6981BC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 07:45:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA21D20674
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 07:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA21D20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c08a6dd;
	Mon, 13 Jul 2020 07:23:38 +0000 (UTC)
Received: from ciao.gmane.io (static.214.254.202.116.clients.your-server.de
 [116.202.254.214])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d5231a9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 07:23:36 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gnw-wireguard@m.gmane-mx.org>) id 1jut94-0004Ft-BF
 for wireguard@lists.zx2c4.com; Mon, 13 Jul 2020 09:45:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: wireguard@lists.zx2c4.com
From: Luca Beltrame <lbeltrame@kde.org>
Subject: Re: [ANNOUNCE] wireguard-linux-compat v1.0.20200712 released
Date: Mon, 13 Jul 2020 07:19:49 +0200
Organization: KDE e.V.
Message-ID: <20200713071949.1f086a2a@dennogumi.org>
References: <913e8149b5a5c3a6@mail.zx2c4.com>
 <CAHmME9qDW7CLDzQhwHQ7bb==dKAdgtbZfEtzmNaxB-atwCguag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uiSrhDd6m6JlpisNYAk1PTI";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Newsreader: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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

--Sig_/uiSrhDd6m6JlpisNYAk1PTI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Il giorno Sun, 12 Jul 2020 22:06:06 -0600
"Jason A. Donenfeld" <Jason@zx2c4.com> ha scritto:

> If anybody thinks that 15.1 support would be worth preserving for more
> releases (how many?), this would be the time to speak up. I'm happy to

15.1 will be EOL in November. So probably worth supporting until then?


--=20
Luca Beltrame
GPG key ID: A29D259B

--Sig_/uiSrhDd6m6JlpisNYAk1PTI
Content-Type: application/pgp-signature
Content-Description: Firma digitale OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE44SOCbfOVCFad4fzRwf0bp7HLewFAl8L7vUACgkQRwf0bp7H
LexstwgAgimwsAnQb5T/QgwMWW2ixKCcWGYu76IN6yKUU/ZTyBmy37CH6wKbhbRJ
NQzNtAHFd5qb1l9q57U5RmSCJmTWwSApHnf1EHOlXgaUohpuqoMijcqE7y8K8wuO
DPsKatCwyO1ufYbQTdBI3Wi1I6kMVzcva7xeZwVKA/oXC/Oxj5rU4kcOXzMfSUte
1Tw4EPjue97FY8advRBY0YFhI0p/JM5x//WYuZLIxHEYpdsQKgBtkk3FKzB+yc/m
HUtiRTol0NsNf0rViiIjYxyYtwLiEJsqe8QLLdDJ5/JKRi/Ml1hFq/eQuFSp4kSF
oXygoqu+XvUOWVjuU7OwQfjbUgf0kw==
=Qh2h
-----END PGP SIGNATURE-----

--Sig_/uiSrhDd6m6JlpisNYAk1PTI--


