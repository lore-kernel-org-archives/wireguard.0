Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba247b79
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 21:15:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d94d7345
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 21:15:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cc8f5b1
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 21:15:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id af049f15
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 21:15:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f82so187778764wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 13:20:45 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Dec 2016 22:20:43 +0100
Message-ID: <CAHmME9pEq1weLxpOC1c0_nFcO9pmJRtTQ3=H8Hh8AtZyhamqpw@mail.gmail.com>
Subject: Ephemeral key lifetime & system sleep
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

As you know, WireGuard provides perfect forward secrecy, otherwise
known as key erasure, by zeroing out old keys in ram, and constantly
rotating in new keys. It keeps, at most, the current, the previous,
and the next key in ram, and for no more than a handful of minutes for
the oldest possible key. It accomplishes this by using the kernel's
timer_list structure, which is sufficiently lightweight and high
performance.

It does not, however, keep track of time during system suspend. This
means that if you put your computer to sleep for an hour, when you
wake it up, it will still be some amount of time before all old keys
are zeroed.

I could add the book keeping to make the key lifetime work across
suspend. The programming isn't that hard. If I did this, the resultant
behavior would be that when you wake up your computer, all keys will
be zeroed if the clock time has elapsed, and otherwise the the timer
will simply be updated to trigger at the correct suspend-adjusted
time.

But I was thinking that instead of this, maybe it'd be simpler and
even more desirable to simply *always wipe all keys immediately
/before/ system suspend*. This would have the desirable property of
preventing ephemeral key recovery from physical access to the ram or
CPU of a suspended system, or attacks against modified SMM handlers
pilfering data during resume just before handing control back to the
kernel. Is this desirable? Is it absurd?

The downside is that if you put your computer to sleep for just a
couple of seconds, when it comes back up, the [mostly invisible
anyway] 1-RTT handshake must occur again, and you won't be able to
decrypt any packets that were sent to you before going to sleep and
arrived after resuming.

The upside is the tinfoil hat security properties outlined above.

Thoughts on this?

Thanks,
Jason
