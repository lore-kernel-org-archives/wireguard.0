Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42063925
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 20:42:37 +0000 (UTC)
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fade6ba
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 20:42:37 +0000 (UTC)
Received: by mail-it0-x234.google.com with SMTP id h20-v6so16932959itf.2
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 13:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
In-Reply-To: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Thu, 6 Sep 2018 22:42:41 +0200
Message-ID: <CAHijbEWTvJW+FsBS3NTsuF=FXAHJFRqThs5tEiPYwj51V7vzYQ@mail.gmail.com>
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

Hi,

After receiving some positive feedback on IRC, I've gone ahead and implemented
this. You can see the code here:

https://github.com/mahkoh/wireguard/commits/transit-namespace

You can test it as follows:

* Create a new netns: ip netns add test
* Enter it: ip netns exec test bash
* Use wg-quick to create a wireguard device
* Try to connect anywhere: It doesn't work
* Set the transit namespace to the init namespace:
    wg set wg0 transit-net /proc/1/ns/net
* Try to connect anywhere: It works

I haven't written any documentation yet but I hope that the commits are clear
enough.

Julian
