Return-Path: anaknaga@inventati.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25a8ff43
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 14:38:35 +0000 (UTC)
Received: from devianza.investici.org (devianza.investici.org
 [198.167.222.108])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51a0c464
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 14:38:35 +0000 (UTC)
Received: from [198.167.222.108] (devianza [198.167.222.108]) (Authenticated
 sender: anaknaga@inventati.org) by localhost (Postfix) with ESMTPSA id
 9625913
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jan 2018 14:42:31 +0000 (UTC)
Message-ID: <1516632145.2241.49.camel@inventati.org>
Subject: Trouble building WireGuard since December releases
From: Kevin <anaknaga@inventati.org>
To: wireguard@lists.zx2c4.com
Date: Mon, 22 Jan 2018 15:42:25 +0100
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

Hi all,

I've been having trouble building WireGuard on Solus since its December
snapshots. Earlier snapshots (e.g. November) still build without a
problem, even on new kernels. Does this have to do with Solus kernel
builds, or am I overlooking something?

user@t450s-solus ~/bin/WireGuard-0.0.20180118/src $ make debug
test -e include/generated/autoconf.h -a -e include/config/auto.conf ||
(	\
echo >&2;							\
echo >&2 "  ERROR: Kernel configuration is invalid.";		\
echo >&2 "         include/generated/autoconf.h or
include/config/auto.conf are missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
to fix it.";	\
echo >&2 ;							\
/bin/false)
mkdir -p /home/user/bin/WireGuard-0.0.20180118/src/.tmp_versions ; rm
-f /home/user/bin/WireGuard-0.0.20180118/src/.tmp_versions/*
make -f ./scripts/Makefile.build obj=/home/user/bin/WireGuard-
0.0.20180118/src
make[2]: *** No rule to make target '/home/user/bin/WireGuard-
0.0.20180118/src/main.o', needed by '/home/user/bin/WireGuard-
0.0.20180118/src/wireguard.o'.  Stop.
make[1]: *** [Makefile:1507: _module_/home/user/bin/WireGuard-
0.0.20180118/src] Error 2
make: *** [Makefile:39: module-debug] Error 2
