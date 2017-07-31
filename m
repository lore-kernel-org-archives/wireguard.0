Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32efa032
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 15:14:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06edce4c
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 15:14:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fbc0bb6
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 15:33:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6a714b34
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 15:33:09 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m88so103697908iod.2
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2017 08:34:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 31 Jul 2017 17:34:55 +0200
Message-ID: <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
Subject: Re: Multihomed server issue
To: Wang Jian <larkwang@gmail.com>
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

On Fri, Jul 28, 2017 at 2:51 AM, Wang Jian <larkwang@gmail.com> wrote:
> The solution can be one of:
>
> 1. server can RTS (response to source), or can bind to arbitary
> address for outgoing

The server does already respond to source.

Can you send me a TCP dump and the output of `ip route` indicating
that WireGuard is doing otherwise?

Thanks,
Jason
