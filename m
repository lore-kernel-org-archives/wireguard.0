Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35599E9B258
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 12:27:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 94876a2c;
	Tue, 24 Feb 2026 12:27:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c0a1a6d0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 12:27:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C78BB61119
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 12:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD6BC19424
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KMr3ACpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1771936047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvHGPBZ9wHt1aP1fErTokF7rhsEBKYC6Lp0tzx6T2xc=;
 b=KMr3ACpWgXgVGz1VZqIkSk+TFkb6t1e3iXBJnBirr5mLj0Ehi8ZefRA29q5VlN1WT8gyK9
 VgnX97fVPxgRJ9oMIiLUensZqsQFTiUi0P0tSuVSY6GPD0VfmCqoOMjuHm3hnBicKTrRfT
 8VNmszDXbNR15PAeP2hNUuc8HikZr74=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4bde68f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 12:27:27 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7d55b97f358so1061343a34.3
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 04:27:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yy2WOfvg5bDdWVMyN7/uIBfLpH4O6+qg22xgis2vQGz5Jk83hv1
 boNdbTzOlqzxiYCi3KJSpa/Rrlm7lROYG7mFWk6PwobI1czku7JIqcbYEuw4baqbu4eXP1XaBw5
 SADjhLQEN/Efn3UsBEvFkc7tQzLRAMg4=
X-Received: by 2002:a05:6830:6d09:b0:7d1:956f:355f with SMTP id
 46e09a7af769-7d52be3f19amr8125292a34.9.1771936046676; Tue, 24 Feb 2026
 04:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20260210143016.0144acf1@leda.eworm.net>
 <20260224115254.761df5a9@leda.eworm.net>
 <CAHmME9pf=TNw6S6HB48q3NKhHzNLAo4qxH64Y7i8Lgg6etFCsg@mail.gmail.com>
 <20260224130751.1faee59a@leda.eworm.net>
In-Reply-To: <20260224130751.1faee59a@leda.eworm.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Feb 2026 13:27:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9pnCLQCp=6=25fnV1jJcNQMeyrAaxLWTmAEOjDff-FkVw@mail.gmail.com>
X-Gm-Features: AaiRm514ai_4QVWOxurGS2uBzfw53GfZmll-LHqL4GQjfhME2UhBla-yaPuqOH4
Message-ID: <CAHmME9pnCLQCp=6=25fnV1jJcNQMeyrAaxLWTmAEOjDff-FkVw@mail.gmail.com>
Subject: Re: Arch Linux - out of date?!
To: Christian Hesse <list@eworm.de>
Cc: wireguard@lists.zx2c4.com
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

On Tue, Feb 24, 2026 at 1:07=E2=80=AFPM Christian Hesse <list@eworm.de> wro=
te:
>
> "Jason A. Donenfeld" <Jason@zx2c4.com> on Tue, 2026/02/24 11:57:
> > On Tue, Feb 24, 2026 at 11:53=E2=80=AFAM Christian Hesse <list@eworm.de=
> wrote:
> > >
> > > Christian Hesse <list@eworm.de> on Tue, 2026/02/10 14:30:
> > > > Hello everybody,
> > > >
> > > > for some time already I am annoyed by mails clogging my input regar=
ding
> > > > wireguard-tools for Arch Linux being out of date. Obviously this is=
 not
> > > > true, I built the package the day of release. [0]
> > > >
> > > > Now found the install page mentioning the package being out-of date=
...
> > > > [1] What goes wrong and how to fix that?
> > > >
> > > > [0] https://archlinux.org/packages/extra/x86_64/wireguard-tools/
> > > > [1] https://www.wireguard.com/install/#arch-module-tools
> > >
> > > Ping... I would like to see this resolved.
> > >
> > > Alternatively I will set up my mail server to forward these mails to =
you
> > > personally, Jason.
> >
> > Hehe.
> >
> > In the midst of a big infrastructure refresh (as perhaps you've
> > noticed), so this is certainly in the queue there. Sorry about this.
>
> Ok, will wait patiently then. Just wanted to make sure this is not lost. =
:)
>
> Is the code available in git anywhere? I could have a look myself then.

I sorted out the arch and alpine ones, but there are still a bunch of
others that are out of date or broken. For alpine I had to work around
anubis (by using a curl useragent).

The code isn't online, but maybe it should be. It's just a bash script
that fetches webpages and executes a regex. The arch ones are:

check \
       tools \
       "Arch" \
       "mail@eworm.de" \
       "https://gitlab.archlinux.org/archlinux/packaging/packages/wireguard=
-tools/-/raw/main/PKGBUILD?ref_type=3Dheads"
\
       'pkgver=3D([0-9.]+)' &
check \
       linuxcompat \
       "Arch" \
       "mail@eworm.de" \
       "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=3Dwireguard=
-dkms"
\
       'pkgver=3D([0-9.]+)' &

check() {
       local type=3D"$1"
       local expected=3D"version_$1"
       expected=3D"${!expected}"
       local name=3D"$2"
       local email=3D"$3"
       local text=3D"$(curl -L -A "curl/8.18.0
($RANDOM$RANDOM$RANDOM$RANDOM)" -s "$4")"
       [[ $text =3D~ $5 ]] && local version=3D"${BASH_REMATCH[1]}" ||
local version=3D"unknown"
       [[ $version =3D=3D "$expected" ]] && local uptodate=3D"true" || loca=
l
uptodate=3D"false"
