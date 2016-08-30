Return-Path: dave.taht@gmail.com
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
 [209.85.214.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeb8c28c
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Aug 2016 19:30:43 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id g62so57158091ith.1
 for <wireguard@lists.zx2c4.com>; Tue, 30 Aug 2016 12:37:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160830192754.GA18189@matrix-dream.net>
References: <20160830064454.GA12680@matrix-dream.net>
 <20160830154439.GA5923@wolff.to>
 <20160830192754.GA18189@matrix-dream.net>
From: Dave Taht <dave.taht@gmail.com>
Date: Tue, 30 Aug 2016 12:37:36 -0700
Message-ID: <CAA93jw5vXAd4EKt089bu7NpCM4qv1YBdYChh_pwsoQK0-SQLew@mail.gmail.com>
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] wg set - unexpected change of routes
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I've only been using wireguard for 24 hours, and I like it a lot.

In my world, what I'd want is the ability to leverage source specific
routing, and to be able
to have nailed up dozens of routes to the same dozens of locations,
having a routing protocol layered on top to pick the best one (or, in
a tor-like way, pick a set of confusing ones), to ensure being able to
route around an outage somewhere.
