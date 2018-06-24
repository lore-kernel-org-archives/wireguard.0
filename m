Return-Path: calvin@isi.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46f2caf5
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Jun 2018 15:46:40 +0000 (UTC)
Received: from boreas.isi.edu (boreas.isi.edu [128.9.160.161])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d61bbcdd
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Jun 2018 15:46:40 +0000 (UTC)
Received: from isi.edu (landercpu12.isi.edu [128.9.168.78])
 by boreas.isi.edu (8.13.8/8.13.8) with SMTP id w5OFpOCJ018432
 for <wireguard@lists.zx2c4.com>; Sun, 24 Jun 2018 08:51:24 -0700 (PDT)
Date: Sun, 24 Jun 2018 08:51:24 -0700
From: Calvin Ardi <calvin@isi.edu>
To: wireguard@lists.zx2c4.com
Subject: wireguard-tools: hard coded config paths in wg-quick
Message-ID: <20180624155124.GP30528@isi.edu>
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

Hi,

The wg-quick bash scripts have their CONFIG_SEARCH_PATHS hard coded to
two locations [1]:

  CONFIG_SEARCH_PATHS=( /etc/wireguard /usr/local/etc/wireguard )

In my use case with MacPorts (and perhaps with Homebrew, if customized
differently), mostly everything lives in /opt/local by default, so users
would initially add their configs to /opt/local/etc/wireguard.

Since the Makefile supports setting and using SYSCONFDIR [2, 3], I
suggest that the CONFIG_SEARCH_PATHS have the value of SYSCONFDIR added
to it--I don't know of a "clean" way to do this besides patching the
scripts in the Makefile during the `make install'

More than happy to help with a patch (creating, testing, or otherwise).

Thanks,
--calvin

[1] https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/darwin.bash#n43
[2] https://git.zx2c4.com/WireGuard/tree/src/tools/Makefile#n8
[3] https://git.zx2c4.com/WireGuard/tree/src/tools/Makefile#n81
