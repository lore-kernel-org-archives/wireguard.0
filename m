Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a0308e0
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 01:05:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad89d472
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 01:05:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fa0ab1c
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 01:06:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5427260
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 01:06:56 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id y15-v6so17795989oia.13
 for <wireguard@lists.zx2c4.com>; Thu, 03 May 2018 18:06:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 May 2018 03:06:55 +0200
Message-ID: <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol@gmx.net
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

If v6 is disabled, no packets will make it to the v6 sockets, and you
should be fine. To entirely disable the creation of that socket,
disable the ipv6 module, via ipv6.disable=1 on the kernel command
line. This shouldn't actually be necessary for you though.

Jason
