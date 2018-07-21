Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43cf0603
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 19:10:36 +0000 (UTC)
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73261515
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 19:10:36 +0000 (UTC)
Received: by mail-io0-x233.google.com with SMTP id z19-v6so12498220ioh.4
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jul 2018 12:19:24 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Received: from ?IPv6:2600:6c4a:787f:d200:44b8:21b0:bd5e:86f4?
 (2600-6c4a-787f-d200-44b8-21b0-bd5e-86f4.dhcp6.chtrptr.net.
 [2600:6c4a:787f:d200:44b8:21b0:bd5e:86f4])
 by smtp.gmail.com with ESMTPSA id r137-v6sm2656668ith.26.2018.07.21.12.19.22
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Jul 2018 12:19:23 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Matt Layher <mdlayher@gmail.com>
Subject: wireguardnl: Go package for interacting with WireGuard via generic
 netlink
Message-ID: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
Date: Sat, 21 Jul 2018 15:19:22 -0400
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

Hi all!

I've heard quite a few good things about WireGuard and decided to try it 
out at home today.  On top of that, I've done a lot of work with netlink 
and generic netlink in Go, and decided to implement a Go package that 
can use wireguard's generic netlink interface in the same way as the 
"wg" tool.  To avoid confusion with "wireguard" or "wireguard-go", I've 
chosen "wireguardnl" as the name:

https://github.com/mdlayher/wireguardnl

This was just a fun experiment for me (it works, but no tests yet), but 
perhaps it'll be useful for someone who wants to inspect the kernel 
module from a Go program (no support for changing settings as of now, 
but that'd be fun!).

While I'm here, I did have one inquiry about "WG_CMD_GET_DEVICE": after 
working with a handful of generic netlink families, I was slightly 
surprised to see that a request paired with "NLM_F_DUMP" doesn't return 
a list of all WireGuard devices from the kernel.

Per the documentation, sending an interface index or name attribute 
works just fine to retrieve a single device, but perhaps it'd be nice to 
be able to just dump a list of all WireGuard devices when "NLM_F_DUMP" 
and no attributes are specified.  For the time being, I can easily work 
around this with my "Devices" method by attempting to query the kernel 
for WireGuard device information about each of my network interfaces, 
and then filter out the ones that return "ENOTSUP".

Thanks for WireGuard, it seems extremely promising so far!

- Matt Layher
