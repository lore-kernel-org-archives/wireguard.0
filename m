Return-Path: wireguard@ajs124.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb98413b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 14:03:57 +0000 (UTC)
Received: from mail.radical-dreamers.de (mail.radical-dreamers.de
 [144.76.172.186])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cd43aa0
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 14:03:57 +0000 (UTC)
Date: Wed, 16 May 2018 16:04:04 +0200
From: ajs124 <wireguard@ajs124.de>
To: wireguard@lists.zx2c4.com
Subject: Re: Multiple (client-)peers with same keys possible ?
Message-ID: <20180516160404.2f58ad46@thinkpad>
In-Reply-To: <896575027.3009605.1526448125867@mail.yahoo.com>
References: <896575027.3009605.1526448125867.ref@mail.yahoo.com>
 <896575027.3009605.1526448125867@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 16 May 2018 05:22:05 +0000 (UTC)
reiner otto <augustus_meyer@yahoo.de> wrote:

> Then individual keys for the clients, sigh.
> 
> Which leads to next question:
> When adding a new client to the servers wg0.conf,
> does it require a restart of wg, _OR_ is it safe to simply "edit" wg0.conf, adding the clients info ?
> 
> Cheers,
> Reiner
> 
>  
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

You don't need to restart, just use "wg addconf" or "wg setconf". Or if you
don't (want to) use the ini config format, for some reason, using "wg
set peer <base64-public-key>" directly should also work.
