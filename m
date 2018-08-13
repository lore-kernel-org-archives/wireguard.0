Return-Path: ahanins@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 233a0f14
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 11:00:15 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f225c1c
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 11:00:15 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q127-v6so12181362ljq.11
 for <wireguard@lists.zx2c4.com>; Mon, 13 Aug 2018 04:11:59 -0700 (PDT)
Return-Path: <ahanins@gmail.com>
Subject: Re: [PATCH 0/1] Fix broken inner checksums for non TCP/UDP protocols
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20180810080617.20283-1-ahanins@gmail.com>
 <CAHmME9pCdYSc5vLUJt_7xkCG9PLMkQE5qMMbrxQ9uCq0U0KL-Q@mail.gmail.com>
From: "Andrey H." <ahanins@gmail.com>
Message-ID: <fef438a2-f085-b3fd-4d8e-041b5c62c030@gmail.com>
Date: Mon, 13 Aug 2018 14:11:56 +0300
MIME-Version: 1.0
In-Reply-To: <CAHmME9pCdYSc5vLUJt_7xkCG9PLMkQE5qMMbrxQ9uCq0U0KL-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On 08/12/2018 11:13 AM, Jason A. Donenfeld wrote:

> Thanks a lot for this patch and for the nice write-up. I'm still not
> sure, though, that I totally understand the checksumming semantics
> properly.
Neither do I :) But skbuff.h gives quite clear instructions about
CHECKSUM_PARTIAL semantics and handling for outgoing packets, namely:

...the driver MUST ensure that the checksum is set correctly. A driver 
can either offload the checksum calculation to the device, or call 
skb_checksum_help (in the case that the device does not support offload 
for a particular checksum).

So the usage of skb_checksum_help is mandatory, because Wireguard device 
itself doesn't have any HW offload capabilities, obviously. But anyway, 
WG device must advertise NETIF_F_HW_CSUM capability, otherwise 
networking stack will not feed GSO super packets to it, that's what I 
have understood while analyzing the root cause of this checksum bug.

As expected, the bug can also be fixed by removing NETIF_F_HW_CSUM bit 
from dev features, but it disables GSO, so not good.

> 
> Your paranoid proposal at the end of your description would be
> something like this?
> 
>> if (skb->ip_summed == CHECKSUM_PARTIAL || !skb_checksum_setup(skb, true)) {
>>     if (skb_checksum_help(skb))
>>         return false;
>> }
> 
> And the bug you're pointing out is that skb_checksum_setup returns
> -EPROTO in the case of GRE and such, because a child function,
> skb_checksum_setup_ip, only works for UDP/TCP?
> 
Yes and yes.

> Do you know why there exist these two separate functions in the first
> place, and what the preferred use cases are for each one?
If you are referring to skb_checksum_help and skb_checksum_setup, then 
they serve different purposes. skb_checksum_help being a supper widely 
used function to finalize partial checksum calculation in case there is 
no HW offload caps (exactly WG case, as it's a virtual device), whereas 
skb_checksum_setup is a function which basically re-calculates checksum 
offset inside skb based on known protocols (only TCP/UDP!) and 
optionally re-calculates the checksum of pseudo-headers which _is_ 
somewhat costly operation and original code does request it by calling 
skb_checksum_setup(skb, true).

So for me it doesn't make sense to call this heavy "setup" function for 
an skb which came directly from the networking stack and we known it's 
been properly setup.

> Also, do you
> know about the relative performance of them and how your patch or the
> paranoid variant above would impact that?
My patch should only increase the performance, because it eliminates 
unnecessary re-initialization of partial checksum and pseudo-header 
summation.

I've just realized that paranoid version could even violate the rules. 
Imagine, there is an skb with ip_summed _not_ equal to CHECKSUM_PARTIAL, 
in this case we would try to forcibly setup partial checksum for this 
packet and finalize it, which doesn't sound right to me, because other 
ip_summed values don't require the driver to tinker with checksum.

_____
BR, Andrey
