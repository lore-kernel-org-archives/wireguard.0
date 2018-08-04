Return-Path: john@mib-infotech.co.nz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fecb5edb
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 21:56:21 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38b97782
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 21:56:21 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id z8-v6so4466020pgu.8
 for <wireguard@lists.zx2c4.com>; Sat, 04 Aug 2018 15:06:59 -0700 (PDT)
Return-Path: <john@mib-infotech.co.nz>
Received: from [10.16.226.11] ([103.247.155.34])
 by smtp.gmail.com with ESMTPSA id l85-v6sm15606211pfk.34.2018.08.04.15.06.56
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 Aug 2018 15:06:58 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: John Huttley <john@mib-infotech.co.nz>
Subject: package seems to have lost netifrc script
Message-ID: <55706f46-74db-9dfb-6cc7-93ce40f0d5c5@mib-infotech.co.nz>
Date: Sun, 5 Aug 2018 10:06:53 +1200
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

Gentoo needs a script in /lib/netifrc/net  for network integration with 
openrc.


This exists in wireguard-0.0.20180625 not in wireguard-0.0.20180802  or git.

The package is built with "module tools".

What happened?

--john
