Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C4C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D0121B69
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0z77SOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D0121B69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 651cbb61;
	Sun, 17 Feb 2019 01:22:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40681595
 for <wireguard@lists.zx2c4.com>; Tue, 5 Feb 2019 07:57:05 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 387401dc
 for <wireguard@lists.zx2c4.com>; Tue, 5 Feb 2019 07:57:05 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id t17so1601932vsc.8
 for <wireguard@lists.zx2c4.com>; Tue, 05 Feb 2019 00:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=I42hH+4dIPU3RMI2w6z6o30xrktro86P2dSHrZsYb3k=;
 b=c0z77SOEN7IzT9S7MKoEAOkouo/uZEt/ewOErJs3yu04ITmimNeGiqwonGcuVKWl4/
 WVOsF1m4FpKihUTEDmDfxEZNPUyMZBQktrf9k6L9qfEVZt42cxaRxptH0CvS0q/g53FI
 zrrhlUtKIerhwvHn/YjKqjKs91gC/Q0nV6gj00szwPbDKUNSLOpR/I3G7pYJ5fgAxvkG
 4JQA4KMksSHhsbKSwKubfADq+h83thoKrt5p+iwHlSIrswNh0xMIEUiwkLNyAFNK69e2
 O8iIq4kyw2iWwb6UTgNc+3te92WpWuEkhnP18F777R3p31pKL7QGpIsAs0+VAVwpt2gg
 0WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=I42hH+4dIPU3RMI2w6z6o30xrktro86P2dSHrZsYb3k=;
 b=EpChhz05S7QcIOFsyJg7p4DfaiH6oV8Ck4DVPkUTUA25svclXJYc62Zp9co8tgzbVo
 N7a4Y9KYJcDIv5L0pU+hkJHWPzOqQwG2mXmi5xo336YyXxfVbE7pF8PDTSkHPOfTxLax
 KpYbO4LAGNaW3rt1aoVLyJERyr7GM2dNu7ApR+erQop92voXwd0EsRID9tchQq6TIC44
 gGVfNdYU65xtaIdoq74lJONUXgBXqf8Jx61dqiFRB0YtrHjSzckm0MCpPsJW9WmoclOc
 yVCzfZza+hbBLam6ye2gNMsdnSLTt8h1qr7EbvTPvUGMJSnLXajAwQvnE9m/q6kvm+7Y
 01vw==
X-Gm-Message-State: AHQUAua6xWxA2TOK4GF76ZTLHytZh5MG8KhYqJo4KeRqSymnG8bew+L4
 byYoCUf+Ib+fxoVx09KsUSi31JnEkdJmMRHp4HKjSRaa
X-Google-Smtp-Source: AHgI3IYYHF2LXN+i22h8dSh/UDX4gYxgTyX+JFLIDAkVxoXBFnMPSILGZrRZTkVS3c4EyLJdqbDFa9gwpo+54hB/1/Q=
X-Received: by 2002:a67:b44:: with SMTP id 65mr1464981vsl.77.1549353827987;
 Tue, 05 Feb 2019 00:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20190123050425.1130-1-donkeysnore@gmail.com>
In-Reply-To: <20190123050425.1130-1-donkeysnore@gmail.com>
From: donkey snore <donkeysnore@gmail.com>
Date: Tue, 5 Feb 2019 17:00:38 +0900
Message-ID: <CAELRk9DGWFqxreCuCPe91bOt_pQ6Rh_Z2p6k+4cCN-x+bXPXWQ@mail.gmail.com>
Subject: Re: [PATCH] Cleanup include redundancy
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:22:13 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6556913857433270622=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6556913857433270622==
Content-Type: multipart/alternative; boundary="0000000000008c74090581210cac"

--0000000000008c74090581210cac
Content-Type: text/plain; charset="UTF-8"

This commit refers to todo list in
https://www.wireguard.com/todo/#fixup-includes. There are include
redundancy in wireguard and this commit consist of cleanup.  Finding
redundancy is analyzed  by using dependencies graph that doxygen produced.
And fix it until there are no redundancy. I'm not sure if it is the right
approach for this issue. Let me know what you think :)

On Wed, 23 Jan 2019 at 14:07, donkeysnore <donkeysnore@gmail.com> wrote:

