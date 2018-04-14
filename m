Return-Path: longneck@scratchbook.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d4f0a3a
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 11:36:56 +0000 (UTC)
Received: from zelda2.hostorama.com (zelda2.hostorama.com [80.74.159.102])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 139608f5
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 11:36:56 +0000 (UTC)
Received: from dog (unknown [185.32.221.150])
 by zelda2.hostorama.com (Postfix) with ESMTPSA id 84AD11E409F6
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 13:51:10 +0200 (CEST)
Date: Sat, 14 Apr 2018 13:51:09 +0200
From: Claude <longneck@scratchbook.ch>
To: wireguard@lists.zx2c4.com
Subject: Re: wg-ip, a tool to assign automatic ip addresses to wireguard
 interfaces
Message-Id: <20180414135109.4e8203e8331b8c9099bfdc6e@scratchbook.ch>
In-Reply-To: <CAHmME9oL_VU3xXtvxs2pLF+UvfLpZWHEEO7ec_=ev3-SZ6KQpQ@mail.gmail.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
 <CAHmME9oL_VU3xXtvxs2pLF+UvfLpZWHEEO7ec_=ev3-SZ6KQpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

> One of the things we'll be investigating is whether it's best to
> derive a v6 address from a public key or whether it's best to make
> these separate/unrelated and share them alongside the public key.
> While the former is much more elegant, a significant problem is
> choosing the right behavior and assessing the security concerns with
> collisions. 

Not sure if you're already aware of, but there is this project called
cjdns which does exactly this. The IPv6 is derrived from the public key.
https://github.com/cjdelisle/cjdns/blob/master/doc/notes/cryptography.md

Maybe you can use that for some ideas or inspirations / evaluations.

Claude
