Return-Path: zx2c4@gentoo.org
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a6cee87
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 22:33:30 +0000 (UTC)
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
 [209.85.215.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zx2c4)
 by smtp.gentoo.org (Postfix) with ESMTPSA id 8F606340DC3
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 22:34:13 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id f93so32554731lfi.2
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 15:34:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160711212044.GA15134@lud.polynome.dn42>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <20160711212044.GA15134@lud.polynome.dn42>
From: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Date: Tue, 12 Jul 2016 00:34:07 +0200
Message-ID: <CAHmME9ohEoP24EEM4sAeG1LweQNa+tXY_TRHM1zqtZcXjn8Fqg@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: zorun@bitsofnetworks.org, Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 11, 2016 at 11:20 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> As I said before, once every ~two weeks is the minimum for me, as I like
> to at least compile-test a new release before publishing it...
>
> You can release more often, but then I would probably skip releases
> (which is not a big deal).

Okay, thanks. Well, let's get this latest snapshot with the NAT fixes
packaged so folks stop complaining. Then I'll focus more on
development than release for two or three weeks or so.
