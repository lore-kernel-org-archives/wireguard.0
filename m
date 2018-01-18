Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca41c2c5
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 20:53:51 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8805eaa4
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 20:53:51 +0000 (UTC)
Date: Thu, 18 Jan 2018 20:57:19 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: passtos patch
Message-ID: <20180118205718.GA12926@matrix-dream.net>
References: <4dc5f671-790e-88df-5483-ee00716d570e@zenit.ru>
 <CAKXLc7cAs1fQ49F1ez_--ednQM6=voJEfPGmapBX8wS=XPGvEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAKXLc7cAs1fQ49F1ez_--ednQM6=voJEfPGmapBX8wS=XPGvEQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jan 18, 2018 at 12:56:55PM +0100, Kalin KOZHUHAROV wrote:
> 
> Since this is not a common scenario, IMHO, and there are only a
> handful TOS worth doing something, a workaround would be to bunch a
> few wg tunnels (even bridge them at both ends?), use fwmark and mangle
> the TOS with iptables/ift...
> Just a suggestion, not tried obviously.
> 

Perhaps it would be possible to use one of the **tables packet markings
to store the TOS before it enters the tunnel and restore it on the
encrypted packet.
