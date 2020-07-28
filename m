Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC8EC433EB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 12:18:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02211206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 12:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lPgAkBNl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02211206D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2393bd8;
	Tue, 28 Jul 2020 11:54:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99741805
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:54:36 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 152c2218
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=bXJlshchcaR+
 0WpSnFkoPXr25Iw=; b=lPgAkBNlQokp0bavuz9obwT/H+1xEYtJHRHmQq/UI810
 exmUXmHq4fEOqGg1xstDkYzgFXMc2cJ1XlT05y5omYKc6KhMrHml4KiqIH2WznsD
 GMOMJqB/HVAJDNsxWra2fHUsiZhkOnRUCkg3ZrhDytBsFi8C/FKvpIBgGgxjszfX
 NvRJUGXAxNCwfQJGXoiFRyENOZm9ap7J66ZIY7Bhr6Klb5UH4OWTd92cLZBFvHIw
 dqA5ppA14mvX5pofdiyZlCy2hIIy35zTjX/s4rzj0z3RZ6urRB7d13M6pew0QAtD
 n2+nQK7lv0OYwbfNVf7C+8bfVrSC532dma5ngH5Zdw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f637bf33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:54:36 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id e64so20440833iof.12
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jul 2020 05:18:02 -0700 (PDT)
X-Gm-Message-State: AOAM530fqnzOTRaQ6Xp54owSSEr736rXd27svrUQGtIqSb+hD6uLnEO8
 rA/sqetwfcfFTLMkCE6Sh9p3rBDjrOiCS98sIng=
X-Google-Smtp-Source: ABdhPJzWJUGDj2G/XUX4NM4bVsFnTGfhpj+Kxdr6q1wsEY6JfvJ9KiYBy40RQ4bDQWAGBffPIlm1w+r8mwCsBAWlysg=
X-Received: by 2002:a5e:dd0a:: with SMTP id t10mr21311328iop.80.1595938682384; 
 Tue, 28 Jul 2020 05:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
 <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
 <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
 <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
 <48a85c212bffaf7004c4934b1da5c4b02674a54c.camel@fud.no>
 <CAHmME9q2NFc9QbKW068jHc=o79m4N5pj6Xvjfw51VSfnsKU=3Q@mail.gmail.com>
 <6c4eba00ca984fc4ff52c1f773ea10d2d0c9123e.camel@fud.no>
In-Reply-To: <6c4eba00ca984fc4ff52c1f773ea10d2d0c9123e.camel@fud.no>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jul 2020 14:17:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9q7aGjQFWqVosmVRdD-1-XbeYBYLZ_wF2Z8qYrApgGOXw@mail.gmail.com>
Message-ID: <CAHmME9q7aGjQFWqVosmVRdD-1-XbeYBYLZ_wF2Z8qYrApgGOXw@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: Tore Anderson <tore@fud.no>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jul 28, 2020 at 2:17 PM Tore Anderson <tore@fud.no> wrote:
>
> * Jason A. Donenfeld
>
> > By the way, I just made this change:
> > https://git.zx2c4.com/wireguard-tools/commit/?id=3D37ed947239f4b3ef161c=
85428d9267eb23a69d69
> > I had assumed it was syncconf all along, until I checked. That makes
> > sense; Luis added `strip` before I added `syncconf`.
>
> That is useful, thank you.
>
> However, I believe this change invalidates the =C2=ABnote that the above
> command will add and update peers but will not remove peers=C2=BB caveat.

Thanks for pointing that out. Fixing.
