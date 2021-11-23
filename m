Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFDFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 18:33:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2f09de02;
	Tue, 23 Nov 2021 18:33:06 +0000 (UTC)
Received: from mail.as397444.net (mail.as397444.net [2620:6e:a000:1::99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 03b58957
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bluematt.me
 ; s=1637690463;
 h=In-Reply-To:From:References:To:Subject:From:Reply-To:Cc; 
 bh=AXu2biY8HbCQVG7P3tSINMaLuWAa8UZ9TmqFSyQfIMw=; b=V/S5fx0vFOX3riNMhsIugZ9J+c
 2I3K0OPPKiKzLKWPbzOQoHJW/LZR27U/qfqKA8JXyyo8WqBTZKtXkg+GsZT4iGSLEGB5vx7s/9Y2w
 o/W/fhqtPaeq4+SudhugTtStZL9e28k9Dzz0uHSAuQXowApXKv+WTSkw5LKUN3jt7aFuKALCCy2G+
 smZxX70TcHuvQW3rLollgHxESS9dCRBPgWmW32fJM0pUdl58jktdl+BiBdrZBo0n0ATZNLADJYgyJ
 Zxyd9kap3VQF7TM+UjTxotkNZ54cyWxgc/EaRHq/Booh1Qa9W4xkhRozF6DNavKrqcmLiHa2P8pgu
 05A/3BJA==;
Received: from [IPV6:2620:6e:a007:232::100] (unknown
 [2620:6e:a000:1000:821f:43e8:e87:8531]) 
 by mail.as397444.net with esmtpsa TLS1.3 id 1mpab7-0053bK-AE
 for wireguard@lists.zx2c4.com; Tue, 23 Nov 2021 18:32:54 +0000
Message-ID: <3c8c2e52-7a1a-2397-d6f4-769032b93044@bluematt.me>
Date: Tue, 23 Nov 2021 13:32:52 -0500
MIME-Version: 1.0
Subject: Re: Incorrect Source Addr Selection On Initiate and Asymmetric Routing
Content-Language: en-US
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6fc9765d-f4ef-84d2-c65a-97bab58e3e4b@bluematt.me>
 <eeee1fa3-8b42-1122-3123-d3b07b150036@bluematt.me>
From: Matt Corallo <wg-lists@bluematt.me>
In-Reply-To: <eeee1fa3-8b42-1122-3123-d3b07b150036@bluematt.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DKIM-Note: Keys used to sign are likely public at
 https://as397444.net/dkim/bluematt.me
X-DKIM-Note: For more info, see https://as397444.net/dkim/
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

Hit this problem again today on 5.10, seems like there's renewed interest in fixing wg's source 
address selection - any chance one of the recent patches may address this?

On 8/18/20 11:26, Matt Corallo wrote:
> [Resending this few-month-old mail because apparently the list bounced it the first time.]
> 
> 
> Oops, should have mentioned, this may have always been the case, with only recent addition of 
> asymmetric routing leading
> me to identify it, but its at least been the case on 5.6.X and currently is the case on 5.7.6.
> 
> Matt
> 
> On 6/28/20 3:03 PM, Matt Corallo wrote:
>> I run wireguard on some endpoints with anycast IP addresses (which mostly workes seamlessly, which 
>> is awesome!), however
>> of late it seems the source address selection in Wireguard incorrectly selects the default source 
>> address when it most
>> recently received packet(s) to a different address.
>>
>> Most of the routes on such boxes have an explicit default source that is different from the 
>> anycast addresses, as
>> otherwise regular connections from such boxes would fail, eg:
>> 1.0.0.0/24 via XXX dev XXX src (non-anycast-address) metric 32
>>
>> Ive observed wireguard selecting the default source in two cases:
>>
>> a) when the server is the one sending the handshake initiation due to the handshake timer, it 
>> appears the server selects
>> a new source address based on the default. I haen't had practical issues with this, but its worth 
>> noting, and probably
>> fixing.
>>
>> b) when the path outbound to the client is different from the path inbound. In my case, inbound v4 
>> traffic from my phone
>> on T-Mobile US (which passes through CG-NAT) comes into my server on one interface, but the path 
>> back out to TMO is via
>> a different interface. In this case, wireguard selects the default source address and sends a 
>> packet which T-Mobile's
>> CG-NAT drops as there is no NAT entry for it.
>>
>> Matt
>>
