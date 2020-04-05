Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD329C2BA17
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 23:44:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6394B2054F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 23:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dm7IlXja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6394B2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8253fe7b;
	Sun, 5 Apr 2020 23:35:51 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [2a00:1450:4864:20::141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d2ee42f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 23:35:48 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q5so10338069lfb.13
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 16:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=P11cYDL7ZDOvtQ3OoePa6LLVHxbXe1AkcbFgzT7Klk0=;
 b=Dm7IlXjaKbxGvFV0zZHcaJ5n3fb3YaXhuA5T5HGnZ/3b88CKJ5r2Gq6lJANvWg/lHM
 4h0BBjn+Hue/eYfg/2/JY2C2o6uu0G40Z/UfabbGPMnIJ6NU7Fk7zP41eZ4E8zyRKjKC
 jRj0RF3fDc7t625Q3Mz5mzOLY7cStSpQY2guWJP9v0nLh43CIl5l0obLdx7NpKGfDuJg
 6PlArsVCc/f2MXmP8zybd5Y38LWP/p7IYNnWZarkkva+wK4kq0RZ15ZoJqZh77HBqsyP
 Cv7uzgrxMYAWUqdImY+jg8GrKPEaWHtwNdRBvxyYXDMv9dHt3G9+yix4hn3qWG2+fdBs
 Q9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P11cYDL7ZDOvtQ3OoePa6LLVHxbXe1AkcbFgzT7Klk0=;
 b=N+oj3MH4FaLrQlp4nPn4Ds6nAULd2RcDGi/gAeGw6DTl6IUsivlojiha0W5xsjdAvd
 /p5rsHLIdzffB1uxFXvTahjJQPKmz70tyoUJ65NzeME9ENs8j9vhg+95Zu67ZT8ZJAVh
 n3cjMxr7Jlw5mL6pMdpq5rjfk6jYgMyiU40bYyMBZuXhFD5alqTULnBFkNiSAb2tsPpd
 o0YvfFC5ZnzW3gTDea6kOLp1Rpp8eKfqimxLrmXJ+pegNZaUXdMbXgXmEb4DgBbe46cR
 WhKEezE6cwekjgTMugKXCXgeS9uaenDhO+4NKKLJzzpJrbav9unyg7ZgWE6emubKjF/C
 8bsA==
X-Gm-Message-State: AGi0PuZHmu3y3hAmiz4vOpklAvxraaOnuiiBdVdY5DbcJ0NRPpEDpXqb
 LmfP1dGiVhTb5SAFygiTDoY9WHwsHseEDdgeWErvYTY/mDs=
X-Google-Smtp-Source: APiQypJiBr/CVVypBQc4xOWAI17w+ixFQUiMLcjBMUJuBlrM/Kx4YcG9NVWzT+PGERgVERug6d9EGgf3KrNftAirlNk=
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr11818428lfd.110.1586130270490; 
 Sun, 05 Apr 2020 16:44:30 -0700 (PDT)
MIME-Version: 1.0
From: Reid Rankin <reidrankin@gmail.com>
Date: Sun, 5 Apr 2020 19:43:54 -0400
Message-ID: <CAMaqUZ2i+LFg8wreOr=H1gB5ocw9+N5uacsZukcjEx6xNrbdkQ@mail.gmail.com>
Subject: Thoughts on wg-dynamic
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I've been thinking about wg-dynamic -- or something quite like it -- a
lot in recent months, and I've had some ideas I think are worth
sharing even though I haven't figured out an ideal final form for them
yet.

Just to let you know where I'm coming from (and to add to the
community gestalt of potential usecases), I've been working on a
stateless WG-based mesh networking system where each node has only
read-only storage. In my application the network is in fact statically
configured -- but none of the nodes knows this configuration on boot.
Instead, the configuration is distributed dynamically and
signature-checked. For this purpose, I've been working on a
configuration protocol that seems more and more like I'm duplicating
effort with wg-dynamic, so I want to share my thoughts so far and
hopefully end up making the upstream project better. (I do realize
that wg-dynamic doesn't have signature support as a design goal, but
good protocols are extensible and I only need 32 bytes of space in
some sort of "vendor option".)

On to the fun stuff. First, I came up with the idea to run the
configuration protocol using IPv6 link-local addresses. I see that
wg-dynamic is doing the same thing, and independent engineers coming
up with the same design is usually a good sign that it's the right
fit. However, I've taken it one step further, by using
cryptographically-generated addresses; each peer automatically gets
fe80:(truncated hash of pubkey)/128 stuck in its allowed IP list. (I'm
considering harmonizing this address generation algorithm with RFC3972
in the future.) This means that initiating the protocol requires no
configuration other than the public key of the peer you'd like to
contact.

