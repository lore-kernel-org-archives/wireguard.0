Return-Path: mardnh@gmx.de
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0c3068d
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 20:43:47 +0000 (UTC)
Received: from [192.168.200.2] ([62.156.62.22]) by mail.gmx.com (mrgmx102)
 with ESMTPSA (Nemesis) id 0LyB6P-1bNy4T3FeX-015cbe for
 <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 22:43:52 +0200
To: wireguard@lists.zx2c4.com
From: Martin Hauke <mardnh@gmx.de>
Message-ID: <577D6D87.7000807@gmx.de>
Date: Wed, 6 Jul 2016 22:43:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Subject: [WireGuard] openSUSE package for WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi there,

i've done some initial packaging work for openSUSE (Leap 42.1,
Tubmleweed and Factory) on OBS.

You can find those packages in my OBS home repository:
http://download.opensuse.org/repositories/home:/mnhauke:/wireguard/

At the moment the package is split in two parts
1) wireguard             (wg userspace-tool)
2) wireguard-kmp-default (kernel module; the "-default" suffix is the
default kernel flavor)

While it builds fine on the mentioned openSUSE versions I did all my
functional tests only with openSUSE Leap 42.1 x86_64

Here's an example for installing the packages on openSUSE Leap 42.1 x86_64:
----
sudo zypper addrepo
http://download.opensuse.org/repositories/home:/mnhauke:/wireguard/openSUSE_Leap_42.1/home:mnhauke:wireguard.repo
sudo zypper install wireguard wireguard-kmp-default
----

Feedback and suggestions are welcome.

best regards,
Martin
