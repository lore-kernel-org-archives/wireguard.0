Return-Path: mytril43@posteo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51116203
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 11:49:49 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e769831
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 11:49:49 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id 6A5602104F
 for <wireguard@lists.zx2c4.com>; Wed,  7 Feb 2018 12:55:46 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3zc0C561LTz9rxD
 for <wireguard@lists.zx2c4.com>; Wed,  7 Feb 2018 12:55:45 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Mytril <mytril43@posteo.de>
Subject: Re: wg-quick systemd service does not work directly after boot
Message-ID: <d2debbc5-fc31-2671-6790-0f33194b146f@posteo.de>
Date: Wed, 7 Feb 2018 12:54:41 +0100
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

i have the same problem with the normal way over debian interface.

The interface cannot resolve the dynamic domain, because the internet
connection is not established at this moment.

But i have also only a workaround to create wg0. I also start the wg at
a later time.

So i think this is not a bug, but rather a problem with the order of
network connection startup.
