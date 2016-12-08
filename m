Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73bd2e5a
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 15:09:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b962e249
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 15:09:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 822b427d
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 15:09:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8d2fb77
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 15:09:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a197so221345749wmd.0
 for <wireguard@lists.zx2c4.com>; Thu, 08 Dec 2016 07:15:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pXPHPZwFy4JLQZLbOjinFnPJ+JcP1mPR=+PvAMLYmoLA@mail.gmail.com>
References: <20161208091214.15449-1-list@eworm.de>
 <CAHmME9qc02xGhyiXp3J3ugFyCKkWbYY0Fj_q9C1euv1gAYa9qg@mail.gmail.com>
 <20161208123343.54f162d7@leda>
 <CAHmME9pXPHPZwFy4JLQZLbOjinFnPJ+JcP1mPR=+PvAMLYmoLA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 16:15:22 +0100
Message-ID: <CAHmME9pDTAafzhW-kgVeTCHjPWKM5Uii1fxpvFqXB9kP8Ni+ng@mail.gmail.com>
Subject: Re: [PATCH 1/1] make the systemd unit example more general
To: Christian Hesse <list@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Dec 8, 2016 at 1:48 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> still seems like the wrong place to be doing these things. Maybe it'd
> be useful to have an extra shell-script in contrib called wg-config.sh
> that takes a device name, a `wg(8)`, config file, a list of IPs given
> by --address=, a list of additional routes given by --route=, and the
> ability to disable auto-route-from-allowed-ips-adding via
> --no-auto-routes. Maybe I'll code this up myself -- it should only
> take a few minutes to do...

https://git.zx2c4.com/WireGuard/tree/contrib/examples/wg-config/README

That was pretty easy.

Is this useful somehow?
