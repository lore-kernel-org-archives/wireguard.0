Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5275d1a0
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:41:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e37d1042
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:41:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 234b454c
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:41:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ccb02b61
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:41:40 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id h4so18139395oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 07:53:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170517144709.GA28773@wolff.to>
References: <20170517144709.GA28773@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 16:53:02 +0200
Message-ID: <CAHmME9od2sWr4gRk1Py+rHN1QNihser7eHoj317H8V7qYuA5yw@mail.gmail.com>
Subject: Re: Wireguard is not building on Fedora with 4.12 rc1 kernels
To: Bruno Wolff III <bruno@wolff.to>
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

Hey Bruno,

Youch. I'm guessing this is because checking for the existence of a .c
file isn't sufficient, since it might not be supplied. I'll change
things around and you can retest.

Jason
