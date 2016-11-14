Return-Path: dsa@cumulusnetworks.com
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
 [209.85.192.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1812a723
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 16:52:44 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id i88so30393870pfk.2
 for <wireguard@lists.zx2c4.com>; Mon, 14 Nov 2016 08:55:20 -0800 (PST)
Return-Path: <dsa@cumulusnetworks.com>
To: Hannes Frederic Sowa <hannes@stressinduktion.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <1479141867.3723362.787321689.4A3DCFD6@webmail.messagingengine.com>
From: David Ahern <dsa@cumulusnetworks.com>
Message-ID: <fd1c804d-3e44-0321-8a3e-67d6ff7357fa@cumulusnetworks.com>
Date: Mon, 14 Nov 2016 09:55:18 -0700
MIME-Version: 1.0
In-Reply-To: <1479141867.3723362.787321689.4A3DCFD6@webmail.messagingengine.com>
Content-Type: text/plain; charset=windows-1252
Subject: Re: [WireGuard] [PATCH v3] ip6_output: ensure flow saddr actually
 belongs to device
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 11/14/16 9:44 AM, Hannes Frederic Sowa wrote:
> On Mon, Nov 14, 2016, at 00:28, Jason A. Donenfeld wrote:
>> This puts the IPv6 routing functions in parity with the IPv4 routing
>> functions. Namely, we now check in v6 that if a flowi6 requests an
>> saddr, the returned dst actually corresponds to a net device that has
>> that saddr. This mirrors the v4 logic with __ip_dev_find in
>> __ip_route_output_key_hash. In the event that the returned dst is not
>> for a dst with a dev that has the saddr, we return -EINVAL, just like
>> v4; this makes it easy to use the same error handlers for both cases.
>>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> Cc: David Ahern <dsa@cumulusnetworks.com>
>> ---
>> Changes from v2:
>>     It turns out ipv6_chk_addr already has the device enumeration
>>     logic that we need by simply passing NULL.
>>
>>  net/ipv6/ip6_output.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
>> index 6001e78..b3b5cb6 100644
>> --- a/net/ipv6/ip6_output.c
>> +++ b/net/ipv6/ip6_output.c
>> @@ -926,6 +926,10 @@ static int ip6_dst_lookup_tail(struct net *net,
>> const struct sock *sk,
>>  	int err;
>>  	int flags = 0;
>>  
>> +       if (!ipv6_addr_any(&fl6->saddr) &&
>> +           !ipv6_chk_addr(net, &fl6->saddr, NULL, 1))
>> +               return -EINVAL;
> 
> Hmm, this check is too permissive, no?
> 
> E.g. what happens if you move a link local address from one interface to
> another? In this case this code would still allow the saddr to be used.

This check -- like the ipv4 variant -- only verifies the saddr is locally assigned. If the address moves interfaces it should be fine.

> 
> I just also quickly read up on the history (sorry was travelling last
> week) and wonder if you ever saw a user space facing bug or if this is
> basically some difference you saw while writing out of tree code?

I checked the userspace API this morning. bind and cmsg for example check that the address is valid with calls to ipv6_chk_addr.
