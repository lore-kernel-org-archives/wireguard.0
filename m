Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85024C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 12:16:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24a375cd;
	Sun, 19 Feb 2023 12:13:46 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24db62ee
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 12:13:43 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 3EF851FDCB;
 Sun, 19 Feb 2023 13:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676808804;
 bh=WIMMV87mUijPy6tap2/qmjjAmUL2JGcIjVL6cHp5YX4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=eipGtGdJgflzNhQ90gNQ7+szva9r+F//qV3cXKoCMNOFz2nJuOIdIh0VOS63hhVpP
 LQuEZOXIyYiAmNgPpKEl07xme2sg34mhY3A+NWj2HdaVijeeESd69N95ygiroMHPe7
 7ZTjZ4uPHyIKTmnINZjLGw/dojPwq2o6Ot3a3laTLn7NiHo9clvjvm7RhqYUQM8+rS
 k3X1IL9wVzn31x66kAjobLW4Pc2QV5+RTrxXxUxhIIVg7wrkGdfhgpxWop2z7RotyC
 VjEqcLEQFz8vtx2K7Mx8sp3279xVDG8k8ISBeMXLQOUf+to605DtYYtxNkK3C26R1Y
 hDvlFCGXL409Q==
Received: by blind.localdomain (Postfix, from userid 1000)
 id F1EC313A11F1; Sun, 19 Feb 2023 13:13:42 +0100 (CET)
References: <87bklqd7vb.fsf@ungleich.ch>
 <c83fee12-bef7-d09f-0cc5-d0a193d783c5@pineview.net>
 <875yby83n2.fsf@ungleich.ch>
User-agent: mu4e 1.7.26; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: Mike O'Connor <mike@pineview.net>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 13:10:19 +0100
In-reply-to: <875yby83n2.fsf@ungleich.ch>
Message-ID: <87y1otc0p5.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Aside from nginx + icmp being handled correctly as a reference,
I want to further elaborate on this case to show that something is
really wrong with the current behaviour:

A typical scenario for routers is to have a lot of global reachable IP
addresses (IPv6, IPv4) assigned to the loopback interface, such as this
system:

[13:11] router2.place6:~# ip a sh dev lo
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:1e:a::b/128 scope global
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:1e:a::a/128 scope global
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:2:a::b/128 scope global
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:2:a::a/128 scope global
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:2:1::7/128 scope global
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:2:1::6/128 scope global
       valid_lft forever preferred_lft forever
    inet6 2a0a:e5c0:2:1::5/128 scope global
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever

The motivation behind that is that independent of the actual routing
interface, these IP addresses are always reachable.

Now in the case of wireguard selecting the source IP based on the
outgoing interface, this is never going to work, as lo cannot send
packets to the outside world.


Nico Schottelius <nico.schottelius@ungleich.ch> writes:

