Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e43dfaac
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 12:24:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12dce961
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 12:24:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d1eaaed
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 12:24:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 764a8db5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 12:24:46 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b204so23015586oii.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 May 2017 05:36:02 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 May 2017 14:36:00 +0200
Message-ID: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
Subject: Text-based IPC for Userspace Implementations
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

Currently wg(8) talks to the kernel by passing structs through an
ioctl. Due to upstream demands, this is going to be changed to
netlink, and we'll ditch those structs. wg(8) previously tried to
re-use those same structs for userspace implementations, passing them
through a unix socket. Implementors did not like dealing with this.
Since the structs are going for the kernel stuff, we might as well
move to something better, too, for the userspace stuff. Therefore
wg(8) now has a very simple text-based IPC format over unix sockets
(or Windows named pipes) that can be easily implemented in nearly
every language, even bash.

I've written a small description of it here: https://www.wireguard.io/xplatform/

This will be part of the next snapshot.

Any questions?

Regards,
Jason
