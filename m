Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3425ce0e
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 00:14:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ea02d3a
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 00:14:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b179ea9
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 00:14:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 66be220e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 00:14:30 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b126so130577801oia.2
 for <wireguard@lists.zx2c4.com>; Sun, 18 Dec 2016 16:21:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <159146feaa0.2768.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
References: <CAHmME9rCZpSjs-a5MbSXZ4APJxnjmd5oSLqcUaGZZChvAqJ38A@mail.gmail.com>
 <159146feaa0.2768.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Dec 2016 01:21:20 +0100
Message-ID: <CAHmME9qvC4DGkU0v3c87R9SDwyqViO4J6QBHmJux9yusU18=wg@mail.gmail.com>
Subject: Re: Seeking Fedora Maintainer
To: Joe Doss <joe@solidadmin.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Joe,

Nice to hear you're still out there, and huge congratulations on your
new kid! This is the best possible reply we could receive.

If you do automate the git build, be sure to build just based on newly
released tags, not on every commit. Also, since you last updated, the
tags have lost their `experimental-` prefix, which will slightly
change the URL. As well, for DKIM, there's now the `make dkim-install`
target, so that you don't have to manage which files are necessary
yourself. Check out what the Arch build does --
https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wireguard --
and if you look in the Makefile, you'll find quite a few paths that
you can override with environment variables, to match your liking.

Finally, please don't hesitate to get help in the maintenance burden
from potential others who might be around who could help.

Jason
