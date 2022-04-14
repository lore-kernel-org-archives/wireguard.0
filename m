Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0644DC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e7b18ece;
	Thu, 21 Apr 2022 23:48:56 +0000 (UTC)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c46c7f6f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 11:28:25 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1nexe8-0004nU-GT; Thu, 14 Apr 2022 13:28:20 +0200
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1nexe8-000PZ9-8X; Thu, 14 Apr 2022 13:28:20 +0200
Subject: Re: [PATCH net 1/2] wireguard: device: fix metadata_dst xmit null
 pointer dereference
To: Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org
Cc: Martynas Pumputis <m@lambda.lt>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
 wireguard@lists.zx2c4.com, kuba@kernel.org, davem@davemloft.net,
 stable@vger.kernel.org
References: <20220414104458.3097244-1-razor@blackwall.org>
 <20220414104458.3097244-2-razor@blackwall.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <24cac92b-4981-4ddc-9a05-32b61799e688@iogearbox.net>
Date: Thu, 14 Apr 2022 13:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20220414104458.3097244-2-razor@blackwall.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.5/26512/Thu Apr 14 10:28:56 2022)
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

On 4/14/22 12:44 PM, Nikolay Aleksandrov wrote:
> When we try to transmit an skb with md_dst attached through wireguard
> we hit a null pointer dereference[1] in wg_xmit() due to the use of
> dst_mtu() which calls into dst_blackhole_mtu() which in turn tries to
> dereference dst->dev. Since wireguard doesn't use md_dsts we should use
> skb_valid_dst() which checks for DST_METADATA flag and if it's set then
> fallback to wireguard's device mtu. That gives us the best chance of
> transmitting the packet, otherwise if the blackhole netdev is used we'd
> get ETH_MIN_MTU.
> 
[...]
> 
> CC: stable@vger.kernel.org
> CC: wireguard@lists.zx2c4.com
> CC: Jason A. Donenfeld <Jason@zx2c4.com>
> CC: Daniel Borkmann <daniel@iogearbox.net>
> CC: Martynas Pumputis <m@lambda.lt>
> Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
> Reported-by: Martynas Pumputis <m@lambda.lt>
> Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>

Looks good to me, thanks Nik!

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
