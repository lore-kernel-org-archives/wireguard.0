Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BE3C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1741C2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1741C2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ironai.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7d4c248;
	Mon, 6 May 2019 20:31:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1258552a
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 00:49:51 +0000 (UTC)
Received: from achernar.uberspace.de (achernar.uberspace.de [95.143.172.237])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7709c62e
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 00:49:51 +0000 (UTC)
Received: (qmail 11207 invoked from network); 8 Apr 2019 00:52:29 -0000
Received: from localhost (HELO ?IPv6:2a02:790:ff:921:e6f8:9cff:feb4:b5e0?)
 (127.0.0.1)
 by achernar.uberspace.de with SMTP; 8 Apr 2019 00:52:29 -0000
Subject: Re: mesh VPN with wireguard?
To: Roman Mamedov <rm@romanrm.net>, Tomasz Chmielewski <mangoo@wpkg.org>
References: <bf1d3b6ac8dc6a31c82042b363db3bf3@wpkg.org>
 <20190406180155.674f40bb@natsu>
From: Vincent Wiemann <vincent.wiemann@ironai.com>
Message-ID: <3d9dc861-a86f-d47d-f892-2dd932d3c66a@ironai.com>
Date: Mon, 8 Apr 2019 02:52:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190406180155.674f40bb@natsu>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 06 May 2019 22:31:03 +0200
Cc: wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

No, it's not easy to create a mesh with WireGuard (if you're referring to real
mesh networks using e.g. Babel).
It's complicated, because in a mesh you don't want to manually assign IP addresses
to the mesh nodes and configure corresponding WireGuard peers.
When roaming comes into play, it becomes even more cumbersome,
as WireGuard has its own routing layer and thus the same subnet can't be assigned to all nodes.
One needs to use a broker script which creates a separate WireGuard interface/instance
for every mesh node automatically so that e.g. Babel can route according to interfaces.
As I don't like this approach and we need it for our mesh network,
I'm working on a layer 2 version of WireGuard.

Regards,

Vincent Wiemann

On 06.04.2019 15:01, Roman Mamedov wrote:
> On Thu, 28 Mar 2019 23:22:45 +0900
> Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> 
>> Does Wireguard allow to set up mesh VPN with "relative ease"?
>>
>> Say, we have 10 servers with public IPs, we want them all to create a 
>> VPN network with private subnet 10.11.12.0/24, and have all 10 servers 
>> communicate directly with each other.
>> Then a year later, expand it to 100 servers.
> 
> Sure.
> 
> But note that in this case unlike Tinc you cannot have some servers exit to
> the outside world via some other servers (with AllowedIP 0.0.0.0/0). There has
> to be just one such exit point per a WG network.
> 
> If it's purely for communication between servers, then of course no issue.
> 
>> Something in the line of: https://www.tinc-vpn.org/
> 
> Another limitation compared to Tinc is that Tinc will autoheal the partially
> disconnected mesh and will have some nodes forwarding for the others, in case
> direct communication between some of them gets cut (e.g. due to a peering or
> routing issue on the underlying Internet -- this saved me a few times).
> 
> WG will do no such thing, and node-to-node communication working will depend
> on both nodes always having direct connectivity to each other.
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
