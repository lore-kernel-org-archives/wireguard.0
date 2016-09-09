Return-Path: opensource@vdorst.com
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3530aa5d
 for <wireguard@lists.zx2c4.com>; Fri, 9 Sep 2016 19:41:13 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 5950E31FC00
 for <wireguard@lists.zx2c4.com>; Fri,  9 Sep 2016 21:49:21 +0200 (CEST)
Date: Fri, 09 Sep 2016 19:49:27 +0000
Message-ID: <20160909194927.Horde.e1JlaJl_SL7blOrpizk9Uba@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
 <20160909135202.GA32666@lud.imag.fr>
 <20160909152208.Horde.qMOsffs1bVcJx-AfO91qa9q@www.vdorst.com>
In-Reply-To: <20160909152208.Horde.qMOsffs1bVcJx-AfO91qa9q@www.vdorst.com>
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

Here is my last source code https://github.com/vDorst/wireguard/tree/mips32r2
Including the long history of try and fail ;).
But also good ideas like try to optimize the code for better data dependency.
Which makes the code less readable but more efficient.

This is the assembly part  
https://github.com/vDorst/wireguard/blob/mips32r2/src/crypto/chacha20-mips32r2.S

Created functions:
* asmlinkage void chacha20_keysetup(struct chacha20_ctx *ctx, const u8  
key[static 32], const u8 nonce[static 8]);
* asmlinkage void chacha20_generic_block(struct chacha20_ctx *ctx);
* asmlinkage unsigned int poly1305_generic_blocks(struct poly1305_ctx  
*ctx, const u8 *src, unsigned int srclen, u32 hibit);

poly1305_generic_blocks is fixed in the last commit.

Code is written for MIPS32r2 Big endian.
Code has some define for __ORDER_BIG_ENDIAN__ which enable the endian  
swap for that data but is not tested for Litte endian.

Todo:
* Change the C code to see how fast that works and set benchmark baseline.
* Look if I can optimize assembler version even more.

Greats,

René van Dorst.
