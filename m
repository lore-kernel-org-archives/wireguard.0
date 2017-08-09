Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca7f3a6f
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 01:29:44 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df86ada5
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 01:29:44 +0000 (UTC)
Received: from d53-64-244-190.nap.wideopenwest.com ([64.53.190.244]:63235
 helo=[192.168.1.155])
 by conquer.yellowcord.com with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
 (Exim 4.85) (envelope-from <joe@solidadmin.com>) id 1dfG9q-0005iL-2J
 for wireguard@lists.zx2c4.com; Tue, 08 Aug 2017 20:51:38 -0500
Subject: Re: trouble installing on Fedora and CentOS
To: wireguard@lists.zx2c4.com
References: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <0774b643-23a3-5e57-c4db-889db42ae7eb@solidadmin.com>
Date: Tue, 8 Aug 2017 20:51:37 -0500
MIME-Version: 1.0
In-Reply-To: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Adam,

Thanks for using WireGuard. See my response below.

On 08/08/2017 02:58 PM, adam souzis wrote:
> I've been impressed with Wireguard, its design has helped simplify the 
> implementation of a distributed sandbox app I am building quite a bit. 
> But I have had mixed results getting it running on different distributions.
> 
> The good news is that I can report that I was able to build, install and 
> run Wireguard on CoreOs.
> 
> The bad news is I was unable to get Wireguard working on either CentOS 
> 7, Fedora 26 or Fedora 25 (running these on AWS), it doesn't appear to 
> be installing the kernel module properly.
> 
> Here's what I see when install the RPM:
> 
> + dkms add -m wireguard -v 0.0.20170629 -q --rpm_safe_upgrade
> 
> + dkms build -m wireguard -v 0.0.20170629 -q
> 
> + dkms install -m wireguard -v 0.0.20170629 -q
> 
> D: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch): waitpid(14760) rc 
> 14760 status 100
> 
> warning: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch) scriptlet 
> failed, exit status 1
> 
> Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms
Are you running into this issue on a freshly provisioned server? Or 
after you do a system update? Do you reboot into the most current kernel 
if you do update? Does the kernel update along with kernel-devel and 
kernel-headers?

This issue is caused by you running a kernel that doesn't have the 
correct kernel-header package installed:

[root@localhost ~]# dkms status
wireguard, 0.0.20170726: added

[root@localhost wireguard-0.0.20170726]# dkms build -m wireguard -v 
0.0.20170726
Error! echo
Your kernel headers for kernel 4.11.8-300.fc26.x86_64 cannot be found at
/lib/modules/4.11.8-300.fc26.x86_64/build or 
/lib/modules/4.11.8-300.fc26.x86_64/source.

[root@localhost ~]# uname -a
Linux localhost.localdomain 4.11.8-300.fc26.x86_64 #1 SMP Thu Jun 29 
20:09:48 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

[root@localhost ~]# rpm -qa |grep kernel
kernel-devel-4.11.11-300.fc26.x86_64
kernel-core-4.11.8-300.fc26.x86_64
kernel-headers-4.11.11-300.fc26.x86_64

I just tested the latest package on Vagrant and it works after running a 
dnf update and rebooting into the most current kernel that matches the 
currently installed kernel headers package.

[root@localhost ~]# uname -a
Linux localhost.localdomain 4.11.11-300.fc26.x86_64 #1 SMP Mon Jul 17 
16:32:11 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

[root@localhost ~]# rpm -qa |grep kernel
kernel-devel-4.11.11-300.fc26.x86_64
kernel-core-4.11.8-300.fc26.x86_64
kernel-headers-4.11.11-300.fc26.x86_64
kernel-core-4.11.11-300.fc26.x86_64

[root@localhost ~]# dkms build -m wireguard -v 0.0.20170726
Module wireguard/0.0.20170726 already built for kernel 
4.11.11-300.fc26.x86_64/4

[root@localhost ~]# ip link add dev wg0 type wireguard

[root@localhost ~]# wg show
interface: wg0

You either want to install the kernel-headers package that matches your 
currently running kernel or dnf update and reboot, then DKMS will auto 
build the WireGuard kernel module on boot.

Joe

--
Joe Doss
joe@solidadmin.com
