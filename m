Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 108b3731
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:12:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdea587d
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:12:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7cab611
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:11:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7b9d1d08
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:11:22 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id n3-v6so22230046ota.5
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 11:14:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180530180547.kn4cikprj7drhlc3@salvia>
References: <CAHmME9que7BqU9sJcmtSpBoHTs8=kybvDZAT_Ai151qZQOCscA@mail.gmail.com>
 <20180530180547.kn4cikprj7drhlc3@salvia>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 May 2018 20:14:42 +0200
Message-ID: <CAHmME9p-Wdsd7=BaQJSnPKyPc+xyQkdMLGUz48O5b7yVwAmHzg@mail.gmail.com>
Subject: Re: Missing skb->dst with flow offloading
To: Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
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

Hey Pablo,

On Wed, May 30, 2018 at 8:05 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> If there a more drivers in-tree that need this, we may add
> skb_dst_set_noref() calls to _hook function in the flowtable codebase.

Can I, then, take that as an implicit acknowledgement that this
observed behavior on OpenWRT is to be expected with the current state
of events, and that I should patch my driver accordingly?

As one example of this in tree, take a look at vxlan -- it's using it
for the mtu/pmtu exactly as WireGuard does.

Regards,
Jason
