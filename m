Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58bdb011
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jul 2016 12:54:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 516504a2
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jul 2016 12:54:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 36832435
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jul 2016 12:54:05 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id g62so70675745lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 29 Jul 2016 05:57:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160729110821.khbc7w6z4rv4nphg@c3po>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <20160727150219.fdyg2smhmffmfxxl@c3po>
 <CAHmME9ogcB=7T8-0Qe+FuH11g7nAtA-xo0Q9CXnkB3SjhwNDkw@mail.gmail.com>
 <20160729110821.khbc7w6z4rv4nphg@c3po>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 29 Jul 2016 14:56:58 +0200
Message-ID: <CAHmME9pPUK5yMdXCWqKoQPMUSzxRuvaPAe7TzOHjx2KWCnzRmA@mail.gmail.com>
To: Michael Gerlach <n3ph@terminal21.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Woah!

root@lede:/# opkg install kmod-wireguard wireguard-tools
Installing kmod-wireguard (4.4.15+0.0.20160722-1) to root...
Downloading http://downloads.lede-project.org/snapshots/targets/malta/le/packages/kmod-wireguard_4.4.15+0.0.20160722-1_mipsel_24kc.ipk.
Installing kmod-udptunnel4 (4.4.15-1) to root...
Downloading http://downloads.lede-project.org/snapshots/targets/malta/le/packages/kmod-udptunnel4_4.4.15-1_mipsel_24kc.ipk.
Installing kmod-udptunnel6 (4.4.15-1) to root...
Downloading http://downloads.lede-project.org/snapshots/targets/malta/le/packages/kmod-udptunnel6_4.4.15-1_mipsel_24kc.ipk.
Installing kmod-ipt-hashlimit (4.4.15-1) to root...
Downloading http://downloads.lede-project.org/snapshots/targets/malta/le/packages/kmod-ipt-hashlimit_4.4.15-1_mipsel_24kc.ipk.
Installing wireguard-tools (0.0.20160722-1) to root...
Downloading http://downloads.lede-project.org/snapshots/packages/mipsel_24kc/packages/wireguard-tools_0.0.20160722-1_mipsel_24kc.ipk.
Installing libmnl (1.0.3-2) to root...
Downloading http://downloads.lede-project.org/snapshots/packages/mipsel_24kc/base/libmnl_1.0.3-2_mipsel_24kc.ipk.
Configuring libmnl.
Configuring kmod-udptunnel4.
Configuring kmod-udptunnel6.
Configuring kmod-ipt-hashlimit.
Configuring kmod-wireguard.
[  110.183892] wireguard: WireGuard loaded. See www.wireguard.io for
information.
[  110.185217] wireguard: (C) Copyright 2015-2016 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
Configuring wireguard-tools.
