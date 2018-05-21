Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecc712e6
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 10:06:44 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6574a48f
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 10:06:44 +0000 (UTC)
Subject: Re: WG: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
From: Axel Neumann <neumann@cgws.de>
Message-ID: <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
Date: Mon, 21 May 2018 12:07:38 +0200
MIME-Version: 1.0
In-Reply-To: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
Content-Type: text/plain; charset=utf-8
Reply-To: neumann@cgws.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

With regards to the subject, ...to discuss the demand and identify
solutions for a "HW-clock INDEPENDENT WG solution", I've seen
essentially three different suggestions so fare:

a) Buy and connect a HW clock.
IMO: Often difficult considering available HW, budget, and skills.

b) Rely on the (HW) clock of somebody else,
considering network time protocols (e.g. NTP, RFC867, RFC868,...) and
related (security) implications (such as new dependencies on remote
services, IP or DNS spoofing, firewall settings, boot-service order,
...). Some experience [1] suggest to go for a).
IMO: A concrete best practice would be good here but would likely
overshoot the complexity and other-systems-dependencies of WG by magnitudes.

c) Modify WG to use (time-independent) counter-based values to prevent
replay-attacks.
Paul [2] gave a pretty nice overview of the yet identified advantages
and implications, suggesting that it requires only few and simple code
changes, introduces no security drawbacks, could be fully compatible
with existing protocol and implementations, and makes HWC or NTP
entirely superfluous. As discussed earlier [3] it can be achieved with
essentially one file-system write operation each boot.

There have been many good comments for a) and b). Still, I'd be happy to
elaborate the case of c), or a maybe a fourth idea, a bit further...
What technical concerns do you see with c) or what suggestions would you
make to somebody working out a patch?

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-May/002832.html
[2] https://lists.zx2c4.com/pipermail/wireguard/2018-May/002875.html
[3] https://lists.zx2c4.com/pipermail/wireguard/2018-May/002865.html

/axel
