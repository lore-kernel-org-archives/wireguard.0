Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4735af7
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 11:54:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfa869e0
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 11:54:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bcd18c8
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 11:54:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d18060a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 11:54:28 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id t79so13353346ota.3
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 03:59:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Nov 2017 12:59:34 +0100
Message-ID: <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
Subject: Re: roaming and ddns dynamic ip
To: d tbsky <tbskyd@gmail.com>
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

This is not a bug. DNS resolution is not done by the WireGuard module,
but rather by the configuration tool. If you want to update an IP,
you'll need to devise a mechanism for this. One popular one is this
example script:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns ,
but many other possibilities exist too.

Jason
