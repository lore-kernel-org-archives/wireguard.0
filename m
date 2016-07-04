Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f69b494b
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 22:07:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abc3bb46
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 22:07:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 089bc9da
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 22:07:32 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id h129so123985799lfh.1
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 15:10:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467669091.3196.0@smtp.gmail.com>
References: <1467669091.3196.0@smtp.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 00:10:51 +0200
Message-ID: <CAHmME9rBTuQ7d3qmbzx3J47NUF7xNXMP5tO8o3UU5G7AiGM=JQ@mail.gmail.com>
To: Artyom Aleksyuk <artyom.h31@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Can WireGuard be adopted for older kernels?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Artyom,

I face the same problem as you. I have an Edge Router Lite, and I'd
really love to run WireGuard on it, but their proprietary kernel is
stuck at 3.10. Major bummer.

The current plan is to write a userspace version in Rust, that will be
cross platform and work well on old kernels. No timeline on that
though.

However, I did at one point run wireguard on really old kernels during
testing. That was before I started using the very nice udp_tunnel_*
library inside newer kernels, which then forced the dependency. But
when I did do this, it worked. Maybe I'll dust off the ugly old code
and hack something horrible together to work on old kernels. On the
other hand, this might not really be a great use of time... I don't
know.

What system are you trying to run it on? Maybe if it's the same as me,
we can both poke Ubnt together to upgrade their kernel...

Jason
