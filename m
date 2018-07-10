Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34d89081
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 19:00:12 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [IPv6:2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b32d29d8
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 19:00:12 +0000 (UTC)
Date: Wed, 11 Jul 2018 00:07:34 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
Message-ID: <20180711000734.5f358590@natsu>
In-Reply-To: <CAHmME9r6perr5PFyF-M6Zcife3V0KZMN-XJ09gcUr-csVxmcBA@mail.gmail.com>
References: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
 <20180710195436.357fb972@natsu>
 <CAHmME9peVZz_x2tQPGng68N1bphyYMHi4FxK9PV4Tt5XRLf4fQ@mail.gmail.com>
 <20180710205729.645bc734@natsu> <20180710233722.31d6b060@natsu>
 <CAHmME9r6perr5PFyF-M6Zcife3V0KZMN-XJ09gcUr-csVxmcBA@mail.gmail.com>
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

On Tue, 10 Jul 2018 20:38:24 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> I might not be understanding you correctly. Do you mean to suggest
> that removing simd_relax() actually harms performance now? That having
> it in there helps performance?

Actually no, after your message I swapped kernels again to recheck, and nope,
now the one with simd_relax removed appears faster a bit as it should be (by
about 5%).

Perhaps it was something else, maybe my test bench is not ideal: both
"dual-core" VMs run on the same 8-core FX-8350, which has some of its cores
coupled to share resources, so at the scheduler's whim VMs can probably affect
each other. (Will try further tests with affinity pinning).

-- 
With respect,
Roman
