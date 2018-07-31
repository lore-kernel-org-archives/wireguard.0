Return-Path: jaron@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 018be09f
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jul 2018 20:40:19 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a48c57d
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jul 2018 20:40:19 +0000 (UTC)
Received: from [192.168.1.2] (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPA id E5438FC201
 for <wireguard@lists.zx2c4.com>; Tue, 31 Jul 2018 16:50:24 -0400 (EDT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
Subject: android feature request: integration with data usage settings
Message-ID: <9d3595ea-4ba8-d972-736d-83ed8b363166@kent-dobias.com>
Date: Tue, 31 Jul 2018 16:50:24 -0400
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

Hello,

I've been using the wireguard kernel module on my android 8.1 device for
a while, and it's been a dream. However, I noticed recently that
settings in Apps -> [App Here] -> Data Usage, like disabling an apps'
ability to use cellular data, become moot while the tunnel is on because
all the data is associated with wireguard in the eyes of that interface.
It would be nice if wireguard somehow respected these settings!

I've never done android development so I don't know where to start, but
would take a crack at it myself with some direction.

Jaron
