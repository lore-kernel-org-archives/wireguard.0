Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83916b78
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 14:22:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9952ecc
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 14:22:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a2b0609
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 14:06:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5543c1c8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 14:06:31 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id b15-v6so27493224oib.10
 for <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 07:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Vb7hrqMcT3Qwr0_ZRQXE645do9iBZnJaL5Qh4GqCKSncejtg@mail.gmail.com>
 <CAHmME9ps967EZUMwL+2Scw=8pSLF16SO2C6bZ+B8LexMb7DqGQ@mail.gmail.com>
 <CA+Vb7hpM1BBg+nR8shSgg298sLt5+PPmxed9vdrYP3cRF1e9jQ@mail.gmail.com>
In-Reply-To: <CA+Vb7hpM1BBg+nR8shSgg298sLt5+PPmxed9vdrYP3cRF1e9jQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Sep 2018 08:22:30 -0600
Message-ID: <CAHmME9rAc77Z9XvvPG+mWy60OEYBycF95qddv9MrDnW_=Rgz3w@mail.gmail.com>
Subject: Re: Missing <asm/neon.h> with 0.0.20180904 on arm with kernel 3.10.107
To: richterphilipp.pops@gmail.com
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

Hi Philipp,

Super ancient kernels like that cannot use Neon in kernel space.

Jason
