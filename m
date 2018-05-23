Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd4dadcc
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 06:53:53 +0000 (UTC)
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db059c3f
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 06:53:53 +0000 (UTC)
Date: Wed, 23 May 2018 06:55:02 +0000
Message-ID: <20180523065502.Horde.XmS-X9MeW68pkcgw65-pNRx@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
Subject: Re: "The OpenWRT Commit" (native chacha20 mips32 support)
In-Reply-To: <CY4PR14MB11417381F5FD378FE994F0A1A2940@CY4PR14MB1141.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting Denis Kisselev <denis@dkisselev.net>:

> Has anyone had a chance to play around with the new snapshot  
> (<https://git.zx2c4.com/WireGuard/commit/?id=d67d89c7f9d83d22d750452236b0e16510ab1368>0.0.20180519<https://git.zx2c4.com/WireGuard/tag/?h=0.0.20180519>) on a mips  
> device?
>
>
> It looks like ChaCha20 is now natively supported but I'm curious  
> about what kind of performance people are now seeing on devices.
>
>
> Anecdotally, it looks like people were getting 50-60mbps on ~650mhz  
> devices like the AR-300M when wireguard made its first splash about  
> a year ago.

Chacha20 routine is around 114-117% faster.
Poly1305 routine is around ~275% faster.
Both compared with generic C version.
So you will see a 10-25% improvement in the speed.

Greats,

René van Dorst.
