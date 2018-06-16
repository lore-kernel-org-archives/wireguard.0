Return-Path: mail@53c70r.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4fc643e
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 20:43:02 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3284224f
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 20:43:02 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id F399343A81
 for <wireguard@lists.zx2c4.com>; Sat, 16 Jun 2018 22:47:19 +0200 (CEST)
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id BLCQhB4fKDJy for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 22:47:18 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Silvan Nagl <mail@53c70r.de>
Subject: CentOS improper mount labeling on SELinux enabled systems
Message-ID: <5301fd31-01bb-3434-b8d2-837ffbaa04fe@53c70r.de>
Date: Sat, 16 Jun 2018 22:47:14 +0200
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

Hello,

herewith I'm requesting a bug fix in the bash script 'wg-quick'. When 
'DNS' is set in the interfaces configuration file 'wg-quick' will mount 
the modified 'resolv.conf' with improper set SELinux labels which leads 
to services not being able to access the 'resolv.conf' correctly. In my 
test case it was 'syslogd_t' not being able to do the syscalls 'getattr 
read' because the normal mount will be labeled as 
'unconfined_u:object_r:user_tmp_t:s0' when i execute the script 
manually. The fix would be easily done by adding the correct mount 
labels as mount option:

mount -o context="system_u:object_r:net_conf_t:s0" -t tmpfs none /dev/shm

Greetings

Silvan



*** /bin/wg-quick    2018-06-13 19:29:40.000000000 +0200
--- wg-quick    2018-06-16 21:58:05.020633893 +0200
***************
*** 331,337 ****
           } | unshare -m --propagation shared bash -c "$(cat <<-_EOF
               set -e
               mount --make-private /dev/shm
!             mount -t tmpfs none /dev/shm
               cat > /dev/shm/resolv.conf
               mount -o remount,ro /dev/shm
               mount -o bind,ro /dev/shm/resolv.conf /etc/resolv.conf
--- 331,337 ----
           } | unshare -m --propagation shared bash -c "$(cat <<-_EOF
               set -e
               mount --make-private /dev/shm
!             mount -o context="system_u:object_r:net_conf_t:s0" -t 
tmpfs none /dev/shm
               cat > /dev/shm/resolv.conf
               mount -o remount,ro /dev/shm
               mount -o bind,ro /dev/shm/resolv.conf /etc/resolv.conf
