Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eee64ec3
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 08:58:15 +0000 (UTC)
Received: from smtp15.bhosted.nl (smtp15.bhosted.nl [94.124.121.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd96be01
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 08:58:15 +0000 (UTC)
Date: Thu, 26 Apr 2018 08:59:10 +0000
Message-ID: <20180426085910.Horde.lkBbsqDOKlkg-Ah-LZ5UFW4@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
Subject: Re: RX Errors from Android Peer
References: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
 <CAHmME9ovmNCJ4501TDpvtu9doci1Z34jS9N88csgNskxq4QrRg@mail.gmail.com>
 <6e8c6b16-f131-6b45-9eee-f162a4f31099@attglobal.net>
In-Reply-To: <6e8c6b16-f131-6b45-9eee-f162a4f31099@attglobal.net>
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

Hi Eddie and Jason,

I seeing this too.

On the server: WireGuard 0.0.20180420-2-g802b85c (Mips32r2)

peer: bHFjNUyfx141TvuNXUyIQ2BDAF57zfcpgdRd09UOlSg=
   endpoint: <ipv4>:22649
   allowed ips: 10.0.0.8/32, fd00::8/128, <ipv6 prefix/48>:fff8::/64
   latest handshake: 17 minutes, 41 seconds ago
   transfer: 3.07 MiB received, 18.78 MiB sent

wg0       Link encap:UNSPEC  HWaddr  
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
           inet addr:10.0.0.1  P-t-P:10.0.0.1  Mask:255.255.255.0
           inet6 addr: fd00::1/64 Scope:Global
           inet6 addr: <ipv6 prefix/48>:fff0::/60 Scope:Global
           UP POINTOPOINT RUNNING NOARP  MTU:1440  Metric:1
           RX packets:23629 errors:215 dropped:0 overruns:0 frame:215
           TX packets:23885 errors:6 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:3224980 (3.0 MiB)  TX bytes:19693516 (18.7 MiB)



Latest Android client 0.4.0 on a Backberry DTEK50 android 6.0.1. So  
fallback on userspace implementation.

Address: 10.0.0.8/32, <ipv6 prefix/48>:fff8::1/64
dns: 8.8.8.8
Allowed IPS: ::/0, 0.0.0.0/0
MTU: auto.


Before test
wg0       Link encap:UNSPEC  HWaddr  
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
           inet addr:10.0.0.1  P-t-P:10.0.0.1  Mask:255.255.255.0
           inet6 addr: fd00::1/64 Scope:Global
           inet6 addr: <ipv6 prefix/48>:fff0::/60 Scope:Global
           UP POINTOPOINT RUNNING NOARP  MTU:1440  Metric:1
           RX packets:23714 errors:215 dropped:0 overruns:0 frame:215
           TX packets:23996 errors:6 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:3239760 (3.0 MiB)  TX bytes:19715932 (18.8 MiB)

dmesg:
wireguard: wg0: Sending handshake initiation to peer 6 (85d26a64)
wireguard: wg0: Receiving handshake initiation from peer 6 (85d26a64)
wireguard: wg0: Sending handshake response to peer 6 (85d26a64)
wireguard: wg0: Keypair 93 created for peer 6
wireguard: wg0: Keypair 91 destroyed for peer 6
wireguard: wg0: Receiving keepalive packet from peer 6 (85d26a64)
wireguard: wg0: Packet has unallowed src IP (8cd8bd50) from peer 6 (85d26a64)
wireguard: wg0: Receiving keepalive packet from peer 6 (85d26a64)
wireguard: wg0: Receiving keepalive packet from peer 6 (85d26a64)
wireguard: wg0: Receiving keepalive packet from peer 6 (85d26a64)
wireguard: wg0: Receiving handshake initiation from peer 6 (85d26a64)
wireguard: wg0: Sending handshake response to peer 6 (85d26a64)
wireguard: wg0: Keypair 94 created for peer 6
wireguard: wg0: Keypair 92 destroyed for peer 6
wireguard: wg0: Receiving keepalive packet from peer 6 (85d26a64)
wireguard: wg0: Retrying handshake with peer 6 (85d26a64) because we  
stopped hearing back after 15 seconds
wireguard: wg0: Sending handshake initiation to peer 6 (85d26a64)
wireguard: wg0: Receiving handshake response from peer 6 (85d26a64)


After test:
wg0       Link encap:UNSPEC  HWaddr  
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
           inet addr:10.0.0.1  P-t-P:10.0.0.1  Mask:255.255.255.0
           inet6 addr: fd00::1/64 Scope:Global
           inet6 addr: <ipv6 prefix/48>:fff0::/60 Scope:Global
           UP POINTOPOINT RUNNING NOARP  MTU:1440  Metric:1
           RX packets:26810 errors:216 dropped:0 overruns:0 frame:216
           TX packets:26866 errors:6 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:3674552 (3.5 MiB)  TX bytes:21719820 (20.7 MiB)

Tunnel is working: test-ipv6.nl shows both my ISP ipv4 and ipv6 address.

Greats,

René van Dorst.
