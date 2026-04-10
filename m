Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F55CF45A0B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 Apr 2026 02:02:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 45bfe8f4;
	Sat, 11 Apr 2026 02:02:34 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 648b8ded
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2026 16:28:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-59e4989dacdso3439899e87.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 09:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775838494; cv=none;
 d=google.com; s=arc-20240605;
 b=GAuhNc3BTqIHVp2x2VLkKicZbaFEfoN3n2HnGs4EKtC1WQJ6/XfunPdxnVgLq8+1+t
 kDKDs8PQ8R8RO5VnIrD72BbHnIIYDSdrIMvUCr4shFalUhcyqoh3E3XMzhXdJR8cHmj7
 ulcdl2y42rW5NcH9muj3XzK2rKEWhFLczLmtYVdKMaNmBEMfMso7HmarNZrneK1Lhoao
 5pt42DIk1xVD7UxDaHsobjXAvABJTA9A/i8jUwofNFtplnNODYoWpdSPwOlJtBNgQcQH
 mgcWMwLn0EOt+CNrPi+LVHf+daHLu4r+PJay9uLwBTaz8FpmIburILHyhUlJZbYbaZQn
 CaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=O5wq1benxs5smqgY1ToMURNoH9zV18y9ybEPnCj0mWk=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=EdT+8RzZNpyEYgzOMddTbRFBSQQD4kJs9E17xaesV3hSzL16l3DM1hpLhJfwzboNrq
 Tmf53zWnz+rHTV/6xXW9PzV2Q+9/x4kOq3oMBBYPggfm8nsa2z25dt9XbE6SnLHAUI6u
 M1mG6RzbCTIpAbzDrZ0WVpjUzWzG/14Wy/qXxKeOdqrkjvPYGMmtIwuDKXAwfpPJWKSe
 tAy/4faCTBbGEQbLwNC3s69DkfYWH1v2XvY+LKVzHNVjGpWxUp7ZCnY5xu7LvYJ65w3D
 5v6ViVmQeFEMp7C+tEt1dUFUisyX9pS+peGoNnOURozGtYM2Py3v6Pd9Rh2toMfAaFMB
 4aRg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkk.net.ru; s=google; t=1775838494; x=1776443294; darn=lists.zx2c4.com;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O5wq1benxs5smqgY1ToMURNoH9zV18y9ybEPnCj0mWk=;
 b=O+sAtwLlhjIdMbuwt6BLbSZEjgiWAOKAo4ie5bvYlcjAYo0OWqTCUaeuaq1n059J27
 ciXS1VcRs+xHIhpxBB5/gXXSbCEGL79l2V0LYZpQ0pdzY74DgyT/4ecm4g51ek06RmB9
 T8ruxLLUmJTwZ4B/lUFDfmXYpzExwpQWBZXJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775838494; x=1776443294;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5wq1benxs5smqgY1ToMURNoH9zV18y9ybEPnCj0mWk=;
 b=Lwxztry3+3YWNFK+7jttmi8g7W7xUEfAtyp7/7xJUolWpLh2pvB/Lo7uYUQNPOrom4
 zTpAmJ/gvJWArRK80/GHxBDNvpM6yrh3KSTXAgfId/ZeAz4W/izJIDC/N/nETkJZEuXM
 bpgLY1kc+n4gm4A0KhCFrfv0+wQFxvm6pKrNZXQFMjlI90ReuSnKUHjilQuI2S/D1tIs
 AHE2BMMmDS6C+Q0XJ1sbEG3nHmn8DfJkVd/lUITDtamwIglvSXU//yPYfpwmmK+hrfIf
 9YOa6imJkZIaqhIahQOxRqIN4BCMRvztgpulDnz8+RR7iAi9pxNUIlcUu+Edp8L6ye7M
 GYIg==
X-Gm-Message-State: AOJu0Yzl+jPXon/16+7DpiVhVTLjuSy/2VJjZ7EOIU3iCU6c8XRukFZM
 YAFDKuZ95k/gMkqDRc3t7KIIBmJU9sN+VZyD7xaXKfutjkA2vWwT/oO6av22/3EsZUz2nAvaMd7
 Vl+fQxpWuxUKzZEO4tPCxdeNuIrP9MDO+qJr2ccXE7tOmI3tF8RH8OEjoVbw=
