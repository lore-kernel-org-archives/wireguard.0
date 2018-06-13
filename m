Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7f692fe
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 22:04:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f675901
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 22:04:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3052c868
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 22:03:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 297720c2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 22:03:18 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id i205-v6so3839147oib.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jun 2018 15:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.834.1528911815.2201.wireguard@lists.zx2c4.com>
In-Reply-To: <mailman.834.1528911815.2201.wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Jun 2018 00:08:15 +0200
Message-ID: <CAHmME9oHtrhg=QnYrr0zUQLnLbH7qCiGA=zpWwDbnOnGHsKm3w@mail.gmail.com>
Subject: Re: Building the android apk on osx (case sensitive)
To: Ben Edmunds <bensammy2@yahoo.co.uk>
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

> ln: illegal option -- r
>
> usage: ln [-Ffhinsv] source_file [target_file]
>
>        ln [-Ffhinsv] source_file ... target_dir
>
>        link source_file target_file

The makefile uses options from coreutil's ln, which aren't available
on macOS. Use Linux to build the app. If Mac support in the build
system is really important to you and you have something useful you'd
like to contribute, I suppose I can futz with the makefile to use
simpler options to ln. Are you able to use Linux for development?
