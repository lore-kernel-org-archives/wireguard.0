Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061CBC3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 12:24:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36dd7779;
	Wed, 20 Dec 2023 12:19:40 +0000 (UTC)
Received: from shin.romanrm.net (shin.romanrm.net [2a11:27c0:1f5::2a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b889f4a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2023 12:19:37 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by shin.romanrm.net (Postfix) with SMTP id E7AE13F725;
 Wed, 20 Dec 2023 12:19:32 +0000 (UTC)
Date: Wed, 20 Dec 2023 17:19:24 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Roman Lesechko <polo-ru@yandex.ru>, wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Edited RU translation to avoid misunderstanding
Message-ID: <20231220171924.7f72351e@nvm>
In-Reply-To: <70a5f5c7-2846-4f96-a567-e2a7d7a65c49@tls.msk.ru>
References: <20231219155923.1892-1-polo-ru@yandex.ru>
 <70a5f5c7-2846-4f96-a567-e2a7d7a65c49@tls.msk.ru>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 20 Dec 2023 10:59:40 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 19.12.2023 18:59, Roman Lesechko :
> > I have edited RU translations of "macToggleStatusButton" on the main sc=
reen. In english button's caption is imperative: Activate/Deactivate. Curre=
nt russian translation is wrong in terms of tenses. For example, Wireguard =
is deactivated, but the button's caption says it is already active.
> >=20
> > Signed-off-by: Roman Lesechko <polo-ru@yandex.ru>
>=20
> > -"tunnelPeerPersistentKeepaliveValue (%@)" =3D "=D0=BA=D0=B0=D0=B6=D0=
=B4=D1=8B=D0=B5 %@ - =D0=B8=D0=BD=D1=82=D0=B5=D1=80=D0=B2=D0=B0=D0=BB =D0=
=B2 =D1=81=D0=B5=D0=BA=D1=83=D0=BD=D0=B4=D0=B0=D1=85";
> > +"tunnelPeerPersistentKeepaliveValue (%@)" =3D "=D0=BA=D0=B0=D0=B6=D0=
=B4=D1=8B=D0=B5 %@ =D1=81=D0=B5=D0=BA=D1=83=D0=BD=D0=B4";
>=20
> Personally I would keep this one as it was.  Yes it is a bit ugly but it =
is better
> for, say, 2 or 3 seconds.

The old one is way too awkward and still wrong for when it's 1.

To handle the case of 2 or 3 it can be "=D0=BA=D0=B0=D0=B6=D0=B4=D1=8B=D0=
=B5 %@ =D1=81=D0=B5=D0=BA."

In this format it's impossible to reach perfection (as in Russian the words
before and after the number also need to change inflection depending on the
actual value). But even as proposed in the patch, I'd say it is better than
before.

--=20
With respect,
Roman
