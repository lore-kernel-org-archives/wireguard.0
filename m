Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed34f258
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2017 05:20:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d85dcf7
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2017 05:20:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff62a636
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2017 05:20:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6fbcb36a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Nov 2017 05:20:22 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id f66so3647208oib.2
 for <wireguard@lists.zx2c4.com>; Wed, 08 Nov 2017 21:23:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJQSx3aCmyP=a=WptUTUn-3igOL0D4i8ETij412bpfdTGeab7Q@mail.gmail.com>
References: <CAJQSx3aCmyP=a=WptUTUn-3igOL0D4i8ETij412bpfdTGeab7Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Nov 2017 14:23:46 +0900
Message-ID: <CAHmME9pCYjzr_41kCcDqwa_8HJhC3WOm2Fxyk9RbeRO9hpyACg@mail.gmail.com>
Subject: Re: Alpine Linux Packages
To: Steve Gilberd <steve@erayd.net>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

http://pkgs.alpinelinux.org/packages?name=wireguard-*

Enable edge:
https://wiki.alpinelinux.org/wiki/Edge

Then:
# apk add -U wireguard-tools
