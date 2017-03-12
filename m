Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a2fc337
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 16:47:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f16d5c0
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 16:47:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac2cd247
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 16:47:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0f5835ff
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 16:47:00 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id 19so101299473oti.0
 for <wireguard@lists.zx2c4.com>; Sun, 12 Mar 2017 09:50:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHQn_MBhXceiPSvEu3KweOjcjxzP1ULyC4kCgZAH+WZZwCsHDA@mail.gmail.com>
References: <CAHQn_MBhXceiPSvEu3KweOjcjxzP1ULyC4kCgZAH+WZZwCsHDA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Mar 2017 09:50:12 -0700
Message-ID: <CAHmME9r9Rm5D4=AiGYbxzXPYGACAYQFiCzH-eyGv_0geik+T4w@mail.gmail.com>
Subject: Re: nara: a prototype of userspace WireGuard implementation in Haskell
To: Bin Jin <bjin@ctrl-d.org>
Content-Type: text/plain; charset=UTF-8
Cc: John Galt <jgalt@centromere.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Bin Jin,

This is wonderful work! Thank you so much for doing it. I'm currently
traveling, but when I'm back at my desk at the end of next week, I'll
spend a considerable amount of time reviewing this entire project.

The biggest thing to focus on is compatibility of algorithms, so that
all implementations stay in sync and have the same security
properties. I'll manually verify this, and I'll also publish some more
detailed information to help implementations do things with precision.
Due to the fact that several algorithms and features of this are _not_
implemented, to users I would not yet recommend anyone using this, for
either client or server. However, because it looks like you're
developing very fast and fluidly, I'm sure this will eventually mature
to a feature complete and secure implementation. This is certainly
extremely exciting.

Thanks again, and expect to hear from me soon with code review.

Regards,
Jason

On Sun, Mar 12, 2017 at 4:30 AM, Bin Jin <bjin@ctrl-d.org> wrote:
> Hello Jason and list,
>
> Over the last few weekends, I have been working on a WireGuard
> implementation with Haskell, and made some progress to reach a somehow
> usable prototype. While there is still much to be done, I think now
> it's time to get it tested by wider public and gather
> feedbacks/opinions.
>
> You can find the repo at github[1]. For now, "nara" is just the
> codename I choose for this prototype. If it ever gets mature enough
> (mostly regarding code quality and performance), I would be very happy
> to rename and maintain it as official reference userspace
> implementation.
>
> The haskell stack[2] tool is required for building, currently only
> Linux and macOS is supported. The official "wg" tool is used for
> configuration, see [3].
>
> For the implementation detail. Haskell STM is used heavily to maintain
> a consistent global state in concurrent environment, while a fixed
> number of threads is used to handle packets (from both UDP socket and
> TUN device) on a per packet basis. For the management of lifetime of
> handshakes/sessions, a heartbeat-based mechanism is used (instead of
> timer-based) for now.
>
> # What's been implemented/tested?
>
> Basically the essential part of protocol. Should be enough to use it
> as a client for normal traffic.
>
> * Handshake initiated by both side. Handshake retry. Session key
> renewal and expiring.
> * Roaming support and Cryptokey Routing should be working, but they
> haven't been thoroughly tested.
> * Limited IPv6 support (just as tunnelled packet)
> * uapi interface to interact with "wg"
> * A simple packet queue for buffering
> * Daemonize and signal handling
>
> # What's to be done?
>
> * Documents and test coverage
> * Receiver side nonce deduplicate
> * Logging and better exceptions handling
> * Cookie support to prevent DDOS attack
> * Full IPv6 support.
> * An accurate timer based approach to manage lifetimes.
> * Send ICMP packets back in case of unreachable hosts
> * Persistent-keepalive
> * Per-host packet queue
> * Benchmark, and performance improvement
> * FreeBSD support (it might be easy but I currently don't have the
> setup to test it)
>
> Due to a few missing features, it's not advised to run nara on the
> server side. As for normal client usage, while I think currently nara
> is stable enough and meet basic security requirements. It might still
> be possible to block for some random time if handshake fails. The
> Haskell runtime makes no guarantee to have heartbeat triggered
> accurately and reliably, at least as I know of. So don't blame me if
> it drops or blocks your traffic.
>
> @Jason The tests I have performed so far is mostly done manually. The
> netns test from the original implementation, as I understand, only
> covers the normal codepath. Is there anything you know that test the
> behavior of implementation (handshake retry, keepalive packets) and
> detection of malicious packets (handshake replay, unknown peer,
> mismatched ip range, expired session key)?
>
> Finally I would like to thank John Galt for the "cacophony" library
> and Peter Wu for his Wireshark plugins. Those saved me a lot of time.
>
> Thanks all
>
> Bin
>
> [1]: https://github.com/bjin/nara
> [2]: https://www.haskellstack.org/
> [3]: https://www.wireguard.io/xplatform/
