Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0699d676
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:07:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c595c60c
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:07:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1b09106
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:07:40 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f82so180075700wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 10:13:06 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Dec 2016 19:13:04 +0100
Message-ID: <CAHmME9rUoGMDvNYEW1h1KXi8sO9Ly0rb+hTNqA4pNwtmxWMSfA@mail.gmail.com>
Subject: MIPS irq stack: work in progress upstream
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

Just FYI, based on some feedback from folks on this list, it looks
like the MIPS linux developers are adding a separate IRQ stack to the
MIPS arch in Linux, which should allow us to get rid of the curve25519
"fake stack" malloc'ing.

https://www.spinics.net/lists/kernel/msg2396739.html

Horrah!

Jason
