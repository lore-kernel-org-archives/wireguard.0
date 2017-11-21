Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c59c7843
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 19:38:49 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id f90d8cb9
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 19:38:49 +0000 (UTC)
Date: Tue, 21 Nov 2017 13:41:37 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: d8738d57ab9ab976a1899e73d955d38317f44486 not building with
 4.15.0-0.rc0.git6.
Message-ID: <20171121194137.GA20179@wolff.to>
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

I tried building the latest WireGuard on the latest rawhide kernel an got 
the following error:

/home/bruno/WireGuard/src/netlink.c: In function ‘get_device_dump_real’:
/home/bruno/WireGuard/src/netlink.c:180:2: error: too many arguments to function ‘genl_dump_check_consistent’
  genl_dump_check_consistent(cb, hdr, &genl_family);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/bruno/WireGuard/src/netlink.c:11:0:
./include/net/genetlink.h:194:20: note: declared here
 static inline void genl_dump_check_consistent(struct netlink_callback *cb,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:306: /home/bruno/WireGuard/src/netlink.o] Error 1

I also got some warnings about redefining READ_ONCE:

 CC [M]  /home/bruno/WireGuard/src/netlink.o
In file included from ./include/linux/kernel.h:10:0,
                 from ./include/linux/skbuff.h:17,
                 from ./include/linux/ip.h:20,
                 from /home/bruno/WireGuard/src/compat/compat.h:528,
                 from <command-line>:0:
./include/linux/compiler.h:249:0: warning: "READ_ONCE" redefined
 #define READ_ONCE(x) __READ_ONCE(x, 1)
 
In file included from <command-line>:0:0:
/home/bruno/WireGuard/src/compat/compat.h:42:0: note: this is the location of the previous definition
 #define READ_ONCE ACCESS_ONCE
