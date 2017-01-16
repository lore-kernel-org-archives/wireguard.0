Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0abf773a
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 14:51:27 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35fa8a1a
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 14:51:27 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [RFC] Handling multiple endpoints for a single peer
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
Date: Mon, 16 Jan 2017 16:01:55 +0100
Message-Id: <B39E551B-33E0-45BA-91C1-68E3D438B816@danrl.com>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,


> On 8 Jan 2017, at 23:49, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> (send an encrypted out of band non-IP packet
> directly to a peer, for things like autoconfig) could play a nice role
> in this.


This is highly interesting! I should undust my gcc probably.


> One thing that comes to mind is how to detect when the local LAN peer
> comes back online there. Should wireguard just be trying to initiate a
> new handshake _always_, and eventually it will succeed and promote the
> cryptokey routing table entry to "active"?

Something like RetryTimeout=3DX comes to mind. And immediately raises =
the question how it is different from PersistentKeepalive? The latter =
one is misused to achieve exactly this sometimes.

The concrete problem Samuel described is one that could be solved by =
scoped addressing. This may be too theoretical for the actual scenario =
and circumstances.


Cheers,

Dan=