X-Gm-Gg: AeBDieuG4LNAlAhC0a6WbxDQovRo9E7l+oiis824+FVe2XRu6WjHUFoipSEB1iILCkT
 4++laCz41Bfd/hP4oHXC7oFrPCoD0vZugFvDe0xjCtndBE9bHO5AP5Tbrm93+XZfXBOw2t5haNB
 hP3yqdZewnUM8wEv/R6KP0iecEVc0S4biubi4HXa7D8uQ7rjP9qqG8y1UIC7QiBn+0I1elsxbqr
 /2imlcjHsF4vpmnevcP+o5Am0eWVAXBzSOKk36eYcei0s8AUbhnQC/eSuEvLAfKMpeANjaZGsQW
 W4Deujk=
X-Received: by 2002:a05:6512:6d2:b0:5a3:e5d1:d11d with SMTP id
 2adb3069b0e04-5a3efd92080mr1453037e87.39.1775838493877; Fri, 10 Apr 2026
 09:28:13 -0700 (PDT)
MIME-Version: 1.0
From: Leonid Evdokimov <leon@darkk.net.ru>
Date: Fri, 10 Apr 2026 19:28:00 +0300
X-Gm-Features: AQROBzCfpxin84uL9pJvkqg51sSgo9rRz1meBXj85HTwenCbbHXJDC3c_Aqr9cQ
Message-ID: <CAB-U=tBRwE+CkfF4XF1C9yiYLRLzHQsnXdEeVR=bs9jqCAwwYw@mail.gmail.com>
Subject: WireGuard obfuscation & active probing: staying virtuous under
 pressure
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 11 Apr 2026 02:02:32 +0000
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

Hi list,

I want to share an experiment on active probing of WireGuard.

Observation: a relatively small burst of replayed handshake packets can
reliably force WireGuard into "Under Load" mode for ~1 second. During
this period, WireGuard responds to all handshake attempts (including
replays) with Cookie messages.

Summary
=3D=3D=3D=3D=3D=3D=3D

This does not break WireGuard itself, but it appears to affect most
WireGuard-specific obfuscation layers I've looked at (xt_wgobfs,
evrim-patch, swgp-go, ClusterM/wg-obfuscator, AmneziaWG, Mullvad's LWO,
gutd).

This distinguisher does not give censors absolute confidence. However,
Frolov, Wampler and Wustrow have demonstrated a conceptually similar
timeout-based distinguisher for TCP-based Probe-resistant Proxies at
NDSS'20. This jar of Cookies seems to be in good company.

Active probing is a well-known and realistic threat for an obfuscated
protocol. E.g. Russia used it against Telegram proxies back in 2018
and still uses it in 2026. Same story with China and Shadowsocks. Iran?
You name it.

I'm describing the attack, exploring possible mitigations for in-tree
and out-of-tree obfuscators, propose an alternative DoS mitigation based
on TOTP-like identity, and speculate about some ideas to make WireGuard
implementations more obfuscation-friendly.

The rest of the letter may take =E2=89=8820 minutes to read. I'm sorry for =
it being
that wordy yet I hope I've managed to structure it in a readable way.

I don't consider the mitigation complete and would appreciate feedback
on its feasibility and alternatives.


Set and setting
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A common design for WireGuard obfuscation is to run a fully encrypted
protocol on top of WireGuard, optionally with additional disguise.
This aligns with the "turn the stream into noise" approach Jason
mentioned in the "Let's talk about obfuscation again" thread at
https://lists.zx2c4.com/pipermail/wireguard/2018-September/003295.html

Such obfuscators typically rely on a long-term obfuscation key (OBFSK),
exchanged out of band and used for symmetric encryption (weaker
constructions are used as well). In practice, OBFSK is often shared
across a clique of peers, partly because Cookie messages are sent before
peer identity is known.

The obfuscated WireGuard fights two distinct attackers with different
goals & capabilities:

