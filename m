Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FE8C32772
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 16:20:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5b54e7da;
	Tue, 23 Aug 2022 16:20:52 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6f26575c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Aug 2022 16:20:50 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id 162155A6;
 Tue, 23 Aug 2022 16:20:49 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:20:48 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Quentin Vallin <Quentin.Vallin@anuvu.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: [Question or feature request] Support multiple peer config file
 using something like /etc/wireguard/conf.d
Message-ID: <20220823212048.71489733@nvm>
In-Reply-To: <MN2PR10MB418992D0FB239AC2D3DC8B298E8F9@MN2PR10MB4189.namprd10.prod.outlook.com>
References: <MN2PR10MB418992D0FB239AC2D3DC8B298E8F9@MN2PR10MB4189.namprd10.prod.outlook.com>
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

Hello,

On Tue, 19 Jul 2022 21:36:57 +0000
Quentin Vallin <Quentin.Vallin@anuvu.com> wrote:

> I'm trying to separate=C2=A0my peer configuration and automate it.=C2=A0
>=20
> I know that I can use the post hook PostUp =3D wg addconf /path/to/my/file
>=20
> It would be easier to have a special path were wireguard can merge the co=
nfig file together, like /etc/wireguard/conf.d/<interface_name>/<files>.con=
f.=C2=A0

Personally I use my own shell script that concatenates pieces of the config
into a single file and runs wg on that. The same script also then handles
addresses, routes and such.

If you're doing any sort of non-trivial setup, you'd likely have a similar
wrapper on top of WG, and then it is easy to also make your own "conf.d".

--=20
With respect,
Roman
