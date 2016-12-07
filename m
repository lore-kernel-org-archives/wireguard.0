Return-Path: dave.taht@gmail.com
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
 [209.85.220.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8800e1a6
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:41:50 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id y205so49578003qkb.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 10:47:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Wed, 7 Dec 2016 10:47:16 -0800
Message-ID: <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, linux-mips@linux-mips.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The openwrt tree has long contained a set of patches that correct for
unaligned issues throughout the linux network stack.

https://git.lede-project.org/?p=openwrt/source.git;a=blob;f=target/linux/ar71xx/patches-4.4/910-unaligned_access_hacks.patch;h=b4b749e4b9c02a74a9f712a2740d63e554de5c64;hb=ee53a240ac902dc83209008a2671e7fdcf55957a

unaligned access traps in the packet processing path on certain versions of
the mips architecture is horrifically bad. I had kind of hoped these
patches in some form would have made it upstream by now. (or the
arches that have the issue retired, I think it's mostly just mips24k)
