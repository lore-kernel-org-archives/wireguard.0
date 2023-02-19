Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B4DC05027
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 18:36:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e26a85a8;
	Sun, 19 Feb 2023 18:31:23 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72b425e0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 18:31:20 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by len.romanrm.net (Postfix) with SMTP id 3566D4017B;
 Sun, 19 Feb 2023 18:31:19 +0000 (UTC)
Date: Sun, 19 Feb 2023 23:31:18 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Daniel =?UTF-8?B?R3LDtmJlcg==?= <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RESEND PATCH v3] wg: Support restricting address family of DNS
 resolved Endpoint
Message-ID: <20230219233118.2d9654f9@nvm>
In-Reply-To: <20230219180428.438453-1-dxld@darkboxed.org>
References: <20230219180428.438453-1-dxld@darkboxed.org>
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

On Sun, 19 Feb 2023 19:04:28 +0100
Daniel Gr=C3=B6ber <dxld@darkboxed.org> wrote:

> +static inline bool parse_address_family(int *family, const char *value)
> +{
> +	if (strcmp(value, "inet") =3D=3D 0)
> +		*family =3D AF_INET;
> +	else if (strcmp(value, "inet6") =3D=3D 0)
> +		*family =3D AF_INET6;

Wouldn't the first condition match "inet6" as well, not ever checking the
second condition?

> +	else if (strcmp(value, "unspec") =3D=3D 0)
> +		*family =3D AF_UNSPEC;
> +	else
> +		return false;
> +
> +	return true;
> +}


--=20
With respect,
Roman
