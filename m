Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e29ea5fe
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Mar 2017 17:29:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9c8a415
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Mar 2017 17:29:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06da08c7
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Mar 2017 17:29:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cb7e1a9d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Mar 2017 17:29:38 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id o24so155777929otb.1
 for <wireguard@lists.zx2c4.com>; Tue, 21 Mar 2017 10:33:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a346373b-b822-9275-210a-c2bf2842f793@sholland.org>
References: <7a3a5f6d-1eb5-ef32-097e-e24c2f9d2805@sholland.org>
 <05adeaed-20ff-ce42-b8c6-73bbc55d7021@sholland.org>
 <CAHmME9qUBMh7DWwWboABv=oLXyfAq9-HWF93s4siPRfgzZpbBw@mail.gmail.com>
 <ce815e61-51e4-48e4-d5ca-e73df208061b@sholland.org>
 <a346373b-b822-9275-210a-c2bf2842f793@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Mar 2017 18:33:56 +0100
Message-ID: <CAHmME9pjcoNKOSjHEhyQ4T0mYcTj7eMmkKnuMb8GGp2sC1ayKA@mail.gmail.com>
Subject: Re: Instability during large transfers
To: Samuel Holland <samuel@sholland.org>
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

Hey Samuel,

Thanks for sticking with it... This is a super hard bug to track down!
I wish I could reproduce it.

Can you try two odd things, separately, and report back?

1. Compile with DEBUG_ATOMIC_SLEEP. Do you get any additional warnings?
2. Hack kernel/sched/Makefile to remove "-fno-omit-frame-pointer" and
see if the backtraces you get are a bit more coherent.

Feel free to find me on IRC.

Jason
