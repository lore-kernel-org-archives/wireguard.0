Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80c773cc
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Dec 2016 18:51:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 313e4146
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Dec 2016 18:51:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 274dcf98
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Dec 2016 18:51:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f7946dbc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Dec 2016 18:51:14 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 3so147582401oih.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Dec 2016 10:59:05 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Dec 2016 19:59:04 +0100
Message-ID: <CAHmME9qR5y-5FzTuXy_V_j7V+vFDXJqpF7mV=T3=vXme187-7A@mail.gmail.com>
Subject: 3.18 kernel for Android
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

I've backported WireGuard using our series of disgusting, horrifying,
and repulsive [1] compat.h hacks to kernel 3.18. WireGuard now
supports all kernels =E2=89=A53.18. This should allow for building the modu=
le
for many Android phones.

If nothing terrible happens, this will be released as part of the next snap=
shot.

Jason

[1] https://git.zx2c4.com/WireGuard/tree/src/compat.h
