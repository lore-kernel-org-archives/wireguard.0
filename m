Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 533be35a
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:16:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6401260f
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:16:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c878f84
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:16:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a345b930
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:16:16 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id 104so44417452otd.3
 for <wireguard@lists.zx2c4.com>; Mon, 16 Jan 2017 05:26:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7db96582-c381-9149-8e27-967618a40c92@hamburg.freifunk.net>
References: <af514aab-0c3a-1a10-17a8-4a538464651f@hamburg.freifunk.net>
 <a24740cf-1d98-8e63-1b20-1424fcb45724@higgsboson.tk>
 <7db96582-c381-9149-8e27-967618a40c92@hamburg.freifunk.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Jan 2017 14:26:45 +0100
Message-ID: <CAHmME9rS7+kRyWtOwZMtxzmfrk_vqx2+iGFsNTuO8usrpBfOHA@mail.gmail.com>
Subject: Re: FAQ and quickstart
To: Christian Hesse <mail@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Christian,

Should the wireguard Arch package depend on linux-headers? Or the dkms
package on linux-headers? Or is it just the Arch-way that dkms merely
prints a warning but doesn't actually have real package deps?

Jason

On Mon, Jan 16, 2017 at 2:23 PM, lennart <lennart@hamburg.freifunk.net> wro=
te:
> Solved it! (Thanks Jason)
> "linux-headers" was not installed.
> "pacman -S linux headers" did the trick.
>
> Thanks all!
>
> On 01/16/2017 02:13 PM, J=C3=B6rg Thalheim wrote:
>> The kernel module is most likely not loaded.
>>
>> Make sure the following command returns something.
>>
>> $ lsmod | grep wireguard
>> wireguard             126976  0
>> ip6_udp_tunnel         16384  1 wireguard
>> udp_tunnel             16384  1 wireguard
>> x_tables               28672  12 xt_hashlimit,xt_LOG,ipt_REJECT,ip_table=
s,iptable_filter,xt_tcpudp,xt_limit,ip6t_REJECT,ip6table_filter,wireguard,x=
t_conntrack,ip6_tables
>> ipv6                  389120  151 nf_conntrack_ipv6,nf_reject_ipv6,nf_de=
frag_ipv6,wireguard,nf_nat_ipv6
>>
>> Since you are on archlinux, did you reboot after kernel upgrade?
>>
>>
>> On 2017-01-16 12:31, lennart wrote:
>>> Hi,
>>>
>>> I'm trying to wireguard via the quickstart [0].
>>> But I get this error:
>>> $ sudo ip link add dev wg0 type wireguard
>>> RTNETLINK answers: Operation not supported
>>>
>>> I know it has something to do with kernel configurations, but that woul=
d
>>> be a whole new topic to me.
>>> What do I need to do? Isn't this a good question for a FAQ?
>>>
>>> I'm on a archlinux:
>>> $ uname -r
>>> 4.8.13-1-ARCH
>>>
>>> Second:
>>> How can a search the hole list archive? I'm just used to an interface t=
o
>>> do that.
>>>
>>> [0] https://www.wireguard.io/quickstart/
>>>
>>> Thanks a lot!
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--=20
Jason A. Donenfeld
Deep Space Explorer
fr: +33 6 51 90 82 66
us: +1 513 476 1200
www.jasondonenfeld.com
www.zx2c4.com
zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc
