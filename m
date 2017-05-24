Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e971b95
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:33:59 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f447d6c8
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:33:59 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx003
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0Lpbqo-1dqGhQ1JDi-00fQ3O for
 <wireguard@lists.zx2c4.com>; Wed, 24 May 2017 03:46:10 +0200
Date: Wed, 24 May 2017 03:46:06 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: What has changed in the configuration file?
Message-ID: <20170524034606.54078c3c@msi.defcon1>
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

Hi list,

I made an update that just upgraded WG to 0.0.20170517-wg2~zesty (on
Debian machines), but this time I'm left behind:

# ip link add dev wg0 type wireguard
# wg setconf wg0 vpnserver0.conf 
Line unrecognized: `Address=10.11.12.1/24'
Configuration parsing error

as 'man wg-quick' still contains an example using:
'Address = 10.200.100.8/24', I'm completely lost.

In fact, my configuration file is very close to the one described in
this man, so:

1- what has replaced the 'Address' primitive?

2- functional configuration files examples _updated_ on the site and in
   the man would be a nice idea.

Jean-Yves
