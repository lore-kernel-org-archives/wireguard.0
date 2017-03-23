Return-Path: prvs=125568ae64=sattler@med.uni-frankfurt.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dac59590
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2017 22:35:21 +0000 (UTC)
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
 [141.2.22.233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06b60a67
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2017 22:35:21 +0000 (UTC)
Received: from smtpauth.cluster.uni-frankfurt.de ([10.1.1.214])
 by mailout.rz.uni-frankfurt.de with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.87)
 (envelope-from <sattler@med.uni-frankfurt.de>) id 1crBOd-000454-HA
 for wireguard@lists.zx2c4.com; Thu, 23 Mar 2017 23:39:55 +0100
Received: from p54b106c4.dip0.t-ipconnect.de ([84.177.6.196]
 helo=[192.168.2.17])
 by smtpauth.cluster.uni-frankfurt.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.87)
 (envelope-from <sattler@med.uni-frankfurt.de>) id 1crBOd-0003Vm-Aa
 for wireguard@lists.zx2c4.com; Thu, 23 Mar 2017 23:39:55 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
Subject: unable to set allowed-ips
Message-ID: <eb21fbc6-206d-68a6-994f-50dce322b534@med.uni-frankfurt.de>
Date: Thu, 23 Mar 2017 23:39:54 +0100
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

Hi there ...

I'm unable to set allowed-ips, I get

   "Unable to set device: Invalid argument"

when running

  # wg set wg0 peer 7KoA... allowed-ips 192.168.237.16/32


The last few line in strace are:

stat64("/var/run/wireguard/wg0.sock", 0xffc7a530) = -1 ENOENT (No such file 
or directory)
socket(AF_INET, SOCK_DGRAM, IPPROTO_IP) = 3
ioctl(3, _IOC(0, 0x89, 0xf1, 0x00), 0xffc7a61c) = -1 EINVAL (Invalid argument)
dup(2)                                  = 4
fcntl64(4, F_GETFL)                     = 0x2 (flags O_RDWR)
fstat64(4, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 3), ...}) = 0
write(4, "Unable to set device: Invalid ar"..., 39Unable to set device: 
Invalid argument
) = 39
close(4)                                = 0
exit_group(1)                           = ?
+++ exited with 1 +++


I'm running a crosscompiled 64bit kernel on 32bit Gentoo
userland. (As I installed it more than 10 years ago.)

Kernel version is 4.10.5, WireGuard is 0.0.20170320.1

I'm neither using a Gentoo kernel nor Gentoo's WireGuard
package but compiled them on my own enabling all Kernel
Requirements mentioned at https://www.wireguard.io/install

Trying to connect an Arch Linux based system (where I can
set allowed-ips) both show that they did a handshake but
as the Gentoo box won't set allowed-ips for the Arch box,
the Gentoo box rejects its packages, complaining about
packets having unallowed src IPs. :-(

I tried several kernels and WireGuard snapshots within the
last weeks and also spend some time searching for "allowed-
ips" and "Invalid argument" but couldn't yet find anything.

Thomas


P.S.: In case it helps, here the output from 'wg' so far:

Gentoo:

   interface: wg0
     public key: 74DO...
     private key: (hidden)
     pre-shared key: (hidden)
     listening port: 22

   peer: 7KoA...
     endpoint: 192.168.2.16:22
     allowed ips: (none)
     latest handshake: 26 minutes, 32 seconds ago
     transfer: 890.99 KiB received, 240 B sent
     persistent keepalive: every 5 minutes, 36 seconds

Arch Linux:


   interface: wg0
     public key: 7KoA...
     private key: (hidden)
     pre-shared key: (hidden)
     listening port: 22

   peer: 74DO...
     endpoint: 192.168.2.17:22
     allowed ips: 192.168.237.17/32
     latest handshake: 29 minutes, 9 seconds ago
     transfer: 14.00 KiB received, 2.21 MiB sent
