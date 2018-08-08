Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7532169
 for <wireguard@lists.zx2c4.com>; Wed, 8 Aug 2018 19:25:51 +0000 (UTC)
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45567946
 for <wireguard@lists.zx2c4.com>; Wed, 8 Aug 2018 19:25:51 +0000 (UTC)
Received: by mail-qt0-x22a.google.com with SMTP id d4-v6so3786968qtn.13
 for <wireguard@lists.zx2c4.com>; Wed, 08 Aug 2018 12:37:00 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Received: from ?IPv6:2600:6c4a:787f:d200:415f:a489:a6c9:915b?
 (2600-6c4a-787f-d200-415f-a489-a6c9-915b.dhcp6.chtrptr.net.
 [2600:6c4a:787f:d200:415f:a489:a6c9:915b])
 by smtp.gmail.com with ESMTPSA id f70-v6sm3166515qke.77.2018.08.08.12.36.58
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Aug 2018 12:36:58 -0700 (PDT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Matt Layher <mdlayher@gmail.com>
Subject: Kernel module sends infinite netlink messages on v0.0.20180802
Message-ID: <8b63f0e3-3f0f-d028-59de-5eb08af2e26a@gmail.com>
Date: Wed, 8 Aug 2018 15:36:57 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all,

While working on wireguardctrl, I found what I believe to be a bug with 
the kernel module today.  I'm using v0.0.20180802.  At first I assumed 
that my code was doing something wrong, but I'm able to make "wg show" 
hang forever as well, so I believe this to be a problem with the kernel 
module itself.

System information:

matt@nerr-2:~$ dmesg | grep wireguard
[ 1075.085912] wireguard: module verification failed: signature and/or 
required key missing - tainting kernel
[ 1075.086235] wireguard: WireGuard 0.0.20180802 loaded. See 
www.wireguard.com for information.
[ 1075.086235] wireguard: Copyright (C) 2015-2018 Jason A. Donenfeld 
<Jason@zx2c4.com>. All Rights Reserved.

matt@nerr-2:~$ uname -a
Linux nerr-2 4.15.0-30-generic #32-Ubuntu SMP Thu Jul 26 17:42:43 UTC 
2018 x86_64 x86_64 x86_64 GNU/Linux

Here are the steps to reproduce the issue:

Grab my "wgnlbug" Go source program and build it: 
https://github.com/mdlayher/wireguardctrl/blob/master/cmd/wgnlbug/main.go

$ go install github.com/mdlayher/wireguardctrl/cmd/wgnlbug

Reset wg0 to a clean state:

$ sudo ip link del dev wg0 && sudo ip link add dev wg0 type wireguard

Attempt to add multiple peers with 511 addresses each (the actual CIDR 
is hard-coded for both and doesn't seem to matter).  Note that you have 
to Ctrl+C the program or it'll hang forever.

$ sudo time ./bin/wgnlbug -n 2
before: wg0
^CCommand terminated by signal 2
1.29user 2.62system 0:02.74elapsed 142%CPU (0avgtext+0avgdata 
385236maxresident)k
0inputs+0outputs (0major+98292minor)pagefaults 0swaps

At this point, "wg show" appears to hang forever until something sends 
it a KILL (kernel maybe?) as well:

$ sudo time wg show
Command terminated by signal 9
20.88user 40.39system 1:03.31elapsed 96%CPU (0avgtext+0avgdata 
12233204maxresident)k
16128inputs+0outputs (92major+3058349minor)pagefaults 0swaps

A look at strace reveals what appears to be an infinite stream of 
multi-part netlink messages with identical sequence numbers:

$ sudo strace wg show
...
recvmsg(3, {msg_name={sa_family=AF_NETLINK, nl_pid=0, 
nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base={{len=4072, 
type=wireguard, flags=NLM_F_MULTI, seq=1533756618, pid=946}, 
"\x00\x01\x00\x00\x06\x00\x06\x00\x00\x00\x00\x00\x08\x00\x07\x00\x00\x00\x00\x00\x08\x00\x01\x00\x81\x00\x00\x00\x08\x00\x02\x00"...}, 
iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 4072
recvmsg(3, {msg_name={sa_family=AF_NETLINK, nl_pid=0, 
nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base={{len=4068, 
type=wireguard, flags=NLM_F_MULTI, seq=1533756618, pid=946}, 
"\x00\x01\x00\x00\xd0\x0f\x08\x00\xcc\x0f\x00\x00\x24\x00\x01\x00\xc6\x24\x8a\x34\xcc\x3c\x4a\x23\x00\xd4\x94\x8d\xec\x58\xc6\x7c"...}, 
iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 4068
recvmsg(3, {msg_name={sa_family=AF_NETLINK, nl_pid=0, 
nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base={{len=4072, 
type=wireguard, flags=NLM_F_MULTI, seq=1533756618, pid=946}, 
"\x00\x01\x00\x00\x06\x00\x06\x00\x00\x00\x00\x00\x08\x00\x07\x00\x00\x00\x00\x00\x08\x00\x01\x00\x81\x00\x00\x00\x08\x00\x02\x00"...}, 
iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 4072
recvmsg(3, {msg_name={sa_family=AF_NETLINK, nl_pid=0, 
nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base={{len=4068, 
type=wireguard, flags=NLM_F_MULTI, seq=1533756618, pid=946}, 
"\x00\x01\x00\x00\xd0\x0f\x08\x00\xcc\x0f\x00\x00\x24\x00\x01\x00\xc6\x24\x8a\x34\xcc\x3c\x4a\x23\x00\xd4\x94\x8d\xec\x58\xc6\x7c"...}, 
iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 4068
recvmsg(3, ^C{msg_name={sa_family=AF_NETLINK, nl_pid=0, 
nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base={{len=4072, 
type=wireguard, flags=NLM_F_MULTI, seq=1533756618, pid=946}, 
"\x00\x01\x00\x00\x06\x00\x06\x00\x00\x00\x00\x00\x08\x00\x07\x00\x00\x00\x00\x00\x08\x00\x01\x00\x81\x00\x00\x00\x08\x00\x02\x00"...}, 
iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 4072
--- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL} ---
strace: Process 946 detached

Hope this is helpful.  If it isn't a kernel module problem, I'd be 
curious to see what both my code and "wg" are doing that causes this.  
It seems to be reproducible 100% of the time on my system.

- Matt Layher
