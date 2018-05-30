Return-Path: pablo@netfilter.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14152ef5
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:03:45 +0000 (UTC)
Received: from mail.us.es (mail.us.es [193.147.175.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bbe799c
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:03:45 +0000 (UTC)
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
 by mail.us.es (Postfix) with ESMTP id E15EF172C6D
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 20:05:18 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 38231DA81B
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 20:04:41 +0200 (CEST)
Date: Wed, 30 May 2018 20:05:47 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Missing skb->dst with flow offloading
Message-ID: <20180530180547.kn4cikprj7drhlc3@salvia>
References: <CAHmME9que7BqU9sJcmtSpBoHTs8=kybvDZAT_Ai151qZQOCscA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9que7BqU9sJcmtSpBoHTs8=kybvDZAT_Ai151qZQOCscA@mail.gmail.com>
Cc: Netdev <netdev@vger.kernel.org>, netfilter-devel@vger.kernel.org,
 Jaap Buurman <jaapbuurman@gmail.com>, openwrt-devel@lists.openwrt.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Felix Fietkau <nbd@nbd.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On Wed, May 30, 2018 at 02:01:05AM +0200, Jason A. Donenfeld wrote:
> Hey Pablo,
> 
> Some OpenWRT people have reported to me that there's a crash when
> enabling flow offloading, because I rely on skb_dst(skb) being
> non-null in ndo_start_xmit. The fix in my code for this is very
> simple:
> 
> - mtu = dst_mtu(skb_dst(skb));
> + dst = skb_dst(skb);
> + mtu = dst ? dst_mtu(dst) : dev->mtu;
> 
> I can make this change, but I wanted to be certain first that omitting
> the dst in the skb is intentional on your part. (If so, there might be
> other drivers to fix as well.) In tracing this, it looks like a packet
> that's forwarded from a flow offloaded interface to a virtual
> interface gets diverted immediately via neigh_xmit, where it is then
> passed to a virtual interface via dev_queue_xmit. I can't see anywhere
> along this path a call to skb_dst_set. Perhaps this is intended, as
> flow offloading is supposed to skip the routing table? Or is there an
> oversight in the new flow offloading code?
> 
> I'd appreciate your input, so that I can make the appropriate change
> -- or not -- to my code.

If there a more drivers in-tree that need this, we may add
skb_dst_set_noref() calls to _hook function in the flowtable codebase.
