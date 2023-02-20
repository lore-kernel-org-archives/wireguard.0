Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB83C6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 09:55:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ef0bf0a;
	Mon, 20 Feb 2023 09:52:11 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c4005bf2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 09:52:08 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 309A520F31;
 Mon, 20 Feb 2023 10:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676886705;
 bh=n+uN7LHfSare2pYp0KbgHazPRr5gZhIqwT8ejGIk4w0=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=i1GAA4AYNgGeqM78v04b5sWD22Kgxbk8pkpxv8ekwU91RU5srcn9OOjfnWnQxrJ5k
 EJz3xUL5fjhFvkUqPaTeUCn4sct9B5zFwV6IPJTuP0LbTOQzl+o6BiXTTNJP8WKugb
 UQ/3bMMqiay+4aCWEsK9zqfLb4J/KuBtCu4FyvrZYNhvlUQ/7XIwfL7KgoRIu0o2+l
 EzC4Dbyvh7cHovDrY3YKbNU/HYJ3tb9L9+CPlUSP7xztffZqyHQtyg4h0W0//MxcF9
 HcQHLQUfvDgTWPVSe751aGLbG2ZbwS+jqQ5vJRaNrgVUin06y4pKbHwoaCmeVPNo0X
 2Z/XyeETLQBMg==
Received: by blind.localdomain (Postfix, from userid 1000)
 id 69A5213A11F1; Mon, 20 Feb 2023 10:52:04 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch> <20230220014252.21178988@nvm>
 <87h6vh72d4.fsf@ungleich.ch>
 <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
User-agent: mu4e 1.7.26; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, Roman Mamedov
 <rm@romanrm.net>, tlhackque <tlhackque@yahoo.com>,
 wireguard@lists.zx2c4.com
Subject: Re: Src addr code review (Was: Source IP incorrect on multi homed
 systems)
Date: Mon, 20 Feb 2023 10:47:36 +0100
In-reply-to: <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
Message-ID: <87leksbr5n.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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


Hey Daniel,

thanks a lot for diving in ...

Daniel Gr=C3=B6ber <dxld@darkboxed.org> writes:
> Let's look at the code (heavily culled):
>
> 	struct flowi4 fl =3D {
> 		.saddr =3D endpoint->src4.s_addr,
> 	};
> 	if (cache)
> 		rt =3D dst_cache_get_ip4(cache, &fl.saddr);

What I am wondering is, how did it get into the cache in the first place?

> [...]
>
> @Nico could it perhaps simply be that you're hitting one of these zero'ing
> cases and that's why it's using regular kernel src addr selection instead
> of the cached endpoint src4 address?

That could absolutely be the case. What is funky is that I see the
problem on two very different systems, but maybe it's a good time to
elaborate on this:

- System A:
  - Wireguard module loaded on the host
  - Wireguard wg-quick used within a kubernetes pods that has
    permissions for managing wireguard
  - The same pod also runs bird for BGP peering

- System B:
  - Wireguard running as wireguard-go on OpnSense / FreeBSD
  - BGP running with frr

Both systems exhibit the behaviour, but maybe it's better to focus on
System A first, as this seems to be more the "upstream" source.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
