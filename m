Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65e96f67
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:00:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef508ecf
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:00:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84cabf95
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:02:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a5aca55
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:02:06 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id l13-v6so28414992otk.9
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 18:02:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACW8NbAnCtceEQLqgJ6vaCHexH3dH_uq82TTPuYKeb-C55NM-Q@mail.gmail.com>
References: <CACW8NbAnCtceEQLqgJ6vaCHexH3dH_uq82TTPuYKeb-C55NM-Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 May 2018 03:02:20 +0200
Message-ID: <CAHmME9oCxEmAK2DBjqGb2cg8+7Dc=cW4L0KQgmgdN2+XJXHumw@mail.gmail.com>
Subject: Re: Wireguard client not roaming
To: Glen Bojsza <gbojsza@gmail.com>
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

Make sure the clock on the client is correct before connecting.
