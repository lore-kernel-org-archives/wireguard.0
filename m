Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c39e3c0
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 00:00:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56d9961a
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 00:00:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 180eb31f
 for <wireguard@lists.zx2c4.com>; Wed, 8 Aug 2018 23:59:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b6fd83cf
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Aug 2018 23:59:12 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id s198-v6so6844261oih.11
 for <wireguard@lists.zx2c4.com>; Wed, 08 Aug 2018 17:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <8b63f0e3-3f0f-d028-59de-5eb08af2e26a@gmail.com>
In-Reply-To: <8b63f0e3-3f0f-d028-59de-5eb08af2e26a@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Aug 2018 17:11:23 -0700
Message-ID: <CAHmME9qi0v1yMbTK+tTjB2RYjriZeRJBDH5i7yNfQcopfmJfOA@mail.gmail.com>
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

Thanks for letting me know. I've got a simpler reproducer now:

    #!/bin/bash

    a=( )
    for i in {1..197}; do
            a+=( abcd::$i )
    done

    s="$IFS"
    IFS=,
    a="${a[*]}"
    IFS="$s"

    ip link del wg0
    ip link add wg0 type wireguard
    wg set wg0 peer "$(wg genkey)" allowed-ips "$a"
    wg set wg0 peer "$(wg genkey)" allowed-ips "$a"
    wg

I'll have this fixed shortly and will ping back on this thread.

Jason
