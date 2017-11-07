Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 746eef1e
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:03 +0000 (UTC)
Received: from 5.mo6.mail-out.ovh.net (5.mo6.mail-out.ovh.net [46.105.54.31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36712bd3
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:03 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id F284511CF4D
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:12 +0100 (CET)
Received: from localhost.localdomain (60-242-138-227.static.tpgi.com.au
 [60.242.138.227]) (Authenticated sender: aurelien@chabot.fr)
 by player696.ha.ovh.net (Postfix) with ESMTPA id 457B13C0092
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:10 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: WireGuard root-less support for android 
Date: Tue,  7 Nov 2017 15:38:11 +1100
Message-Id: <20171107043817.9050-1-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I worked on a set of change to add root-less support of WireGuard for
android. The solution I choose is to use the wireguard-go library inside
the android application. Golang as a mechanism to export some native
binding quite easily to java. The set of patch need some feedback but
it's actually working well. I'd like to know if you think this is a good
direction to take for the android application.
The patch are in the thread but I used a submodule to integrate the
wireguard-go library inside the wireguard-android so at least this need
to be change with the official url if it's get merge. 

You can also find the set of change on my github :
https://github.com/trishika/wireguard-android
https://github.com/trishika/wireguard-go

Aurélien
