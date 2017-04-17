Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93dde505
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 17:47:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5ce64a6
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 17:47:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7944deaa
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 17:47:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 608ad5e2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 17:47:57 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id x184so62208026oia.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 Apr 2017 10:55:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPNEFAaG3cQQJSyAuGxdHQHMm6+RzrQVt9ZrzTxrVNKm01z2dA@mail.gmail.com>
References: <CAPNEFAaG3cQQJSyAuGxdHQHMm6+RzrQVt9ZrzTxrVNKm01z2dA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Apr 2017 19:55:37 +0200
Message-ID: <CAHmME9qQmaQXBJ+pR6MHx90fUb0_EmwriBo6=rRupEDFF6d=Yg@mail.gmail.com>
Subject: Re: nat traversal / userspace impl
To: "Jason E. Aten" <j.e.aten@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Apr 17, 2017 at 7:45 PM, Jason E. Aten <j.e.aten@gmail.com> wrote:
> 1. If it uses UDP only, how does NAT traversal (firewall punch through)
> work?

The same way UDP punching works every place else.

>
> 2. are there userspace implementations available...?

In the works.

> compile the wireguard kernel module on centos 7.3 with kernel 3.10, no luck,

I'll try to debug under centos' 3.10 kernel. Thanks for the report.

> lots of compile time header issues. I upgraded to kernel 4.10 and could
> compile the wireguard module under kernel 4.10, but then got stuck on how to
> compile the dependent modules;hey aren't specific to wireguard, but rather
> generic modules that just weren't in the default 4.10 kernel and I'm not
> sure how to build them.
>
> [root@k0 src]# insmod ./wireguard.ko
> insmod: ERROR: could not insert module ./wireguard.ko: Unknown symbol in
> module
> [root@k0 src]# dmesg
> ...
> [77292.707469] wireguard: Unknown symbol udp_sock_create4 (err 0)
> [77292.711122] wireguard: Unknown symbol udp_tunnel6_xmit_skb (err 0)
> [77292.714899] wireguard: Unknown symbol udp_tunnel_sock_release (err 0)
> [77292.718642] wireguard: Unknown symbol setup_udp_tunnel_sock (err 0)
> [77292.722699] wireguard: Unknown symbol udp_sock_create6 (err 0)
> [77292.726007] wireguard: Unknown symbol udp_tunnel_xmit_skb (err 0)
> [root@k0 src]#

Try running `make install && modprobe wireguard` and see if that does
what you want.
Barring that, you can try `modprobe udp_tunnel && modprobe ip6_udp_tunnel`.

Jason
