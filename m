Return-Path: rriley.cs@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 498c2fa5
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 10:58:35 +0000 (UTC)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
 [209.85.128.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58e9b268
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 10:58:35 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id c55so70570309wrc.3
 for <wireguard@lists.zx2c4.com>; Sun, 16 Apr 2017 04:06:07 -0700 (PDT)
Return-Path: <rriley.cs@gmail.com>
Received: from [10.20.150.55] ([86.36.66.129])
 by smtp.googlemail.com with ESMTPSA id u145sm6084444wmu.1.2017.04.16.04.06.02
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Apr 2017 04:06:03 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Ryan Riley <rriley.cs@gmail.com>
Subject: wireguard-tools Ubuntu package missing the binaries
Message-ID: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>
Date: Sun, 16 Apr 2017 14:06:01 +0300
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

I've been trying to setup wireguard to experiment with it a bit and I've 
run into a problem.  The i386 wireguard-tools package on the PPA for 
Ubuntu Xenial doesn't actually contain any of the binaries, just 
documentation.  You see this by checking the file listing at the end of 
the build log here:

https://launchpadlibrarian.net/315022481/buildlog_ubuntu-xenial-i386.wireguard_0.0.20170409-wg1~xenial_BUILDING.txt.gz

The amd64 package does contain the binaries.

I appreciate your work!

Thanks
Ryan
