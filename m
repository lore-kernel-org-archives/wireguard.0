Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d9ba834
 for <wireguard@lists.zx2c4.com>; Sat, 3 Feb 2018 14:11:12 +0000 (UTC)
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
 [209.85.213.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dda4f1e6
 for <wireguard@lists.zx2c4.com>; Sat, 3 Feb 2018 14:11:12 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e125so15209187vkh.13
 for <wireguard@lists.zx2c4.com>; Sat, 03 Feb 2018 06:16:41 -0800 (PST)
MIME-Version: 1.0
From: Wang Jian <larkwang@gmail.com>
Date: Sat, 3 Feb 2018 22:16:40 +0800
Message-ID: <CAF75rJBF=DmWPYQ9+Fw3iejX2K9KBWAdsoqi-Q6OiG9e4n2e9w@mail.gmail.com>
Subject: wireguard: neighbor table overflow problem
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

While wireguard is not arp enabled device, I see neighbor table
overflow in my wireguard setup.

The problem is seen in the servers, that connect multiple satellite
site together.

Let's say wireguard server A has an internal interface eth0, which has
address 10.4.0.40/24.  The gateway of satellite sites, such as
10.200.0.0/22, 10.200.4.0/22, 10.200.8.0/22, have internal interface
eth0, which has address 10.200.0.1, 10.200.4.1, 10.200.8.1,
respectively.

Address 10.4.0.40/32 is assigned to the wg0 interface of server A,
and 10.200.0.1/32, 10.200.4.1/32, 10.200.8.1/32 are assigned to wg0
interface of satellite gateways respectively.

We don't use p2p addresse scheme for wg0 interface. So when we ping
other gateways from one gateway, or ping satellite gateways and host
in satellite subnets from wireguard server A, the internal host ip
address is used directly. This avoids policy routing or nat rules,
makes setup simpler.

Wireguard interface is NOARP, but we see repeatedly "neighbor table
overflow" kernel message.

ARP table just has a few entries (less than 10), miles away from overflowing.

Using "ip monitor" in wireguard server, we can see fast flushing messages

delete 10.200.x.x dev wg0 lladdr NOARP   <-- form 1
delete 10.200.x.x dev wg0 lladdr bc:9c:31:d6:ab:1C NOARP  <-- form 2
delete 10.200.x.x dev wg0 lladdr a0:36:9f:77:6b:6c NOARP   <-- form 3

In form 1 message, no mac address.
In form 2 message, mac address is partially correct, but last one or
more bits are corrupted (sometimes unprintable).
In form 3 message, mac address is correct and belongs to one of
server's subnet neighbor.

For an "ip monitor" session, the messages start from form 1, then
randomly change between form 1, 2 or 3, in batch by batch pattern.

So, this setup exposes two or more issues
1. this wireguard setup triggers unexpected neighbor table behaviour,
i.e. spurious overflow
2. the "ip monitor" has bugs or kernel rtnetlink messages are incorrect

Currently, we can do little about this. Increasing neighbor table size
and tuning aging parameters may reduce the kernel message frequency
(not sure), but cannot eliminate the problem.

iproute2 and kernel versions as following:

~# dpkg -l iproute2
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                        Version            Architecture
Description
+++-===========================-==================-==================-===========================================================
ii  iproute2                    3.16.0-2           amd64
networking and traffic control tools

~# uname -a
Linux hostname 4.6.0-0.bpo.1-amd64 #1 SMP Debian 4.6.4-1~bpo8+1
(2016-08-11) x86_64 GNU/Linux

~# uname -a
Linux hostname 4.7.0-0.bpo.1-amd64 #1 SMP Debian 4.7.8-1~bpo8+1
(2016-10-19) x86_64 GNU/Linux

~# uname -a
Linux hostname 4.9.0-0.bpo.2-amd64 #1 SMP Debian 4.9.18-1~bpo8+1
(2017-04-10) x86_64 GNU/Linux
