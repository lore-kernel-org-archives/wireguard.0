Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feda878f
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 19:06:05 +0000 (UTC)
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bdf1b05
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 19:06:05 +0000 (UTC)
Received: by mail-it0-x235.google.com with SMTP id h23-v6so21165791ita.5
 for <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 12:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
 <CAHmME9rB71UbcY-kLkJO0yOVQ-s31E_S9yCKdZTh6F9-PScN5A@mail.gmail.com>
In-Reply-To: <CAHmME9rB71UbcY-kLkJO0yOVQ-s31E_S9yCKdZTh6F9-PScN5A@mail.gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Fri, 7 Sep 2018 21:06:16 +0200
Message-ID: <CAHijbEX8cRGA3_NFdRqFCraLns_UhaSbX0yFJTax8bsFvAP9XQ@mail.gmail.com>
Subject: Re: Setting the transit namespace at runtime
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

Hi Jason,

> I'd thought of this early on, but failed to come up with what seemed
> like an actually realistic use case for it.

How about creating Wireguard devices as a user that has no
privileges/capabilites in the init namespace?

$ unshare -r -U -m
$ mount --bind /proc/self/ns/net init-ns
$ unshare -n
$ ./setup-wg0.sh
$ wg set wg0 transit-net init-ns

Julian