> Signed-off-by: donkeysnore <donkeysnore@gmail.com>
> ---
>  src/allowedips.c                    |  1 -
>  src/cookie.c                        |  6 ------
>  src/crypto/zinc/blake2s/blake2s.c   |  3 ---
>  src/crypto/zinc/chacha20/chacha20.c |  1 -
>  src/crypto/zinc/poly1305/poly1305.c |  1 -
>  src/device.c                        |  3 ---
>  src/device.h                        |  3 ---
>  src/hashtables.c                    |  2 --
>  src/main.c                          |  2 --
>  src/messages.h                      |  1 -
>  src/netlink.c                       |  2 --
>  src/noise.c                         |  5 -----
>  src/noise.h                         |  3 ---
>  src/peer.c                          |  5 -----
>  src/peer.h                          |  5 -----
>  src/queueing.h                      |  4 ----
>  src/receive.c                       |  7 -------
>  src/send.c                          |  4 ----
>  src/socket.c                        |  5 -----
>  src/timers.c                        |  2 --
>  src/tools/config.c                  |  3 ---
>  src/tools/curve25519.c              |  1 -
>  src/tools/encoding.h                |  1 -
>  src/tools/genkey.c                  |  1 -
>  src/tools/ipc.c                     | 10 ----------
>  src/tools/set.c                     |  1 -
>  src/tools/setconf.c                 |  1 -
>  src/tools/show.c                    |  8 --------
>  src/tools/showconf.c                |  5 -----
>  29 files changed, 96 deletions(-)
>
> diff --git a/src/allowedips.c b/src/allowedips.c
> index 30b66f4..ace5ac7 100644
> --- a/src/allowedips.c
> +++ b/src/allowedips.c
> @@ -3,7 +3,6 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> -#include "allowedips.h"
>  #include "peer.h"
>
>  struct allowedips_node {
> diff --git a/src/cookie.c b/src/cookie.c
> index 97ab28a..f4095dc 100644
> --- a/src/cookie.c
> +++ b/src/cookie.c
> @@ -3,16 +3,10 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> -#include "cookie.h"
>  #include "peer.h"
> -#include "device.h"
> -#include "messages.h"
>  #include "ratelimiter.h"
>  #include "timers.h"
>
> -#include <zinc/blake2s.h>
> -#include <zinc/chacha20poly1305.h>
> -
>  #include <net/ipv6.h>
>  #include <crypto/algapi.h>
>
> diff --git a/src/crypto/zinc/blake2s/blake2s.c
> b/src/crypto/zinc/blake2s/blake2s.c
> index b881db0..c0c88ee 100644
> --- a/src/crypto/zinc/blake2s/blake2s.c
> +++ b/src/crypto/zinc/blake2s/blake2s.c
> @@ -12,12 +12,9 @@
>  #include <zinc/blake2s.h>
>  #include "../selftest/run.h"
>
> -#include <linux/types.h>
>  #include <linux/string.h>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> -#include <linux/bug.h>
>  #include <asm/unaligned.h>
>
>  typedef union {
> diff --git a/src/crypto/zinc/chacha20/chacha20.c
> b/src/crypto/zinc/chacha20/chacha20.c
> index b4763c8..6859c83 100644
> --- a/src/crypto/zinc/chacha20/chacha20.c
> +++ b/src/crypto/zinc/chacha20/chacha20.c
> @@ -10,7 +10,6 @@
>  #include <zinc/chacha20.h>
>  #include "../selftest/run.h"
>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/vmalloc.h>
> diff --git a/src/crypto/zinc/poly1305/poly1305.c
> b/src/crypto/zinc/poly1305/poly1305.c
> index 7d373b9..c476719 100644
> --- a/src/crypto/zinc/poly1305/poly1305.c
> +++ b/src/crypto/zinc/poly1305/poly1305.c
> @@ -11,7 +11,6 @@
>  #include "../selftest/run.h"
>
>  #include <asm/unaligned.h>
> -#include <linux/kernel.h>
>  #include <linux/string.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> diff --git a/src/device.c b/src/device.c
> index 98c05bc..e1f6bb0 100644
> --- a/src/device.c
> +++ b/src/device.c
> @@ -6,15 +6,12 @@
>  #include "queueing.h"
>  #include "socket.h"
>  #include "timers.h"
> -#include "device.h"
>  #include "ratelimiter.h"
> -#include "peer.h"
>  #include "messages.h"
>
>  #include <linux/module.h>
>  #include <linux/rtnetlink.h>
>  #include <linux/inet.h>
> -#include <linux/netdevice.h>
>  #include <linux/inetdevice.h>
>  #include <linux/if_arp.h>
>  #include <linux/icmp.h>
> diff --git a/src/device.h b/src/device.h
> index b85638c..c53c463 100644
> --- a/src/device.h
> +++ b/src/device.h
> @@ -8,13 +8,10 @@
>
>  #include "noise.h"
>  #include "allowedips.h"
> -#include "hashtables.h"
>  #include "cookie.h"
>
> -#include <linux/types.h>
>  #include <linux/netdevice.h>
>  #include <linux/workqueue.h>
> -#include <linux/mutex.h>
>  #include <linux/net.h>
>  #include <linux/ptr_ring.h>
>
> diff --git a/src/hashtables.c b/src/hashtables.c
> index 18cac91..242f27d 100644
> --- a/src/hashtables.c
> +++ b/src/hashtables.c
> @@ -3,9 +3,7 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> -#include "hashtables.h"
>  #include "peer.h"
> -#include "noise.h"
>
>  static struct hlist_head *pubkey_bucket(struct pubkey_hashtable *table,
>                                         const u8
> pubkey[NOISE_PUBLIC_KEY_LEN])
> diff --git a/src/main.c b/src/main.c
> index 4b5b58e..7aa3e97 100644
> --- a/src/main.c
> +++ b/src/main.c
> @@ -4,8 +4,6 @@
>   */
>
>  #include "version.h"
> -#include "device.h"
> -#include "noise.h"
>  #include "queueing.h"
>  #include "ratelimiter.h"
>  #include "netlink.h"
> diff --git a/src/messages.h b/src/messages.h
> index 3cfd1c5..c8d6d76 100644
> --- a/src/messages.h
> +++ b/src/messages.h
> @@ -10,7 +10,6 @@
>  #include <zinc/chacha20poly1305.h>
>  #include <zinc/blake2s.h>
>
> -#include <linux/kernel.h>
>  #include <linux/param.h>
>  #include <linux/skbuff.h>
>
> diff --git a/src/netlink.c b/src/netlink.c
> index bdd3150..0bac1d0 100644
> --- a/src/netlink.c
> +++ b/src/netlink.c
> @@ -4,11 +4,9 @@
>   */
>
>  #include "netlink.h"
> -#include "device.h"
>  #include "peer.h"
>  #include "socket.h"
>  #include "queueing.h"
> -#include "messages.h"
>  #include "uapi/wireguard.h"
>  #include <linux/if.h>
>  #include <net/genetlink.h>
> diff --git a/src/noise.c b/src/noise.c
> index e629307..1efddd8 100644
> --- a/src/noise.c
> +++ b/src/noise.c
> @@ -3,12 +3,7 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> -#include "noise.h"
> -#include "device.h"
> -#include "peer.h"
> -#include "messages.h"
>  #include "queueing.h"
> -#include "hashtables.h"
>
>  #include <linux/rcupdate.h>
>  #include <linux/slab.h>
> diff --git a/src/noise.h b/src/noise.h
> index 8e5cc0a..7ad0cfc 100644
> --- a/src/noise.h
> +++ b/src/noise.h
> @@ -5,14 +5,11 @@
>  #ifndef _WG_NOISE_H
>  #define _WG_NOISE_H
>
> -#include "messages.h"
>  #include "hashtables.h"
>
> -#include <linux/types.h>
>  #include <linux/spinlock.h>
>  #include <linux/atomic.h>
>  #include <linux/rwsem.h>
> -#include <linux/mutex.h>
>  #include <linux/ktime.h>
>  #include <linux/kref.h>
>
> diff --git a/src/peer.c b/src/peer.c
> index 020a97b..778c4fc 100644
> --- a/src/peer.c
> +++ b/src/peer.c
> @@ -3,14 +3,9 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> -#include "peer.h"
> -#include "device.h"
>  #include "queueing.h"
>  #include "timers.h"
> -#include "hashtables.h"
> -#include "noise.h"
>
> -#include <linux/kref.h>
>  #include <linux/lockdep.h>
>  #include <linux/rcupdate.h>
>  #include <linux/list.h>
> diff --git a/src/peer.h b/src/peer.h
> index f3cf255..996afe6 100644
> --- a/src/peer.h
> +++ b/src/peer.h
> @@ -7,13 +7,8 @@
>  #define _WG_PEER_H
>
>  #include "device.h"
> -#include "noise.h"
> -#include "cookie.h"
>
> -#include <linux/types.h>
>  #include <linux/netfilter.h>
> -#include <linux/spinlock.h>
> -#include <linux/kref.h>
>  #include <net/dst_cache.h>
>
>  struct wg_device;
> diff --git a/src/queueing.h b/src/queueing.h
> index d2866aa..ae35660 100644
> --- a/src/queueing.h
> +++ b/src/queueing.h
> @@ -7,10 +7,6 @@
>  #define _WG_QUEUEING_H
>
>  #include "peer.h"
> -#include <linux/types.h>
> -#include <linux/skbuff.h>
> -#include <linux/ip.h>
> -#include <linux/ipv6.h>
>
>  struct wg_device;
>  struct wg_peer;
> diff --git a/src/receive.c b/src/receive.c
> index 693ec57..a7db35e 100644
> --- a/src/receive.c
> +++ b/src/receive.c
> @@ -4,17 +4,10 @@
>   */
>
>  #include "queueing.h"
> -#include "device.h"
> -#include "peer.h"
>  #include "timers.h"
> -#include "messages.h"
> -#include "cookie.h"
>  #include "socket.h"
>
>  #include <linux/simd.h>
> -#include <linux/ip.h>
> -#include <linux/ipv6.h>
> -#include <linux/udp.h>
>  #include <net/ip_tunnels.h>
>
>  /* Must be called with bh disabled. */
> diff --git a/src/send.c b/src/send.c
> index b0df5c7..c928367 100644
> --- a/src/send.c
> +++ b/src/send.c
> @@ -5,11 +5,7 @@
>
>  #include "queueing.h"
>  #include "timers.h"
> -#include "device.h"
> -#include "peer.h"
>  #include "socket.h"
> -#include "messages.h"
> -#include "cookie.h"
>
>  #include <linux/simd.h>
>  #include <linux/uio.h>
> diff --git a/src/socket.c b/src/socket.c
> index 652d798..d93df29 100644
> --- a/src/socket.c
> +++ b/src/socket.c
> @@ -3,16 +3,11 @@
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
> Rights Reserved.
>   */
>
> -#include "device.h"
>  #include "peer.h"
>  #include "socket.h"
>  #include "queueing.h"
> -#include "messages.h"
>
>  #include <linux/ctype.h>
> -#include <linux/net.h>
> -#include <linux/if_vlan.h>
> -#include <linux/if_ether.h>
>  #include <linux/inetdevice.h>
>  #include <net/udp_tunnel.h>
>  #include <net/ipv6.h>
> diff --git a/src/timers.c b/src/timers.c
> index ee16c56..f2ad4f6 100644
> --- a/src/timers.c
> +++ b/src/timers.c
> @@ -4,8 +4,6 @@
>   */
>
>  #include "timers.h"
> -#include "device.h"
> -#include "peer.h"
>  #include "queueing.h"
>  #include "socket.h"
>
> diff --git a/src/tools/config.c b/src/tools/config.c
> index 5d15356..360721b 100644
> --- a/src/tools/config.c
> +++ b/src/tools/config.c
> @@ -8,15 +8,12 @@
>  #include <ctype.h>
>  #include <netdb.h>
>  #include <stdio.h>
> -#include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> -#include <sys/socket.h>
>  #include <sys/stat.h>
>  #include <errno.h>
>
>  #include "config.h"
> -#include "containers.h"
>  #include "ipc.h"
>  #include "encoding.h"
>
> diff --git a/src/tools/curve25519.c b/src/tools/curve25519.c
> index 7949933..609ff6e 100644
> --- a/src/tools/curve25519.c
> +++ b/src/tools/curve25519.c
> @@ -5,7 +5,6 @@
>
>  #include "curve25519.h"
>
> -#include <stdint.h>
>  #include <string.h>
>
>  #ifndef __BYTE_ORDER__
> diff --git a/src/tools/encoding.h b/src/tools/encoding.h
> index f977ee9..41a2fb2 100644
> --- a/src/tools/encoding.h
> +++ b/src/tools/encoding.h
> @@ -7,7 +7,6 @@
>  #define ENCODING_H
>
>  #include <stdbool.h>
> -#include <stdint.h>
>  #include "containers.h"
>
>  #define WG_KEY_LEN_BASE64 ((((WG_KEY_LEN) + 2) / 3) * 4 + 1)
> diff --git a/src/tools/genkey.c b/src/tools/genkey.c
> index 65711e1..c3d2642 100644
> --- a/src/tools/genkey.c
> +++ b/src/tools/genkey.c
> @@ -6,7 +6,6 @@
>  #include <errno.h>
>  #include <stdio.h>
>  #include <unistd.h>
> -#include <sys/types.h>
>  #include <sys/stat.h>
>  #include <string.h>
>  #include <fcntl.h>
> diff --git a/src/tools/ipc.c b/src/tools/ipc.c
> index da31eff..e22a9a5 100644
> --- a/src/tools/ipc.c
> +++ b/src/tools/ipc.c
> @@ -11,34 +11,24 @@
>  #include <linux/genetlink.h>
>  #include "mnlg.h"
>  #endif
> -#include <netinet/in.h>
> -#include <sys/socket.h>
> -#include <net/if.h>
>  #include <errno.h>
> -#include <stdbool.h>
>  #include <stddef.h>
>  #include <stdio.h>
> -#include <stdlib.h>
>  #include <string.h>
>  #include <ctype.h>
>  #include <unistd.h>
> -#include <time.h>
>  #include <dirent.h>
>  #include <signal.h>
>  #include <netdb.h>
>  #include <limits.h>
> -#include <sys/types.h>
>  #include <sys/ioctl.h>
> -#include <sys/types.h>
>  #include <sys/stat.h>
>  #include <sys/un.h>
>  #include <arpa/inet.h>
>
>  #include "ipc.h"
> -#include "containers.h"
>  #include "encoding.h"
>  #include "curve25519.h"
> -#include "../uapi/wireguard.h"
>
>  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
>  #define SOCK_SUFFIX ".sock"
> diff --git a/src/tools/set.c b/src/tools/set.c
> index 19f4b92..f50f368 100644
> --- a/src/tools/set.c
> +++ b/src/tools/set.c
> @@ -4,7 +4,6 @@
>   */
>
>  #include <stdio.h>
> -#include <stdlib.h>
>  #include <string.h>
>
>  #include "containers.h"
> diff --git a/src/tools/setconf.c b/src/tools/setconf.c
> index 8211ebd..7a0295a 100644
> --- a/src/tools/setconf.c
> +++ b/src/tools/setconf.c
> @@ -5,7 +5,6 @@
>
>  #include <stddef.h>
>  #include <stdio.h>
> -#include <stdlib.h>
>  #include <string.h>
>
>  #include "containers.h"
> diff --git a/src/tools/show.c b/src/tools/show.c
> index ba6f115..870860d 100644
> --- a/src/tools/show.c
> +++ b/src/tools/show.c
> @@ -5,20 +5,12 @@
>
>  #include <arpa/inet.h>
>  #include <inttypes.h>
> -#include <netinet/in.h>
> -#include <sys/socket.h>
> -#include <net/if.h>
> -#include <stdbool.h>
>  #include <stddef.h>
> -#include <stdint.h>
> -#include <stdlib.h>
>  #include <stdio.h>
>  #include <string.h>
>  #include <errno.h>
> -#include <time.h>
>  #include <netdb.h>
>
> -#include "containers.h"
>  #include "ipc.h"
>  #include "terminal.h"
>  #include "encoding.h"
> diff --git a/src/tools/showconf.c b/src/tools/showconf.c
> index ad76b7f..a57985f 100644
> --- a/src/tools/showconf.c
> +++ b/src/tools/showconf.c
> @@ -4,16 +4,11 @@
>   */
>
>  #include <arpa/inet.h>
> -#include <netinet/in.h>
> -#include <sys/socket.h>
> -#include <net/if.h>
>  #include <stddef.h>
>  #include <stdio.h>
>  #include <string.h>
> -#include <stdlib.h>
>  #include <netdb.h>
>
> -#include "containers.h"
>  #include "encoding.h"
>  #include "ipc.h"
>  #include "subcommands.h"
> --
> 2.17.1
>
>

--0000000000008c74090581210cac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This commit refers to todo list in=C2=A0<=
a href=3D"https://www.wireguard.com/todo/#fixup-includes">https://www.wireg=
uard.com/todo/#fixup-includes</a>. There are include redundancy in wireguar=
d and this commit consist of cleanup.=C2=A0 Finding redundancy is analyzed=
=C2=A0 by using dependencies graph that doxygen produced. And fix it until =
there are no redundancy. I&#39;m not sure if it is the right approach for t=
his issue. Let me know what you think :)</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 23 Jan 2019 at 14:07,=
 donkeysnore &lt;<a href=3D"mailto:donkeysnore@gmail.com">donkeysnore@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Signed-off-by: donkeysnore &lt;<a href=3D"mailto:donkeysnore@gmail.com"=
 target=3D"_blank">donkeysnore@gmail.com</a>&gt;<br>
---<br>
=C2=A0src/allowedips.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0src/cookie.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ------<br>
=C2=A0src/crypto/zinc/blake2s/blake2s.c=C2=A0 =C2=A0|=C2=A0 3 ---<br>
=C2=A0src/crypto/zinc/chacha20/chacha20.c |=C2=A0 1 -<br>
=C2=A0src/crypto/zinc/poly1305/poly1305.c |=C2=A0 1 -<br>
=C2=A0src/device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ---<br>
=C2=A0src/device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ---<br>
=C2=A0src/hashtables.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0src/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0src/messages.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0src/netlink.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0src/noise.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 -----<br>
=C2=A0src/noise.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>
=C2=A0src/peer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 -----<br>
=C2=A0src/peer.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 -----<br>
=C2=A0src/queueing.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
=C2=A0src/receive.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 -------<br>
=C2=A0src/send.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
=C2=A0src/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 -----<br>
=C2=A0src/timers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0src/tools/config.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 ---<br>
=C2=A0src/tools/curve25519.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 -<br>
=C2=A0src/tools/encoding.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0src/tools/genkey.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0src/tools/ipc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 ----------<br>
=C2=A0src/tools/set.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0src/tools/setconf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0src/tools/show.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 --------<br>
=C2=A0src/tools/showconf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 -----<br>
=C2=A029 files changed, 96 deletions(-)<br>
<br>
diff --git a/src/allowedips.c b/src/allowedips.c<br>
index 30b66f4..ace5ac7 100644<br>
--- a/src/allowedips.c<br>
+++ b/src/allowedips.c<br>
@@ -3,7 +3,6 @@<br>
=C2=A0 * Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;. All Rights Reser=
ved.<br>
=C2=A0 */<br>
<br>
-#include &quot;allowedips.h&quot;<br>
=C2=A0#include &quot;peer.h&quot;<br>
<br>
=C2=A0struct allowedips_node {<br>
diff --git a/src/cookie.c b/src/cookie.c<br>
index 97ab28a..f4095dc 100644<br>
--- a/src/cookie.c<br>
+++ b/src/cookie.c<br>
@@ -3,16 +3,10 @@<br>
=C2=A0 * Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;. All Rights Reser=
ved.<br>
=C2=A0 */<br>
<br>
-#include &quot;cookie.h&quot;<br>
=C2=A0#include &quot;peer.h&quot;<br>
-#include &quot;device.h&quot;<br>
-#include &quot;messages.h&quot;<br>
=C2=A0#include &quot;ratelimiter.h&quot;<br>
=C2=A0#include &quot;timers.h&quot;<br>
<br>
-#include &lt;zinc/blake2s.h&gt;<br>
-#include &lt;zinc/chacha20poly1305.h&gt;<br>
-<br>
=C2=A0#include &lt;net/ipv6.h&gt;<br>
=C2=A0#include &lt;crypto/algapi.h&gt;<br>
<br>
diff --git a/src/crypto/zinc/blake2s/blake2s.c b/src/crypto/zinc/blake2s/bl=
ake2s.c<br>
index b881db0..c0c88ee 100644<br>
--- a/src/crypto/zinc/blake2s/blake2s.c<br>
+++ b/src/crypto/zinc/blake2s/blake2s.c<br>
@@ -12,12 +12,9 @@<br>
=C2=A0#include &lt;zinc/blake2s.h&gt;<br>
=C2=A0#include &quot;../selftest/run.h&quot;<br>
<br>
-#include &lt;linux/types.h&gt;<br>
=C2=A0#include &lt;linux/string.h&gt;<br>
-#include &lt;linux/kernel.h&gt;<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/init.h&gt;<br>
-#include &lt;linux/bug.h&gt;<br>
=C2=A0#include &lt;asm/unaligned.h&gt;<br>
<br>
=C2=A0typedef union {<br>
diff --git a/src/crypto/zinc/chacha20/chacha20.c b/src/crypto/zinc/chacha20=
/chacha20.c<br>
index b4763c8..6859c83 100644<br>
--- a/src/crypto/zinc/chacha20/chacha20.c<br>
+++ b/src/crypto/zinc/chacha20/chacha20.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0#include &lt;zinc/chacha20.h&gt;<br>
=C2=A0#include &quot;../selftest/run.h&quot;<br>
<br>
-#include &lt;linux/kernel.h&gt;<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/init.h&gt;<br>
=C2=A0#include &lt;linux/vmalloc.h&gt;<br>
diff --git a/src/crypto/zinc/poly1305/poly1305.c b/src/crypto/zinc/poly1305=
/poly1305.c<br>
index 7d373b9..c476719 100644<br>
--- a/src/crypto/zinc/poly1305/poly1305.c<br>
+++ b/src/crypto/zinc/poly1305/poly1305.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0#include &quot;../selftest/run.h&quot;<br>
<br>
=C2=A0#include &lt;asm/unaligned.h&gt;<br>
-#include &lt;linux/kernel.h&gt;<br>
=C2=A0#include &lt;linux/string.h&gt;<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/init.h&gt;<br>
diff --git a/src/device.c b/src/device.c<br>
index 98c05bc..e1f6bb0 100644<br>
--- a/src/device.c<br>
+++ b/src/device.c<br>
@@ -6,15 +6,12 @@<br>
=C2=A0#include &quot;queueing.h&quot;<br>
=C2=A0#include &quot;socket.h&quot;<br>
=C2=A0#include &quot;timers.h&quot;<br>
-#include &quot;device.h&quot;<br>
=C2=A0#include &quot;ratelimiter.h&quot;<br>
-#include &quot;peer.h&quot;<br>
=C2=A0#include &quot;messages.h&quot;<br>
<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/rtnetlink.h&gt;<br>
=C2=A0#include &lt;linux/inet.h&gt;<br>
-#include &lt;linux/netdevice.h&gt;<br>
=C2=A0#include &lt;linux/inetdevice.h&gt;<br>
=C2=A0#include &lt;linux/if_arp.h&gt;<br>
=C2=A0#include &lt;linux/icmp.h&gt;<br>
diff --git a/src/device.h b/src/device.h<br>
index b85638c..c53c463 100644<br>
--- a/src/device.h<br>
+++ b/src/device.h<br>
@@ -8,13 +8,10 @@<br>
<br>
=C2=A0#include &quot;noise.h&quot;<br>
=C2=A0#include &quot;allowedips.h&quot;<br>
-#include &quot;hashtables.h&quot;<br>
=C2=A0#include &quot;cookie.h&quot;<br>
<br>
-#include &lt;linux/types.h&gt;<br>
=C2=A0#include &lt;linux/netdevice.h&gt;<br>
=C2=A0#include &lt;linux/workqueue.h&gt;<br>
-#include &lt;linux/mutex.h&gt;<br>
=C2=A0#include &lt;linux/net.h&gt;<br>
=C2=A0#include &lt;linux/ptr_ring.h&gt;<br>
<br>
diff --git a/src/hashtables.c b/src/hashtables.c<br>
index 18cac91..242f27d 100644<br>
--- a/src/hashtables.c<br>
+++ b/src/hashtables.c<br>
@@ -3,9 +3,7 @@<br>
=C2=A0 * Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;. All Rights Reser=
ved.<br>
=C2=A0 */<br>
<br>
-#include &quot;hashtables.h&quot;<br>
=C2=A0#include &quot;peer.h&quot;<br>
-#include &quot;noise.h&quot;<br>
<br>
=C2=A0static struct hlist_head *pubkey_bucket(struct pubkey_hashtable *tabl=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const u8=
 pubkey[NOISE_PUBLIC_KEY_LEN])<br>
diff --git a/src/main.c b/src/main.c<br>
index 4b5b58e..7aa3e97 100644<br>
--- a/src/main.c<br>
+++ b/src/main.c<br>
@@ -4,8 +4,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;version.h&quot;<br>
-#include &quot;device.h&quot;<br>
-#include &quot;noise.h&quot;<br>
=C2=A0#include &quot;queueing.h&quot;<br>
=C2=A0#include &quot;ratelimiter.h&quot;<br>
=C2=A0#include &quot;netlink.h&quot;<br>
diff --git a/src/messages.h b/src/messages.h<br>
index 3cfd1c5..c8d6d76 100644<br>
--- a/src/messages.h<br>
+++ b/src/messages.h<br>
@@ -10,7 +10,6 @@<br>
=C2=A0#include &lt;zinc/chacha20poly1305.h&gt;<br>
=C2=A0#include &lt;zinc/blake2s.h&gt;<br>
<br>
-#include &lt;linux/kernel.h&gt;<br>
=C2=A0#include &lt;linux/param.h&gt;<br>
=C2=A0#include &lt;linux/skbuff.h&gt;<br>
<br>
diff --git a/src/netlink.c b/src/netlink.c<br>
index bdd3150..0bac1d0 100644<br>
--- a/src/netlink.c<br>
+++ b/src/netlink.c<br>
@@ -4,11 +4,9 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;netlink.h&quot;<br>
-#include &quot;device.h&quot;<br>
=C2=A0#include &quot;peer.h&quot;<br>
=C2=A0#include &quot;socket.h&quot;<br>
=C2=A0#include &quot;queueing.h&quot;<br>
-#include &quot;messages.h&quot;<br>
=C2=A0#include &quot;uapi/wireguard.h&quot;<br>
=C2=A0#include &lt;linux/if.h&gt;<br>
=C2=A0#include &lt;net/genetlink.h&gt;<br>
diff --git a/src/noise.c b/src/noise.c<br>
index e629307..1efddd8 100644<br>
--- a/src/noise.c<br>
+++ b/src/noise.c<br>
@@ -3,12 +3,7 @@<br>
=C2=A0 * Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;. All Rights Reser=
ved.<br>
=C2=A0 */<br>
<br>
-#include &quot;noise.h&quot;<br>
-#include &quot;device.h&quot;<br>
-#include &quot;peer.h&quot;<br>
-#include &quot;messages.h&quot;<br>
=C2=A0#include &quot;queueing.h&quot;<br>
-#include &quot;hashtables.h&quot;<br>
<br>
=C2=A0#include &lt;linux/rcupdate.h&gt;<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
diff --git a/src/noise.h b/src/noise.h<br>
index 8e5cc0a..7ad0cfc 100644<br>
--- a/src/noise.h<br>
+++ b/src/noise.h<br>
@@ -5,14 +5,11 @@<br>
=C2=A0#ifndef _WG_NOISE_H<br>
=C2=A0#define _WG_NOISE_H<br>
<br>
-#include &quot;messages.h&quot;<br>
=C2=A0#include &quot;hashtables.h&quot;<br>
<br>
-#include &lt;linux/types.h&gt;<br>
=C2=A0#include &lt;linux/spinlock.h&gt;<br>
=C2=A0#include &lt;linux/atomic.h&gt;<br>
=C2=A0#include &lt;linux/rwsem.h&gt;<br>
-#include &lt;linux/mutex.h&gt;<br>
=C2=A0#include &lt;linux/ktime.h&gt;<br>
=C2=A0#include &lt;linux/kref.h&gt;<br>
<br>
diff --git a/src/peer.c b/src/peer.c<br>
index 020a97b..778c4fc 100644<br>
--- a/src/peer.c<br>
+++ b/src/peer.c<br>
@@ -3,14 +3,9 @@<br>
=C2=A0 * Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;. All Rights Reser=
ved.<br>
=C2=A0 */<br>
<br>
-#include &quot;peer.h&quot;<br>
-#include &quot;device.h&quot;<br>
=C2=A0#include &quot;queueing.h&quot;<br>
=C2=A0#include &quot;timers.h&quot;<br>
-#include &quot;hashtables.h&quot;<br>
-#include &quot;noise.h&quot;<br>
<br>
-#include &lt;linux/kref.h&gt;<br>
=C2=A0#include &lt;linux/lockdep.h&gt;<br>
=C2=A0#include &lt;linux/rcupdate.h&gt;<br>
=C2=A0#include &lt;linux/list.h&gt;<br>
diff --git a/src/peer.h b/src/peer.h<br>
index f3cf255..996afe6 100644<br>
--- a/src/peer.h<br>
+++ b/src/peer.h<br>
@@ -7,13 +7,8 @@<br>
=C2=A0#define _WG_PEER_H<br>
<br>
=C2=A0#include &quot;device.h&quot;<br>
-#include &quot;noise.h&quot;<br>
-#include &quot;cookie.h&quot;<br>
<br>
-#include &lt;linux/types.h&gt;<br>
=C2=A0#include &lt;linux/netfilter.h&gt;<br>
-#include &lt;linux/spinlock.h&gt;<br>
-#include &lt;linux/kref.h&gt;<br>
=C2=A0#include &lt;net/dst_cache.h&gt;<br>
<br>
=C2=A0struct wg_device;<br>
diff --git a/src/queueing.h b/src/queueing.h<br>
index d2866aa..ae35660 100644<br>
--- a/src/queueing.h<br>
+++ b/src/queueing.h<br>
@@ -7,10 +7,6 @@<br>
=C2=A0#define _WG_QUEUEING_H<br>
<br>
=C2=A0#include &quot;peer.h&quot;<br>
-#include &lt;linux/types.h&gt;<br>
-#include &lt;linux/skbuff.h&gt;<br>
-#include &lt;linux/ip.h&gt;<br>
-#include &lt;linux/ipv6.h&gt;<br>
<br>
=C2=A0struct wg_device;<br>
=C2=A0struct wg_peer;<br>
diff --git a/src/receive.c b/src/receive.c<br>
index 693ec57..a7db35e 100644<br>
--- a/src/receive.c<br>
+++ b/src/receive.c<br>
@@ -4,17 +4,10 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;queueing.h&quot;<br>
-#include &quot;device.h&quot;<br>
-#include &quot;peer.h&quot;<br>
=C2=A0#include &quot;timers.h&quot;<br>
-#include &quot;messages.h&quot;<br>
-#include &quot;cookie.h&quot;<br>
=C2=A0#include &quot;socket.h&quot;<br>
<br>
=C2=A0#include &lt;linux/simd.h&gt;<br>
-#include &lt;linux/ip.h&gt;<br>
-#include &lt;linux/ipv6.h&gt;<br>
-#include &lt;linux/udp.h&gt;<br>
=C2=A0#include &lt;net/ip_tunnels.h&gt;<br>
<br>
=C2=A0/* Must be called with bh disabled. */<br>
diff --git a/src/send.c b/src/send.c<br>
index b0df5c7..c928367 100644<br>
--- a/src/send.c<br>
+++ b/src/send.c<br>
@@ -5,11 +5,7 @@<br>
<br>
=C2=A0#include &quot;queueing.h&quot;<br>
=C2=A0#include &quot;timers.h&quot;<br>
-#include &quot;device.h&quot;<br>
-#include &quot;peer.h&quot;<br>
=C2=A0#include &quot;socket.h&quot;<br>
-#include &quot;messages.h&quot;<br>
-#include &quot;cookie.h&quot;<br>
<br>
=C2=A0#include &lt;linux/simd.h&gt;<br>
=C2=A0#include &lt;linux/uio.h&gt;<br>
diff --git a/src/socket.c b/src/socket.c<br>
index 652d798..d93df29 100644<br>
--- a/src/socket.c<br>
+++ b/src/socket.c<br>
@@ -3,16 +3,11 @@<br>
=C2=A0 * Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;. All Rights Reser=
ved.<br>
=C2=A0 */<br>
<br>
-#include &quot;device.h&quot;<br>
=C2=A0#include &quot;peer.h&quot;<br>
=C2=A0#include &quot;socket.h&quot;<br>
=C2=A0#include &quot;queueing.h&quot;<br>
-#include &quot;messages.h&quot;<br>
<br>
=C2=A0#include &lt;linux/ctype.h&gt;<br>
-#include &lt;linux/net.h&gt;<br>
-#include &lt;linux/if_vlan.h&gt;<br>
-#include &lt;linux/if_ether.h&gt;<br>
=C2=A0#include &lt;linux/inetdevice.h&gt;<br>
=C2=A0#include &lt;net/udp_tunnel.h&gt;<br>
=C2=A0#include &lt;net/ipv6.h&gt;<br>
diff --git a/src/timers.c b/src/timers.c<br>
index ee16c56..f2ad4f6 100644<br>
--- a/src/timers.c<br>
+++ b/src/timers.c<br>
@@ -4,8 +4,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;timers.h&quot;<br>
-#include &quot;device.h&quot;<br>
-#include &quot;peer.h&quot;<br>
=C2=A0#include &quot;queueing.h&quot;<br>
=C2=A0#include &quot;socket.h&quot;<br>
<br>
diff --git a/src/tools/config.c b/src/tools/config.c<br>
index 5d15356..360721b 100644<br>
--- a/src/tools/config.c<br>
+++ b/src/tools/config.c<br>
@@ -8,15 +8,12 @@<br>
=C2=A0#include &lt;ctype.h&gt;<br>
=C2=A0#include &lt;netdb.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
-#include &lt;sys/socket.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
<br>
=C2=A0#include &quot;config.h&quot;<br>
-#include &quot;containers.h&quot;<br>
=C2=A0#include &quot;ipc.h&quot;<br>
=C2=A0#include &quot;encoding.h&quot;<br>
<br>
diff --git a/src/tools/curve25519.c b/src/tools/curve25519.c<br>
index 7949933..609ff6e 100644<br>
--- a/src/tools/curve25519.c<br>
+++ b/src/tools/curve25519.c<br>
@@ -5,7 +5,6 @@<br>
<br>
=C2=A0#include &quot;curve25519.h&quot;<br>
<br>
-#include &lt;stdint.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
<br>
=C2=A0#ifndef __BYTE_ORDER__<br>
diff --git a/src/tools/encoding.h b/src/tools/encoding.h<br>
index f977ee9..41a2fb2 100644<br>
--- a/src/tools/encoding.h<br>
+++ b/src/tools/encoding.h<br>
@@ -7,7 +7,6 @@<br>
=C2=A0#define ENCODING_H<br>
<br>
=C2=A0#include &lt;stdbool.h&gt;<br>
-#include &lt;stdint.h&gt;<br>
=C2=A0#include &quot;containers.h&quot;<br>
<br>
=C2=A0#define WG_KEY_LEN_BASE64 ((((WG_KEY_LEN) + 2) / 3) * 4 + 1)<br>
diff --git a/src/tools/genkey.c b/src/tools/genkey.c<br>
index 65711e1..c3d2642 100644<br>
--- a/src/tools/genkey.c<br>
+++ b/src/tools/genkey.c<br>
@@ -6,7 +6,6 @@<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
-#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
diff --git a/src/tools/ipc.c b/src/tools/ipc.c<br>
index da31eff..e22a9a5 100644<br>
--- a/src/tools/ipc.c<br>
+++ b/src/tools/ipc.c<br>
@@ -11,34 +11,24 @@<br>
=C2=A0#include &lt;linux/genetlink.h&gt;<br>
=C2=A0#include &quot;mnlg.h&quot;<br>
=C2=A0#endif<br>
-#include &lt;netinet/in.h&gt;<br>
-#include &lt;sys/socket.h&gt;<br>
-#include &lt;net/if.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
-#include &lt;stdbool.h&gt;<br>
=C2=A0#include &lt;stddef.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;ctype.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
-#include &lt;time.h&gt;<br>
=C2=A0#include &lt;dirent.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
=C2=A0#include &lt;netdb.h&gt;<br>
=C2=A0#include &lt;limits.h&gt;<br>
-#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
-#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &lt;sys/un.h&gt;<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
<br>
=C2=A0#include &quot;ipc.h&quot;<br>
-#include &quot;containers.h&quot;<br>
=C2=A0#include &quot;encoding.h&quot;<br>
=C2=A0#include &quot;curve25519.h&quot;<br>
-#include &quot;../uapi/wireguard.h&quot;<br>
<br>
=C2=A0#define SOCK_PATH RUNSTATEDIR &quot;/wireguard/&quot;<br>
=C2=A0#define SOCK_SUFFIX &quot;.sock&quot;<br>
diff --git a/src/tools/set.c b/src/tools/set.c<br>
index 19f4b92..f50f368 100644<br>
--- a/src/tools/set.c<br>
+++ b/src/tools/set.c<br>
@@ -4,7 +4,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &lt;stdio.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
<br>
=C2=A0#include &quot;containers.h&quot;<br>
diff --git a/src/tools/setconf.c b/src/tools/setconf.c<br>
index 8211ebd..7a0295a 100644<br>
--- a/src/tools/setconf.c<br>
+++ b/src/tools/setconf.c<br>
@@ -5,7 +5,6 @@<br>
<br>
=C2=A0#include &lt;stddef.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
<br>
=C2=A0#include &quot;containers.h&quot;<br>
diff --git a/src/tools/show.c b/src/tools/show.c<br>
index ba6f115..870860d 100644<br>
--- a/src/tools/show.c<br>
+++ b/src/tools/show.c<br>
@@ -5,20 +5,12 @@<br>
<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
=C2=A0#include &lt;inttypes.h&gt;<br>
-#include &lt;netinet/in.h&gt;<br>
-#include &lt;sys/socket.h&gt;<br>
-#include &lt;net/if.h&gt;<br>
-#include &lt;stdbool.h&gt;<br>
=C2=A0#include &lt;stddef.h&gt;<br>
-#include &lt;stdint.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
-#include &lt;time.h&gt;<br>
=C2=A0#include &lt;netdb.h&gt;<br>
<br>
-#include &quot;containers.h&quot;<br>
=C2=A0#include &quot;ipc.h&quot;<br>
=C2=A0#include &quot;terminal.h&quot;<br>
=C2=A0#include &quot;encoding.h&quot;<br>
diff --git a/src/tools/showconf.c b/src/tools/showconf.c<br>
index ad76b7f..a57985f 100644<br>
--- a/src/tools/showconf.c<br>
+++ b/src/tools/showconf.c<br>
@@ -4,16 +4,11 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
-#include &lt;netinet/in.h&gt;<br>
-#include &lt;sys/socket.h&gt;<br>
-#include &lt;net/if.h&gt;<br>
=C2=A0#include &lt;stddef.h&gt;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;netdb.h&gt;<br>
<br>
-#include &quot;containers.h&quot;<br>
=C2=A0#include &quot;encoding.h&quot;<br>
=C2=A0#include &quot;ipc.h&quot;<br>
=C2=A0#include &quot;subcommands.h&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000008c74090581210cac--

--===============6556913857433270622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6556913857433270622==--