> Let me rephrase the problem statement:
>
>     - ping and http calls to the multi homed machine work correctly:
>       I can ping 147.78.195.254 and the reply contains the same address.
>       I can ping 195.141.200.73 and the reply contains the same address.
>       I can curl 147.78.195.254 and the reply contains the same address.
>       I can curl 195.141.200.73 and the reply contains the same address.
>
>     - wireguard does NOT work because it changes the reply address:
>       A packet sent to 147.78.195.254 is being replied with 195.141.200.73
>
> In general, processes reply with the IP address that was used to contact
> them and not with the outgoing interface address, which would also break
> adding IP addresses to the loopback interface.
>
> For full detail, see ip addresses [0] and routing below [1] and tests
> executed [2].
>
> I believe that this is a bug in wireguard.
>
> --------------------------------------------------------------------------------
>
> [2]
>
> Let's see how it looks like in detail:
>
> 1) ping to 147.78.195.254: works
>
> [9:14] nb3:~% ping -c2 147.78.195.254
> PING 147.78.195.254 (147.78.195.254) 56(84) bytes of data.
> 64 bytes from 147.78.195.254: icmp_seq=1 ttl=53 time=7.27 ms
> 64 bytes from 147.78.195.254: icmp_seq=2 ttl=53 time=6.30 ms
>
> --- 147.78.195.254 ping statistics ---
> 2 packets transmitted, 2 received, 0% packet loss, time 1002ms
> rtt min/avg/max/mdev = 6.296/6.781/7.267/0.485 ms
>
> / # tcpdump -ni any host 194.5.220.43
> tcpdump: data link type LINUX_SLL2
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on any, link-type LINUX_SLL2 (Linux cooked v2), snapshot length 262144 bytes
> 08:14:48.379618 net1  In  IP 194.5.220.43 > 147.78.195.254: ICMP echo request, id 89, seq 1, length 64
> 08:14:48.379651 net2  Out IP 147.78.195.254 > 194.5.220.43: ICMP echo reply, id 89, seq 1, length 64
> 08:14:49.380340 net1  In  IP 194.5.220.43 > 147.78.195.254: ICMP echo request, id 89, seq 2, length 64
> 08:14:49.380392 net2  Out IP 147.78.195.254 > 194.5.220.43: ICMP echo reply, id 89, seq 2, length 64
>
> 2) ping to 195.141.200.73
>
> [9:14] nb3:~% ping -c2 195.141.200.73
> PING 195.141.200.73 (195.141.200.73) 56(84) bytes of data.
> 64 bytes from 195.141.200.73: icmp_seq=1 ttl=53 time=11.3 ms
> 64 bytes from 195.141.200.73: icmp_seq=2 ttl=53 time=6.81 ms
>
> --- 195.141.200.73 ping statistics ---
> 2 packets transmitted, 2 received, 0% packet loss, time 1002ms
> rtt min/avg/max/mdev = 6.813/9.057/11.301/2.244 ms
> [9:15] nb3:~%
> / # tcpdump -ni any host 194.5.220.43
> tcpdump: data link type LINUX_SLL2
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on any, link-type LINUX_SLL2 (Linux cooked v2), snapshot length 262144 bytes
> 08:16:19.257697 net2  In  IP 194.5.220.43 > 195.141.200.73: ICMP echo request, id 91, seq 1, length 64
> 08:16:19.257730 net2  Out IP 195.141.200.73 > 194.5.220.43: ICMP echo reply, id 91, seq 1, length 64
> 08:16:20.250948 net2  In  IP 194.5.220.43 > 195.141.200.73: ICMP echo request, id 91, seq 2, length 64
> 08:16:20.250980 net2  Out IP 195.141.200.73 > 194.5.220.43: ICMP echo reply, id 91, seq 2, length 64
>
> 3) http to 147.78.195.254
>
> [9:16] nb3:~% curl -s 147.78.195.254 > /dev/null ; echo $?
> 0
> / # tcpdump -ni any host 194.5.220.43
> tcpdump: data link type LINUX_SLL2
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on any, link-type LINUX_SLL2 (Linux cooked v2), snapshot length 262144 bytes
> 08:17:04.082945 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [S], seq 1405408358, win 64240, options [mss 1460,sackOK,TS val 1380610701 ecr 0,nop,wscale 7], length 0
> 08:17:04.082983 net2  Out IP 147.78.195.254.80 > 194.5.220.43.39274: Flags [S.], seq 3790092363, ack 1405408359, win 65160, options [mss 1460,sackOK,TS val 520503591 ecr 1380610701,nop,wscale 7], length 0
> 08:17:04.089996 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [.], ack 1, win 502, options [nop,nop,TS val 1380610709 ecr 520503591], length 0
> 08:17:04.090121 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [P.], seq 1:79, ack 1, win 502, options [nop,nop,TS val 1380610709 ecr 520503591], length 78: HTTP: GET / HTTP/1.1
> 08:17:04.090136 net2  Out IP 147.78.195.254.80 > 194.5.220.43.39274: Flags [.], ack 79, win 509, options [nop,nop,TS val 520503598 ecr 1380610709], length 0
> 08:17:04.090301 net2  Out IP 147.78.195.254.80 > 194.5.220.43.39274: Flags [P.], seq 1:239, ack 79, win 509, options [nop,nop,TS val 520503598 ecr 1380610709], length 238: HTTP: HTTP/1.1 200 OK
> 08:17:04.090381 net2  Out IP 147.78.195.254.80 > 194.5.220.43.39274: Flags [P.], seq 239:854, ack 79, win 509, options [nop,nop,TS val 520503598 ecr 1380610709], length 615: HTTP
> 08:17:04.096058 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [.], ack 239, win 501, options [nop,nop,TS val 1380610715 ecr 520503598], length 0
> 08:17:04.096059 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [.], ack 854, win 497, options [nop,nop,TS val 1380610715 ecr 520503598], length 0
> 08:17:04.096339 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [F.], seq 79, ack 854, win 501, options [nop,nop,TS val 1380610715 ecr 520503598], length 0
> 08:17:04.096450 net2  Out IP 147.78.195.254.80 > 194.5.220.43.39274: Flags [F.], seq 854, ack 80, win 509, options [nop,nop,TS val 520503604 ecr 1380610715], length 0
> 08:17:04.102609 net1  In  IP 194.5.220.43.39274 > 147.78.195.254.80: Flags [.], ack 855, win 501, options [nop,nop,TS val 1380610721 ecr 520503604], length 0
>
>
> 4) http to 195.141.200.73
>
> [9:17] nb3:~% curl -s 195.141.200.73 > /dev/null ; echo $?
> 0
>
> / # tcpdump -ni any host 194.5.220.43
> tcpdump: data link type LINUX_SLL2
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on any, link-type LINUX_SLL2 (Linux cooked v2), snapshot length 262144 bytes
> 08:18:05.951066 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [S], seq 1556080700, win 64240, options [mss 1460,sackOK,TS val 765965336 ecr 0,nop,wscale 7], length 0
> 08:18:05.951106 net2  Out IP 195.141.200.73.80 > 194.5.220.43.41484: Flags [S.], seq 3465881361, ack 1556080701, win 65160, options [mss 1460,sackOK,TS val 3168643538 ecr 765965336,nop,wscale 7], length 0
> 08:18:05.958699 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [.], ack 1, win 502, options [nop,nop,TS val 765965342 ecr 3168643538], length 0
> 08:18:05.958749 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [P.], seq 1:79, ack 1, win 502, options [nop,nop,TS val 765965342 ecr 3168643538], length 78: HTTP: GET / HTTP/1.1
> 08:18:05.958763 net2  Out IP 195.141.200.73.80 > 194.5.220.43.41484: Flags [.], ack 79, win 509, options [nop,nop,TS val 3168643545 ecr 765965342], length 0
> 08:18:05.959216 net2  Out IP 195.141.200.73.80 > 194.5.220.43.41484: Flags [P.], seq 1:239, ack 79, win 509, options [nop,nop,TS val 3168643546 ecr 765965342], length 238: HTTP: HTTP/1.1 200 OK
> 08:18:05.959327 net2  Out IP 195.141.200.73.80 > 194.5.220.43.41484: Flags [P.], seq 239:854, ack 79, win 509, options [nop,nop,TS val 3168643546 ecr 765965342], length 615: HTTP
> 08:18:05.965244 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [.], ack 239, win 501, options [nop,nop,TS val 765965350 ecr 3168643546], length 0
> 08:18:05.965348 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [.], ack 854, win 497, options [nop,nop,TS val 765965350 ecr 3168643546], length 0
> 08:18:05.965487 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [F.], seq 79, ack 854, win 501, options [nop,nop,TS val 765965350 ecr 3168643546], length 0
> 08:18:05.965573 net2  Out IP 195.141.200.73.80 > 194.5.220.43.41484: Flags [F.], seq 854, ack 80, win 509, options [nop,nop,TS val 3168643552 ecr 765965350], length 0
> 08:18:05.971916 net2  In  IP 194.5.220.43.41484 > 195.141.200.73.80: Flags [.], ack 855, win 501, options [nop,nop,TS val 765965356 ecr 3168643552], length 0
>
>
>
> [0]
> wireguard "server" that changes the source ip:
>
> / # ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>     inet 127.0.0.1/8 scope host lo
>        valid_lft forever preferred_lft forever
>     inet6 ::1/128 scope host
>        valid_lft forever preferred_lft forever
> 3: eth0@if29: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
>     link/ether 66:4a:9c:12:5b:6c brd ff:ff:ff:ff:ff:ff
>     inet6 2a0a:e5c0:10:1e:7f21:83ca:a7d:46d2/128 scope global
>        valid_lft forever preferred_lft forever
>     inet6 fe80::644a:9cff:fe12:5b6c/64 scope link
>        valid_lft forever preferred_lft forever
> 4: net1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
>     link/ether 3c:ec:ef:cb:d8:1b brd ff:ff:ff:ff:ff:ff
>     inet 147.78.195.254/27 brd 147.78.195.255 scope global net1
>        valid_lft forever preferred_lft forever
>     inet6 2a0a:e5c0:1:8::53/64 scope global
>        valid_lft forever preferred_lft forever
>     inet6 fe80::3eec:efff:fecb:d81b/64 scope link
>        valid_lft forever preferred_lft forever
> 5: v1477819464: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN qlen 1000
>     link/[65534]
>     inet 147.78.194.65/26 scope global v1477819464
>        valid_lft forever preferred_lft forever
>     inet6 2a0a:e5c0:2e::1/64 scope global
>        valid_lft forever preferred_lft forever
> 26: net2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
>     link/ether 3c:ec:ef:cb:d8:1c brd ff:ff:ff:ff:ff:ff
>     inet 195.141.200.73/31 scope global net2
>        valid_lft forever preferred_lft forever
>     inet6 2001:1700:3500:2::12/124 scope global
>        valid_lft forever preferred_lft forever
>     inet6 fe80::3eec:efff:fecb:d81c/64 scope link
>        valid_lft forever preferred_lft forever
> / #
>
> wireguard client behind nat:
>
> nb3:/etc/wireguard# curl -4 ifconfig.io
> 194.5.220.43
> nb3:/etc/wireguard# ip a sh dev wlan0
> 2: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
>     link/ether 84:5c:f3:ed:52:9c brd ff:ff:ff:ff:ff:ff
>     inet 192.168.4.85/24 brd 192.168.4.255 scope global dynamic noprefixroute wlan0
>        valid_lft 317sec preferred_lft 242sec
>     inet6 2a0a:e5c0:13:0:865c:f3ff:feed:529c/64 scope global dynamic mngtmpaddr noprefixroute
>        valid_lft 86394sec preferred_lft 14394sec
>     inet6 fe80::865c:f3ff:feed:529c/64 scope link
>        valid_lft forever preferred_lft forever
> nb3:/etc/wireguard#
>
>
> [1]
> / # ip route get 194.5.220.43
> 194.5.220.43 via 195.141.200.72 dev net2  src 195.141.200.73
> / #
>
>
> Mike O'Connor <mike@pineview.net> writes:
>
>> Generally all OSs will if sending from a local process will use the
>> address of the outgoing interface for the packet.
>>
>> If the packet is forwarded and no NAT is used the address will be
>> routed via the interface suggested by the routing table.
>>
>> So local routing can be a real pain, policy based routing is an
>> option. The other option could be to setup an 'output' NAT to an
>> address which is multi-homed.
>>
>> I have a system running which is multi-homed with out issue other than
>> the actual routing machine. This machine is BGP connected to three
>> locations.
>>
>> There is no NAT setup and because I also add the wireguard link
>> addresses to the BGP sessions.
>>
>> Cheers
>>
>>
>>
>> On 19/2/2023 6:44 am, Nico Schottelius wrote:
>>> Dear group,
>>>
>>> I was wondering how wireguard [Linux kernel] or wireguard-go [FreeBSD]
>>> are supposed to decide which IP address to use for replying?
>>>
>>> I have seen both on FreeBSD and Linux that wireguard seems to use the IP
>>> address of the outgoing interface, i.e. the one with the route returning
>>> to the sender. However in multi homed situations, this can be wrong,
>>> let's take this example:
>>>
>>>        19:57:24.607526 net1  In  IP 194.5.220.43.60770 > 147.78.195.254.51820: UDP, length 148
>>>        19:57:24.608358 net2  Out IP 195.141.200.73.51820 > 194.5.220.43.60770: UDP, length 92
>>>
>>> The initiator sends from 194.5.220.43 to the receiver 147.78.195.254.
>>> Wireguard then replies with the source IP of 195.141.200.73 instead of
>>> 147.78.195.254.
>>>
>>> As the node is multi homed, the packet might leave through any of its
>>> uplinks and thus return with a random (unexpected) IP address and will
>>> not pass NAT rules on firewalls and finally be dropped. F.i. in above
>>> example the firewall drops the packet from 195.141.200.73, because there
>>> is no session entry for that.
>>>
>>> I have observed this behaviour both on Linux 6.1.11 as well as
>>> wireguard-go 0.0.20220316_8,1 on FreeBSD and in both cases the
>>> connection will break depending on which active interface is taken as
>>> exit.
>>>
>>> I would argue that wireguard should by default invert the IP
>>> addresses, i.e. switch dst=src, src=dst and then reply with that,
>>> instead of adapting an interface specific address, or is there a good
>>> reason for the current behaviour?
>>>
>>> Best regards,
>>>
>>> Nico
>>>
>>> --
>>> Sustainable and modern Infrastructures by ungleich.ch


--
Sustainable and modern Infrastructures by ungleich.ch
