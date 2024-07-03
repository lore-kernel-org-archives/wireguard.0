Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE1CC2BD09
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Jul 2024 18:11:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a5ed60b;
	Wed, 3 Jul 2024 18:11:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e263d87
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Jul 2024 18:11:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 351F860347;
 Wed,  3 Jul 2024 18:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB1EC2BD10;
 Wed,  3 Jul 2024 18:11:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZRmmUp+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1720030281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxP95z8H/D5jQ1acVpMchUAdQN8JTrhlX7OCXvz9kwQ=;
 b=ZRmmUp+yHoawM9i6CE4ye6v4+uhrw5XL1V05sJWeH8bJ/BFb28hVJYr8s42ypVo6hLtbE1
 f2Lb+p++NVADqKpyDm9yUuASkqsTIjXFbJv4F+oyM5hDzpg/YFBrk9r7BjP+/VuxaGi3Jx
 0/4hlTNikRoAD/60UEWeTujua408ac8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a2dcc16d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Jul 2024 18:11:20 +0000 (UTC)
Date: Wed, 3 Jul 2024 20:11:14 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Helge Deller <deller@kernel.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] wireguard: allowedips: Prevent unaligned memory accesses
Message-ID: <ZoWUQho7noWwAqrF@zx2c4.com>
References: <ZoV6Q6lWgVRqe7eh@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZoV6Q6lWgVRqe7eh@p100>
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

Hi Helge,

On Wed, Jul 03, 2024 at 06:20:19PM +0200, Helge Deller wrote:
> On the parisc platform the Linux kernel issues kernel warnings because
> swap_endian() tries to load a 128-bit IPv6 address from an unaligned
> memory location:
>  Kernel: unaligned access to 0x55f4688c in wg_allowedips_insert_v6+0x2c/0x80 [wireguard] (iir 0xf3010df)
>  Kernel: unaligned access to 0x55f46884 in wg_allowedips_insert_v6+0x38/0x80 [wireguard] (iir 0xf2010dc)
> 
> Avoid such unaligned memory accesses by instead using the
> get_unaligned_be64() helper macro.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> index 0ba714ca5185..daf967130b72 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -15,8 +15,8 @@ static void swap_endian(u8 *dst, const u8 *src, u8 bits)
>  	if (bits == 32) {
>  		*(u32 *)dst = be32_to_cpu(*(const __be32 *)src);
>  	} else if (bits == 128) {
> -		((u64 *)dst)[0] = be64_to_cpu(((const __be64 *)src)[0]);
> -		((u64 *)dst)[1] = be64_to_cpu(((const __be64 *)src)[1]);
> +		((u64 *)dst)[0] = get_unaligned_be64(src);

Ahh, right, in6_addr only has a u32 member, not a u64 member, so that's
potentially unaligned.

> +		((u64 *)dst)[1] = get_unaligned_be64(src[8]);

src[8] is not correct, however. (This crashes; did you test it?) I've
fixed it up and put it in the wireguard tree:

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/commit/?id=ad3d9eef8e1b304b243e63124581f97c88ce7ff9

I'll push this up to net.git soon. Thanks for the patch.

Jason
