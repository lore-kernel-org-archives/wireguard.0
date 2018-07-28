Return-Path: niklasbuschmann@posteo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59a4997b
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Jul 2018 20:26:40 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b90b03a6
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Jul 2018 20:26:40 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout02.posteo.de (Postfix) with ESMTPS id 50A1321121
 for <wireguard@lists.zx2c4.com>; Sat, 28 Jul 2018 22:36:23 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 41dHft5WcZz9rxM
 for <wireguard@lists.zx2c4.com>; Sat, 28 Jul 2018 22:36:22 +0200 (CEST)
From: Niklas Buschmann <niklasbuschmann@posteo.de>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [darwin] wg-quick command line flag to prevent disown
Message-Id: <1C82AB17-0F62-4A85-A336-B6A89D79ABBA@posteo.de>
Date: Sat, 28 Jul 2018 22:36:21 +0200
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I am using macOS=E2=80=99s launchd to create a boot daemon that runs =
wg-quick. Now launchd seems to kill the process when wg-quick calls =
disown, so I am currently just manually removing disown from the end of =
monitor_daemon, which of course breaks after each update, so I wish =
there was an option to keep wg-quick in the foreground.

Maybe there is a better approach to run wireguard as macOS daemon? I =
haven=E2=80=99t found any resources on this topic yet.

Thanks,
Niklas=
