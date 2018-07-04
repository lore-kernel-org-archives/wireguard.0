Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3b1314f
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:07:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dd01e7e
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:07:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2013d95d
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:06:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c9e114b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:06:17 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k81-v6so12924591oib.4
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jul 2018 14:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <fada85c8aea2e15480602784fba3eeeb@agner.ch>
In-Reply-To: <fada85c8aea2e15480602784fba3eeeb@agner.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Jul 2018 23:13:57 +0200
Message-ID: <CAHmME9odvkuvmpA6Fg0D-Cwy7zzokFDcaB7QP384AHL6VOd9RA@mail.gmail.com>
Subject: Re: Android: TCP connection drop when disabling WiFi
To: Stefan Agner <stefan@agner.ch>
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

Hi Stefan,

I wish this were the case too, but Android sends SOCK_DESTROY to
everything when networks change, and there isn't a lot that can be
done about it without rooting the device, as far as I can tell. If
you've got some Android chops and can think of a way we can suppress
that, I'd be very interested.

Jason