"Censor": observes traffic and can replay it, but does not know OBFSK.
Censor wants to reveal an obfuscated WireGuard endpoint.

"DoSer": may know OBFSK and responder.static_public, and may be
a legitimate peer capable of generating arbitrary handshake initiations.
DoSer is a malicious competitor and/or user wanting to disrupt service.

Encryption of cleartext, authentication of padding and shaping noise
into a stream of plausible packets is out of scope of this letter.
This Cookie jar already gets too big on its own.


Cookies as distinguisher
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

An active prober can replay captured handshake packets to force
WireGuard to talk, triggering =E2=80=9CUnder Load=E2=80=9D mode. Once trigg=
ered,
WireGuard replies with Cookie messages to any handshake with valid mac1,
including replays(!).

Two properties make this useful as a distinguisher:
- the transition is easy to trigger with a short burst
- the "Under Load" state persists for ~1 second (Go and Linux)

I have not rigorously compared this behavior against other UDP services
under similar load, but I assume it is sufficiently distinctive.

WireGuard-Go starts sending Cookies after ~128 queued handshakes (1/8 of
default queue size 1024), Linux kernel implementation uses a queue of
4096, so the threshold is ~512.

One way to trigger "Under Load" is to send a paced "train" of handshakes
with a low interpacket gap. It works surprisingly well both in LAN and
over the Internet. The numbers I got are summarized in the table below.

WireGuard under test | Train | Train rate | Steady rate | RTT
-----------------------+-------+------------------+ ------------+-------
Core i7-6600U x2, Go | 200 | 35k pps, 59 Mbit | 12,000 pps | LAN
MikroTik RB951G-2HnD | 750 | 35k pps, 59 Mbit | 640 pps | LAN
Celeron J1900, FreeBSD | 550 | 50k pps, 84 Mbit | ? | 3 ms
UpCloud VM, EPYC 7543 | 700 | 50k pps, 84 Mbit | ? | 14 ms
Amnezia-1.5, kmod-awg | 2000 | 50k pps, 84 Mbit | ? | 47 ms


Experiment details
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Celeron machine was located in the same city as the load generator
(Russia, St.Petersburg), but within a different ISP. UpCloud VM was
in a nearby country (Sweden). AmneziaWG box was "far away" in Western
Europe.

The train speed is expressed with packet rate instead of interpacket gap
as that's what MikroTik Traffic Generator sets. RB3011UiAS-RM was used
as a load generator for the experiments. Some installations might need
other tools as RouterOS limits /tool/traffic-generator header length
to 256 bytes. E.g., AmneziaWG adding more than 66 bytes of padding
can't be tested with it. Unfortunately, pktgen in mainline Linux had
some issues with custom payloads, that's why RouterOS was used.

While 2000 packets might sound like a lot, it's just 350 KiB of traffic.
It's an unnoticeable volume of traffic for a VPN hub and/or "exit node".
It is an inexpensive amount of traffic for a modern active prober.
It's in the same ballpark as The Guardian index page (gziped)
being 150 KiB, as measured without additional css/js/img assets.

More boring way to fill the queue is to saturate the worker thread
doing handshake processing. Running Device.ConsumeMessageInitiation
takes 0.13 ms on Intel Core i7-6600U. Thus, this CPU is expected
to handle at most ~7700 pps of handshakes per core. That correlates
well with the numbers above.


Mitigation challenges
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Mitigating active probing at the obfuscation layer is possible,
but significantly harder out-of-tree than in-tree:

- The obfuscator needs to preserve SrcIP for WireGuard's rate limiting.
- Forwarding Cookies preserves DoS protection but exposes a probing
signal.
- Dropping Cookies removes the distinguisher but breaks legitimate
handshakes under load (clients cannot compute mac2).
- Peer identity is not available before WireGuard processes the packet.

Handling Cookies in the obfuscator requires:
- tracking mac1
- decrypting per-IP Cookies
- maintaining per-endpoint state to update mac2

Details below.

