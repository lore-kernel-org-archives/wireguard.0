Return-Path: lennart@hamburg.freifunk.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf51ce20
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 11:21:36 +0000 (UTC)
Received: from srv01.hamburg.freifunk.net (srv01.hamburg.freifunk.net
 [212.12.51.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35808dee
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 11:21:36 +0000 (UTC)
Received: from [10.5.0.5] (no1x.mullvad.net [31.169.51.155])
 by srv01.hamburg.freifunk.net (Postfix) with ESMTPSA id 1BDF65BF
 for <wireguard@lists.zx2c4.com>; Mon, 16 Jan 2017 12:32:07 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: lennart <lennart@hamburg.freifunk.net>
Subject: FAQ and quickstart
Message-ID: <af514aab-0c3a-1a10-17a8-4a538464651f@hamburg.freifunk.net>
Date: Mon, 16 Jan 2017 12:31:59 +0100
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

I'm trying to wireguard via the quickstart [0].
But I get this error:
$ sudo ip link add dev wg0 type wireguard
RTNETLINK answers: Operation not supported

I know it has something to do with kernel configurations, but that would
be a whole new topic to me.
What do I need to do? Isn't this a good question for a FAQ?

I'm on a archlinux:
$ uname -r
4.8.13-1-ARCH

Second:
How can a search the hole list archive? I'm just used to an interface to
do that.

[0] https://www.wireguard.io/quickstart/

Thanks a lot!
