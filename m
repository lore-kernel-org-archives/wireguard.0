Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DB7C25B7A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2024 14:11:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df3af49a;
	Tue, 21 May 2024 14:11:40 +0000 (UTC)
Received: from mail.as41281.net (mail.as41281.net [2a0f:df00:0:300::109])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9d85ffe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2024 14:11:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12C7B162EF6; Tue, 21 May 2024 16:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keff.org; s=dkim;
 t=1716300696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yLKINthQFsNIfQTqqLlPE6z2Az1LbBdhkCC1CUbX5qM=;
 b=t9kQxcoYVFa4kJz/oQGPxAhdOXcsX+a3a1MtpnMvkmCtd3uvMKn0eiUKM9pBKvixmdEUM8
 94z5f71qm6n7tRT3jgiUY1JGdkkkXCibm100a6i0hYSFwPstBIxC21DBKCAor/uXrqJNTH
 /rv3GTtA8hcD+0GI1+omd7Pc7OaWnuY=
Message-ID: <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
Date: Tue, 21 May 2024 21:11:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wireguard address binding - how to fix?
To: Nico Schottelius <nico.schottelius@ungleich.ch>,
 Janne Johansson <icepic.dz@gmail.com>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 <87a5kjgw3j.fsf@ungleich.ch>
Content-Language: en-US
From: Sebastian Hyrvall <sh@keff.org>
In-Reply-To: <87a5kjgw3j.fsf@ungleich.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

The reason wireguard does it like this I think is because when designing 
it there was no thought given to any client,server scenario.

Both sides are behaving like clients that can jump between IPs at any 
time. This is a flawed concept given that in 90% of scenarios there
is at least one side acting as a server on a static ip. Unless the 
server side is a home user on dynamic ip and rebinding could be difficult.

I've also given a bit of thought to the security aspect of this for VPN 
providers. Since a remote party can override the configured "Endpoint" 
if there was a scenario where vpn provider privkeys are
compromised. The attacker can then, by knowing the connecting clients 
ip, get him to shift over the tunnel to their server and perform a long 
term, most likely undetected, mitm attack.

Anyway. I've waited for this binding option for years. It's insane to me 
it gets ignored.

One product is for example Mikrotik hardware. They don't want to 
implement third party patches so they are waiting for this bind-patch to 
be included in the kernel. Until then we're forced to use OpenVPN in our 
setups.


On 2024-05-21 19:58, Nico Schottelius wrote:
> Hello Janne,
>
> Janne Johansson <icepic.dz@gmail.com> writes:
>
>> Den tis 21 maj 2024 kl 09:50 skrev Nico Schottelius
>> <nico.schottelius@ungleich.ch>:
>>> Hello Jason,
>>> do you mind applying the patch from Daniel? Or is there anything wrong with it?
>>>
>>> Daniel: amazing work, I was not aware that you have already put in the
>>> hard work, thank you so very much!
>>>
>>> The world (*) is suffering because of the lack of IP address binding in wireguard.
>>>
>>> (*) With world I refer to every engineer that needs to run wireguard in
>>> non-trivial situations with multiple IP addresses on one host, which is
>>> extremely common for anything that routes.
>> Well, the main reason for wg to NOT do anything special is because
>> routing generally is done by looking at the destination ip and then
> No. Generally speaking that is incorrect.
> It is not special to reply with the same IP address.
>
> Generally speaking, when you have systems with multiple IP addresses you
> want to be able to steer the binding to an IP address. And even if you
> don't do that, you reply with the same IP address you have been
> contacted with. Wireguard does neither of it at the moment.  I have
> written this already many times on this list, but the reason is very
> easy:
>
> - A connection is initiated from device A, connecting to router B on IP adddress a.b.c.d
> - The packet is correctly received by router B
> - The router replies incorrectly with address f.d.g.h
> - The reply packet is correctly blocked at the firewall of device A, because it comes
>    from a random, unknown IP address
>
> This is the basic 101 of networking is to reply with the same address
> you have been contacted with, there is no discussion necessary. The
> whole world does it, even A-patch-y httpd (*) supports it. Since 1980 or
> so.
>
> Routing choices are independent of that, replying with the same IP
> address is a standard behaviour.
>
> Nico
>
> (*) As does ssh, nginx, ipsec protocols, openvpn, any rails application,
> any python application - I am not sure which software that binds to a
> socket does not support it, with the exception of wireguard.
>
>
