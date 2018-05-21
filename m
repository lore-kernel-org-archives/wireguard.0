Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e759d0d
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 11:58:01 +0000 (UTC)
Received: from sonic303-20.consmr.mail.ir2.yahoo.com
 (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0b1874b
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 11:58:01 +0000 (UTC)
Date: Mon, 21 May 2018 11:58:53 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <wireguard@lists.zx2c4.com>,  <neumann@cgws.de>
Message-ID: <1522499692.6109802.1526903933505@mail.yahoo.com>
Subject: Re: WG: Need for HW-clock independent timestamps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <1522499692.6109802.1526903933505.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

+1;=20
Not just to consider the "very standard case", which why quality of softwar=
e nowadays goes down.
Although you are correct here, that power cycle is almost normal usage proc=
edure.


--------------------------------------------
Axel Neumann <neumann@cgws.de> schrieb am Mo, 21.5.2018:

 Betreff: Re: WG: Need for HW-clock independent timestamps
 An: wireguard@lists.zx2c4.com
 Datum: Montag, 21. Mai, 2018 14:52 Uhr
=20
 On 21.05.2018 13:22, Reto Brunner
 wrote:
 > On Mon, May 21, 2018 at
 12:07:38PM +0200, Axel Neumann wrote:
 >> entirely superfluous. As discussed
 earlier [3] it can be achieved with
 >>
 essentially one file-system write operation each boot.
 >=20
 > You might as well
 achieve the same with the timestamp.
 >
 Just add a pre-shutdown hook, which touches a file.
=20
 yes, can be an option, but
 would only work in "normal" soft-shut-down
 cases, not in case of a hard reset or power
 cycle. A not-so-uncommon
 scenario for
 embedded home-network devices and community-network
 deployments. Especially when considering the
 first choice of a=C2=A0 normal
 user (desperately
 trying to fix its internet-via-WG tunnel connection):
 Power cycle the device.
=20
 /axel
=20
 >
 Restore the system clock to this upon boot (which may very
 well be off
 > but who cares).
 >=20
 > After the wg tunnel
 is back up, sync with any NTP server you trust and you
 > are back up and running.
 >=20
 > What is the
 advantage of doing it with a counter?
 > I
 fail to see the benefit.
 >
 _______________________________________________
 > WireGuard mailing list
 > WireGuard@lists.zx2c4.com
 > https://lists.zx2c4.com/mailman/listinfo/wireguard
 >
=20
=20
 _______________________________________________
 WireGuard mailing list
 WireGuard@lists.zx2c4.com
 https://lists.zx2c4.com/mailman/listinfo/wireguard
=20
