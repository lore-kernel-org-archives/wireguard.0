Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D67C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 00:46:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf1ba52d;
	Sun, 19 Feb 2023 00:46:01 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7c92525b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 00:45:58 +0000 (UTC)
Received: from [203.33.246.37] (abovetime.pineview.net [203.33.246.37])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 7855380090;
 Sun, 19 Feb 2023 11:15:55 +1030 (ACDT)
Message-ID: <c83fee12-bef7-d09f-0cc5-d0a193d783c5@pineview.net>
Date: Sun, 19 Feb 2023 11:15:55 +1030
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: Source IP incorrect on multi homed systems
Content-Language: en-US
To: Nico Schottelius <nico.schottelius@ungleich.ch>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <87bklqd7vb.fsf@ungleich.ch>
From: Mike O'Connor <mike@pineview.net>
In-Reply-To: <87bklqd7vb.fsf@ungleich.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Generally all OSs will if sending from a local process will use the 
address of the outgoing interface for the packet.

If the packet is forwarded and no NAT is used the address will be routed 
via the interface suggested by the routing table.

So local routing can be a real pain, policy based routing is an option. 
The other option could be to setup an 'output' NAT to an address which 
is multi-homed.

I have a system running which is multi-homed with out issue other than 
the actual routing machine. This machine is BGP connected to three 
locations.

There is no NAT setup and because I also add the wireguard link 
addresses to the BGP sessions.

Cheers



On 19/2/2023 6:44 am, Nico Schottelius wrote:
> Dear group,
>
> I was wondering how wireguard [Linux kernel] or wireguard-go [FreeBSD]
> are supposed to decide which IP address to use for replying?
>
> I have seen both on FreeBSD and Linux that wireguard seems to use the IP
> address of the outgoing interface, i.e. the one with the route returning
> to the sender. However in multi homed situations, this can be wrong,
> let's take this example:
>
>        19:57:24.607526 net1  In  IP 194.5.220.43.60770 > 147.78.195.254.51820: UDP, length 148
>        19:57:24.608358 net2  Out IP 195.141.200.73.51820 > 194.5.220.43.60770: UDP, length 92
>
> The initiator sends from 194.5.220.43 to the receiver 147.78.195.254.
> Wireguard then replies with the source IP of 195.141.200.73 instead of
> 147.78.195.254.
>
> As the node is multi homed, the packet might leave through any of its
> uplinks and thus return with a random (unexpected) IP address and will
> not pass NAT rules on firewalls and finally be dropped. F.i. in above
> example the firewall drops the packet from 195.141.200.73, because there
> is no session entry for that.
>
> I have observed this behaviour both on Linux 6.1.11 as well as
> wireguard-go 0.0.20220316_8,1 on FreeBSD and in both cases the
> connection will break depending on which active interface is taken as
> exit.
>
> I would argue that wireguard should by default invert the IP
> addresses, i.e. switch dst=src, src=dst and then reply with that,
> instead of adapting an interface specific address, or is there a good
> reason for the current behaviour?
>
> Best regards,
>
> Nico
>
> --
> Sustainable and modern Infrastructures by ungleich.ch


