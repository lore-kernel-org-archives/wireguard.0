Return-Path: matrixman3077@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95794708
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 08:39:36 +0000 (UTC)
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
 [209.85.220.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dd3eb05
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 08:39:36 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id k201so13729583qke.9
 for <wireguard@lists.zx2c4.com>; Wed, 31 Jan 2018 00:44:40 -0800 (PST)
MIME-Version: 1.0
From: John Wayne <matrixman3077@gmail.com>
Date: Wed, 31 Jan 2018 10:44:39 +0200
Message-ID: <CACwd1hYUb0aGFOQoDY30a0Gsu2E-OaSHF0319x-kGbTSwov9Hg@mail.gmail.com>
Subject: Wireguard backport to 2.6.3x kernels
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I am working on a project that involves some old MIPS and ARM based
custom boards.
Current SDKs for these boards are pretty messy and there is no
documentation about the
patches that were applied to the 2.6.3x kernels in order make them
work on these boards.

So my question is how painfully will it be to port wireguard to the
even more ancient 2.6.3x kernels?

Thanks!
Igor B.
