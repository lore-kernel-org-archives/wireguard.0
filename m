Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c340e18
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 20:21:37 +0000 (UTC)
Received: from dnvrco-cmomta01.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.228])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 010dea7d
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 20:21:37 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Eddie <stunnel@attglobal.net>
Subject: Procedure for Updating Snapshot
Message-ID: <22f3ea2f-b76e-e106-3e62-4584241e8d1a@attglobal.net>
Date: Sun, 13 May 2018 13:21:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

What is the correct procedure for updating WG with a new snapshot.

I'm currently running CentOS 7.4 and previously had installed the 
20180420 snapshot.  Today, I tried to update with the new 20180513 one, 
and it appears to be failing.  The command I used was:  yum update 
--disablerepo=* --enablerepo=jdoss-wireguard wireguard*

This resulted in the following messages:

Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
   Updating   : 
1:wireguard-dkms-0.0.20180513-1.el7.centos.noarch            1/4
warning: %post(wireguard-dkms-1:0.0.20180513-1.el7.centos.noarch) 
scriptlet failed, exit status 10
Non-fatal POSTIN scriptlet failure in rpm package 
1:wireguard-dkms-0.0.20180513-1.el7.centos.noarch
   Updating   : 
1:wireguard-tools-0.0.20180513-1.el7.centos.x86_64           2/4
   Cleanup    : 
1:wireguard-tools-0.0.20180420-1.el7.centos.x86_64           3/4
   Cleanup    : 
1:wireguard-dkms-0.0.20180420-1.el7.centos.noarch            4/4
   Verifying  : 
1:wireguard-dkms-0.0.20180513-1.el7.centos.noarch            1/4
   Verifying  : 
1:wireguard-tools-0.0.20180513-1.el7.centos.x86_64           2/4
   Verifying  : 
1:wireguard-tools-0.0.20180420-1.el7.centos.x86_64           3/4
   Verifying  : 
1:wireguard-dkms-0.0.20180420-1.el7.centos.noarch            4/4

Updated:
   wireguard-dkms.noarch 1:0.0.20180513-1.el7.centos
   wireguard-tools.x86_64 1:0.0.20180513-1.el7.centos

Complete!


However, the extra/wireguard.ko module was not built.

I then realised that I had not stopped the running instance, and so ran:

systemctl stop wg-quick@wg0
yum reinstall --disablerepo=* --enablerepo=jdoss-wireguard wireguard*

This resulted in exactly the same errors and again the 
extra/wireguard.ko module was not built.

What am I doing wrong here.

Cheers.
