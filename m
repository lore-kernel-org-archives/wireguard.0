Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c425c879
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:27:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43511011
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:27:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b1753e9
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:26:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4f8aeafa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 18:26:43 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id y10-v6so22281715otg.10
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 11:30:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180530182442.wbgke26kaoau2du2@salvia>
References: <CAHmME9que7BqU9sJcmtSpBoHTs8=kybvDZAT_Ai151qZQOCscA@mail.gmail.com>
 <20180530180547.kn4cikprj7drhlc3@salvia>
 <CAHmME9p-Wdsd7=BaQJSnPKyPc+xyQkdMLGUz48O5b7yVwAmHzg@mail.gmail.com>
 <20180530182442.wbgke26kaoau2du2@salvia>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 May 2018 20:30:03 +0200
Message-ID: <CAHmME9qmurA1DJ=VaAnwu78OgHM5DQg7iZpoR+oh2s7pHs+inA@mail.gmail.com>
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

On Wed, May 30, 2018 at 8:24 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> May it crash the kernel because it's assuming is set? If so, then
> I'd appreciate if you send us a patch to

I suspect it won't crash, but the pmtu might wind up wrong / not calculated.

> Please, use the nf-next.git tree to patch nf_flow_offload_ip_hook()
> and nf_flow_offload_ip6_hook(), it's rather late, we'll request a
> -stable submission for this if needed.

Given the above, I'll submit a patch, though I don't suppose it will
be necessary for -stable.
