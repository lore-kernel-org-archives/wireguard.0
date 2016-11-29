Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51413824
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 19:18:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1400c634
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 19:18:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c948995
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 19:18:40 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b14so129501001lfg.2
 for <wireguard@lists.zx2c4.com>; Tue, 29 Nov 2016 11:23:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <736bee70-7a99-8681-a976-f6fdb4e524a0@qt.io>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
 <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
 <736bee70-7a99-8681-a976-f6fdb4e524a0@qt.io>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 29 Nov 2016 20:23:06 +0100
Message-ID: <CAHmME9pRtf+qxzhxUs88JB3A-NeQNwQBNRsB0BzvWYvUEQnbjA@mail.gmail.com>
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: Nikolai Kosjar <nikolai.kosjar@qt.io>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "qt-creator@qt-project.org" <qt-creator@qt-project.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Nikolai,

On Tue, Nov 29, 2016 at 9:55 AM, Nikolai Kosjar <nikolai.kosjar@qt.io> wrote:
> Should work with the Clang Code Model, Qt Creator from the current 4.2
> branch.
>
> The corresponding report was
> https://bugreports.qt.io/browse/QTCREATORBUG-15590.


Okay, in that case, I'll wait until 4.2 for it. One question:
PRECOMPILED_HEADER -- will this take a list, or only a single value?

By the way, I figured out an alternative workaround in the meantime. I
add to "clang code model warnings" box the string "-include
/path/to/header.h".

Jason
