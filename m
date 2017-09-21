Return-Path: konstantin@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca9a31f1
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 19:16:01 +0000 (UTC)
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
 [209.85.214.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3e86524
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 19:16:01 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id g18so1533603itg.5
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 12:43:26 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from gmail.com (192-0-230-179.cpe.teksavvy.com. [192.0.230.179])
 by smtp.gmail.com with ESMTPSA id p18sm1384726itp.24.2017.09.21.12.43.24
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Sep 2017 12:43:24 -0700 (PDT)
Date: Thu, 21 Sep 2017 15:43:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: wireguard@lists.zx2c4.com
Subject: Failure building on CentOS-7.4
Message-ID: <20170921194323.GC2587@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi, all:

I am getting the following error trying to build using the latest
CentOS-7.4 kernel using the 20170907 snapshot:

[root@ossna17 ~]# uname -r
3.10.0-693.2.2.el7.x86_64
[root@ossna17 ~]# cat /var/lib/dkms/wireguard/0.0.20170907/build/make.log
DKMS make.log for wireguard-0.0.20170907 for kernel 3.10.0-693.2.2.el7.x86_64 (x86_64)
Thu Sep 21 19:37:51 UTC 2017
make: Entering directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'
  LD      /var/lib/dkms/wireguard/0.0.20170907/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170907/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170907/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170907/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170907/build/peer.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:98:20: error: static declaration of ‘ipv6_mod_enabled’ follows non-static declaration
 static inline bool ipv6_mod_enabled(void)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:98:20: error: static declaration of ‘ipv6_mod_enabled’ follows non-static declaration
 static inline bool ipv6_mod_enabled(void)
                    ^
In file included from include/net/dsfield.h:11:0,
                 from include/net/ip_tunnels.h:10,
                 from /var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:71,
                 from <command-line>:0:
include/linux/ipv6.h:260:6: note: previous declaration of ‘ipv6_mod_enabled’ was here
 bool ipv6_mod_enabled(void);
      ^
In file included from include/net/dsfield.h:11:0,
                 from include/net/ip_tunnels.h:10,
                 from /var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:71,
                 from <command-line>:0:
include/linux/ipv6.h:260:6: note: previous declaration of ‘ipv6_mod_enabled’ was here
 bool ipv6_mod_enabled(void);
      ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:98:20: error: static declaration of ‘ipv6_mod_enabled’ follows non-static declaration
 static inline bool ipv6_mod_enabled(void)
                    ^
In file included from include/net/dsfield.h:11:0,
                 from include/net/ip_tunnels.h:10,
                 from /var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:71,
                 from <command-line>:0:
include/linux/ipv6.h:260:6: note: previous declaration of ‘ipv6_mod_enabled’ was here
 bool ipv6_mod_enabled(void);
      ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:98:20: error: static declaration of ‘ipv6_mod_enabled’ follows non-static declaration
 static inline bool ipv6_mod_enabled(void)
                    ^
In file included from include/net/dsfield.h:11:0,
                 from include/net/ip_tunnels.h:10,
                 from /var/lib/dkms/wireguard/0.0.20170907/build/compat/compat.h:71,
                 from <command-line>:0:
include/linux/ipv6.h:260:6: note: previous declaration of ‘ipv6_mod_enabled’ was here
 bool ipv6_mod_enabled(void);
      ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20170907/build/peer.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [/var/lib/dkms/wireguard/0.0.20170907/build/main.o] Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20170907/build/device.o] Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20170907/build/noise.o] Error 1
make: *** [_module_/var/lib/dkms/wireguard/0.0.20170907/build] Error 2
make: Leaving directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'

Best,
Konstantin
