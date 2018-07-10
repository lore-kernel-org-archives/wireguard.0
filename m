Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4343ab08
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 14:47:19 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [IPv6:2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 762253db
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 14:47:16 +0000 (UTC)
Date: Tue, 10 Jul 2018 19:54:36 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
Message-ID: <20180710195436.357fb972@natsu>
In-Reply-To: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
References: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
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

On Sun, 08 Jul 2018 18:52:32 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

>   * receive: use NAPI on the receive path
>   
>   This is a big change that should both improve preemption latency (by not
>   disabling it unconditionally) and vastly improve rx performance on most
>   systems by using NAPI. The main purpose of this snapshot is to test out this
>   technique.

Just ran a few tests, it appears the performance is about 5-10% higher.
Great work!

Two VMs running on the same host (non-WG iperf3 is 14 Gbit/sec), typical
results (upgrading receiver machine only):

Single core:

Before: 1.06 Gbit/sec
After: 1.13 Gbit/sec

Dual core:

Before: 1.25 Gbit/sec
After: 1.35 Gbit/sec

Note that my "before" is a bit non-stock, but with a patch which removed two
calls of "simd_relax" (as I wanted to keep max performance over the
interactivity changes). "After" is the new snapshot without any patches.

-- 
With respect,
Roman
