Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5cc3659
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 21:32:10 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b5a0262
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 21:32:10 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Lucian Cristian <luci@createc.ro>
Subject: centos 6 build error
Message-ID: <9fe139f0-a635-76ef-90b0-56b1a968c565@createc.ro>
Date: Mon, 2 Jan 2017 23:40:51 +0200
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

i'm trying to make a centos 6 peer and I'm blocked by this error

   CC [M]  /WireGuard/src/socket.o
/WireGuard/src/socket.c: In function ‘socket_init’:
/WireGuard/src/socket.c:343: error: unknown field ‘local_ip’ specified 
in initializer
/WireGuard/src/socket.c:343: warning: missing braces around initializer
/WireGuard/src/socket.c:343: warning: (near initialization for 
‘port4.<anonymous>’)
/WireGuard/src/socket.c:350: error: unknown field ‘local_ip6’ specified 
in initializer
/WireGuard/src/socket.c:350: warning: braces around scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
/WireGuard/src/socket.c:350: warning: excess elements in scalar initializer
/WireGuard/src/socket.c:350: warning: (near initialization for 
‘port6.<anonymous>.local_ip.s_addr’)
make[2]: *** [/WireGuard/src/socket.o] Error 1
make[1]: *** [_module_/WireGuard/src] Error 2

I'm missing some dependencies ?

regards
