Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab5a3e27
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 23:09:22 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4bbd327
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 23:09:22 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 41805137AE03
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 00:14:53 +0100 (CET)
Date: Mon, 20 Nov 2017 23:14:16 +0000
Message-ID: <20171120231416.Horde.CgDTFw41-BBj-IomMwxyq3_@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: netns.sh stuck at ncat.
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Tested the latest code on my Solidrun Cubox with Marvell Dove 88AP510 SoC.
But is get stuck on ncat. Device did not crash. I can terminate the  
script with ctrl-c.

Probably a weird config ;-)

Crosscompiled kernel 4.13.14 and wireguard on F26 from git source.

Linux cubox-es 4.13.14 #8 Mon Nov 20 17:47:03 CET 2017 armv7l armv7l  
armv7l GNU/Linux

console:

[   15.283929] wireguard: loading out-of-tree module taints kernel.
[   15.339447] wireguard: allowedips self-tests: pass
[   15.341220] wireguard: nonce counter self-tests: pass
[   15.370589] wireguard: curve25519 self-tests: pass
[   15.371282] wireguard: chacha20poly1305 self-tests: pass
[   15.374534] wireguard: blake2s self-tests: pass
[   15.798922] wireguard: ratelimiter self-tests: pass
[   15.799019] wireguard: WireGuard 0.0.20171111-16-gaffc38e loaded.  
See www.wireguard.com for information.
[   15.799023] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.

[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 peer wXPE01il/3J9gBYCroPUc7mHgIxXjKW/TPULllHFWmc=  
allowed-ips 192.168.241.0/24
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[  318.566899] wireguard: wg0: Sending keepalive packet to peer 6  
([::1]:2/0%0)
[  318.567104] wireguard: wg0: Receiving keepalive packet from peer 7  
([::1]:9998/0%0)
[  325.607881] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  325.607898] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  325.607915] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  325.607925] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  325.607936] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  325.607946] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  330.727519] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  330.727536] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  330.727547] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  335.846999] wireguard: wg0: Sending keepalive packet to peer 6  
([::1]:2/0%0)
[  335.847198] wireguard: wg0: Receiving keepalive packet from peer 7  
([::1]:9998/0%0)
[  346.087013] wireguard: wg0: Sending keepalive packet to peer 6  
([::1]:2/0%0)
[  346.087203] wireguard: wg0: Receiving keepalive packet from peer 7  
([::1]:9998/0%0)
[  356.328019] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  356.328037] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  356.328047] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  356.328057] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  356.328067] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  356.328077] wireguard: wg0: Packet has unallowed src IP (fd00::2)  
from peer 6 ([::1]:2/0%0)
[  366.567072] wireguard: wg0: Sending keepalive packet to peer 6  
([::1]:2/0%0)
[  366.567207] wireguard: wg0: Receiving keepalive packet from peer 7  
([::1]:9998/0%0)
[  376.807090] wireguard: wg0: Sending keepalive packet to peer 6  
([::1]:2/0%0)
[  376.807281] wireguard: wg0: Receiving keepalive packet from peer 7  
([::1]:9998/0%0)

Kernel CONFIG: https://paste.fedoraproject.org/paste/W6aa6vCAmrDMEgSwdAxbYA

root@cubox-es:/usr/src/WireGuard/src/tests# cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 5 (v7l)
BogoMIPS        : 333.33
Features        : half thumb fastmult vfp edsp iwmmxt thumbee vfpv3  
vfpv3d16 tls idivt
CPU implementer : 0x56
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0x581
CPU revision    : 5

Hardware        : Marvell Dove
Revision        : 0000
Serial          : 0000000000000000


gcc version 7.0.1 20170309 (Red Hat Cross 7.0.1-0.4)

Greats,

René van Dorst.
