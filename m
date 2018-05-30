Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ebd937a
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 02:27:06 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1ca3db3
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 02:27:06 +0000 (UTC)
Received: from [64.53.190.244] (port=63690 helo=[192.168.1.146])
 by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <joe@solidadmin.com>) id 1fNqrN-0000GR-5p
 for wireguard@lists.zx2c4.com; Tue, 29 May 2018 21:29:09 -0500
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
From: Joe Doss <joe@solidadmin.com>
Subject: atomic-wireguard: Fedora Atomic Host and Silverblue support
Message-ID: <64ba52e4-98cf-cede-8852-a694038eb082@solidadmin.com>
Date: Tue, 29 May 2018 21:29:08 -0500
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

Hello there,

I am the Fedora/RHEL/CentOS package maintainer for WireGuard and I have 
seen at least one post on the mailing list and some random chatter on 
IRC about supporting WireGuard on Project Atomic [1] based distros. 
Specifically Fedora Atomic Host [2] and Silverblue [3]. Since I am 
starting to work more with Fedora Atomic Host for my projects, I have 
found a need to create a solution on my end.

Like CoreOS, these distros are immutable and designed to run 
containerized applications. Most of the file system on a Project Atomic 
based distro is read-only. This makes the current wireguard-dkms RPM 
impossible to use without substantial work on rpm-ostree [4]. To work 
around this limitation, I have created atomic-wireguard [5] and 
open-sourced it. Simply put, it builds the kernel module inside a 
container and then it loads it on the host node.

Some comments and disclaimers to consider before you use this project:

* It is much slower than using DKMS. It will add ~5 to 10min on your 
boot time if the kernel module isn't built for your currently booted 
kernel. Speeding this up is something I will be looking into soon.

* It relies on having a working Internet connection during boot to pull 
down the source and build the module for the current running kernel. 
This most likely can be improved.

* It probably has bugs. I wouldn't use this with production workloads 
without ample testing on your end.

* You can use the RPM on Fedora 28 Workstation. It will replace the 
wireguard-dkms and wireguard-tools packages and the install instructions 
are on the GitHub repo.

* wg-quick isn't supported as my use-case doesn't use it. Instead, 
atomic-wireguard makes use of the new WireGuard features in 
systemd-networkd that comes with systemd 238 that ships with Fedora 28.

* RHEL Atomic Host/CentOS Atomic Host support is going to take some 
time. There are a handful of RPMs that have to mature a bit to get into 
RHEL. Specifically systemd, podman, and container-selinux packages.

* Updating to the most current WireGuard snapshot is faster since you 
don't have to wait for me to make a new wireguard-dkms RPM. ;)

This project should be a stopgap for getting WireGuard on a Project 
Atomic based distro until we get upstream into the mainline kernel. All 
of the source is up on GitHub and the RPM is on Copr [6]. PRs and GH 
issues are welcome! Enjoy!

Thanks,
Joe

[1] https://www.projectatomic.io/
[2] https://getfedora.org/en/atomic/
[3] https://teamsilverblue.org/
[4] https://github.com/projectatomic/rpm-ostree/issues/1091
[5] https://github.com/jdoss/atomic-wireguard
[6] https://copr.fedorainfracloud.org/coprs/jdoss/atomic-wireguard/


-- 
Joe Doss
joe@solidadmin.com

https://twitter.com/jdoss
