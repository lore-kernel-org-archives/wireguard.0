Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 594bf2ef
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 11:39:45 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76cbb0de
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 11:39:44 +0000 (UTC)
Subject: Re: LibreCMC Wireguard Issue
To: wireguard@lists.zx2c4.com
References: <698609534.8582.1511609887938@ichabod.co-bxl>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <33ed921e-3710-1271-b11d-cdc8ae88fb76@createc.ro>
Date: Sat, 25 Nov 2017 13:45:16 +0200
MIME-Version: 1.0
In-Reply-To: <698609534.8582.1511609887938@ichabod.co-bxl>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 25.11.2017 13:38, xx xxx wrote:
> I have a Thinkpenguin TPE R1100 Router with a Librecmc snapshot dated 13 Nov 2017 installed.
> I've run "opkg update" and then unsuccessfully tried to install Wireguard [Luci-proto-wireguard} via both the cli and wui. In both cases I get the following errors:
> root@libreCMC:~# opkg install luci-proto-wireguard
> Installing luci-proto-wireguard (git-17.290.15350-38115e8-1) to root...
> Downloading https://librecmc.org/librecmc/downloads/snapshots/v1.4.1/packages/mips_24kc/base/luci-proto-wireguard_git-17.290.15350-38115e8-1_all.ipk
> Collected errors:
> * satisfy_dependencies_for: Cannot satisfy the following dependencies for luci-proto-wireguard:
> * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) * kernel (= 4.4.87-1-4da53cbca65b7f25a04fcf5e4f6404a0) *
> * opkg_install_cmd: Cannot install package luci-proto-wireguard.
>
> Any ideas how to resolve?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

try to use  opkg install luci-proto-wireguard --force-reinstall 
--force-depends
