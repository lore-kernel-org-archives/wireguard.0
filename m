Return-Path: adorman@ironicdesign.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78841ec8
 for <wireguard@lists.zx2c4.com>; Thu, 3 May 2018 21:51:42 +0000 (UTC)
Received: from rosalind.ironicdesign.com (rosalind.ironicdesign.com
 [206.166.194.243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5be8a7d
 for <wireguard@lists.zx2c4.com>; Thu, 3 May 2018 21:51:42 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Andy Dorman <adorman@ironicdesign.com>
Subject: wg0 packets not being routed?
Message-ID: <8599540b-b761-57a1-a585-b4395f9bed96@ironicdesign.com>
Date: Thu, 3 May 2018 16:53:33 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Ironic Design Development <devel@lists.ironicdesign.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

We are just getting started with Wireguard, so I apologize in advance 
for any stupid mistakes I have made to cause this.

I am trying to set up VPN traffic between a local debian server cluster 
(allowed 192.168.99.x/24) and a Linode VM cluster (also debian, allowed 
192.168.100.x/24).

I have set up wg0 on two servers in the local cluster to confirm I am 
doing it correctly and I had no problem installing WG on the Linode 
slice once I switched the kernel to grub2 and rebooted into the latest 
AMD64 kernel with appropriate headers installed.

The problem is the Qwest edge router my local NOC connects through 
complains with "Destination Net Unreachable" as shown here.

# ping 192.168.100.2
PING 192.168.100.2 (192.168.100.2) 56(84) bytes of data.
 From 65.152.242.37 icmp_seq=1 Destination Net Unreachable

FYI, 65.152.242.37 is the IP of atl-edge-24.inet.qwest.net
...

The local and Linode servers have the wg0 interface configured as shown:

local NOC servers
========================
Server at 192.168.99.7
.............................
interface: wg0
   public key: 3piZKS+b1GFMwkAED3ZqIL02VLRfKCSRrfGKeyu1MXU=
   private key: (hidden)
   listening port: 53339

peer: /RjZ+4Zx+4TIfp8a4tGj4mZQ+ZtQGxThHiXOID4aplQ=
   endpoint: 206.166.195.227:53339
   allowed ips: 192.168.99.2/32
   latest handshake: 1 day, 23 minutes, 5 seconds ago
   transfer: 4.03 KiB received, 4.05 KiB sent

peer: eW8d4b4HBxY6szYsgI9V8kzkZqhWY4BaehSxkHaqBx0=
   endpoint: 173.230.137.236:53339
   allowed ips: 192.168.100.2/32

Server at 192.168.99.2
.............................
interface: wg0
   public key: /RjZ+4Zx+4TIfp8a4tGj4mZQ+ZtQGxThHiXOID4aplQ=
   private key: (hidden)
   listening port: 53339

peer: 3piZKS+b1GFMwkAED3ZqIL02VLRfKCSRrfGKeyu1MXU=
   endpoint: 206.166.194.234:53339
   allowed ips: 192.168.99.7/32
   latest handshake: 1 day, 21 minutes, 42 seconds ago
   transfer: 4.05 KiB received, 4.03 KiB sent

peer: eW8d4b4HBxY6szYsgI9V8kzkZqhWY4BaehSxkHaqBx0=
   endpoint: 173.230.137.236:53339
   allowed ips: 192.168.100.2/32

Linode VM server
========================
interface: wg0
   public key: eW8d4b4HBxY6szYsgI9V8kzkZqhWY4BaehSxkHaqBx0=
   private key: (hidden)
   listening port: 53339

peer: /RjZ+4Zx+4TIfp8a4tGj4mZQ+ZtQGxThHiXOID4aplQ=
   endpoint: 206.166.195.227:53339
   allowed ips: 192.168.99.2/32

peer: 3piZKS+b1GFMwkAED3ZqIL02VLRfKCSRrfGKeyu1MXU=
   endpoint: 206.166.194.234:53339
   allowed ips: 192.168.99.7/32


As I said earlier, the two local NOC server can ping each other on the 
192.168.99.x block just fine AND they can ping the public endpoint IP 
(173.230.137.236) of the Linode server, but both get a "network 
unreachable" error from 65.152.242.37 (atl-edge-24.inet.qwest.net) if 
they try to ping the Linode server using the allowed IP, 192.168.100.2.

It is as if the packets had the unroutable IP, 192.168.100.2, as their 
destination instead of the endpoint, 172.230.137.236.

So what have I missed?

Thank you for Wireguard and any help anyone can provide to show me what 
I am doing wrong.

-- 
Andy Dorman
Ironic Design, Inc.
AnteSpam.com

CONFIDENTIALITY NOTICE: This message is for the named person's use only. 
It may contain confidential, proprietary or legally privileged 
information. No confidentiality or privilege is waived or lost by any 
erroneous transmission. If you receive this message in error, please 
immediately destroy it and notify the sender. You must not, directly or 
indirectly, use, disclose, distribute, or copy any part of this message 
if you are not the intended recipient.
