Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46cdcca3
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 19:30:26 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e62cb01
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 19:30:26 +0000 (UTC)
Date: Mon, 26 Mar 2018 00:42:12 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: add/remove a peer
Message-ID: <20180326004212.55bf62f0@natsu>
In-Reply-To: <CAKXLc7e1cJ6E=KCMshe_=EOtnwTa-YpRwPe2RwW8vNkj3qzONw@mail.gmail.com>
References: <1521919967.1921.32.camel@gmail.com>
 <CAF75rJBe8amfHP__gQMzAf6cBj933c2yCg4wx4nA2hw98tcVXQ@mail.gmail.com>
 <1522001437.2044.11.camel@gmail.com>
 <CAKXLc7e1cJ6E=KCMshe_=EOtnwTa-YpRwPe2RwW8vNkj3qzONw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, 25 Mar 2018 21:17:35 +0200
Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> There is a reason, at least one, good one - it is called simplicity.
> It is also hard to work when you are running out of disk space or
> memory; do you expect WG to solve that for you?
> Simply put, IP addressing schemes are not a part of WG, neither a requirement.
> There are many ways to use WG and "assign random, free IP address and
> send to a new peer" is too specific of a use case.
> 
> May be you can cobble up something with a DHCP server that cares about
> certain address range?
> Or a simple flat-file dB and a script that does it for you?
> 
> What happens when you run out of addresses?
> How do you re-assign an IP address to a new peer?
> ...
> Those are questions widely outside WG, IMHO.

Agreed.

One more idea that comes to mind, is to use IPv6 and assign IPs based on peer
public keys. Assuming a fixed /64 subnet, using a 64-bit half of the public
key for the host part, still makes collisions nearly impossible.

-- 
With respect,
Roman
