Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0154c98
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 04:54:10 +0000 (UTC)
Received: from sonic303-19.consmr.mail.ir2.yahoo.com
 (sonic303-19.consmr.mail.ir2.yahoo.com [77.238.178.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36fbdf37
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 04:54:10 +0000 (UTC)
Date: Sun, 13 May 2018 04:57:10 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <neumann@cgws.de>, Kalin KOZHUHAROV <me.kalin@gmail.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Message-ID: <1324673763.992877.1526187430298@mail.yahoo.com>
Subject: Re: Need for HW-clock independent timestamps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <1324673763.992877.1526187430298.ref@mail.yahoo.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Having implemented this solution already, I consider it some type of hack, =
as the standard time sync unfortunately happens very late in the start of t=
he services,  after rc.local called. And the sync might take quite some tim=
e.

Which means, I had to "hack"  the time sync immediately after WAN up, and t=
o be done in a single shot, before starting WG.

It might be a reasonable workaround, as a standard new option in openwrt, t=
o allow immediate time sync after WAN up, instead of the graceful sync much=
 later.

However, as a real RTC is rather cheap, it might be a good idea, in case of=
 commercial apps, to ask the supplier of the device to be used  for the inc=
lusion of a RTC.
The more requests, the better the chances to find more devices with RTC inc=
luded.

--------------------------------------------
Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> schrieb am So, 13.5.2018:

=20
=20
 The analogue for a wireguard deployment would
 be to run NTP on the
 unsecured links and not
 configure the wireguard tunnels until NTP has
 synced. This has different security
 implications for a VPN than for
 dnssec, of
 course, but it could be doable.=20
=20
