Return-Path: snakker@mail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cab2da3
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 15:42:39 +0000 (UTC)
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bbf8601
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 15:42:39 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <trinity-7bfdb88a-30b2-44a2-8dd9-06c245b8a247-1501949046979@3capp-mailcom-lxa11>
From: "Mail Mail" <snakker@mail.com>
To: wireguard@lists.zx2c4.com
Subject: net-2-host configuration
Content-Type: text/plain; charset=UTF-8
Date: Sat, 5 Aug 2017 18:04:06 +0200
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Trying to wrap my head around how this is supposed to work, more used to tinc/softether.

I got the follow network setup (https://pastebin.com/kjn0GRzM):

+-------------------+     +--------------------+                             
| Internal Server 1 |     | Main FW Site A     |                             
| VLAN 101          |     |                    |                             
| 10.90.1.10/24     |     | Eth0 = Ext Pub IP  |-\    +---------------------+
|                   |\    | VLAN 100           |  -\  |  Remote Site B      |
+-------------------+ -\  |                    |    --|  Eth0 = Ext Pub IP  |
                        -\| Eth1 = Internal IP |      |                     |
                          - VLAN 101           |      |  wg0                |
+-------------------+   -/| 10.90.1.2/24       |      |  10.90.1.100/24     |
| Internal Server 2 | -/  |                    |      |                     |
- VLAN 101          |/    | wg0                |      +---------------------+
| 10.90.1.11/24     |     | 10.90.1.1/24       |                             
|                   |     |                    |                             
+-------------------+     +--------------------+                             

Say I have a Site A, that has two or more internal servers only on VLAN 101 / 10.90.1.0/24, that are connected to the FW in Site A on a physical interface (eth1). 
Site B needs to be able to access the internal servers in Site A, so i created wg0 with wireguard between the two sites, they can both see each other / 10.90.1.100 can ping 10.90.1.1 and the other way around just fine, but how do i get access to internal servers in Site A, that are connected to the FW at Site A, if i add the 10.90.1.2 ip to eth1 in the FW at Site A, wireguard refuses to come up:

[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip address add 10.90.1.1/24 dev wg0
[#] ip link set mtu 1420 dev wg0
[#] ip link set wg0 up
[#] ip route add 10.90.1.0/24 dev wg0
RTNETLINK answers: File exists
[#] ip link delete dev wg0

Then i tried just bridging wg0 and eth1, but that doesn't work either:
brctl addif br0 eth1 wg0
can't add wg0 to bridge br0: Invalid argument

If eth1 and wg0 could just coexist, I could probably fix it with some static routes, but when they can't I'm a bit lost.

I'm probably missing something obvious, but I have stared myself blind on this, any pointers or help would be very appreciated :)
