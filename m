Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0406bfdb
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 15:42:30 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89df8364
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 15:42:30 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 08 May 2018 17:44:56 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: wireguard@lists.zx2c4.com
Subject: Re: WG interface to ipv4
Message-ID: <4f1f154f85bb01204c883e37e41eba86@rcrdbrt.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> The current concept of WG has indeed certain pros over other VPN
> solutions, but like most everything else in life, it has its cons too
> and it will be determined by the user what suits best. Time will tell
> the adoption/penetration level of WG is achieving. For me unfortunately
> the cons (not just what is mentioned in this thread) are outweighing 
> the
> pros in WG's current state and thus departing from WG for the time 
> being
> but keeping an eye on future developments.

If the cons of WireGuard are that it gives the users less freedom to 
make mistakes, then I'm all for it.

I don't really get why the iface bindings should be accomplished at the 
WireGuard level. If I get it correctly, it won't be safer than it 
already is.
WireGuard just has to provide a secure and standard network interface. 
There are other full-featured, clogged VPNs out there that can even make 
you the coffee, I'd like WireGuard to stand out and stick to the 
original "UNIX tools philosophy": do one thing and do it well.
