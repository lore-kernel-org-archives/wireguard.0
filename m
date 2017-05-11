Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f571e1e7
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 12:09:51 +0000 (UTC)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
 [209.85.128.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec02ba9d
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 12:09:51 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id l9so19094266wre.1
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 05:20:29 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 11 May 2017 14:20:27 +0200
Message-ID: <CADdae-g_jBia3E5NnCvK8j+C_tQxOvj0U6r4iHbHd_2Lg7OADg@mail.gmail.com>
Subject: [wireguard-devel] Check wireguard tunnel is alive
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

Hello,
For the moment, for check if a wireguard tunnel is alive, we ping
peer, it's working well  but,
we would prefer to use latest handshake.
At https://www.wireguard.io/protocol/ ,  we can read some information,
it seems based on REKEY_TIMOUT ?
can you be more precise, what is the maximum interval in second
between handshake, can we set this interval ?

Regards,
Nicolas Prochazka