Lacking SrcIP preservation collapses all traffic to an external
IP of the obfuscator, typically 127.0.0.1. Number of handshakes
with valid mac2 is rate-limited to 20pps Under Load. Thus, DoSer
scheduling a handshake "train" every 1s gets DoS for all users.

It's possible to limit the number of in-flight handshake_initiation packets
between obfuscation and WireGuard layers to avoid Cookie response being
triggered. It's a poor-man mitigation: it protects against burst-based
probing, but the undersized queue does not protect from DoS.
More on that below.

Naive drop of Cookies at the obfuscation layer opens WireGuard layer
to the following DoS attack: as soon as Under Load condition
is triggered, WireGuard layer would demand mac2 and all(!) the clients
will be unable to progress with handshake till Under Load is gone
as they can't compute mac2. Go and Linux versions stay in Under Load
state for one second.

Fighting "censor" alone is relatively easy. E.g. add coarse UTC
timestamps, limit handshake validity to =E2=89=8830 seconds, keep some
fixed-size replay filter (e.g. a Bloom filter of a size depending
on a number of configured peers), and that should be enough.

DoSer is a different beast. I suggest using temporary Peer Identity
to fight DoSer in absence of Cookies.


TOTP-based DoS mitigation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Adding clocked Peer ID (ClkID) to an obfuscation-layer envelope
effectively introduces a temporary, TOTP-like, pre-DH identifier.
It trades some of WireGuard's identity-hiding properties for earlier
filtering.

Responder being Under Load may use ClkID for quick drop of invalid
ClkIDs and as a rate-limit key instead of (isMac2Valid, SrcIP)
condition.

ClkID might be HASH(LABEL_CLKID || Epoch || initiator.static_public
  || responder.static_public || p2p.PSK)

Epoch might be int(UTC.Seconds / 120); 120 comes from RekeyAfterTime
and Cookie lifetime. It's worth investigating if 128 saves a measurable
amount of CPU cycles: cloudflare/boringtun Cookie emitter assumes it's
worth it.

Am I right that ClkID does not worsen Identity-hiding properties
if we factor UDP metadata in?

ClkID is essentially a one-time ID under normal conditions and it's only
reused for retries within a 2min interval. The latter implies that ClkID
has to be encrypted by an obfuscator, but that's out of scope of this
writeup.

ClkID opens the possibility for a powerful attacker mounting targeted DoS
against a specific user via rate-limiting at the obfuscation layer.
That needs knowledge of semi-public receiver.OBFSK paired with
capability to observe obfuscated traffic. DoSer knows OBFSK but can't
listen traffic, and censor does not know OBFSK otherwise the obfuscation
game is already lost.

ClkID demands PSK to be unique for each pair of connected WireGuard
interfaces to avoid DoS through impersonation within the clique
of peers. That's one common setup, but default WireGuard also has
PSK=3D0^256. I've observed one large deployment reusing non-zero PSKs
across a clique of users. Initiator's and Responder.static_public
are mixed into ClkID to make deployment of these kind "working",
but "insecure" against malicious clique members. "Working" as in
"not suffering from an extra rate-limit imposed by shooting themselves
in the foot". Lack of that mixin will lead to violation of principle
of least astonishment as adding few more peers to such a deployment
may lead to unexpected handshake drops within the mesh.

The price responder pays to support ClkID-based dispatch is computation
of Blake2s-256 for each configured peer every two minutes. That's =E2=89=88=
300ms
spent every 2min for (1 << 20) peers on a Skylake Intel Core i7-6600U.
It's close to 0.25% of a single CPU core time, it does not sound
prohibitive for an obfuscated protocol. That still has few open
problems: thundering herd; CPU usage penalty for an completely idle
interface; CPU usage penalty for an interface with low number of active
peers & high number of peers configured.

I would appreciate feedback whether the proposed ClkID approach is a
reasonable direction, or if there are simpler alternatives I am missing.


WireGuard & identity
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Identity-hiding property of the WireGuard handshake makes it non-trivial
to rate-limit based on the initiator's identity as the identity is unsealed
only after DH and that's exactly the CPU-consuming operation.

However, identity-hiding is not absolute in WireGuard:

