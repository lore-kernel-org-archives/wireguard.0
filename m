Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA45AFF885A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2026 11:55:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f3a249b1;
	Mon, 4 May 2026 11:55:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 641adebc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2026 11:55:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7643760121;
 Mon,  4 May 2026 11:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83843C2BCB8;
 Mon,  4 May 2026 11:55:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="F8vk2MX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1777895706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qhXIcqW4V5cC2OU8v8u35JdQLwT+N9+zNz5UrxUcGxk=;
 b=F8vk2MX5UsoBu3WxKDBgUWDY2K4eaBqEoiqBuTdGvl4xds9uN1aDBQMfTFhJ0i7CcB5S//
 GWJF3/+wuwYve079T+IxnIm8QLTs+w9Jz4eS9ru0q39XQJb9zl9YzQdbBNmpz2CqdMBljt
 Lht8Tvf0GwhW8Eqw0cE0TG7b9jMUaGs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86dd755d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 May 2026 11:55:06 +0000 (UTC)
Date: Mon, 4 May 2026 13:55:03 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Florian Uekermann <florian@uekermann.me>
Cc: wireguard@lists.zx2c4.com, A Jonas <jonas@chaincode.com>,
 Carl Dong <carl@obscura.net>
Subject: Re: [PATCH] wg-quick: fix darwin MTU detection
Message-ID: <afiJFxeMxJw-n9-G@zx2c4.com>
References: <20251020142254.16546-2-florian@uekermann.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251020142254.16546-2-florian@uekermann.me>
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

Hi Florian,

Sorry I didn't see this. I filtered this out because it wasn't formatted
correctly (explanation below the break, commit subject not matching
other wg-quick commits). Some notes:

On Mon, Oct 20, 2025 at 04:22:55PM +0200, Florian Uekermann wrote:
> I used macOS 15.4 for testing, but I am not particularly familiar with
> the Apple ecosystem. I'm not sure if this never worked, the netstat
> shipped by Apple changed at some point and how/which other platforms
> (iOS?) may be affected. So please keep that in mind before merging.

If you're submitting a patch with your name on it, please do the
research to make sure it's correct! Otherwise, what you're submitting is
more of a bug report than a patch.

>  src/wg-quick/darwin.bash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
> index 1b7fe5e..0467f0e 100755
> --- a/src/wg-quick/darwin.bash
> +++ b/src/wg-quick/darwin.bash
> @@ -177,7 +177,7 @@ set_mtu() {
>  		cmd ifconfig "$REAL_INTERFACE" mtu "$MTU"
>  		return
>  	fi
> -	while read -r destination _ _ _ _ netif _; do
> +	while read -r destination _ _ netif _; do

Should this be changed for the other invocations of `netstat -nr -f ...`
in the code? It's a bit confusing because in del_route(), it looks like
the first invocation (for inet) is aware that it's the 6th parameter,
while the second invocation (for inet6) seems to stick with this
presumption that it's the 4th. So what's going on here?

Consulting the source from Apple, it looks like the 4th param is indeed
the right one?
https://github.com/apple-oss-distributions/network_cmds/blob/97e27e6244c16d399bfeb254315ddc5828711c56/netstat.tproj/route.c#L328

What circumstances cause this to change? v4 vs v6? Something else?

I'd like to get to the bottom of this before applying this patch. When
you submit a v2, please include your explanation as part of the commit
message.

Thanks,
Jason
