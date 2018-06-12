Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3a855ab
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 19:56:46 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 441bc4e9
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 19:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mjr.org (Postfix) with ESMTP id 2903C16C386
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jun 2018 21:00:32 +0100 (BST)
Received: from mjr.org ([127.0.0.1])
 by localhost (mjr.org [127.0.0.1]) (amavisd-new, port 10024) with LMTP
 id oHtVaIUzWdk6 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:00:32 +0100 (BST)
Received: from brix.local (cpc98556-croy24-2-0-cust77.19-2.cable.virginm.net
 [82.34.227.78]) by mjr.org (Postfix) with ESMTP id 072C116C385
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jun 2018 21:00:32 +0100 (BST)
Message-ID: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
Subject: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Tue, 12 Jun 2018 21:00:31 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Loving wireguard but I'm getting failures running the Debian realtime
kernel. I first noticed that the wg link was freezing for 20-30 seconds
at a time, and then the machine would freeze.

For example now, before the innevitable freeze:

http://dpaste.com/1WFGS46

from 3820.516865 seconds in

[ 3820.516865] BUG: scheduling while atomic:
kworker/1:2/17295/0x00000002
[ 3820.516865] Modules linked ...
[ 3820.516926] Preemption disabled at:
[ 3820.516932] [<ffffffffbda3366f>] kernel_fpu_begin+0xf/0x20
[ 3820.516934] CPU: 1 PID: 17295 Comm: kworker/1:2 Tainted:
G     U     O     4.16.0-2-rt-amd64 #1 Debian 4.16.12-1
[ 3820.516935] Hardware name: Dell Inc. PowerEdge T20/0VD5HY, BIOS A06
01/27/2015
[ 3820.516940] Workqueue: wg-crypt-wg0 packet_encrypt_worker
[wireguard]
[ 3820.516940] Call Trace:
[ 3820.516946]  dump_stack+0x5c/0x85
[ 3820.516948]  ? kernel_fpu_begin+0xf/0x20
[ 3820.516950]  __schedule_bug+0x73/0xc0
[ 3820.516953]  __schedule+0x5a1/0x6e0
<etc - see paste>

Is there any more info needed? I think I'm going to drop the rt kernel
for now because I've had 4 lockups in 24hrs (since moving to the rt
kernel)

Is this a known problem? I'm guessing that wg hasnt been tested much
with the rt patchset.

With a previous freeze it was preceeded by thousands of :

Jun 12 18:11:40 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:11:45 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:11:50 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:11:55 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:12:00 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:12:05 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:12:10 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1
Jun 12 18:12:15 brix /usr/lib/gdm3/gdm-x-session[9135]: ERROR
block_reap:328: [bandwidth] bad exit code 1

then:

Jun 12 18:16:01 brix kernel: [16507.893206] CPU: 2 PID: 18331 Comm:
kworker/2:2 Tainted: G     U     O     4.16.0-2-rt-amd64 #1 Debian
4.16.12-1
Jun 12 18:16:01 brix kernel: [16507.893206] Hardware name: Dell Inc.
PowerEdge T20/0VD5HY, BIOS A06 01/27/2015
Jun 12 18:16:01 brix kernel: [16507.893211] Workqueue: wg-crypt-wg0
packet_encrypt_worker [wireguard]
Jun 12 18:16:01 brix kernel: [16507.893212] Call Trace:
Jun 12 18:16:01 brix kernel: [16507.893218]  dump_stack+0x5c/0x85
Jun 12 18:16:01 brix kernel: [16507.893220]  ?
kernel_fpu_begin+0xf/0x20
Jun 12 18:16:01 brix kernel: [16507.893222]  __schedule_bug+0x73/0xc0
Jun 12 18:16:01 brix kernel: [16507.893224]  __schedule+0x5a1/0x6e0

And this was all interspersed with the network going up and down. A log
of the previous failure:

https://pastebin.com/eFPHXaYk

Many thanks.