E.g. observer knowing responder.static_public may passively confirm
the expected identity of a responder using mac1. They still have to see
the flow in both directions to use response as a confirmation (not
"proof"). But that's exactly how TSPU is to be deployed (TSPU is
Russian tsar-in-the-middle filtering equipment) and that's how jabber.ru
XMPP traffic was intercepted.

Assuming that censor is a bi-directional observer sounds plausible
to me for the purpose of threat modeling.

E.g. observer with responder.static_private key seized may decrypt
initiator.static_public.

E.g. observer may use receiver_index to keep track of user's network
location when the user is roaming from one IP to another.

So, if I understand WireGuard's identity-hiding correctly, the main goal
is to make two user's sessions non-linkable if the user is silent(!)
for an extended period of time AND connection metadata does not allow
for session linkage: e.g. user roams to another IP AND rotates
listen-port. IIUC, this extended period is =E2=89=883min of silence,
as RejectAfterTime states.

One may say that obfuscation slightly improves privacy of WireGuard
as it encrypts the WireGuard header. Now, as a client moves between
networks, a passive observer of both network paths will need OBFSK
to determine the fact that old and new IP addresses belong to the same
system using the unencrypted receiver_index of the packets. However,
listen-port on both sides often stays the same while one of the peers
is roaming, so anonymity set is still "all the users of the Endpoint
roaming at the same time".

NTP Client Data Minimization draft mentions similar problem at
https://datatracker.ietf.org/doc/html/draft-ietf-ntp-data-minimization-04#s=
ection-4.1


ClkID alternatives
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

SrcIP is a bad key for rate-limiting as IP ownership verification
becomes unreliable without Cookies. Established sessions might have
their SrcIP verified, but new ones are not. Roaming with session being
active transfers the ownership to the new IP, but roaming to the new
IP after two minutes of silence keeps SrcPort at most.

Active Queue Management combined with Proof-of-Work schemes like
hashcash is another way to make an attack more costly to DoSer, but they
come with their own drawbacks.

First, PoW penalises the legitimate user as well, especially under bad
network weather as we lose ability to distinguish handshake timeout due
to natural packet loss from the need to mint more zeroes & work harder.

Second, designing PoW schemes in the era of ASIC miners might be tricky.
E.g. Antminer KA3-166T mining Blake2s-256 produces 52,000 MH/W, GPU AMD
RX 6650 XT does 70 MH/W while Intel Core i7-6600U CPU does just 1 MH/W.


ClkID performance
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

When the responder is completely idle, it may put ClkID check after DH
and avoid spending time on regular re-computation of ClkIDs for all
configured peers.

When the responder is active and transits to Under Load it gets tricky.
On one hand, it will already take 17ms to do DH for these 128
handshakes. On another hand, these 17ms may be rather spent computing
=E2=89=8844,000 ClkIDs given the fact that Blake2s-256 takes ~340 less time
than DH. What's worse, the censor might try to use RTT as a signal
to distinguish VPN doing NAT from full-mesh Tailscale-like end-to-end
VPN and RTT bias "Under Load".

It's unclear to me if it's possible to have a unified ClkID behavior
suitable both for a smallish interface with 256 peers and for
WireGuardMaxxer with (1<<20) peers.

I don't know the quasi-optimal way to go. One might be to have several
"escalation" steps. Here are some back of the napkin calculations:

First one is being idle & doing nothing. Being idle is good
both for battery consumption and overall mental health.

Second one is an active interface with a TINY number of peers, e.g. =E2=89=
=88100
peers. 100 comes from Blake2s-256 being 340 times more computationally
expensive than one DH exchange and need to compute =C2=B1one Epoch. This
interface can compute ClkID in the Handshake thread and be just fine.

Third one is an active interface with OKAY number of peers, e.g.
under =E2=89=882'500. These interfaces have latency penalty less than 1ms
for computing the full ClkID table as the interface transitions to "Under
Load" state. OKAY value is not necessary a compile-time constant,
it might also be a runtime estimate to keep latency under 1ms depending
on something like LoadAverage value.

