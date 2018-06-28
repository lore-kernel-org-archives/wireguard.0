Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b001ea4
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 02:42:00 +0000 (UTC)
Received: from dnvrco-cmomta02.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.225])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71d6aeae
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 02:41:59 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Eddie <stunnel@attglobal.net>
Subject: wg-quick broken by iproute2 update
Message-ID: <8b1fc545-1422-2b85-a1c1-9acaf79dacff@attglobal.net>
Date: Wed, 27 Jun 2018 19:47:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I just updated both a RHEL and a CentOS system from 7 -> 7.5. Following 
this, when running wg-quick, the routing tables are not updated 
correctly.  Both systems are running iproute.x86_64-4.11.0-14.el7, but 
from different repositories and are definitely different builds as they 
install to different sbin libraries.

Here's what I'm seeing:

[eddieath@oc8361880017 ~]$ sudo ip rule list
0:    from all lookup local
32766:    from all lookup main
32767:    from all lookup default
[eddieath@oc8361880017 ~]$
[eddieath@oc8361880017 ~]$ sudo wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip address add 192.168.0.11/24 dev wg0
[#] ip link set mtu 1420 dev wg0
[#] ip link set wg0 up
[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[eddieath@oc8361880017 ~]$
[eddieath@oc8361880017 ~]$ sudo ip rule list
0:    from all lookup local
32764:    from all lookup main
32765:    not from all fwmark 0xca6c lookup 51820
32766:    from all lookup main
32767:    from all lookup default
[eddieath@oc8361880017 ~]$

Note the "suppress_prefixlength 0" has been dropped, which really breaks 
the routing with a "normal" main ahead of table 51820. Following this, 
when running the "down", the duplicated table is not removed, as there 
is no match searching for "suppress_prefixlength 0":

[eddieath@oc8361880017 ~]$ sudo wg-quick down wg0
[#] wg showconf wg0
sync: ignoring all arguments
[#] ip -4 rule delete table 51820
[#] ip link delete dev wg0
[eddieath@oc8361880017 ~]$ sudo ip rule list
0:    from all lookup local
32764:    from all lookup main
32766:    from all lookup main
32767:    from all lookup default
[eddieath@oc8361880017 ~]$

I've confirmed this on both systems and also that the behaviour is 
purely within ip, and not anything that wg-quick is doing:

[eddieath@oc8361880017 ~]$ sudo ip rule list
0:    from all lookup local
32766:    from all lookup main
32767:    from all lookup default
[eddieath@oc8361880017 ~]$ sudo ip -4 rule add table main 
suppress_prefixlength 0
[eddieath@oc8361880017 ~]$ sudo ip rule list
0:    from all lookup local
32765:    from all lookup main
32766:    from all lookup main
32767:    from all lookup default
[eddieath@oc8361880017 ~]$

Cheers.
