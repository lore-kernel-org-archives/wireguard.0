Return-Path: mk.fraggod@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 394667a1
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2017 16:45:08 +0000 (UTC)
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
 [209.85.215.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f7772a1
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2017 16:45:08 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id s16so7702861lfs.1
 for <wireguard@lists.zx2c4.com>; Thu, 09 Nov 2017 08:48:38 -0800 (PST)
Return-Path: <mk.fraggod@gmail.com>
Received: from malediction ([188.226.62.174])
 by smtp.gmail.com with ESMTPSA id g12sm1280958lfd.61.2017.11.09.08.48.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Nov 2017 08:48:31 -0800 (PST)
Date: Thu, 9 Nov 2017 21:48:29 +0500
From: Mike Kazantsev <mk.fraggod@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Documentation for kernel requirements doesn't mention
 CONFIG_UNUSED_SYMBOLS
Message-ID: <20171109214829.7205e821@malediction>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Have tried to build wireguard module (using dkms) on mainline 4.9.58
from kernel.org, and had following warnings on MODPOST:

  MODPOST 1 modules
  WARNING: "inet_confirm_addr" [/var/lib/dkms/wireguard/0.0.20171101/build/wireguard.ko] undefined!
  WARNING: "skb_checksum_setup" [/var/lib/dkms/wireguard/0.0.20171101/build/wireguard.ko] undefined!
  WARNING: "add_random_ready_callback" [/var/lib/dkms/wireguard/0.0.20171101/build/wireguard.ko] undefined!
  WARNING: "del_random_ready_callback" [/var/lib/dkms/wireguard/0.0.20171101/build/wireguard.ko] undefined!

These symbols did exist in /proc/kallsyms:

  ffffffff9385a100 T add_random_ready_callback
  ffffffff9385a1b0 T del_random_ready_callback
  ffffffff93991c20 T skb_checksum_setup
  ffffffff93a22ab0 T inet_confirm_addr

But not in Module.symvers file, hence the warnings.

Loading module also failed with following dmesg output:

  [20139.879546] wireguard: Unknown symbol del_random_ready_callback (err 0)
  [20139.879568] wireguard: Unknown symbol add_random_ready_callback (err 0)
  [20139.879611] wireguard: Unknown symbol skb_checksum_setup (err 0)
  [20139.879627] wireguard: Unknown symbol inet_confirm_addr (err 0)

All symbols in question have e.g. "EXPORT_SYMBOL(inet_confirm_addr);"
in the kernel code.

Reason seem to be missing CONFIG_UNUSED_SYMBOLS=y kernel option, which
wireguard effectively requires to be enabled, but which is missing from
"Kernel Requirements" section of the documentation (as of today, at least):

  https://www.wireguard.com/install/#kernel-requirements

While docs might not mention some other common sense options which are
enabled in most kernels, I wanted to suggest considering including this
one, in case it wasn't considered already.

As description above suggests, it might be not obvious why these
particular symbols get stripped during build, unlike with other options
that are already documented, where one can easily trace missing symbol
to a disabled module.

It'd have saved me a bunch of time spent looking into the issue.

Thanks!


-- 
Mike Kazantsev // fraggod.net