Fourth one is an active interface with a HUGE number of peers, something
between OKAY and MAX_PEERS_PER_DEVICE. These interfaces can't afford
to spend a few hundred milliseconds to process the next handshake while
transitioning to Under Load state, so they should refresh ClkID tables
in the background.


OBFSK scoping
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Handling Cookie messages at the obfuscator layer and dropping Cookie
messages from the on-the-wire part of the obfuscated protocol opens
a possibility to bind OBFSK to a listening port on ingress and
to an endpoint on egress instead of having the same key shared
among the whole clique.

Scoped OBFSK brings little value to typical setups. Peers in full-mesh
already know all OBFSK keys. All peers in hub-and-spoke share OBFSK
for the hub. However, scoped OBFSK aligns well with WireGuard agility
allowing other topologies.

Obfuscator handling Cookies on its own might set OBFSK to some F(peer),
e.g. defaulting to HASH(LABEL_OBFS || peer.static_public).

However, an out-of-tree obfuscator has to recover peer identity from
mac1 (or receiver_index), which is not directly available after packet
emission. This leads to cache-based or computationally expensive lookup
methods doing trial hashing over all known peers. Both methods are also
prone to ToC/ToU races.


DoS with undersized queue
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

First, it's tricky to make a robust estimator of in-flight handshakes
count. The obfuscator gets a handshake_response if the
handshake_initiation was handled, but it's challenging to distinguish
"handshake not yet handled" from "handshake dropped" cases.

The handshakes are not guaranteed to be handled in FIFO order,
e.g. WireGuard-Go starts a per-CPU RoutineHandshake worker.

Overestimating the number of in-flight handshakes lowers handshake
throughput available for "good" users. The DoSer knowing
responder.static_public might craft 512 different handshakes
with out-of-date encrypted_timestamp, send them and force the obfuscator
on the responder side into a hard choice. When should it be ready to relay
the next handshake of the legitimate user to the WireGuard layer given
the complete silence?

Underestimating the number of in-flight handshakes and putting WireGuard
backend Under Load leaves the obfuscator with a choice between plain DoS an=
d
computational DoS. Plain DoS may come from cookies being dropped by
obfuscator and legitimate users being unable to do handshakes for 1s.
Computational DoS comes from cookies being decrypted & used without
any IP validation.

If I do math correctly, sustaining a computational DoS against
a somewhat modern CPU still needs ~10 Mbit/s of handshakes per attacked
core. That's not a lot, but disabling the Cookie-based protection
in such a convoluted way does not sound too bad for certain setups.
Although, it's still suboptimal for a deployment of a scale of a sizable
VPN service provider.


WireGuard over Shadowsocks-2022
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

TL;DR: Too much crypto + deployment challenges.

Shadowsocks is a good solution against censor, but it strips 40 more
bytes from MTU and AEADs data twice: XChaCha20-Poly1305 of Shadowsocks +
ChaCha20-Poly1305 of WireGuard burning twice as much carbon credits.
Performance matters: e.g. Mullvad introduces LWO claiming performance
improvement over Shadowsocks.

WireGuard over Shadowsocks might drop SrcIP. This allows DoSer talking
to WireGuard through Shadowsocks to trigger rate-limiting of 127.0.0.1
(or other "external" IP address of the Shadowsocks daemon).

Common recipes on the web do nothing special about this threat. I expect
WireGuard-Go and Linux kernel implementations to drop handshakes
exceeding the 20pps limit and DoS legitimate users if Under Load is
triggered. Other implementations behave differently, more below.

IIUC, Shadowsocks deployments typically assume trusted PSK holders and
that's a weaker assumption than WireGuard's threat model. WireGuard
assumes peer being potentially malicious (e.g. limited to 50
INITIATIONS_PER_SECOND) and responder.static_public being known to an
attacker (attacker gets Cookies & juices at most 20 PACKETS_PER_SECOND
out of a single SrcIP they control).

The only major installation of Shadowsocks+WireGuard I know is Mullvad.
I assume, Mullvad uses Rust gotatun implementation, so I've chosen not
to explore DoS-ability of it in-the-wild as gotatun takes a non-mainline
approach to anti-DoS Cookies.


