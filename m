Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1db98c53
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:23:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3767b7be
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:23:40 +0000 (UTC)
Message-ID: <1513024271.24175.3.camel@gmx.de>
Subject: Re: Reading configuration from stdin
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: Aaron Jones <aaronmdjones@gmail.com>
Date: Mon, 11 Dec 2017 21:31:11 +0100
In-Reply-To: <ebc466dc-a1b7-6de9-2e3b-fb94e63f60a6@gmail.com>
References: <1512909832.1336.19.camel@gmx.de>
 <ebc466dc-a1b7-6de9-2e3b-fb94e63f60a6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 2017-12-11 at 04:12 +0000, Aaron Jones wrote:
> On 10/12/17 12:43, Manuel Sch=C3=B6lling wrote:
> > Hi,
> >=20
> > Would it make sense (aka be secure) if we make it possible to call
> > 'wg setconf wg0 -' so the wg tool does not read the configuration
> > from a file but from stdin? Same for 'wg set wg0 private-key -' and
> > 'wg set wg0 psk -'?
>=20
> This should already be possible via `wg setconf wg0 /dev/stdin', no?
Duh, you're right. I totally forgot about /dev/stdin 'cause tools like
cat use '-'!
