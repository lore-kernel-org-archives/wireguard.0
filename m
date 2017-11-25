Return-Path: adolphjohn@mailfence.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c8eabdc
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 11:32:40 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c5d83ad
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 11:32:40 +0000 (UTC)
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
 by wilbur.contactoffice.com (Postfix) with ESMTP id 58A2B3213
 for <wireguard@lists.zx2c4.com>; Sat, 25 Nov 2017 12:38:09 +0100 (CET)
Message-ID: <698609534.8582.1511609887938@ichabod.co-bxl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Subject: LibreCMC Wireguard Issue
From: xx xxx <adolphjohn@mailfence.com>
To: wireguard@lists.zx2c4.com
Date: Sat, 25 Nov 2017 12:38:07 +0100 (CET)
Reply-To: xx xxx <adolphjohn@mailfence.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I have a Thinkpenguin TPE R1100 Router with a Librecmc snapshot dated 13 Nov 2017 installed.
I've run "opkg update" and then unsuccessfully tried to install Wireguard [Luci-proto-wireguard} via both the cli and wui. In both cases I get the following errors:
root@libreCMC:~# opkg install luci-proto-wireguard
Installing luci-proto-wireguard (git-17.290.15350-38115e8-1) to root...
Downloading https://librecmc.org/librecmc/downloads/snapshots/v1.4.1/packages/mips_24kc/base/luci-proto-wireguard_git-17.290.15350-38115e8-1_all.ipk
Collected errors:
* satisfy_dependencies_for: Cannot satisfy the following dependencies for luci-proto-wireguard:
* kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) *
* opkg_install_cmd: Cannot install package luci-proto-wireguard.

Any ideas how to resolve?
