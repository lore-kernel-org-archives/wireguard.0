Return-Path: dsa@cumulusnetworks.com
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
 [209.85.192.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b13630f4
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 17:45:27 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c4so18786387pfb.1
 for <wireguard@lists.zx2c4.com>; Mon, 14 Nov 2016 09:48:03 -0800 (PST)
Return-Path: <dsa@cumulusnetworks.com>
To: Hannes Frederic Sowa <hannes@stressinduktion.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <1479141867.3723362.787321689.4A3DCFD6@webmail.messagingengine.com>
 <fd1c804d-3e44-0321-8a3e-67d6ff7357fa@cumulusnetworks.com>
 <7d8c0210-9132-c755-9053-6ec19409e343@stressinduktion.org>
 <c75290bd-7ea2-0bf8-7ac0-fc5a3c81e312@cumulusnetworks.com>
 <7779da88-08dc-0adb-42dd-8e00502693df@stressinduktion.org>
From: David Ahern <dsa@cumulusnetworks.com>
Message-ID: <0214eaf8-70c6-5a37-cddd-faa1c4268871@cumulusnetworks.com>
Date: Mon, 14 Nov 2016 10:48:01 -0700
MIME-Version: 1.0
In-Reply-To: <7779da88-08dc-0adb-42dd-8e00502693df@stressinduktion.org>
Content-Type: text/plain; charset=utf-8
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

On 11/14/16 10:33 AM, Hannes Frederic Sowa wrote:
>>>>> I just also quickly read up on the history (sorry was travelling last
>>>>> week) and wonder if you ever saw a user space facing bug or if this is
>>>>> basically some difference you saw while writing out of tree code?
>>>>
>>>> I checked the userspace API this morning. bind and cmsg for example check that the address is valid with calls to ipv6_chk_addr.
>>>
>>> Hmm, so it fixes no real bug.
>>>
>>> Because of translations of flowi6_oif we actually can't do a correct
>>> check of source address for cases like the one I outlined above? Hmm,
>>> maybe we should simply depend on user space checks.
>>
>> I believe Jason's case is forwarding path and the ipv6_stub->ipv6_dst_lookup API.
> 
> It is not a kernel API, because we don't support something like that for
> external kernel modules. We basically exported ipv6_dst_lookup to allow
> some IPv4 code to do ipv6 stunts when the IPv6 module is loaded. ;)

???

ipv6_stub is exported for modules (EXPORT_SYMBOL_GPL(ipv6_stub)).

ipv6_stub->ipv6_dst_lookup is used by several modules -- geneve, tipc, vxlan, mpls -- for IPv6 lookups, not IPv4 code do IPv6 stunts.

So how do you say that is not an exported kernel API?
