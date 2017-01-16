Return-Path: lennart@hamburg.freifunk.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f46171a
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:13:25 +0000 (UTC)
Received: from srv01.hamburg.freifunk.net (srv01.hamburg.freifunk.net
 [212.12.51.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f4de19b
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:13:24 +0000 (UTC)
Received: from [10.5.0.5] (no1x.mullvad.net [31.169.51.155])
 by srv01.hamburg.freifunk.net (Postfix) with ESMTPSA id 4655C3AA
 for <wireguard@lists.zx2c4.com>; Mon, 16 Jan 2017 14:23:57 +0100 (CET)
Subject: Re: FAQ and quickstart
To: wireguard@lists.zx2c4.com
References: <af514aab-0c3a-1a10-17a8-4a538464651f@hamburg.freifunk.net>
 <a24740cf-1d98-8e63-1b20-1424fcb45724@higgsboson.tk>
From: lennart <lennart@hamburg.freifunk.net>
Message-ID: <7db96582-c381-9149-8e27-967618a40c92@hamburg.freifunk.net>
Date: Mon, 16 Jan 2017 14:23:48 +0100
MIME-Version: 1.0
In-Reply-To: <a24740cf-1d98-8e63-1b20-1424fcb45724@higgsboson.tk>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Solved it! (Thanks Jason)
"linux-headers" was not installed.
"pacman -S linux headers" did the trick.

Thanks all!

On 01/16/2017 02:13 PM, Jörg Thalheim wrote:
> The kernel module is most likely not loaded.
> 
> Make sure the following command returns something.
> 
> $ lsmod | grep wireguard
> wireguard             126976  0
> ip6_udp_tunnel         16384  1 wireguard
> udp_tunnel             16384  1 wireguard
> x_tables               28672  12 xt_hashlimit,xt_LOG,ipt_REJECT,ip_tables,iptable_filter,xt_tcpudp,xt_limit,ip6t_REJECT,ip6table_filter,wireguard,xt_conntrack,ip6_tables
> ipv6                  389120  151 nf_conntrack_ipv6,nf_reject_ipv6,nf_defrag_ipv6,wireguard,nf_nat_ipv6
> 
> Since you are on archlinux, did you reboot after kernel upgrade?
> 
> 
> On 2017-01-16 12:31, lennart wrote:
>> Hi,
>>
>> I'm trying to wireguard via the quickstart [0].
>> But I get this error:
>> $ sudo ip link add dev wg0 type wireguard
>> RTNETLINK answers: Operation not supported
>>
>> I know it has something to do with kernel configurations, but that would
>> be a whole new topic to me.
>> What do I need to do? Isn't this a good question for a FAQ?
>>
>> I'm on a archlinux:
>> $ uname -r
>> 4.8.13-1-ARCH
>>
>> Second:
>> How can a search the hole list archive? I'm just used to an interface to
>> do that.
>>
>> [0] https://www.wireguard.io/quickstart/
>>
>> Thanks a lot!
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
