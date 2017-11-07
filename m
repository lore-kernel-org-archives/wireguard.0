Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47453c78
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 11:56:44 +0000 (UTC)
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
 [87.98.165.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd996c8d
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 11:56:44 +0000 (UTC)
Received: from player732.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6B57F16DB8B
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 12:59:56 +0100 (CET)
Received: from localhost.localdomain (60-242-138-227.static.tpgi.com.au
 [60.242.138.227]) (Authenticated sender: aurelien@chabot.fr)
 by player732.ha.ovh.net (Postfix) with ESMTPA id E2C6E200EE
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 12:59:53 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: WireGuard-Go Android support
Date: Tue,  7 Nov 2017 22:59:37 +1100
Message-Id: <20171107115939.4879-1-aurelien@chabot.fr>
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

This is a set of patch the wireguard-go project adding some needed stuff
to have android support. 
The idea is to use the wireguard-go project as a library that is exposed
with a "gomobile" binding to an android application.
I posted a set of patch on the wireguard-android project too and it is
worth for anyone looking at those change to have a look there too, at
least at the couple of go file that live there.
The change look a bit intrusive here (I had to move most of the code to
a folder...) but I did not find any other clean solution to be able to
use this code as an outside library (although I am not a go expert). I
am open to any better idea.

Regarding the change itself, there is one item that i'd like to
highlight, it's the change on that add a "tun device close". I am not
sure why I had to add this code, maybe I miss something else more
general, but it was actually never called in my case.   

Aurélien
