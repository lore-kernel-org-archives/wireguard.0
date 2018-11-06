Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D55FC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:42:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D42E206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzdo9TIG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D42E206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94af0355;
	Tue, 6 Nov 2018 20:38:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f658ba1c
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:38:07 +0000 (UTC)
Received: from mail-it1-x136.google.com (mail-it1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13f89cc5
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:38:07 +0000 (UTC)
Received: by mail-it1-x136.google.com with SMTP id e11so16356346itl.5
 for <wireguard@lists.zx2c4.com>; Tue, 06 Nov 2018 12:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLLb6tmpjCuCTODCFhV9fMWbCE9tnyTrVz+sYOuapqY=;
 b=Dzdo9TIGbMuSHny+/aRCX5jKONbXX1QO2CXmpxylBRA0D/GOim+8qVhnAbsTFFvehV
 Qoi+XqgYsG6lash5zUUbUUhOCG5R54cCUGJWAdTYfdLvj0297Oe3x9Yh84EXcBZSBieu
 4Pf5M26qdUOUlraR9rYUTHx5vExU/BDFMxYkGJgwOeRKqUGAcl7ORGl7IaVkKD6Fh2U4
 6n8vlaPXFTJq+udgk4Qh92PBk4xYk1+aP+qTDU+Ul/MzLH68HsMt5Xrb80BYvz+Puosv
 4N5YSPL4p/lt3KS+Ymj+f7CV76WNZpnEJ2pUlu/ULxx9YiDtw/DaligyebdCBAfRAHm/
 WbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLLb6tmpjCuCTODCFhV9fMWbCE9tnyTrVz+sYOuapqY=;
 b=iOuznPkVUe1b4u9xiLA4nUm7ambGEjX+s+i4VcJsRG1hzHMkHsE2fK0rAzZT9yDbDs
 68wy1U2l1kO5JCsNLvULzThGIQCZQ1+ZhoxvkLo1UHcejGQM7nagMn5rI8g2cU0s5NQB
 PwNgXgbsdgk0GFrgN75tTl1P0WPt0H3Q2sd7YFUEO0LApUiBnkJaMNJux7cSlWS2lYOI
 3W8Jwm3JPY/Pk+xWNLwSTHClrCk/KS1quIibeyII81IrV5Xy+69pjA3CECjjJBd2l4wi
 A+xCiK8cQ4RgtOiMwIeY+X7upcc3CbPCSKpI32yMCnUpDrGV49tVis0VjIDWRWd8GqPh
 6uFQ==
X-Gm-Message-State: AGRZ1gLu3M56SghtlYY++rLgfIhOEiWpbZXd/FTUkROD6CprdBkPkmiS
 6eWqctAz1i/i+DKdXuCeWDtaa6NbyhywqQCnaOMMJYxO
X-Google-Smtp-Source: AJdET5cC3F1x5r6iv0BKPmWZ2sGG7jCobkp7rN97iW4O4MQoKzn2+8KbDm8sUYyQ9mrp7mwu9OXrFxgv94MZTtuytxA=
X-Received: by 2002:a24:81c1:: with SMTP id
 q184-v6mr3493510itd.152.1541536949749; 
 Tue, 06 Nov 2018 12:42:29 -0800 (PST)
MIME-Version: 1.0
References: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
 <3jyAZC1J0MGdvAW-Ldzv1OiVrcdJ-GLbqgVTNY2U_1Qp-SstlhEUK9l82mBR9FwfS3F4yiwnNREeFzMaSlR0L6cw2M58JhcB3itJYNBTOUg=@sunfi.sh>
In-Reply-To: <3jyAZC1J0MGdvAW-Ldzv1OiVrcdJ-GLbqgVTNY2U_1Qp-SstlhEUK9l82mBR9FwfS3F4yiwnNREeFzMaSlR0L6cw2M58JhcB3itJYNBTOUg=@sunfi.sh>
From: Lars Francke <lars.francke@gmail.com>
Date: Tue, 6 Nov 2018 21:41:53 +0100
Message-ID: <CAD-Ua_gLEPjZ9ufHnLtPM-eqAj+t1pN0uFbOpx3zobF5oHSPDw@mail.gmail.com>
Subject: Re: Question about AllowedIPs and proper "mesh" setup
To: phil@sunfi.sh
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============6262102244734115707=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6262102244734115707==
Content-Type: multipart/alternative; boundary="0000000000004c4eba057a050a0e"

--0000000000004c4eba057a050a0e
Content-Type: text/plain; charset="UTF-8"

Phil, Matthias,

thanks for the answers. I haven't received Matthias answer but I can see it
in the archive.

The reason I wanted to do it the way I initially described is laziness. I'm
setting up the machines using Ansible[0]. It'd be great if I didn't need
any special cases but it seems that that's going to be way easier than
figuring out another way (which doesn't even seem to exist yet) ;-)

Thank you both!

Cheers,
Lars

[0] <https://github.com/opencore/ansible_wireguard> (It's not beautiful but
it does what I need)

On Tue, Nov 6, 2018 at 9:16 PM Phil Hofer <phil@sunfi.sh> wrote:

> > Now I want to add an outside client into the mix (e.g. my laptop). I
> want to be able to connect to just one of those hosts and have that host
> forward my packages to the others.
> > I can get it to work if I pick _one_ specific jump host but I haven't
> managed to set it up in a way that I can connect to any of them.
>
> You might consider setting up just one of your servers
> as a gateway for a subnet dedicated to your client machine(s).
> Then add routes on your servers to the gateway.
>
> For example, set up 10.0.0.1 as the gateway to 10.0.1.0/24,
> and set your client machine up as 10.0.1.1. Machines on
> 10.0.0.0/24 remain connected directly.
>
> If you need to be able to route through any one of
> your servers on an ad-hoc basis, then you'll need some
> additional routing protocol magic, as Matthias suggested.
>
> Cheers,
> Phil

--0000000000004c4eba057a050a0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Phil, Matthias,<div><br></div><div>thanks=
 for the answers. I haven&#39;t received Matthias answer but I can see it i=
n the archive.</div><div><br></div><div>The reason I wanted to do it the wa=
y I initially described is laziness. I&#39;m setting up the machines using =
Ansible[0]. It&#39;d be great if I didn&#39;t need any special cases but it=
 seems that that&#39;s going to be way easier than figuring out another way=
 (which doesn&#39;t even seem to exist yet) ;-)</div><div><br></div><div>Th=
ank you both!</div><div><br></div><div>Cheers,</div><div>Lars</div><div><br=
></div><div>[0] &lt;<a href=3D"https://github.com/opencore/ansible_wireguar=
d">https://github.com/opencore/ansible_wireguard</a>&gt; (It&#39;s not beau=
tiful but it does what I need)</div></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr">On Tue, Nov 6, 2018 at 9:16 PM Phil Hofer &lt;phil@sun=
fi.sh&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; Now I want to=
 add an outside client into the mix (e.g. my laptop). I want to be able to =
connect to just one of those hosts and have that host forward my packages t=
o the others.<br>
&gt; I can get it to work if I pick _one_ specific jump host but I haven&#3=
9;t managed to set it up in a way that I can connect to any of them.<br>
<br>
You might consider setting up just one of your servers<br>
as a gateway for a subnet dedicated to your client machine(s).<br>
Then add routes on your servers to the gateway.<br>
<br>
For example, set up 10.0.0.1 as the gateway to <a href=3D"http://10.0.1.0/2=
4" rel=3D"noreferrer" target=3D"_blank">10.0.1.0/24</a>,<br>
and set your client machine up as 10.0.1.1. Machines on<br>
<a href=3D"http://10.0.0.0/24" rel=3D"noreferrer" target=3D"_blank">10.0.0.=
0/24</a> remain connected directly.<br>
<br>
If you need to be able to route through any one of<br>
your servers on an ad-hoc basis, then you&#39;ll need some<br>
additional routing protocol magic, as Matthias suggested.<br>
<br>
Cheers,<br>
Phil</blockquote></div>

--0000000000004c4eba057a050a0e--

--===============6262102244734115707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6262102244734115707==--
