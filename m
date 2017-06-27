Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9349ad3
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:42:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbbeee09
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:42:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57c1755d
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:56:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5e4fd375
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:56:32 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id i127so39154330wma.0
 for <wireguard@lists.zx2c4.com>; Tue, 27 Jun 2017 13:59:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <72b8742f-c5e7-557e-a45c-3b0b99efaf47@createc.ro>
References: <8cfef683-d9e1-fb6b-704c-f0c938c84c5b@createc.ro>
 <72b8742f-c5e7-557e-a45c-3b0b99efaf47@createc.ro>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Jun 2017 22:59:30 +0200
Message-ID: <CAHmME9pW9Ritr6D1kQRS6F__mXcmko_c5+MkXMrkbuOnUvKR=Q@mail.gmail.com>
Subject: Re: fix centos 6 compile
To: Lucian Cristian <luci@createc.ro>
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

Isn't EL6 still on 2.6.32, which is far away from the 3.10 that
WireGuard requires? In that case you'll be running with a custom
kernel. Why can't you just update your gcc from the same external
repo, at the same time?

I just backported to EL7.3 and felt nauseous the whole time. Not sure
I have the stomach for EL6...
