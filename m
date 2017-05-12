Return-Path: carroarmato0@inuits.eu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8260f294
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:26:04 +0000 (UTC)
Received: from zimbra.inuits.be (mail.inuits.eu [88.151.241.2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d452a3a0
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:26:04 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.inuits.be (Postfix) with ESMTP id 4EA954016F
 for <wireguard@lists.zx2c4.com>; Fri, 12 May 2017 11:36:49 +0200 (CEST)
Received: from zimbra.inuits.be ([127.0.0.1])
 by localhost (zimbra.inuits.be [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZp6mPVA5xAr for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 11:36:47 +0200 (CEST)
Received: from [10.0.42.51] (d54c71dba.static.telenet.be [84.199.29.186])
 by zimbra.inuits.be (Postfix) with ESMTPSA id 48FB540152
 for <wireguard@lists.zx2c4.com>; Fri, 12 May 2017 11:36:47 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Christophe Vanlancker <carroarmato0@inuits.eu>
Subject: Wireguard on Centos 7
Message-ID: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
Date: Fri, 12 May 2017 11:36:44 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1A3520956A3FDAAED59801E4"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------1A3520956A3FDAAED59801E4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to install wireguard on Centos 7.3.1611 with kernel 
3.10.0-514.16.1.el7.x86_64 being the latest. When trying to run dkms to 
compile the kernel module it bugs out.

Although the documentation says kernels >= 3.10 should be ok, I see that 
only kernels above 3.10.105 are being tested.


Version: 0.0.20170421


I attached the output of the make log.

Regards,
Christophe

-- 
-- 
Christophe Vanlancker <christophe.vanlancker@inuits.eu>
+32 (494) 232277 | Linux & Open-Source consultant - Inuits.eu


--------------1A3520956A3FDAAED59801E4
Content-Type: text/x-log;
 name="make.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="make.log"

DKMS make.log for wireguard-0.0.20170421 for kernel 3.10.0-514.16.1.el7.x86_64 (x86_64)
Fri May 12 11:19:07 CEST 2017
make: Entering directory `/usr/src/kernels/3.10.0-514.16.1.el7.x86_64'
  LD      /var/lib/dkms/wireguard/0.0.20170421/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170421/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170421/build/noise.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:13:2: warning: #warning "WireGuard support for kernels < 4.1 should work but is slightly experimental." [-Wcpp]
 #warning "WireGuard support for kernels < 4.1 should work but is slightly experimental."
  ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:13:2: warning: #warning "WireGuard support for kernels < 4.1 should work but is slightly experimental." [-Wcpp]
 #warning "WireGuard support for kernels < 4.1 should work but is slightly experimental."
  ^
In file included from ./arch/x86/include/asm/paravirt_types.h:45:0,
                 from ./arch/x86/include/asm/ptrace.h:64,
                 from ./arch/x86/include/asm/alternative.h:8,
                 from ./arch/x86/include/asm/bitops.h:16,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/skbuff.h:17,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:27:21: error: duplicate member ‘data’
 #define headers_end data
                     ^
include/linux/rh_kabi.h:88:41: note: in definition of macro ‘RH_KABI_EXTEND’
 # define RH_KABI_EXTEND(_new)           _new;
                                         ^
include/linux/skbuff.h:718:23: note: in expansion of macro ‘headers_end’
  RH_KABI_EXTEND(__u32 headers_end[0])
                       ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/skbuff.h:738:6: error: duplicate member ‘data’
     *data;
      ^
include/linux/skbuff.h: In function ‘skb_reset_tail_pointer’:
include/linux/skbuff.h:1684:24: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->tail = skb->data - skb->head;
                        ^
include/linux/skbuff.h: In function ‘__skb_push’:
include/linux/skbuff.h:1727:12: error: invalid operands to binary - (have ‘__u32[]’ and ‘unsigned int’)
  skb->data -= len;
            ^
include/linux/skbuff.h:1729:2: warning: return from incompatible pointer type [enabled by default]
  return skb->data;
  ^
include/linux/skbuff.h: In function ‘__skb_pull’:
include/linux/skbuff.h:1737:19: error: invalid operands to binary + (have ‘__u32[]’ and ‘unsigned int’)
  return skb->data += len;
                   ^
include/linux/skbuff.h: In function ‘__pskb_pull’:
include/linux/skbuff.h:1753:19: error: invalid operands to binary + (have ‘__u32[]’ and ‘unsigned int’)
  return skb->data += len;
                   ^
include/linux/skbuff.h: In function ‘skb_headroom’:
include/linux/skbuff.h:1778:19: error: invalid operands to binary - (have ‘const __u32 *’ and ‘unsigned char * const’)
  return skb->data - skb->head;
                   ^
include/linux/skbuff.h: In function ‘skb_reserve’:
In file included from ./arch/x86/include/asm/paravirt_types.h:45:0,
                 from ./arch/x86/include/asm/ptrace.h:64,
                 from ./arch/x86/include/asm/alternative.h:8,
                 from ./arch/x86/include/asm/bitops.h:16,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/skbuff.h:17,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:27:21: error: duplicate member ‘data’
 #define headers_end data
                     ^
include/linux/rh_kabi.h:88:41: note: in definition of macro ‘RH_KABI_EXTEND’
 # define RH_KABI_EXTEND(_new)           _new;
                                         ^
include/linux/skbuff.h:718:23: note: in expansion of macro ‘headers_end’
  RH_KABI_EXTEND(__u32 headers_end[0])
                       ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/skbuff.h:738:6: error: duplicate member ‘data’
     *data;
      ^
include/linux/skbuff.h:1817:12: error: invalid operands to binary + (have ‘__u32[]’ and ‘int’)
  skb->data += len;
            ^
include/linux/skbuff.h: In function ‘skb_inner_transport_offset’:
include/linux/skbuff.h:1858:41: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_inner_transport_header(skb) - skb->data;
                                         ^
include/linux/skbuff.h: In function ‘skb_reset_inner_transport_header’:
include/linux/skbuff.h:1863:42: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->inner_transport_header = skb->data - skb->head;
                                          ^
include/linux/skbuff.h: In function ‘skb_reset_inner_network_header’:
include/linux/skbuff.h:1880:40: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->inner_network_header = skb->data - skb->head;
                                        ^
include/linux/skbuff.h: In function ‘skb_reset_inner_mac_header’:
include/linux/skbuff.h:1897:36: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->inner_mac_header = skb->data - skb->head;
                                    ^
include/linux/skbuff.h: In function ‘skb_reset_transport_header’:
include/linux/skbuff.h:1918:36: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->transport_header = skb->data - skb->head;
                                    ^
include/linux/skbuff.h: In function ‘skb_reset_network_header’:
include/linux/skbuff.h:1935:34: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->network_header = skb->data - skb->head;
                                  ^
include/linux/skbuff.h: In function ‘skb_reset_mac_header’:
include/linux/skbuff.h: In function ‘skb_reset_tail_pointer’:
include/linux/skbuff.h:1956:30: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->mac_header = skb->data - skb->head;
                              ^
include/linux/skbuff.h:1684:24: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->tail = skb->data - skb->head;
                        ^
include/linux/skbuff.h: In function ‘skb_transport_offset’:
include/linux/skbuff.h: In function ‘__skb_push’:
include/linux/skbuff.h:2000:35: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_transport_header(skb) - skb->data;
                                   ^
include/linux/skbuff.h:1727:12: error: invalid operands to binary - (have ‘__u32[]’ and ‘unsigned int’)
  skb->data -= len;
            ^
include/linux/skbuff.h: In function ‘skb_network_offset’:
include/linux/skbuff.h:1729:2: warning: return from incompatible pointer type [enabled by default]
  return skb->data;
  ^
include/linux/skbuff.h:2015:33: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_network_header(skb) - skb->data;
                                 ^
include/linux/skbuff.h: In function ‘skb_inner_network_offset’:
include/linux/skbuff.h: In function ‘__skb_pull’:
include/linux/skbuff.h:2020:39: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_inner_network_header(skb) - skb->data;
                                       ^
include/linux/skbuff.h:1737:19: error: invalid operands to binary + (have ‘__u32[]’ and ‘unsigned int’)
  return skb->data += len;
                   ^
include/linux/skbuff.h: In function ‘__pskb_pull’:
include/linux/skbuff.h:1753:19: error: invalid operands to binary + (have ‘__u32[]’ and ‘unsigned int’)
  return skb->data += len;
                   ^
include/linux/skbuff.h: In function ‘skb_headroom’:
include/linux/skbuff.h:1778:19: error: invalid operands to binary - (have ‘const __u32 *’ and ‘unsigned char * const’)
  return skb->data - skb->head;
                   ^
include/linux/skbuff.h: In function ‘skb_reserve’:
include/linux/skbuff.h:1817:12: error: invalid operands to binary + (have ‘__u32[]’ and ‘int’)
  skb->data += len;
            ^
include/linux/skbuff.h: In function ‘skb_inner_transport_offset’:
include/linux/skbuff.h:1858:41: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_inner_transport_header(skb) - skb->data;
                                         ^
include/linux/skbuff.h: In function ‘skb_reset_inner_transport_header’:
include/linux/skbuff.h:1863:42: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->inner_transport_header = skb->data - skb->head;
                                          ^
include/linux/skbuff.h: In function ‘skb_reset_inner_network_header’:
include/linux/skbuff.h:1880:40: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->inner_network_header = skb->data - skb->head;
                                        ^
include/linux/skbuff.h: In function ‘skb_header_pointer’:
include/linux/skbuff.h: In function ‘skb_reset_inner_mac_header’:
include/linux/skbuff.h:1897:36: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->inner_mac_header = skb->data - skb->head;
                                    ^
include/linux/skbuff.h: In function ‘skb_reset_transport_header’:
include/linux/skbuff.h:2845:9: warning: passing argument 4 of ‘__skb_header_pointer’ discards ‘const’ qualifier from pointer target type [enabled by default]
         skb_headlen(skb), buffer);
         ^
include/linux/skbuff.h:1918:36: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->transport_header = skb->data - skb->head;
                                    ^
include/linux/skbuff.h: In function ‘skb_reset_network_header’:
include/linux/skbuff.h:2828:21: note: expected ‘void *’ but argument is of type ‘const __u32 *’
 static inline void *__skb_header_pointer(const struct sk_buff *skb, int offset,
                     ^
include/linux/skbuff.h:1935:34: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->network_header = skb->data - skb->head;
                                  ^
include/linux/skbuff.h: In function ‘skb_reset_mac_header’:
include/linux/skbuff.h:1956:30: error: invalid operands to binary - (have ‘__u32 *’ and ‘unsigned char *’)
  skb->mac_header = skb->data - skb->head;
                              ^
include/linux/skbuff.h: In function ‘skb_transport_offset’:
include/linux/skbuff.h:2000:35: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_transport_header(skb) - skb->data;
                                   ^
include/linux/skbuff.h: In function ‘skb_network_offset’:
include/linux/skbuff.h:2015:33: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_network_header(skb) - skb->data;
                                 ^
include/linux/skbuff.h: In function ‘skb_inner_network_offset’:
include/linux/skbuff.h:2020:39: error: invalid operands to binary - (have ‘unsigned char *’ and ‘const __u32 *’)
  return skb_inner_network_header(skb) - skb->data;
                                       ^
include/linux/skbuff.h: In function ‘skb_header_pointer’:
include/linux/skbuff.h:2845:9: warning: passing argument 4 of ‘__skb_header_pointer’ discards ‘const’ qualifier from pointer target type [enabled by default]
         skb_headlen(skb), buffer);
         ^
include/linux/skbuff.h:2828:21: note: expected ‘void *’ but argument is of type ‘const __u32 *’
 static inline void *__skb_header_pointer(const struct sk_buff *skb, int offset,
                     ^
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/netdevice.h: At top level:
include/linux/netdevice.h:2365:43: error: macro "dev_recursion_level" passed 1 arguments, but takes just 0
 static inline int dev_recursion_level(void)
                                           ^
include/linux/netdevice.h:2366:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 {
 ^
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/netdevice.h: At top level:
include/linux/netdevice.h:2365:43: error: macro "dev_recursion_level" passed 1 arguments, but takes just 0
 static inline int dev_recursion_level(void)
                                           ^
include/linux/netdevice.h:2366:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 {
 ^
In file included from include/net/rtnetlink.h:5:0,
                 from include/net/neighbour.h:29,
                 from include/net/dst.h:17,
                 from include/net/sock.h:72,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:60,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:10,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/net/netlink.h: In function ‘nlmsg_trim’:
include/net/netlink.h:536:40: error: invalid operands to binary - (have ‘unsigned char *’ and ‘__u32 *’)
   skb_trim(skb, (unsigned char *) mark - skb->data);
                                        ^
In file included from include/net/rtnetlink.h:5:0,
                 from include/net/neighbour.h:29,
                 from include/net/dst.h:17,
                 from include/net/sock.h:72,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:60,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:10,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/net/netlink.h: In function ‘nlmsg_trim’:
include/net/netlink.h:536:40: error: invalid operands to binary - (have ‘unsigned char *’ and ‘__u32 *’)
   skb_trim(skb, (unsigned char *) mark - skb->data);
                                        ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h: At top level:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:82:1: warning: initialization from incompatible pointer type [enabled by default]
 };
 ^
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:82:1: warning: (near initialization for ‘ipv6_stub_impl.ipv6_dst_lookup’) [enabled by default]
In file included from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:88:0,
                 from <command-line>:0:
include/net/addrconf.h:196:32: error: conflicting types for ‘ipv6_stub’
 extern const struct ipv6_stub *ipv6_stub __read_mostly;
                                ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:83:37: note: previous definition of ‘ipv6_stub’ was here
 static const struct ipv6_stub_type *ipv6_stub = &ipv6_stub_impl;
                                     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h: At top level:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:82:1: warning: initialization from incompatible pointer type [enabled by default]
 };
 ^
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:82:1: warning: (near initialization for ‘ipv6_stub_impl.ipv6_dst_lookup’) [enabled by default]
In file included from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:88:0,
                 from <command-line>:0:
include/net/addrconf.h:196:32: error: conflicting types for ‘ipv6_stub’
 extern const struct ipv6_stub *ipv6_stub __read_mostly;
                                ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:83:37: note: previous definition of ‘ipv6_stub’ was here
 static const struct ipv6_stub_type *ipv6_stub = &ipv6_stub_impl;
                                     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:125:20: error: redefinition of ‘netif_keep_dst’
 static inline void netif_keep_dst(struct net_device *dev)
                    ^
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/netdevice.h:3981:20: note: previous definition of ‘netif_keep_dst’ was here
 static inline void netif_keep_dst(struct net_device *dev)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:133:0: warning: "netdev_alloc_pcpu_stats" redefined [enabled by default]
 #define netdev_alloc_pcpu_stats alloc_percpu
 ^
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/netdevice.h:2182:0: note: this is the location of the previous definition
 #define netdev_alloc_pcpu_stats(type)     \
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:125:20: error: redefinition of ‘netif_keep_dst’
 static inline void netif_keep_dst(struct net_device *dev)
                    ^
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/netdevice.h:3981:20: note: previous definition of ‘netif_keep_dst’ was here
 static inline void netif_keep_dst(struct net_device *dev)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:133:0: warning: "netdev_alloc_pcpu_stats" redefined [enabled by default]
 #define netdev_alloc_pcpu_stats alloc_percpu
 ^
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/netdevice.h:2182:0: note: this is the location of the previous definition
 #define netdev_alloc_pcpu_stats(type)     \
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:165:20: error: static declaration of ‘skb_scrub_packet’ follows non-static declaration
 static inline void skb_scrub_packet(struct sk_buff *skb, bool xnet)
                    ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/skbuff.h:2809:6: note: previous declaration of ‘skb_scrub_packet’ was here
 void skb_scrub_packet(struct sk_buff *skb, bool xnet);
      ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:183:19: error: redefinition of ‘prandom_u32_max’
 static inline u32 prandom_u32_max(u32 ep_ro)
                   ^
In file included from include/linux/net.h:22:0,
                 from include/linux/skbuff.h:27,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/random.h:52:19: note: previous definition of ‘prandom_u32_max’ was here
 static inline u32 prandom_u32_max(u32 ep_ro)
                   ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:205:0: warning: "S8_MAX" redefined [enabled by default]
 #define S8_MAX ((s8)(U8_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:33:0: note: this is the location of the previous definition
 #define S8_MAX  ((s8)(U8_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:208:0: warning: "S16_MAX" redefined [enabled by default]
 #define S16_MAX ((s16)(U16_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:36:0: note: this is the location of the previous definition
 #define S16_MAX  ((s16)(U16_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:211:0: warning: "S32_MAX" redefined [enabled by default]
 #define S32_MAX ((s32)(U32_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:39:0: note: this is the location of the previous definition
 #define S32_MAX  ((s32)(U32_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:214:0: warning: "S64_MAX" redefined [enabled by default]
 #define S64_MAX ((s64)(U64_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:42:0: note: this is the location of the previous definition
 #define S64_MAX  ((s64)(U64_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:221:20: error: static declaration of ‘memzero_explicit’ follows non-static declaration
 static inline void memzero_explicit(void *s, size_t count)
                    ^
In file included from include/linux/bitmap.h:8:0,
                 from include/linux/cpumask.h:11,
                 from ./arch/x86/include/asm/cpumask.h:4,
                 from ./arch/x86/include/asm/msr.h:10,
                 from ./arch/x86/include/asm/processor.h:20,
                 from ./arch/x86/include/asm/thread_info.h:22,
                 from include/linux/thread_info.h:54,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mm_types.h:8,
                 from include/linux/kmemcheck.h:4,
                 from include/linux/skbuff.h:18,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/string.h:158:6: note: previous declaration of ‘memzero_explicit’ was here
 void memzero_explicit(void *s, size_t count);
      ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:165:20: error: static declaration of ‘skb_scrub_packet’ follows non-static declaration
 static inline void skb_scrub_packet(struct sk_buff *skb, bool xnet)
                    ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/skbuff.h:2809:6: note: previous declaration of ‘skb_scrub_packet’ was here
 void skb_scrub_packet(struct sk_buff *skb, bool xnet);
      ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:183:19: error: redefinition of ‘prandom_u32_max’
 static inline u32 prandom_u32_max(u32 ep_ro)
                   ^
In file included from include/linux/net.h:22:0,
                 from include/linux/skbuff.h:27,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/random.h:52:19: note: previous definition of ‘prandom_u32_max’ was here
 static inline u32 prandom_u32_max(u32 ep_ro)
                   ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:205:0: warning: "S8_MAX" redefined [enabled by default]
 #define S8_MAX ((s8)(U8_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:33:0: note: this is the location of the previous definition
 #define S8_MAX  ((s8)(U8_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:208:0: warning: "S16_MAX" redefined [enabled by default]
 #define S16_MAX ((s16)(U16_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:36:0: note: this is the location of the previous definition
 #define S16_MAX  ((s16)(U16_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:211:0: warning: "S32_MAX" redefined [enabled by default]
 #define S32_MAX ((s32)(U32_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:39:0: note: this is the location of the previous definition
 #define S32_MAX  ((s32)(U32_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:214:0: warning: "S64_MAX" redefined [enabled by default]
 #define S64_MAX ((s64)(U64_MAX >> 1))
 ^
In file included from include/linux/skbuff.h:17:0,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/kernel.h:42:0: note: this is the location of the previous definition
 #define S64_MAX  ((s64)(U64_MAX>>1))
 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:221:20: error: static declaration of ‘memzero_explicit’ follows non-static declaration
 static inline void memzero_explicit(void *s, size_t count)
                    ^
In file included from include/linux/bitmap.h:8:0,
                 from include/linux/cpumask.h:11,
                 from ./arch/x86/include/asm/cpumask.h:4,
                 from ./arch/x86/include/asm/msr.h:10,
                 from ./arch/x86/include/asm/processor.h:20,
                 from ./arch/x86/include/asm/thread_info.h:22,
                 from include/linux/thread_info.h:54,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mm_types.h:8,
                 from include/linux/kmemcheck.h:4,
                 from include/linux/skbuff.h:18,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:62,
                 from <command-line>:0:
include/linux/string.h:158:6: note: previous declaration of ‘memzero_explicit’ was here
 void memzero_explicit(void *s, size_t count);
      ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:83:37: warning: ‘ipv6_stub’ defined but not used [-Wunused-variable]
 static const struct ipv6_stub_type *ipv6_stub = &ipv6_stub_impl;
                                     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170421/build/compat/compat.h:83:37: warning: ‘ipv6_stub’ defined but not used [-Wunused-variable]
 static const struct ipv6_stub_type *ipv6_stub = &ipv6_stub_impl;
                                     ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20170421/build/main.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [/var/lib/dkms/wireguard/0.0.20170421/build/noise.o] Error 1
make: *** [_module_/var/lib/dkms/wireguard/0.0.20170421/build] Error 2
make: Leaving directory `/usr/src/kernels/3.10.0-514.16.1.el7.x86_64'

--------------1A3520956A3FDAAED59801E4--
