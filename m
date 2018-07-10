Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 238b2c26
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 18:30:01 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f1667da
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 18:30:01 +0000 (UTC)
Date: Tue, 10 Jul 2018 23:37:22 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
Message-ID: <20180710233722.31d6b060@natsu>
In-Reply-To: <20180710205729.645bc734@natsu>
References: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
 <20180710195436.357fb972@natsu>
 <CAHmME9peVZz_x2tQPGng68N1bphyYMHi4FxK9PV4Tt5XRLf4fQ@mail.gmail.com>
 <20180710205729.645bc734@natsu>
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

On Tue, 10 Jul 2018 20:57:29 +0500
Roman Mamedov <rm@romanrm.net> wrote:

> I'll probably test again without simd_relax

Somehow it's now noticeably worse without those. Even got some dips below
1 Gbit/s which I have never seen before, and the overall speed is lower.

-- 
With respect,
Roman
