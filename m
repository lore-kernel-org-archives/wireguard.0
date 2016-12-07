Return-Path: davem@davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cf61e6a
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:46:03 +0000 (UTC)
Date: Wed, 07 Dec 2016 13:51:27 -0500 (EST)
Message-Id: <20161207.135127.789629809982860453.davem@davemloft.net>
To: dave.taht@gmail.com
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-mips@linux-mips.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

From: Dave Taht <dave.taht@gmail.com>
Date: Wed, 7 Dec 2016 10:47:16 -0800

> https://git.lede-project.org/?p=openwrt/source.git;a=blob;f=target/linux/ar71xx/patches-4.4/910-unaligned_access_hacks.patch;h=b4b749e4b9c02a74a9f712a2740d63e554de5c64;hb=ee53a240ac902dc83209008a2671e7fdcf55957a

It's so much better to analyze properly where the misalignment comes from
and address it at the source, as we have for various cases that trip up
Sparc too.

Marking structures "packed" is going to kill performance and is not
the answer.
