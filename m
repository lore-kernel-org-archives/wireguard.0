Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75955300
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 08:48:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18b35e42
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 08:48:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd41e12d
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:02:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68d5adcb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:02:03 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id l83so7436101oif.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 02:04:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Jun 2017 11:04:50 +0200
Message-ID: <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
Subject: Re: making wireguard work on RHEL7/etc.
To: wireguard@wut.to
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

Hey,

Thanks so much for doing the mind numbing work of trudging through all
those ifdefs. Maintaining compat.h is truly a horrifying experience,
and now somebody can commiserate with me :).

Obviously these patches aren't mergable as-is, but it functions as a
treasure map for how to actually go about it.

Are you aware of any RHEL-specific defines I might be able to use to
differentiate?

Regards,
Jason
