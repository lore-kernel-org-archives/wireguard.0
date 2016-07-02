Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6624db9f
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 23:24:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb37ac2b
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 23:24:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c8acae0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 23:24:09 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id h129so97544344lfh.1
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jul 2016 16:27:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zipzyb1e.fsf@alice.fifthhorseman.net>
References: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
 <CAHmME9qJW8JTP9b+A9-roxtvGwur0KWmhyo=h+fvhdg+LwzX-Q@mail.gmail.com>
 <87zipzyb1e.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 01:27:14 +0200
Message-ID: <CAHmME9q0fVxOq5JNy9da8vJ7cid3FzQueS9+pRCB-1TdA8+y5A@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
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

On Sat, Jul 2, 2016 at 11:39 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> Sure, but in that case why bother with the compile-time check at all,
> and why not just use getrandom(2) directly instead of syscall(2)?

So that it compiles on more platforms and I don't have to include the
syscall number myself.

> It's also possible to generate machine configs (with wg) on a machine
> that doesn't plan to run it (e.g., if you're deploying psk's through a
> configuration-management system).

That's a good point.

>
> With the patch, wg should just work on any of these systems.

You're right. Also, wg(8) is going to eventually handle the userspace
implementations with the exact same interface [1].

I'll reconsider this and look at it tomorrow or this week.

[1] https://www.wireguard.io/xplatform/