The current use of fe80::/128 as a magic address for the wg-dynamic
server brings up an important distinction between my usecase and the
current goals of wg-dynamic, and I think it might be a
significant-enough distinction to warrant changing its direction
slightly. Specifically, wg-dynamic is currently designed as a
centralized system -- nodes are not peers, because one must be in
charge of assigning IPs. I believe that my application, where each
peer knows the correct (signed) IP assignment for each other peer but
none are responsible for issuing new assignments, demonstrates that
the concerns of assigning configurations and distributing that
configuration information are fundamenally separate.

I beleive that the CGA-based approach would be more appropriate for
wg-dynamic as a whole, because it would fit better with WG's own
decentralized design, enable interesting new use cases, and simplify
configuration. Obviously it's important to specify which peers you to
trust to assign addresses -- I suggest that centralized, non-PKI-based
systems retain the "magic" address for an implicitly trusted central
server, which would use both its link-local CGA and fe80::/128. Still,
this would eliminate the chicken-and-egg problem, where some mechanism
would be needed to assign link-local IPs to each client before they
could communicate with the server to get their "real" IP assignment.
(I also suspect that if the current system were deployed as-is, many
operators would just roll their own hash-based IP allocation system
instead of maintaining some sort of database of assignments, and fewer
knobs is better when there's a sensible default and nothing to be
gained but incompatibility by tweaking it.)

Secondly, wg-dynamic needs a reliable transport to use at layer 4, but
I don't think it should be TCP. Wireguard itself is a tiny,
lightweight protocol -- one implementable on a microcontroller, if you
so desire -- but TCP is only available because it's built into kernels
everywhere, and while those implementations are battle-tested at this
point there's been a rich history of bugs in TCP stacks before the
kinks got worked out. I believe that it's important that whatever the
final form of wg-dynamic it should not preclude a completely
self-contained implementation -- say, in userspace, or on a
microcontroller. There's been plenty of work courtesy of the IDS and
DPI crowd towards reassembling TCP streams in userland, but there
aren't many full userland TCP stacks -- and the ones that are there I
wouldn't trust.

Therefore, I suggest TFTP as a transport. (No, seriously.) TFTP has
many things going for it in this application: it has simple,
well-understood state machine which can be implemented securely in a
mostly-stateless timer-driven fashion (sound familiar?), it can return
short blocks of data in only a single RTT (which TCP can't), and it's
got existing tooling that would be useful for
prototyping/experimentation/whatever. Essentially, it's got everything
you need and nothing you don't, and running it inside a WG tunnel gets
you all the security features the protocol lacks intrinsically.

TFTP is also symmetric -- there's not a huge distinction between a
server and a client, and data can be pulled or pushed as needed. A
traditional DHCP-style configuration request or renewal could be
modelled by a client requesting a magically-named "file"; a server
could send an updated configuration by pushing the same file instead,
reducing the need to rely on short lease times in networks whose
configurations (read: routes) change frequently.

TFTP is also extensible. A number of useful options already exist --
for example, one to set the block size of a transfer to take advantage
of the full MTU available, and another that provides windowed
transmission and acknowledgement and can provide throughput comparable
to TCP in many cases. And while TFTP is inherently a one-way protocol,
it's easy to add support for a request/response paradigm. (I've got a
prototype of this; the client sends a request and includes an option
requesting a response, which the server fills in with a magical file
name the client can request to retrieve said response. All simple
state-machine-based stuff.)

What I haven't solved yet -- and the reason I've delayed until now to
write this up and share it -- is all the stuff above layer 4. In my
prototype system, I use a userland daemon with access to the WG
private key to intercept incoming WG handshake requests, decrypt the
public key of the initiator, and add each new initiator as a peer with
one of these link-local CGAs before delivering the handshake packet.
(This increases my risk of DoS somewhat, but that's acceptable in my
application.) I then can use TFTP to transfer data between hosts, but
I think I've gotten too caught up in the specifics of my own
application (verifying signatures, creation and distribution of signed
config blobs, etc).

I'm hoping that by taking a step back and treating the problem as one
of developing a generic, extensible in-band configuration scheme the
natural form of a solution to that problem will emerge, and I can
build all my other fancy crap on top of it. I think link-local CGAs
and TFTP are elegant solutions, but I really need a higher-level
protocol to build my fancy stuff on top of -- which means I need
wg-dynamic. And I don't just need it to be an idea, I need it to be a
tiny, elegant, documented protocol.

So I want to get involved. Let's talk about architecture, get some
consensus, do some documentation. Let's build an MVP for Linux, but
also for Go and Rust. I'm game for all of it -- somebody hit me up and
let me know how I can help.

--Reid
