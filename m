Return-Path: whit@transpect.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6b11182
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 15:55:20 +0000 (UTC)
Received: from black.transpect.com (vt.electrainfo.com [207.136.236.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfc65254
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 15:55:20 +0000 (UTC)
Date: Mon, 4 Dec 2017 11:01:59 -0500
From: Whit Blauvelt <whit@transpect.com>
To: wireguard@lists.zx2c4.com
Subject: What are the options for stopping and starting?
Message-ID: <20171204160159.GA27666@black.transpect.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Great design on this project. If I can understand some of the things the
docs don't cover yet, I'll try to write them up.

The first thing I'm tripping over is the relationship of a configuration
file, say wg0.conf, to the wg kernel module. I can follow the documented
examples to get a connection set up; but once it's going I'm vague on how to
reset it to other values -- perhaps another port, or different allowed IPs
.... There are some cases where hand-editing of the conf file gets
overwritten by some automated process. Does that have something to do with
the "SaveConfig" flag? What's the theory there?

More centrally, how does one apply changes through the conf file? Most of
use are used to user-space daemons, where restarting the daemon or having it
reload its prefs is standard. Or for kernel stuff, we're used to using
sysctl.d. Working with settings of a kernel module set through a conf file
like this is not such a regular thing. What should the standard methods be
here?

Thanks,
Whit
