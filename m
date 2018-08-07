Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e78887a
 for <wireguard@lists.zx2c4.com>; Tue, 7 Aug 2018 18:05:51 +0000 (UTC)
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cf74000
 for <wireguard@lists.zx2c4.com>; Tue, 7 Aug 2018 18:05:51 +0000 (UTC)
Received: by mail-io0-x243.google.com with SMTP id i18-v6so14761570ioj.13
 for <wireguard@lists.zx2c4.com>; Tue, 07 Aug 2018 11:16:52 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Received: from ?IPv6:2600:6c4a:787f:d200:ec44:1bb4:3e36:7af8?
 (2600-6c4a-787f-d200-ec44-1bb4-3e36-7af8.dhcp6.chtrptr.net.
 [2600:6c4a:787f:d200:ec44:1bb4:3e36:7af8])
 by smtp.gmail.com with ESMTPSA id o67-v6sm771211iod.66.2018.08.07.11.16.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Aug 2018 11:16:50 -0700 (PDT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Matt Layher <mdlayher@gmail.com>
Subject: wireguardctrl: Go package that enables control of WireGuard devices
 on multiple platforms
Message-ID: <e0d214b0-d1b4-4708-7e91-989060fcaf97@gmail.com>
Date: Tue, 7 Aug 2018 14:16:49 -0400
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

Hi all,

It's been a couple of weeks since my previous thread, so I wanted to 
follow up with a new one now that my Go package has a new name and an 
extended scope:

https://github.com/mdlayher/wireguardctrl

wireguardctrl is a Go package that abstracts away the WireGuard kernel, 
userspace, and any future OS-specific interfaces.

At this point, I've got all of the device and peer retrieval 
functionality done, but I still need to implement device peer 
configuration for both the kernel and userspace interfaces.  There are a 
couple issues open around this topic.

I think this package is at a point where I'd feel comfortable having 
folks try it out and see what happens.  I've got some integration tests 
hooked up in Travis CI for both the kernel and userspace modules, and it 
seems to work well!  My next plan is to consider building some kind of 
one-shot utility for setting up a tunnel by running a small program on 
two machines.

Thanks for your time, and feel free to reach out here or on IRC for any 
questions.

- Matt Layher

PS: Jason, if you do end up making a language bindings page for the 
website, I'd still like this package to be listed there!  I also found 
the beginnings of a Python library today: https://github.com/apognu/wgctl.
