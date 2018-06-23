Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f2df64a
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 12:18:04 +0000 (UTC)
Received: from mail3.protonmail.ch (mail3.protonmail.ch [185.70.40.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6befe529
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 12:18:04 +0000 (UTC)
Date: Sat, 23 Jun 2018 08:23:08 -0400
To: wireguard <wireguard@lists.zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Wireguard doesn't work with Linux 4.18-rc1
Message-ID: <J4C97NjxCe5Yi6ATwPhttes2-igbViLr-ejjOWK58wH8F-E0jdzmifyxLEVi5wmkNql7JVDqdpJ1WU0ufUzNwBZeLHmqncbQz7-SJRDGu8E=@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I can't make wireguard work with linux 4.18-rc1 and mainline from
06.22.2018.

sudo wg-quick up abc
[#] ip link add abc type wireguard
[#] wg setconf abc /dev/fd/xx
[#] ip address add xx.xx.xx.xxx/xx dev abc
[#] ip link set mtu 1420 dev abc
[#] ip link set abc up
[#] resolvconf -a abc -m 0 -x
[#] wg set abc fwmark xxxxx
[#] ip -4 route add 0.0.0.0/0 dev abc table xxxxx
[#] ip -4 rule add not fwmark xxxxx table xxxxx
[#] ip -4 rule add table main suppress_prefixlength 0
RTNETLINK answers: File exists
[#] resolvconf -d abc
[#] ip -4 rule delete table xxxxx
RTNETLINK answers: Address family not supported by protocol
Dump terminated
RTNETLINK answers: Address family not supported by protocol
Dump terminated
[#] ip link delete dev abc

It works with Linux 4.17 and earlier. I tested two latest wireguard
snapshots (0.0.20180620, 0.0.20180613).

I'm disabling ipv6 at boot with ipv6.disable=3D1

Jordan
