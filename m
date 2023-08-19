Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87014EE4981
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 07:22:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 451a2a24;
	Sat, 19 Aug 2023 07:22:50 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 844daeb4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 07:22:48 +0000 (UTC)
Received: janet.servers.dxld.at; Sat, 19 Aug 2023 09:22:48 +0200
Date: Sat, 19 Aug 2023 09:22:45 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Nathaniel Filardo <nwfilardo@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: IPv6-only flag set on v6 sockets prevents the use of v4-mapped
 addresses
Message-ID: <20230819072245.bj7giu7lk4zqib2h@House.clients.dxld.at>
References: <CAKsvP2ZcqUvFD5g6vMxZrv7Z5+YAmoGBAh7zf8iZPPRE6LNEDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKsvP2ZcqUvFD5g6vMxZrv7Z5+YAmoGBAh7zf8iZPPRE6LNEDg@mail.gmail.com>
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

Hi Nathaniel,

On Mon, May 22, 2023 at 07:48:04AM +0100, Nathaniel Filardo wrote:
> This means that v4-mapped v6 addresses (::ffff:a.b.c.d) can be
> registered as peer endpoints, but the kernel very silently won't try
> to reach out.  Is that deliberate for some reason that eludes me?  If
> it is, could the userspace tooling be educated about v4-mapped
> addresses and translate them accordingly before handing them up to the
> kernel; if it isn't, could we drop the v6-only flag on the kernel
> socket?

Since I recently sent some patches touching the socket binding code I'm
worndering what the exact use case is here? DNS will never return these
addressess, I've only ever seen them used (internally to programs) when the
kernel returns them in non-v6only sockets. Is there some other context
these get returned in I'm missing?

I considered dropping the v6only flag for the new bind-to-address code path
I introduced but couldn't convince myself that there really is a good
reason to deviate from established wg behaviour here.

--Daniel
