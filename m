Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a050f312
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:19:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b571efe0
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:19:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4948a000
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:18:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c7567be
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:18:17 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id k81-v6so18683799oib.4
 for <wireguard@lists.zx2c4.com>; Sun, 29 Jul 2018 20:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
 <CAECwjAi9rrcqb6+kJcWChVGxnk1Ro68nJS7wh2b7F791RWSHvg@mail.gmail.com>
In-Reply-To: <CAECwjAi9rrcqb6+kJcWChVGxnk1Ro68nJS7wh2b7F791RWSHvg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Jul 2018 05:29:13 +0200
Message-ID: <CAHmME9ppK0TF5TQgY4kwJTpzWGAtNHBSwKbHPHJV2mPbj_7DHg@mail.gmail.com>
Subject: Re: compilation error on centos 7 kernels
To: Yousong Zhou <yszhou4tech@gmail.com>
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

Update to the latest available centos kernel in the latest available
centos release, and then after install WireGuard. If you're facing
problems then, email a compilation log.
