Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB9C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaa96de8;
	Tue, 20 May 2025 19:42:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 099e3908
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Mar 2025 16:59:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 310345C5944;
 Wed, 19 Mar 2025 16:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4FAC4CEE4;
 Wed, 19 Mar 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Tq66VM76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1742403561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uf/p7VlVNzQ814HdQ3t8Ub9K7Z0QRnEkUpNVCIzegLU=;
 b=Tq66VM76yopfaCOE3UPF1qlAPt1DsX2zUYDHrSNummG1xYmOUI7d8Ewg8pRwES15HaorQh
 bAv7+5B4aGoERuQIVOXGVzyCehOPPd1G3/XdxZzpA0ux+Kqg6s8VIUj2UF3RS5Dwklc4og
 pWkNWnxxVysrGgrmfc8P7GhTYzMigRg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a205e8a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 19 Mar 2025 16:59:20 +0000 (UTC)
Date: Wed, 19 Mar 2025 17:59:16 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Dmitrii Ermakov <demonihin@gmail.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] wireguard: use rhashtables instead of hashtables
Message-ID: <Z9r35H2rfLV8m5iW@zx2c4.com>
References: <20250105110036.70720-2-demonihin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105110036.70720-2-demonihin@gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Jan 05, 2025 at 12:00:17PM +0100, Dmitrii Ermakov wrote:
> @@ -74,7 +75,6 @@ struct noise_handshake {
>  	u8 remote_static[NOISE_PUBLIC_KEY_LEN];
>  	u8 remote_ephemeral[NOISE_PUBLIC_KEY_LEN];
>  	u8 precomputed_static_static[NOISE_PUBLIC_KEY_LEN];
> -
>  	u8 preshared_key[NOISE_SYMMETRIC_KEY_LEN];
>  
>  	u8 hash[NOISE_HASH_LEN];
> @@ -83,6 +83,8 @@ struct noise_handshake {
>  	u8 latest_timestamp[NOISE_TIMESTAMP_LEN];
>  	__le32 remote_index;
>  
> +	siphash_key_t hash_seed;

Why?

> +#include "linux/printk.h"
> +#include "linux/rcupdate.h"
> +#include "linux/rhashtable-types.h"
> +#include "linux/rhashtable.h"
> +#include "linux/siphash.h"

Seems wrong.

> +#include "messages.h"
>  #include "peer.h"
>  #include "noise.h"
> +#include "linux/memory.h"

Ditto.

>  
> -static struct hlist_head *pubkey_bucket(struct pubkey_hashtable *table,
> -					const u8 pubkey[NOISE_PUBLIC_KEY_LEN])
> +static inline u32 index_hashfn(const void *data, u32 len, u32 seed)
>  {
> -	/* siphash gives us a secure 64bit number based on a random key. Since
> -	 * the bits are uniformly distributed, we can then mask off to get the
> -	 * bits we need.
> -	 */
> -	const u64 hash = siphash(pubkey, NOISE_PUBLIC_KEY_LEN, &table->key);
> +	const u32 *index = data;
> +	return *index;
> +}

But shouldn't this actually use siphash? What's happening here?

> +struct peer_hash_pubkey {
> +	siphash_key_t key;
> +	u8 pubkey[NOISE_PUBLIC_KEY_LEN];
> +};
> +
> +static inline u32 wg_peer_obj_hashfn(const void *data, u32 len, u32 seed)
> +{
> +	const struct wg_peer *peer = data;
> +	struct peer_hash_pubkey key;
> +	u64 hash;
> +
> +	memcpy(&key.key, &peer->handshake.hash_seed, sizeof(key.key));
> +	memcpy(&key.pubkey, &peer->handshake.remote_static, NOISE_PUBLIC_KEY_LEN);
> +
> +	hash = siphash(&key.pubkey, NOISE_PUBLIC_KEY_LEN, &key.key);

Why this weird construction with this other struct?

I'll stop reading here. There's a lot of strangeness with this patch.
Maybe it's workable with enough care, but I think to review this into
shape, in its current state, would be about the same as just rewriting
it.
