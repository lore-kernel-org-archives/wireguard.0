Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ed35bae
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 21:38:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7372fc40
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 21:38:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce50a00c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 21:38:38 +0000 (UTC)
Received: by mail-wj0-f178.google.com with SMTP id xy5so338712454wjc.0
 for <wireguard@lists.zx2c4.com>; Tue, 06 Dec 2016 13:43:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJSP0QUDhKYC41j0WxJQEX06-szCr8oPWsP3BK75LNvSYviXHA@mail.gmail.com>
References: <CAJSP0QUDhKYC41j0WxJQEX06-szCr8oPWsP3BK75LNvSYviXHA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Dec 2016 22:43:56 +0100
Message-ID: <CAHmME9qE_jSXaUvCw8dCpz4zK8ukEdOVvc=9HhPmxTDTTeLk2A@mail.gmail.com>
Subject: Re: [WireGuard] Wireguard disk image for QEMU Advent Calendar 2016?
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Stefan,

Sorry for the late reply. Your message went into my spam folder, as
the contents of the message seems slightly spamy upon first glance...

I'm not sure I exactly understand what you're proposing. If you're
interested in the intersection between QEMU and WireGuard, you might
enjoy checking out our test harness [1]. For every commit, it compiles
a new kernel and userland, for each kernel version >= 4.1, and runs a
large dedicated test suite in QEMU.

Jason

[1] https://www.wireguard.io/build-status/
