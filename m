Return-Path: bjin1990@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ca04262
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 11:27:47 +0000 (UTC)
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
 [209.85.220.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39529090
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 11:27:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id j127so34215933qke.0
 for <wireguard@lists.zx2c4.com>; Sun, 12 Mar 2017 04:30:58 -0700 (PDT)
MIME-Version: 1.0
Sender: bjin1990@gmail.com
From: Bin Jin <bjin@ctrl-d.org>
Date: Sun, 12 Mar 2017 19:30:37 +0800
Message-ID: <CAHQn_MBhXceiPSvEu3KweOjcjxzP1ULyC4kCgZAH+WZZwCsHDA@mail.gmail.com>
Subject: nara: a prototype of userspace WireGuard implementation in Haskell
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: John Galt <jgalt@centromere.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Jason and list,

Over the last few weekends, I have been working on a WireGuard
implementation with Haskell, and made some progress to reach a somehow
usable prototype. While there is still much to be done, I think now
it's time to get it tested by wider public and gather
feedbacks/opinions.

You can find the repo at github[1]. For now, "nara" is just the
codename I choose for this prototype. If it ever gets mature enough
(mostly regarding code quality and performance), I would be very happy
to rename and maintain it as official reference userspace
implementation.

The haskell stack[2] tool is required for building, currently only
Linux and macOS is supported. The official "wg" tool is used for
configuration, see [3].

For the implementation detail. Haskell STM is used heavily to maintain
a consistent global state in concurrent environment, while a fixed
number of threads is used to handle packets (from both UDP socket and
TUN device) on a per packet basis. For the management of lifetime of
handshakes/sessions, a heartbeat-based mechanism is used (instead of
timer-based) for now.

# What's been implemented/tested?

Basically the essential part of protocol. Should be enough to use it
as a client for normal traffic.

* Handshake initiated by both side. Handshake retry. Session key
renewal and expiring.
* Roaming support and Cryptokey Routing should be working, but they
haven't been thoroughly tested.
* Limited IPv6 support (just as tunnelled packet)
* uapi interface to interact with "wg"
* A simple packet queue for buffering
* Daemonize and signal handling

# What's to be done?

* Documents and test coverage
* Receiver side nonce deduplicate
* Logging and better exceptions handling
* Cookie support to prevent DDOS attack
* Full IPv6 support.
* An accurate timer based approach to manage lifetimes.
* Send ICMP packets back in case of unreachable hosts
* Persistent-keepalive
* Per-host packet queue
* Benchmark, and performance improvement
* FreeBSD support (it might be easy but I currently don't have the
setup to test it)

Due to a few missing features, it's not advised to run nara on the
server side. As for normal client usage, while I think currently nara
is stable enough and meet basic security requirements. It might still
be possible to block for some random time if handshake fails. The
Haskell runtime makes no guarantee to have heartbeat triggered
accurately and reliably, at least as I know of. So don't blame me if
it drops or blocks your traffic.

@Jason The tests I have performed so far is mostly done manually. The
netns test from the original implementation, as I understand, only
covers the normal codepath. Is there anything you know that test the
behavior of implementation (handshake retry, keepalive packets) and
detection of malicious packets (handshake replay, unknown peer,
mismatched ip range, expired session key)?

Finally I would like to thank John Galt for the "cacophony" library
and Peter Wu for his Wireshark plugins. Those saved me a lot of time.

Thanks all

Bin

[1]: https://github.com/bjin/nara
[2]: https://www.haskellstack.org/
[3]: https://www.wireguard.io/xplatform/
