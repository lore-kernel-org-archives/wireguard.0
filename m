Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58f6a054
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 21:36:36 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9qJW8JTP9b+A9-roxtvGwur0KWmhyo=h+fvhdg+LwzX-Q@mail.gmail.com>
References: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
 <CAHmME9qJW8JTP9b+A9-roxtvGwur0KWmhyo=h+fvhdg+LwzX-Q@mail.gmail.com>
Date: Sat, 02 Jul 2016 17:39:41 -0400
Message-ID: <87zipzyb1e.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] use runtime check for getrandom syscall
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat 2016-07-02 16:10:42 -0400, Jason A. Donenfeld wrote:

> WireGuard supports kernels ≥4.1. getrandom was added in 3.17. So, all
> kernels on which wg is useful support getrandom.

Sure, but in that case why bother with the compile-time check at all,
and why not just use getrandom(2) directly instead of syscall(2)?

It's also possible to generate machine configs (with wg) on a machine
that doesn't plan to run it (e.g., if you're deploying psk's through a
configuration-management system).

With the patch, wg should just work on any of these systems.

   --dkg
