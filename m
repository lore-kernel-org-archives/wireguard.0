Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c1746ff
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 13:57:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5d14334
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 13:57:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a2ce8cf
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 13:57:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 24cd2f04
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 13:57:11 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id o23so12685177otd.1
 for <wireguard@lists.zx2c4.com>; Sun, 03 Dec 2017 06:03:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <EE5CC249-FD46-4984-8A0A-0CC583E3C3FA@ferrisellis.com>
References: <CAHmME9qmjgDJ3bXhWaZ86=iuLi+kDVmLqC0iZnU=3QHA0wBDMg@mail.gmail.com>
 <cdc270d3-19ea-97b9-eb34-efff88ec3d25@posteo.de>
 <CAHmME9p+20_OGuGDTF5e7nfGz=-PTBrVfOxu3P27GQMd3vLrLA@mail.gmail.com>
 <EE5CC249-FD46-4984-8A0A-0CC583E3C3FA@ferrisellis.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Dec 2017 15:03:41 +0100
Message-ID: <CAHmME9oO2FMC+QJyAJtRnvS6Ey+91YTwVqCLNnU4Z2HR983__g@mail.gmail.com>
Subject: Re: Dealing with list volume
To: Ferris Ellis <ferris@ferrisellis.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Dec 2, 2017 at 12:01 AM, Ferris Ellis <ferris@ferrisellis.com> wrot=
e:
> Wikis: As for wikis, I always have had mixed feelings about them. For lar=
ge
> projects like Gentoo or Arch they=E2=80=99re great, in my opinion, for co=
mmunity
> knowledge accumulation. But for smaller projects I=E2=80=99ve found havin=
g something
> to the effect of a community maintained `docs/` directory with markdown i=
s
> just simpler and easier. Plus you can always go back and generate some
> pretty webpages out of the `docs/` markdown files if you=E2=80=99ve reach=
ed the
> adoption level where people expect documentation to be in webpages.

This is what I currently have for the wireguard.com page. I should
really open source that repo. I could certainly use some more
documentation, but nobody has stepped up to create it.
