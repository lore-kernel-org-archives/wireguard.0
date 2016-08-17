Return-Path: joe@solidadmin.com
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a44b72a5
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 03:18:47 +0000 (UTC)
Received: from d4-50-47-134.col.wideopenwest.com ([50.4.134.47]:45411
 helo=sts1.inf7.net)
 by conquer.yellowcord.com with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
 (Exim 4.85) (envelope-from <joe@solidadmin.com>) id 1bZrSS-0006J6-D8
 for wireguard@lists.zx2c4.com; Tue, 16 Aug 2016 22:24:00 -0500
To: wireguard@lists.zx2c4.com
From: Joe Doss <joe@solidadmin.com>
Message-ID: <919f5c60-4f1e-0f12-012b-021bce9aca5d@solidadmin.com>
Date: Tue, 16 Aug 2016 22:24:00 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: [WireGuard] Fedora WireGuard RPMs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey there!

I saw the project was missing packages for Fedora, so I wrote some specs 
for RPMs to install the kernel module via DKMS and one for WireGuard 
tools. They are up on my Copr.

https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/

Which can be enabled with:

sudo dnf copr enable jdoss/wireguard

and the packages installed with:

sudo dnf install wireguard-dkms wireguard-tools

I haven't tested them other than making sure the kernel module loads on 
Fedora 24 and doing the first parts of the quick start. Let me know what 
you think and feedback for improvements on the specs is welcome.

Thanks!
Joe


-- 
Joe Doss
joe@solidadmin.com
