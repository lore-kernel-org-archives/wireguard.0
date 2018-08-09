Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fafa2ad1
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 02:09:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed1cf0f3
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 02:09:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02f39109
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 02:08:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb35100f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 02:08:29 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id n21-v6so7299466oig.3
 for <wireguard@lists.zx2c4.com>; Wed, 08 Aug 2018 19:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <8b63f0e3-3f0f-d028-59de-5eb08af2e26a@gmail.com>
 <CAHmME9qi0v1yMbTK+tTjB2RYjriZeRJBDH5i7yNfQcopfmJfOA@mail.gmail.com>
 <CAHQtf6-gQRYWfb0eiWuMmke5S9LO3tf26h+YczKwtAZNALtJiA@mail.gmail.com>
In-Reply-To: <CAHQtf6-gQRYWfb0eiWuMmke5S9LO3tf26h+YczKwtAZNALtJiA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Aug 2018 19:20:42 -0700
Message-ID: <CAHmME9qyZQ-XQ0GDcoBAK8PdDr444Le5i0wq15un4oROKSj1AQ@mail.gmail.com>
Subject: Re: Kernel module sends infinite netlink messages on v0.0.20180802
To: Matt Layher <mdlayher@gmail.com>
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

On Wed, Aug 8, 2018 at 5:30 PM Matt Layher <mdlayher@gmail.com> wrote:
>
> Excellent! That's much more concise.

Let me know if this fixes it for you, and please do keep messing with
weird cases to see if you can find more bugs. I really appreciate you
finding this.

https://git.zx2c4.com/WireGuard/commit/?id=fd60e07ba3e294b94985a42d11afebf55f1d8829
