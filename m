Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF6CC4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164302184B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164302184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71482bd0;
	Fri, 5 Apr 2019 15:21:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 643a5382
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2019 19:34:14 +0000 (UTC)
Received: from bond.m7n.se (2a00:1a28:1251:46:246:28:121:8000
 [IPv6:2a00:1a28:1251:46:246:28:121:8000])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c278db9
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2019 19:34:14 +0000 (UTC)
Received: from [IPv6:2001:470:de6f:1301::83b] (unknown
 [IPv6:2001:470:de6f:1301::83b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 55F7B60098C2;
 Tue, 26 Mar 2019 19:35:18 +0000 (UTC)
Subject: Re: Multiple VPN connections on Android
To: Julian Orth <ju.orth@gmail.com>, wireguard@lists.zx2c4.com
References: <75dc1198-7727-f342-2756-a160f3f3f994@gmail.com>
From: mikma.wg@lists.m7n.se
Message-ID: <1aad1b45-8174-79c3-f62b-84462e0c2baa@m7n.se>
Date: Tue, 26 Mar 2019 20:35:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <75dc1198-7727-f342-2756-a160f3f3f994@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Apr 2019 17:21:48 +0200
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


On 2019-03-26 15:17, Julian Orth wrote:
> Hello list,
> 
> I'm currently using WireGuard on Android for two purposes:
> 
> 1. Routing all traffic via a commercial VPN provider to protect myself on
>     open wireless networks.
> 2. Connecting to my home network.
> 
> Unfortunately WireGuard on Android does not allow me to do both of these
> things at the same time. I assume this is because VpnService [1] only allows 1
> VPN connection at a time.

Can't you add the peer for your home network to the same configuration 
(tun device) as the peer for the commercial VPN provider? It seems a 
straight forward solution to me if you are okay with the IP addresses 
assigned by the VPN provider.

> 
> Has any thought been put into emulating multiple tun devices in user space?

I don't see why you would need multiple tun devices. It is possible to 
add multiple IPv4 and IPv6 addresses to the tun device, but there may be 
a problem with the source address selection. Linux allows specifying a 
preferred address for each route, but it isn't possible in the Android 
API AFAIK. If you have a rooted device then you can potentially update 
the routing tables with the preferred source address for each VPN route.

/Mikma

> 
> Julian
> 
> [1] https://developer.android.com/reference/android/net/VpnService.html
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
