Return-Path: artyom.h31@gmail.com
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf79b0ef
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 21:48:14 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id f6so123692474lfg.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 14:51:35 -0700 (PDT)
Return-Path: <artyom.h31@gmail.com>
Received: from [192.168.1.103] ([176.53.224.13])
 by smtp.gmail.com with ESMTPSA id 78sm3784275lfs.29.2016.07.04.14.51.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jul 2016 14:51:32 -0700 (PDT)
Date: Tue, 05 Jul 2016 00:51:31 +0300
From: Artyom Aleksyuk <artyom.h31@gmail.com>
To: wireguard@lists.zx2c4.com
Message-Id: <1467669091.3196.0@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: [WireGuard] Can WireGuard be adopted for older kernels?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi!
I'm currently using IPsec to make a virtual network between two private 
computers, and I'm searching for a simpler and faster alternative. 
Looks like WireGuard is a tool which perfectly suits my needs. However 
I'm forced to use an old kernel version (3.10) because it's the only 
version available for my device. Do you have any plans to adopt 
WireGuard for older kernels? I think that there's a lot of Linux 
machines which use an old kernel and which won't be updated in the 
foreseeable future.
