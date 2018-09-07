Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9dba0a6
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 02:47:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d6cd92b
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 02:47:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4955e5c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 02:31:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1c2e14ff
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 02:31:47 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id y207-v6so24526924oie.13
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 19:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Vb7hrqMcT3Qwr0_ZRQXE645do9iBZnJaL5Qh4GqCKSncejtg@mail.gmail.com>
In-Reply-To: <CA+Vb7hrqMcT3Qwr0_ZRQXE645do9iBZnJaL5Qh4GqCKSncejtg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Sep 2018 20:47:42 -0600
Message-ID: <CAHmME9ps967EZUMwL+2Scw=8pSLF16SO2C6bZ+B8LexMb7DqGQ@mail.gmail.com>
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

Thanks for the report. Can you tell me if this fixes it for you?

https://git.zx2c4.com/WireGuard/commit/?id=dcb765a453fa22e4195bc42de1792567fe511c67

Jason
