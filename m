Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcd71a22
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 19:16:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b5ffe63
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 19:16:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5b68a4e8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 19:16:36 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id t196so129734629lff.3
 for <wireguard@lists.zx2c4.com>; Tue, 29 Nov 2016 11:21:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <HE1PR02MB16597D89414EB2F7E6265BA2F08A0@HE1PR02MB1659.eurprd02.prod.outlook.com>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
 <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
 <HE1PR02MB16597D89414EB2F7E6265BA2F08A0@HE1PR02MB1659.eurprd02.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 29 Nov 2016 20:21:01 +0100
Message-ID: <CAHmME9rLoJbKda+i9z2AA2jpqfZ96XG_ZEVurKbHbZ2TfPqdRQ@mail.gmail.com>
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: Marco Bubke <Marco.Bubke@qt.io>
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

Hi Marco,

I'll start compiling a list for you, so that I can give you something
more useful than my last message. For starters, here's one bug found
within seconds:

1. Open a file in the project. All seems fine.
2. Ctrl click on a function that points to somewhere in the Linux
kernel headers.
3. Close that file. Now there are all sorts of non-nonsensical clang
errors in the original file.

Here's a video to demonstrate:
https://data.zx2c4.com/qt-creator-clang-model-bug-ff94c572-d8ff-4c54-a5ac-3aa6485251a9.mp4

Jason
