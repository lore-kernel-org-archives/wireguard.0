Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C3AD10F57
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:48:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 459368d4;
	Mon, 18 Nov 2024 01:39:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e60c6ade
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Nov 2024 13:42:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41E5DA407F1;
 Sun, 10 Nov 2024 13:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66806C4CECD;
 Sun, 10 Nov 2024 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731246155;
 bh=vWh3xc9cy52fVyeE5+7/UQXjUVEjNZjJfHc25gWXRCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YhmYxIYpYLNDkOACqRb1jQqwJA1FOPIIT5/JHaHliGHy8mXFrJPAh6LaK+bDsMRht
 P0lkauBuylNgpI9mVrVW9jkJr/E5djrOdSsrSLJusQIPXTJUveie0S5WClyxnq4Lcl
 3gkf8Z1OuzVPCxIGZw6krQp6aVegtlvi32VJq3JZWbzqrYYo5or4iVOIx2T9ZcF+gB
 4IE5zd1YxXBIqebEWWULJ3PrPNVcV4gyBvCH0w3UK4G9eS0Kwmck06WpBhpnBsJ+fw
 oUkj6ziEiDZk6AkfV9lg+BQ/r+pcA3oDLMUzHQkWTFoR15h0SQuEdp0/hSBiHcTlp5
 0ojdQp0zmsa8w==
Date: Sun, 10 Nov 2024 13:42:30 +0000
From: Simon Horman <horms@kernel.org>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: wireguard: load nf_conntrack if it's not
 present
Message-ID: <20241110134230.GR4507@kernel.org>
References: <20241107024418.3606-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107024418.3606-1-liuhangbin@gmail.com>
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

On Thu, Nov 07, 2024 at 02:44:18AM +0000, Hangbin Liu wrote:
> Some distros may not load nf_conntrack by default, which will cause
> subsequent nf_conntrack settings to fail. Let's load this module if it's
> not loaded by default.
> 
> Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  tools/testing/selftests/wireguard/netns.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
> index 405ff262ca93..508b391e8d9a 100755
> --- a/tools/testing/selftests/wireguard/netns.sh
> +++ b/tools/testing/selftests/wireguard/netns.sh
> @@ -66,6 +66,7 @@ cleanup() {
>  orig_message_cost="$(< /proc/sys/net/core/message_cost)"
>  trap cleanup EXIT
>  printf 0 > /proc/sys/net/core/message_cost
> +lsmod | grep -q nf_conntrack || modprobe nf_conntrack

Hi Hangbin,

As modprobe should be idempotent both for the case were nf_conntrack is
built-in (I'm unsure if that case can ever occur) and the module has
already been inserted, I think you simply use:

modprobe nf_conntrack

Of course, if nf_conntrack isn't available at all, then this will fail.
But that was the case with your patch too. And so I assume it is intended.

>  
>  ip netns del $netns0 2>/dev/null || true
>  ip netns del $netns1 2>/dev/null || true
> -- 
> 2.46.0
> 
> 
