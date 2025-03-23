Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8428C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f3818cf;
	Tue, 20 May 2025 19:43:35 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [2001:41d0:e:133a::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d9658825
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Mar 2025 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nwl.cc;
 s=mail2022; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/T/hpX5aJNmpqnR9NK2A+cGQ1FWYHUdQ6owTEm+NkC8=; b=WB43qXFFdYFHyR5t/uK9qx1+4L
 rMbG4BjFktbrOKNCnj0rC/+DPOXYzmEtUIZP9RNv1gl1enBQ2ZOY+sha3VxzkWbBDrLLAcv2iq40a
 vt+geQae7IZrwG8UDt+vcCJWt3K6tqcJdHbpkKItmmTmqgsJcQuZQifLJoL/oTrm0slRlCh45oaBr
 +mAretfpZExXb6pVCtyj9qaizsC2Vm4j1r8SguPSOs27ub2XVGg3az/oaW7z/e4dm5OkqOArKpntV
 Utr18Ccaf6xXXBs2PVB/WoCrnwI9rfF2tWX+VsgDnQ7m4jDDuKcYTeUaBX+JdMW51Zf3FwpRkUVO6
 sCwsJpnA==;
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.97.1)
 (envelope-from <phil@nwl.cc>) id 1twSaX-000000006Pj-16rX;
 Sun, 23 Mar 2025 22:10:33 +0100
Date: Sun, 23 Mar 2025 22:10:33 +0100
From: Phil Sutter <phil@nwl.cc>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 net-next 1/2] wireguard: selftests: convert iptables to
 nft
Message-ID: <Z-B4yfBvm2aXW_Ar@orbyte.nwl.cc>
Mail-Followup-To: Phil Sutter <phil@nwl.cc>,
 Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250322093016.16631-1-liuhangbin@gmail.com>
 <20250322093016.16631-2-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322093016.16631-2-liuhangbin@gmail.com>
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

On Sat, Mar 22, 2025 at 09:30:15AM +0000, Hangbin Liu wrote:
> Convert iptabels to nft as it is the replacement for iptables, which is used
          ~~~~~~~~

Typo, but I would write "Convert the selftest to nft ..." instead since
that is what you're converting, iptables is just replaced. :)

> by default in most releases.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  tools/testing/selftests/wireguard/netns.sh | 29 ++++++++++++++--------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
> index 55500f901fbc..8b840fef90af 100755
> --- a/tools/testing/selftests/wireguard/netns.sh
> +++ b/tools/testing/selftests/wireguard/netns.sh
> @@ -75,6 +75,11 @@ pp ip netns add $netns1
>  pp ip netns add $netns2
>  ip0 link set up dev lo
>  
> +# init nft tables
> +n0 nft add table ip wgtest
> +n1 nft add table ip wgtest
> +n2 nft add table ip wgtest
> +
>  ip0 link add dev wg0 type wireguard
>  ip0 link set wg0 netns $netns1
>  ip0 link add dev wg0 type wireguard
> @@ -196,13 +201,14 @@ ip1 link set wg0 mtu 1300
>  ip2 link set wg0 mtu 1300
>  n1 wg set wg0 peer "$pub2" endpoint 127.0.0.1:2
>  n2 wg set wg0 peer "$pub1" endpoint 127.0.0.1:1
> -n0 iptables -A INPUT -m length --length 1360 -j DROP
> +n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }

You may skip the 'policy accept \;' part in all 'add chain' commands as
this is the default for all chains. Unless you prefer to explicitly
state the chain policy, of course.

Cheers, Phil
