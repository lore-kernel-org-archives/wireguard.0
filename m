Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E45CA1013
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 01:05:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a4006a3;
	Sat, 6 Sep 2025 00:18:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 18a206ee
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:18:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6FF166029B;
 Sat,  6 Sep 2025 00:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C51CC4CEF5;
 Sat,  6 Sep 2025 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757117891;
 bh=lu+qRIbrRnZYTba50Wh+xDGx19vsLgoXzjNCDvoDXhI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LcwxCXYowbvRJToUbp7RT0rVnNzFcbUTfuqhhb5hY6ijwHm1YMB13p/TllOhBoVaU
 Oow7s8yoeerWWd51e59nqinESsmyUpz3dRv2ZFHUrrweM+oOUzjigcxWFf11w6ccYe
 XJzWTeD9m5B/P8FnSPDpwJEgQOiEjE1Gv2kjs5JXJQ29jSMscxVp446ii2QhxO/XLn
 pZ8ctoSxv0oCO7cQhAT0Qmds1SWFxVT6MIsKVJSl9WUXUBrd+dVW6MZZBjyYambqy1
 lXQNmbzNyLr6s/h2XExLN7A9ZcCtrHJYfUqM12FyaVZZg3Dn2fDkbQ/6ze1ORjfaOq
 eNzW36EQiTWsg==
Date: Fri, 5 Sep 2025 17:18:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 05/11] tools: ynl-gen: define nlattr *array in
 a block scope
Message-ID: <20250905171809.694562c6@kernel.org>
In-Reply-To: <20250904220156.1006541-5-ast@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-5-ast@fiberby.net>
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

On Thu,  4 Sep 2025 22:01:28 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Instead of trying to define "struct nlattr *array;" in the all
> the right places, then simply define it in a block scope,
> as it's only used here.
>=20
> Before this patch it was generated for attribute set _put()
> functions, like wireguard_wgpeer_put(), but missing and caused a
> compile error for the command function wireguard_set_device().
>=20
> $ make -C tools/net/ynl/generated wireguard-user.o
> -e      CC wireguard-user.o
> wireguard-user.c: In function =E2=80=98wireguard_set_device=E2=80=99:
> wireguard-user.c:548:9: error: =E2=80=98array=E2=80=99 undeclared (first =
use in ..)
>   548 |         array =3D ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
>       |         ^~~~~

Dunno about this one. In patch 4 you basically add another instance of
the "let's declare local vars at function level" approach. And here
you're going the other way. This patch will certainly work, but I felt
like I wouldn't have written it this way if I was typing in the parsers
by hand.
