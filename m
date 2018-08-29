Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7e6e923
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 03:52:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 496e721a
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 03:52:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 610240c6
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 03:50:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34506503
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 03:50:52 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id m11-v6so6827773oic.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Aug 2018 21:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <0f7abb29-d6d3-d211-c174-2748b318182f@boothlabs.me>
In-Reply-To: <0f7abb29-d6d3-d211-c174-2748b318182f@boothlabs.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Aug 2018 22:05:37 -0600
Message-ID: <CAHmME9rC_DrveLyP-ecEfpyOyLbopFpTO05KNuuMNHMtZYwr-Q@mail.gmail.com>
Subject: Re: [PATCH ARM] Compile on Raspberry Pi
To: boothf@boothlabs.me
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

Thanks! Fixed with:
https://git.zx2c4.com/WireGuard/commit/?id=4a5ef87efbc73d21107cb64cbaac3112bafd5288
