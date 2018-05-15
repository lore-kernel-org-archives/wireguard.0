Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 283a38f6
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 22:54:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83236d76
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 22:54:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0df28b16
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 22:53:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e2c3eff6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 22:53:09 +0000 (UTC)
Date: Wed, 16 May 2018 00:54:36 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
Message-ID: <20180515225433.GA26432@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

We're gradually adding more platforms capable of running WireGuard, thanks to
some still-buggy userspace code Mathias and I have been developing. Today you
can try WireGuard on two new platforms: Android and macOS.

[NEW] WireGuard for Android
---------------------------
You can download the app from the Play Store or from F-Droid. It supports
adding wg-quick(8)-style .conf files or .zips of them. The app uses the kernel
module if available, which gives the best performance, stability, and battery
life, and falls back to the userspace code if it's not available. Download at:
https://play.google.com/store/apps/details?id=com.wireguard.android

[NEW] WireGuard for macOS
-------------------------
You can install wg-quick, wg, and wireguard-go using Homebrew. Then you should
be able to run `wg-quick up whatever` and familiar commands as you're used to.
If you're setting up a network manually, you can run `wireguard-go utun3` in
place of the usual Linux command `ip link add utun3 dev wireguard`. Install
with the Homebrew command:
$ brew install wireguard-tools

[FUTURE] WireGuard for ${YOUR_FAVORITE_PLATFORM}
------------------------------------------------
It's a work in progress, and we hope to have nice things to announce in the
coming weeks. If you're interested in helping to develop support for a
particular platform, please send us an email at team@wireguard.com.

[WORKHORSE] WireGuard for Linux
-------------------------------
The Linux kernel implementation remains the recommended and most complete
WireGuard implementation, and we're actively working on upstreaming this code
to kernel.org. Install instructions are available for every major distro on:
https://www.wireguard.com/install/

[DISCLAIMER] Alpha Warning for Security-related Software
--------------------------------------------------------
The new implementations for macOS and Android are alpha quality, at best, so
keep expectations low. There are bugs. There may even be security issues, and
we don't yet certify that this software does what we want it to do. Let us
know as you encounter the inevitable nasty bugs. Consider this as "pre-release"
software.

Enjoy!
Jason
