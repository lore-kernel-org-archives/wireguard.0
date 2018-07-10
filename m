Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa4f1a7a
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 15:50:09 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0e8516b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 15:50:09 +0000 (UTC)
Date: Tue, 10 Jul 2018 20:57:29 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
Message-ID: <20180710205729.645bc734@natsu>
In-Reply-To: <CAHmME9peVZz_x2tQPGng68N1bphyYMHi4FxK9PV4Tt5XRLf4fQ@mail.gmail.com>
References: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
 <20180710195436.357fb972@natsu>
 <CAHmME9peVZz_x2tQPGng68N1bphyYMHi4FxK9PV4Tt5XRLf4fQ@mail.gmail.com>
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

On Tue, 10 Jul 2018 16:57:14 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> The latest snapshot will still have the same preemption relaxation
> with simd_relax(), but gets performance gains by moving to napi, so
> it's still faster overall. If you want the simd_relax() to not take a
> hit and get maximum throughput, the right way of doing this is
> actually to just disable preemption in your kernel with
> PREEMPT_NONE=y.

I build a single kernel to use across a diverse park of machines, including
servers, routers -- and a few GUI desktops. It is not an option for me to
disable preemption entirely in that kernel. (And it would be a hassle to build
two or more kernels each time).

However those of my hosts which are routers with WG, are NOT the same hosts
which are interactive desktops. So I don't want any sacrifices towards
interactivity *in WG*.

I'll probably test again without simd_relax, but from the past mailing list
discussion it seemed like that one doesn't affect things much. In any case,
it's great that you found a way to keep performance and increase interactivity
at the same time with NAPI.

-- 
With respect,
Roman
