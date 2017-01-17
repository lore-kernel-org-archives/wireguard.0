Return-Path: lennart@hamburg.freifunk.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eecff2cc
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 09:12:23 +0000 (UTC)
Received: from srv01.hamburg.freifunk.net (srv01.hamburg.freifunk.net
 [212.12.51.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c29659a
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 09:12:23 +0000 (UTC)
Received: from [10.5.0.2] (no1x.mullvad.net [31.169.51.155])
 by srv01.hamburg.freifunk.net (Postfix) with ESMTPSA id 557C324C
 for <wireguard@lists.zx2c4.com>; Tue, 17 Jan 2017 10:23:02 +0100 (CET)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: lennart <lennart@hamburg.freifunk.net>
Subject: Similar Problem with ArchARM
Message-ID: <03b53159-927e-fa41-8fcd-544e914c7441@hamburg.freifunk.net>
Date: Tue, 17 Jan 2017 10:22:53 +0100
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

Hi again,

I'm now trying to get wireguard running on my raspberry pi with archARM
[0]. I installed wireguard-dkms, wireguard-tools and
linux-raspberrypi-headers and now get:

alarm@alarmpi ~/wireguard ❯❯❯ sudo modprobe wireguard
modprobe: FATAL: Module wireguard not found in directory
/lib/modules/4.1.20-1-ARCH

Any idea what could solve this problem?

[0] https://archlinuxarm.org/

Thanks again!
