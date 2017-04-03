Return-Path: stefan@agner.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f14e27b
 for <wireguard@lists.zx2c4.com>; Mon, 3 Apr 2017 07:02:17 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22512484
 for <wireguard@lists.zx2c4.com>; Mon, 3 Apr 2017 07:02:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 03 Apr 2017 00:07:56 -0700
From: Stefan Agner <stefan@agner.ch>
To: Jason@zx2c4.com
Subject: WireGuard recipes for OpenEmbedded
Message-ID: <a994fb2505af736da73a956fdee94128@agner.ch>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Just posted two recipes which allow building WireGuard using
OpenEmbedded:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-April/112075.html

OE makes it easy to build WireGuard for all sorts of platforms. I
created a quick test VPN between an ARM and 64-bit MIPS machine, seems
to work fine, see
https://blog.printk.io/2017/04/openembedded-recipes-for-wireguard-vpn/

Keep the amazing work, looking forward to see WireGuard upstream :-)

--
Stefan
