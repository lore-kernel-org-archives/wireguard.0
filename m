Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 373df756
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 20:24:34 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net
 [IPv6:2001:1608:10:3::a:8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cdd9ac9
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 20:24:34 +0000 (UTC)
Date: Tue, 22 May 2018 21:25:37 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: WG: Need for HW-clock independent timestamps
Message-ID: <20180522202537.GA18356@matrix-dream.net>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
 <20180521145618.GA3199@wolff.to>
 <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 21, 2018 at 05:34:42PM +0200, Matthias Urlichs wrote:
> I might also wonder why you'd peer with somebody whom you don't trust
> not to collect and/or abuse the information that you just rebooted …

You might wish to connect with someone because he provides services.
Active monitoring can provide similar information, but there is no need
to send your running reboot count and time since last reboot in every
handshake message.


It seems wireguard requires external/persistent state (time is state)
to prevent replays, because of its 1-RTT key exchange. A 2-RTT design
wouldn't require such dependencies.

How about allowing counter wrapping, if it has been at least
2 * REKEY_TIMEOUT from last handshake? Perhaps reusing the cookie
protocol for a 2-RTT handshake?

Losing access to a device, because its clock has gone wonky is not pleasant.

--
Ivan Labáth
