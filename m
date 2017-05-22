Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efcac7bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 00:50:20 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62bafd1d
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 00:50:20 +0000 (UTC)
Date: Mon, 22 May 2017 03:02:11 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: openresolv dependency
Message-ID: <20170522030211.6fb18de8@msi.defcon1>
In-Reply-To: <CAHmME9pJEXKRhz8dbY6hrg33Ey-j6zD6O2uu125bMqx_vCKovg@mail.gmail.com>
References: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
 <CAHmME9pJEXKRhz8dbY6hrg33Ey-j6zD6O2uu125bMqx_vCKovg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 22 May 2017 02:41:13 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> https://github.com/EggieCode/wireguard-ppa/issues/19

Following your comment, you could flip the resolvconf dependency from 
a mandatory one to a a recommand or even a suggest, with a few comment
lines into the /usr/share/doc/README.Debian file.

Jean-Yves
