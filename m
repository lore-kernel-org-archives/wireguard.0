Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4e0d411
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:34:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 494e5254
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:34:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e15cbae
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:34:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0e5f4a7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:34:27 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id l18so98894810oig.2
 for <wireguard@lists.zx2c4.com>; Sat, 13 May 2017 16:45:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513073721.GD22218@tuxmachine.polynome.dn42>
References: <20170513073721.GD22218@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 01:45:22 +0200
Message-ID: <CAHmME9rowGrGgBoWaVzh0OjFrFKj95Ub__fT+SGYLD4SKYRpiw@mail.gmail.com>
Subject: Re: Performance of Wireguard on Infiniband 40G
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

Hey again,

On Sat, May 13, 2017 at 9:37 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> - Debian jessie
> - Linux 3.16.43-2

One small and unfortunate thought just occurred to me: the backporting
to really old kernels I'm pretty sure is way less efficient than newer
kernels on the RX, due to some missing core fast-path APIs in the old
kernels. In particular, I had to wrap the UDP layer with some nasty
hacks to get packets out, whereas newer kernels have an elegant API
for that which integrates in the right place. Just a thought... I
haven't actually done concrete measurements though.

Jason
