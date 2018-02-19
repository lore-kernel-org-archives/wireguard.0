Return-Path: dominik@suess.wtf
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26c0c4af
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 11:57:19 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de99f325
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 11:57:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 7C67242B7E
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 13:04:47 +0100 (CET)
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id 2Qv1sAINTrJd for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 13:04:44 +0100 (CET)
Date: Mon, 19 Feb 2018 13:04:38 +0100
From: Dominik =?iso-8859-1?b?U/zf?= <dominik@suess.wtf>
Subject: wireguard-go relative imports
To: wireguard@lists.zx2c4.com
Message-Id: <1519041791.htnfj9db7j.astroid@manalishi.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Can someone tell me the reason why the wireguard-go package uses
relative imports? This breaks go build when the working directory is
inside of the /home/thesuess/workspace and thus wireguard-go cannot be inst=
alled via go
get.

What are the upsides to this approach?
=
