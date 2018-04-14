Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e8bb31a
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:55:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 375fad22
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:55:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9640a955
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:46:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dc456a84
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:46:13 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id a14-v6so11887903otf.6
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 19:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
References: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 04:09:17 +0200
Message-ID: <CAHmME9r-ZHkhKjw+JTkF++t+9TBEnSv6AKF=FitQkg4V+a14dw@mail.gmail.com>
Subject: Re: Policy-based routing
To: Bruno <bruno@streamfeed.com>
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

Hi Bruno,

You can't set multiple peers to use 0.0.0.0/0 at the same time on the
same interface. How would it be able to choose which peer to send
traffic to then? Instead, if you want some kind of redundancy or
bonding, you can try using multiple interfaces, and then use whatever
traditional routing or load balancing tools that you ordinarily would.

Jason
