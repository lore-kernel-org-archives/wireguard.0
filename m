Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 976a1a09
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 20:28:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6b60d4f
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 20:28:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cddc87c8
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 20:28:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 05c6b4e9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 20:28:10 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id v132so644454oie.1
 for <wireguard@lists.zx2c4.com>; Thu, 02 Nov 2017 13:30:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+Hw3eYrO9ksGfdLxvK0XhEbqA8x3_gXb1CnAhCiifwfyiY9-A@mail.gmail.com>
References: <CA+Hw3eYrO9ksGfdLxvK0XhEbqA8x3_gXb1CnAhCiifwfyiY9-A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 2 Nov 2017 21:30:47 +0100
Message-ID: <CAHmME9rmmj5X6AmBs-khfyvbU3xHNcqNM5OdPZ7rykoTnL5a9A@mail.gmail.com>
Subject: Re: Wireguard: segmentation fault on rPi
To: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
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

pi@raspberrypizero:~ $ readelf -a WireGuard/src/tools/wg | grep Tag_CPU_name
  Tag_CPU_name: "6"
pi@raspberrypizero:~ $ readelf -a /usr/bin/wg | grep Tag_CPU_name
  Tag_CPU_name: "7-A"

Looks like the Debian repo supplies ARMv7a binaries, whereas the
raspizero is ARMv6.
