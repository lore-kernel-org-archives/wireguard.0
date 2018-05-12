Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d410c489
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 22:34:51 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00e0e1eb
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 22:34:51 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: neumann@cgws.de, Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: Need for HW-clock independent timestamps
In-Reply-To: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
Date: Sun, 13 May 2018 00:10:18 +0200
Message-ID: <87po20wmnp.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Axel Neumann <neumann@cgws.de> writes:

> Thanks a lot for your replies. But as you can see from my comments below
> this all does not look like a valid option for many embedded use cases.
> BTW, my background are community mesh networks which are maintained by
> all kind of different individuals using a zoo of different device
> types.

We had a long discussion on the issue of time on embedded routers with
no RTC around the time support for DNSSEC was added to dnsmasq. The
solution we ended up with in OpenWrt was that dnsmasq will run without
validating signatures until NTP indicates that it has synced to a time
server. See the --dnssec-no-timecheck and --dnssec-timestamp options to
dnsmasq for details on how this works.

You're right, of course, that "just add an RTC" is not a solution...

The analogue for a wireguard deployment would be to run NTP on the
unsecured links and not configure the wireguard tunnels until NTP has
synced. This has different security implications for a VPN than for
dnssec, of course, but it could be doable. Depends on your setup how
this is best done; you don't give enough details for me to have an
informed opinion :)

> I would really appreciate if WG can further elaborate on this issue.
> There are many real-life communities with embedded-device deployments
> that would be looking forward to use WG.
>
> Could you also comment on the described approach (see again at the end
> of the mail) of allowing (maybe as an alternative) a sequence number
> instead of a timestamp?

Can't comment on the security implications of this; but even if it is
possible without degrading the security of the protocol, this is a
non-trivial change at the protocol level; so if you want to deploy
anything within the next ~6-12 months, I'd suggest finding a
workaround...

-Toke
