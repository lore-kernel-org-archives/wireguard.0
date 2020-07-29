Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2684AC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 10:40:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAAE20663
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 10:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=megamailservers.eu header.i=@megamailservers.eu header.b="OEAkPya2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAAE20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sager.me.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 591806bb;
	Wed, 29 Jul 2020 10:16:32 +0000 (UTC)
Received: from mail267c50.megamailservers.eu (mail1460c50.megamailservers.eu
 [91.136.14.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e77418b4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 10:16:30 +0000 (UTC)
X-Authenticated-User: sagermail@sager.me.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1596019202;
 bh=JmaVsUnoevxIZ+xOZpj0LPU08gEL9C7KxV5NuQJ9MOo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=OEAkPya2uTT5RXsymVPRSGkDaHw9cDSV1zb2H+1zu7Lbywh1QiToH2VpV9FxbptUt
 r8K46PfAKhWYEcgpMSwp00H74lXuRLhI5MPCKucMBaE6RsVJc8Xx15QiegYR27LkwY
 wX5P3MjGFlYSD0+nK++wQW23RGHCwgkLSKGhW7VI=
Feedback-ID: john@sager.me.u
Received: from mainserver.wc (97.83.2.81.in-addr.arpa [81.2.83.97])
 (authenticated bits=0)
 by mail267c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 06TAe0qp007422
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 10:40:02 +0000
Received: from [2001:8b0:cbe3:0:7987:f1cd:3396:9cb6]
 by mainserver.wc with esmtp (Exim 4.86_2)
 (envelope-from <john@sager.me.uk>) id 1k0jVA-0005Uh-9I
 for wireguard@lists.zx2c4.com; Wed, 29 Jul 2020 11:40:00 +0100
Subject: Re: Confused about AllowedIPs meaning?
To: wireguard@lists.zx2c4.com
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
From: John Sager <john@sager.me.uk>
Message-ID: <981bec3d-2e1d-b0bf-d008-0b6717fa4300@sager.me.uk>
Date: Wed, 29 Jul 2020 11:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CTCH-RefID: str=0001.0A782F1B.5F215202.004A, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=Cf92G4jl c=1 sm=1 tr=0 a=dws6IJh5fU+Ftmrx3Eq8JA==:117
 a=dws6IJh5fU+Ftmrx3Eq8JA==:17 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=_RQrkK6FrEwA:10 a=yINdheanYzn9BT-ZHT0A:9 a=mmS0wzeBsJUxqt4B:21
 a=w7F0OaiFwd0QAJDl:21 a=QEXdDO2ut3YA:10
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

So, are you running a RPi at each end as the Wireguard termination point? 
I'm assuming you can't run Wireguard on your border routers. If you could 
the config is easier, and you could if you used OpenWrt on the border 
routers. I'm also assuming that your border routers are wifi access points, 
so all your hosts connect there. So:

1) Give the RPi a static address on its home network, and a default route to 
its own border router. Put a static route in the border router to point to 
the RPi for the network address range at the *other* end. So all hosts 
connected to the border router go to the Internet for everything except the 
other network, which go to the RPi.

2) Put NAT rules in the border routers to point the Wireguard port to the 
RPi at its own end.

3) At RPi A set Wireguard to point to the Internet address & Wireguard port 
for Network B. Set AllowedIPs to the network B range.

4) Mirror (3) at the B end.

HTH John

On 26/07/2020 11:57, Gunnar Niels wrote:
> Hello, I'm new to wireguard and have been experimenting with it in my home lab.
> I'm interesting in using it to join two home networks (192.168.2.0/24 and
> 192.168.4.0/24). They're typical home networks in two physically different
> locations, each with their own gateways to the internet. I'd like for the
> machines on each network to use their default gateway for internet access, but
> configure things so they use a simple linux machine (raspberry pi) to route
> to the other subnet over wireguard is the destination is the opposite subnet.
> 
> One wireguard node is exposed via an endpoint with a dns A record (I'm port
> forwarding to the internal machine). On the other subnet, the rpi node is 
> behind
> NAT and pointed to that endpoint.
> 
> I have been able to get the wireguard nodes to connect and route machines on
> their opposite networks, but I haven't been able to get non-wireguard nodes
> to communicate with non-wireguard nodes across the tunnel. I have a few 
> questions
> I'm trying to clear up:
> 
> * Is it true that there isn't really a notion of a server/client from 
> wireguard's
> perspective, they're really just nodes, and I've applied the semantic 
> designation
> of the node behind the endpoint as a server, and the node behind the NAT as 
> the client?
> 
> * Here's my "server" config on 192.168.2.0/24:
> 
> ===
> 
> [Interface]
> Address = 10.2.0.1/24
> ListenPort = 34777
> PrivateKey = <server_priv_key>
> 
> [Peer]
> PublicKey = <client_pub_key>
> AllowedIPs = 10.2.0.2/32
> 
> ===
> 
> Here's my "client" config on 192.168.4.0/24
> 
> ===
> 
> [Interface]
> Address = 10.2.0.2/24
> PrivateKey = <client_priv_key>
> 
> [Peer]
> PublicKey = <server_pub_key>
> AllowedIPs = 0.0.0.0/0
> Endpoint = <server_host>:34777
> PersistentKeepalive = 15
> 
> ===
> 
> 
> The simplicity of the wireguard config is one of the best features about it,
> but the only thing I'm unclear about here is: exactly what is the "AllowedIPs"
> field configuring? I'm not sure how to configure these fields for my use-case.
> I'm guessing the server configuration is explicitly whitelisting the client,
> but I'm not sure what 0.0.0.0/24 on the clientside is saying. It feels like
> I should have my subnets as part of this field, but I'm not sure where because
> I'm not sure exactly what the field represents.
> 
> If someone could elaborate on it and point me in the right direction given my
> objective, that would be much appreciated!
> 
> -GN
> 
