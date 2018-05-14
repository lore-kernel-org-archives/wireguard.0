Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9531539f
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 May 2018 19:44:43 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c56c7bc8
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 May 2018 19:44:42 +0000 (UTC)
Received: from [64.53.190.244] (port=46174 helo=[192.168.1.146])
 by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
 (envelope-from <joe@solidadmin.com>) id 1fIJOr-0002IB-Js
 for wireguard@lists.zx2c4.com; Mon, 14 May 2018 14:44:49 -0500
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Joe Doss <joe@solidadmin.com>
Subject: Fedora/CentOS error: wireguard-dkms-1:0.0.20180420-1.fc28.noarch:
 erase failed
Message-ID: <f5c5a4c8-e20b-d810-909a-12ed0129b0a9@solidadmin.com>
Date: Mon, 14 May 2018 14:44:48 -0500
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

One of my coworkers stumbled on this error this morning where the 
WireGuard DKMS module would get removed by a kernel update and leave the 
wireguard-dkms-0.0.20180420-1.fc28.noarch RPM hanging out where it 
couldn't uninstall correctly. You will see this error on a dnf/yum update:

Failed:
   wireguard-dkms.noarch 1:0.0.20180513-1.fc28

You can verify the issue with this command:

# rpm -qa |grep wireguard-dkms
wireguard-dkms-0.0.20180513-1.fc28.noarch
wireguard-dkms-0.0.20180420-1.fc28.noarch

You will see the old snapshot RPM won't manually be removed like this:

# rpm -e wireguard-dkms-0.0.20180420-1.fc28.noarch
error: %preun(wireguard-dkms-1:0.0.20180420-1.fc28.noarch) scriptlet 
failed, exit status 3
error: wireguard-dkms-1:0.0.20180420-1.fc28.noarch: erase failed

You can fix this easily with:

# dkms install -m wireguard -v 0.0.20180420

Verify it is installed:

# dkms status
wireguard, 0.0.20180420, 4.16.6-302.fc28.x86_64, x86_64: installed 
(WARNING! Diff between built and installed module!)
wireguard, 0.0.20180513, 4.16.6-302.fc28.x86_64, x86_64: built
wireguard, 0.0.20180513, 4.16.7-300.fc28.x86_64, x86_64: installed

Manually remove the old snapshot RPM:

# rpm -e wireguard-dkms-0.0.20180420-1.fc28.noarch

Verify that it is uninstalled:

# rpm -qa |grep wireguard-dkms
wireguard-dkms-0.0.20180513-1.fc28.noarch

This issue seems to be a pretty rare edge case, and the fix is easy. I 
will try and improve the RPM so this can't happen in the future. Any 
ideas from the list on how to prevent this edge case are welcome.

Joe




-- 
Joe Doss
joe@solidadmin.com