Iron-rich Cookies recipes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Two Rust implementations behave differently regarding the Cookies
compared to WireGuard-Go and Linux kernel.

mullvad/gotatun checks Under Load condition on per-SrcIP basis,
not with per-device queue waterline like Linux & Go do. It makes sense
given that the development is led by Mullvad: the goal might be to avoid
"leaking" "Under Load" state to the network.

It makes gotatun vulnerable to SrcIP spoofing, however the vulnerability
is unlikely exploitable for DoS purposes: it's just a per-IP slot
allocation in a HashMap that is .clear()'ed every second without doing
memory reallocation. The only vector I see here is OOM through spoofing.
Saturating 10 Gbit/s interface with handshakes will probably lead just
to ~1=E2=80=A62GiB of HashMap<IpAddr,u64> being allocated. So, it's an unre=
alistic
OOM trigger.

cloudflare/boringtun does completely different things. It flips global
"Under Load" flag after 10 handshakes within a second, and I don't see
post-mac2 per-IP rate limiter at all.

I feel like both gotatun and boringtun may warrant further analysis
regarding their CPU DoS resistance in certain setups given the different
way to handle Under Load conditions.


Sidenotes
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Sidenote #1: WireGuard Go ratelimiter.Allow() should probably follow
Linux kernel WireGuard implementation and use IPv6 as /64 subnet.

Sidenote #2: WireGuard web page on DoS mitigation seems to be
out of date, https://www.wireguard.com/protocol/#dos-mitigation says:

> In order for the server to remain silent unless it receives a valid
> packet, while under load, all messages are required to have a MAC that
> combines the receiver's public key and optionally the PSK as the MAC
> key.

IIUC, PSK is not currently used for DoS-related mac1/mac2, it's mixed
into KDF for handshake_response.encrypted_nothing and SymmetricSession.
Am I getting it wrong?


What's for WireGuard?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I have not built a full PoC yet, so these ideas are exploratory. Still,
I'd like to discuss a few changes that could make WireGuard easier
to integrate with obfuscation layers, without changing its core.

1) Optional per-device Send-Cookie toggle

Allowing WireGuard to disable the built-in Cookie sender on a per-device
basis would let an obfuscation layer take full responsibility for DoS
protection.

This avoids forcing out-of-tree obfuscators to choose between:
- interpreting Cookie messages, or
- leaking a distinguisher, or
- breaking handshakes under load.

This would be conceptually similar to net.ipv4.tcp_syncookies allowing
delegating DoS tradeoffs to the operator.

2) Optional exposure of a receiver identifier

Obfuscators currently lack access to peer identity, which makes per-peer
configuration and rate limiting difficult without trial hashing over all
peers.

An optional mechanism to expose a receiver-side identifier in outgoing
packets (e.g., HASH(static_public) or ClkID conveyed via the mac2 field)
could allow obfuscators to integrate with WireGuard's identity model
without modifying handshake semantics.

Question:

Would changes of this scope be acceptable for the reference
implementation, or is this better kept entirely out-of-tree?
Would it make sense to develop a more detailed proposal?


Acknowledgements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I'd like to thank Danil Bezborodov (@ShaTie), Egor Koleda (@radioegor146)
and Dmitry Nourell (hey@flo.boo) for valuable suggestions and corrections.

I'm also thankful to Schei=C3=9Fe und Pisse Stiftung for donations supporti=
ng
the work on this idea, to Amnezia VPN led by Mazay Banzaev for real-word
data on WireGuard usage, to B4CKSP4CE hackerspace for equipment used for
benchmarks.

And for the "WireGuard itself is derived from an exfiltration mechanism
of mine" as Jason Donenfeld told at
https://lists.zx2c4.com/pipermail/wireguard/2018-September/003295.html
for providing an excellent and well-thought protocol to build upon.


--=20
WBRBW, Leonid Evdokimov, https://darkk.net.ru tel:+79816800702
PGP: 6691 DE6B 4CCD C1C1 76A0  0D4A E1F2 A980 7F50 FAB2
