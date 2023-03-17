Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD5C74A5B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Mar 2023 19:57:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a69955f4;
	Fri, 17 Mar 2023 19:54:58 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eef34979
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Mar 2023 19:54:53 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by len.romanrm.net (Postfix) with SMTP id 3CE834031A;
 Fri, 17 Mar 2023 19:54:52 +0000 (UTC)
Date: Sat, 18 Mar 2023 00:54:51 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Ashish SHUKLA <ashish.is@lostca.se>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Force a specific IP for outgoing WG traffic with SNAT?
Message-ID: <20230318005451.7212e6c9@nvm>
In-Reply-To: <e4f7dc477cd14e14a75e304878e6cb05@lostca.se>
References: <20230217000747.0825b2e9@nvm>
 <e4f7dc477cd14e14a75e304878e6cb05@lostca.se>
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

On Sat, 18 Mar 2023 01:13:53 +0530
Ashish SHUKLA <ashish.is@lostca.se> wrote:

> Did you try filtering based on fwmark ?
>=20
>      CONFIGURATION FILE FORMAT
>             The configuration file format is based on INI. There are two=
=20
> top level sections -- Interface and Peer. Multiple Peer sections may be=20
> specified, but only one Interface section may be specified.
>=20
>             The Interface section may contain the following fields:
>=20
>             =E2=80=A2      PrivateKey =E2=80=94 a base64 private key gene=
rated by wg=20
> genkey. Required.
>=20
>             =E2=80=A2      ListenPort =E2=80=94 a 16-bit port for listeni=
ng. Optional; if=20
> not specified, chosen randomly.
>=20
>             =E2=80=A2      FwMark =E2=80=94 a 32-bit fwmark for outgoing =
packets. If set=20
> to 0 or "off", this option is disabled. May be specified in hexadecimal=20
> by prepending "0x". Optional.

I was not aware there was such an option. For now the task described in the
original message is no longer required, I will try fwmark next time when it
might be. Thanks!

--=20
With respect,
Roman
