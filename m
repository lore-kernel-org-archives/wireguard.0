Return-Path: opensource@vdorst.com
Received: from smtp02.bhosted.nl (smtp02.bhosted.nl [94.124.121.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1675cb10
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Sep 2016 11:57:46 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id AC4BF323F3E
 for <wireguard@lists.zx2c4.com>; Sun, 11 Sep 2016 14:06:02 +0200 (CEST)
Date: Sun, 11 Sep 2016 12:06:11 +0000
Message-ID: <20160911120611.Horde.MpIrXgeYy6b-xAXfCHOkOXJ@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <20160910125025.Horde.1oXPxRzlX1oP4By8Ppdyv2N@www.vdorst.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Subject: Re: [WireGuard] [PATCHv2] Add support for platforms which has no
 efficient unaligned memory access
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Typo HAVE_EFFICIENT_UNALIGNED_ACCESS -->  
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS.

 From 13fae657624aac6b9c1f411aa6472a91aae7fcc3 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Date: Sat, 10 Sep 2016 10:58:58 +0200
Subject: [PATCH] Add support for platforms which has no efficient unaligned
  memory access

Without it, it caused 55.2% slowdown in throughput at TP-Link  
WR1043ND, MIPS32r2@400Mhz.

Simply check for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS at compile time.

Test on TP-Link WR1043ND, MIPS32r2@400Mhz.
Setup: https://lists.zx2c4.com/pipermail/wireguard/2016-August/000331.html

Benchmarks before:

root@lede:~# iperf3 -c 10.0.0.1 -i 10
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0    202 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0             sender
[  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec                  receiver

root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  3982
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datagrams
[  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  0.049 ms  0/3982 (0%)
[  4] Sent 3982 datagrams

Benchmarks with aligned memory fetching:

root@lede:~# iperf3 -c 10.0.0.1 -i 10
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0    145 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0             sender
[  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec                  receiver

iperf Done.
root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  7207
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datagrams
[  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  0.041 ms  0/7207 (0%)
[  4] Sent 7207 datagrams
---
  src/crypto/chacha20poly1305.c | 31 +++++++++++++++++++++++++++++++
  1 file changed, 31 insertions(+)

diff --git a/src/crypto/chacha20poly1305.c b/src/crypto/chacha20poly1305.c
index 5190894..294cbf6 100644
--- a/src/crypto/chacha20poly1305.c
+++ b/src/crypto/chacha20poly1305.c
@@ -248,13 +248,29 @@ struct poly1305_ctx {

  static void poly1305_init(struct poly1305_ctx *ctx, const u8  
key[static POLY1305_KEY_SIZE])
  {
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+       u32 t0, t1, t2, t3;
+#endif
+
         memset(ctx, 0, sizeof(struct poly1305_ctx));
         /* r &= 0xffffffc0ffffffc0ffffffc0fffffff */
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
         ctx->r[0] = (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
         ctx->r[1] = (le32_to_cpuvp(key +  3) >> 2) & 0x3ffff03;
         ctx->r[2] = (le32_to_cpuvp(key +  6) >> 4) & 0x3ffc0ff;
         ctx->r[3] = (le32_to_cpuvp(key +  9) >> 6) & 0x3f03fff;
         ctx->r[4] = (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;
+#else
+       t0 = le32_to_cpuvp(key + 0);
+       t1 = le32_to_cpuvp(key + 4);
+       t2 = le32_to_cpuvp(key + 8);
+       t3 = le32_to_cpuvp(key +12);
+       ctx->r[0] = t0 & 0x3ffffff; t0 >>= 26; t0 |= t1 << 6;
+       ctx->r[1] = t0 & 0x3ffff03; t1 >>= 20; t1 |= t2 << 12;
+       ctx->r[2] = t1 & 0x3ffc0ff; t2 >>= 14; t2 |= t3 << 18;
+       ctx->r[3] = t2 & 0x3f03fff; t3 >>= 8;
+       ctx->r[4] = t3 & 0x00fffff;
+#endif
         ctx->s[0] = le32_to_cpuvp(key +  16);
         ctx->s[1] = le32_to_cpuvp(key +  20);
         ctx->s[2] = le32_to_cpuvp(key +  24);
@@ -267,6 +283,9 @@ static unsigned int poly1305_generic_blocks(struct  
poly1305_ctx *ctx, const u8 *
         u32 s1, s2, s3, s4;
         u32 h0, h1, h2, h3, h4;
         u64 d0, d1, d2, d3, d4;
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+       u32 t0, t1, t2, t3;
+#endif

         r0 = ctx->r[0];
         r1 = ctx->r[1];
@@ -287,11 +306,23 @@ static unsigned int  
poly1305_generic_blocks(struct poly1305_ctx *ctx, const u8 *

         while (likely(srclen >= POLY1305_BLOCK_SIZE)) {
                 /* h += m[i] */
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
                 h0 += (le32_to_cpuvp(src +  0) >> 0) & 0x3ffffff;
                 h1 += (le32_to_cpuvp(src +  3) >> 2) & 0x3ffffff;
                 h2 += (le32_to_cpuvp(src +  6) >> 4) & 0x3ffffff;
                 h3 += (le32_to_cpuvp(src +  9) >> 6) & 0x3ffffff;
                 h4 += (le32_to_cpuvp(src + 12) >> 8) | hibit;
+#else
+               t0 = le32_to_cpuvp(src +  0);
+               t1 = le32_to_cpuvp(src +  4);
+               t2 = le32_to_cpuvp(src +  8);
+               t3 = le32_to_cpuvp(src + 12);
+               h0 += t0 & 0x3ffffff;
+               h1 += sr((((u64)t1 << 32) | t0), 26) & 0x3ffffff;
+               h2 += sr((((u64)t2 << 32) | t1), 20) & 0x3ffffff;
+               h3 += sr((((u64)t3 << 32) | t2), 14) & 0x3ffffff;
+               h4 += (t3 >> 8) | hibit;
+#endif

                 /* h *= r */
                 d0 = mlt(h0, r0) + mlt(h1, s4) + mlt(h2, s3) +  
mlt(h3, s2) + mlt(h4, s1);
--
2.5.5
