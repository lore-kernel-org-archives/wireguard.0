Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3412d964
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 17:48:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e663a831
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 17:48:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5a86f08
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 18:07:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id debcda48
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 18:07:32 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id h199so86442419ith.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Jul 2017 11:08:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170727171923.GA28775@lore.localdomain>
References: <20170727171923.GA28775@lore.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Jul 2017 20:08:47 +0200
Message-ID: <CAHmME9oQe1iRQk8rdetXWioMKwUA27W1vNUdq7KTmgzjg5KE4g@mail.gmail.com>
Subject: Re: errors building 0.0.20170706 and later with Linux 3.14.0
To: Jaron Kent-Dobias <jaron@kent-dobias.com>
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

Hello,

The latest snapshot of WireGuard is 0.0.20170726. Can you tell me if
that fixes the issue for you? Likely not, but I'd be interested in the
newer build log.

Additionally, could you tell me why you're running 3.14, and what
package you're using to get that in Arch? Or, even better, a link to
the kernel sources of that package.

Thanks,
Jason

PS: you need to subscribe to this list in order to reply.
