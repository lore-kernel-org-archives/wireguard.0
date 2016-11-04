Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d73ad4cf
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:34:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ca63be7
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:34:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id effa3b2c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:34:57 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id b14so68340501lfg.2
 for <wireguard@lists.zx2c4.com>; Fri, 04 Nov 2016 09:36:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fun7cnil.fsf@toke.dk>
References: <CAHmME9omqGyouvfT72Z3pC4YYWoJ_yLCuCZ6zZ8BG7QpJh+xKQ@mail.gmail.com>
 <87fun7cnil.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 Nov 2016 17:36:18 +0100
Message-ID: <CAHmME9q_BPdE3HZ5NpYx9mF2=EgrE54+8ygq-3OkaqtNxXSing@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Major Queueing Algorithm Simplification
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Nov 4, 2016 at 3:45 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> But really, instead of guessing why not measure?
>
> Simply run a `flent tcp_4up <hostname>` through the tunnel (requires a
> netperf server instance running on <hostname>) and look at the latency
> graph. The TCP flows will start five seconds after the ping flow; this
> shouldn't cause the ping RTT to rise by more than max ~10ms. And of
> course, trying this on a machine that does *not* have a gazillion
> megafast cores as well is important :)
>
> There's an Ubuntu PPA to get Flent, or you can just `pip install flent`.
> See https://flent.org/intro.html#installing-flent

I maintain the Gentoo package for Flent, actually. I'm doing some
benchmarks now...
