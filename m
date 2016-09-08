Return-Path: opensource@vdorst.com
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6addead
 for <wireguard@lists.zx2c4.com>; Thu, 8 Sep 2016 11:49:50 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 4BCA031CFD0
 for <wireguard@lists.zx2c4.com>; Thu,  8 Sep 2016 13:57:49 +0200 (CEST)
Date: Thu, 08 Sep 2016 11:57:53 +0000
Message-ID: <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
In-Reply-To: <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I did try to write some MIPS32r2 code.
I wrote the chacha20_keysetup, chacha20_generic_block and  
poly1305_generic_blocks in assembly.
Tried to load all needed variables in the registers. Which should  
reduce the memory overhead.
But it is very difficult for me to do code profiling and/or isolate  
the code and make some benchmark programs like supercop.
So testing was simple. Crosscompile the code. Copy and load the module  
on the target. Run setup script and iperf.

#ifdef CONFIG_CPU_MIPS32_R2
asmlinkage void chacha20_keysetup(struct chacha20_ctx *ctx, const u8  
key[static 32], const u8 nonce[static 8]);
asmlinkage void chacha20_generic_block(struct chacha20_ctx *ctx);
asmlinkage unsigned int poly1305_generic_blocks(struct poly1305_ctx  
*ctx, const u8 *src, unsigned int srclen, u32 hibit);
#endif

But the speed is equal or less on my TP WR1043ND device which is a  
MIPS32r2 24kc big endian.
So GCC does a good job. Also 24kc has no special CoProcessors or FPU.

Most improvement what I had it to change the buildroot default  
optimization -Os to -O2.
This gives around 1-3% speed improvement.

ideas:
- remove the little endian parts on the MIPS.
   Offcourse do it also on the other side.
   On this device I can't switch endian.
   But I did not see any improvements. Need 2 instruction for swapping  
32bit register.
   After a quick calculation it could save around 0.4% which is  
~0.1MBit/s on this device.

Greats,

René van Dorst.
