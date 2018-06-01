Return-Path: jungleboogie0@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a57ed997
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 23:24:15 +0000 (UTC)
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49247d2b
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 23:24:15 +0000 (UTC)
Received: by mail-it0-x22f.google.com with SMTP id a195-v6so3568048itd.3
 for <wireguard@lists.zx2c4.com>; Fri, 01 Jun 2018 16:26:39 -0700 (PDT)
MIME-Version: 1.0
From: jungle Boogie <jungleboogie0@gmail.com>
Date: Fri, 1 Jun 2018 16:26:36 -0700
Message-ID: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
Subject: Openbsd update recommendation
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi All,

For openBSD instructions here:
https://www.wireguard.com/install/#packages

Curl is not apart of base, so you can either assume the users have
curl installed, or use ftp(1) in the example. If you're doing the
latter, you'll need a pkg_add to also include curl.

https://man.openbsd.org/ftp.1


Also, I already have a go path setup. How do I get around this?

cd .gopath/src/git.zx2c4.com/wireguard-go && dep ensure -vendor-only -v
/usr/src/wireguard/wireguard-go-0.0.20180531 is not within a known GOPATH/src
gmake: *** [Makefile:33: vendor/.created] Error 1
gmake: Leaving directory '/usr/src/wireguard/wireguard-go-0.0.20180531'


$ echo $GOPATH
/home/jungle/gopath

Thanks!

-- 
-------
inum: 883510009027723
sip: jungleboogie@sip2sip.info
