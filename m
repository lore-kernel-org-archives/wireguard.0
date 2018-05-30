Return-Path: pablo@netfilter.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39a83fed
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:22:38 +0000 (UTC)
Received: from mail.us.es (mail.us.es [193.147.175.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1c061bb
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:22:38 +0000 (UTC)
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
 by mail.us.es (Postfix) with ESMTP id C7DF8174D13
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 20:24:13 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 13984DA81D
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 20:23:36 +0200 (CEST)
Date: Wed, 30 May 2018 20:24:42 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Missing skb->dst with flow offloading
Message-ID: <20180530182442.wbgke26kaoau2du2@salvia>
References: <CAHmME9que7BqU9sJcmtSpBoHTs8=kybvDZAT_Ai151qZQOCscA@mail.gmail.com>
 <20180530180547.kn4cikprj7drhlc3@salvia>
 <CAHmME9p-Wdsd7=BaQJSnPKyPc+xyQkdMLGUz48O5b7yVwAmHzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9p-Wdsd7=BaQJSnPKyPc+xyQkdMLGUz48O5b7yVwAmHzg@mail.gmail.com>
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

On Wed, May 30, 2018 at 08:14:42PM +0200, Jason A. Donenfeld wrote:
> Hey Pablo,
> 
> On Wed, May 30, 2018 at 8:05 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > If there a more drivers in-tree that need this, we may add
> > skb_dst_set_noref() calls to _hook function in the flowtable codebase.
> 
> Can I, then, take that as an implicit acknowledgement that this
> observed behavior on OpenWRT is to be expected with the current state
> of events, and that I should patch my driver accordingly?
> 
> As one example of this in tree, take a look at vxlan -- it's using it
> for the mtu/pmtu exactly as WireGuard does.

May it crash the kernel because it's assuming is set? If so, then
I'd appreciate if you send us a patch to
netfilter-devel@vger.kernel.org.

Please, use the nf-next.git tree to patch nf_flow_offload_ip_hook()
and nf_flow_offload_ip6_hook(), it's rather late, we'll request a
-stable submission for this if needed.

Thanks.
