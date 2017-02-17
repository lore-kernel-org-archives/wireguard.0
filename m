Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df6eca34
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:36:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 431eace9
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:36:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2405461
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:36:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b0714710
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:36:03 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id k4so11183960otc.0
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 05:36:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <05adeaed-20ff-ce42-b8c6-73bbc55d7021@sholland.org>
References: <7a3a5f6d-1eb5-ef32-097e-e24c2f9d2805@sholland.org>
 <05adeaed-20ff-ce42-b8c6-73bbc55d7021@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Feb 2017 14:36:22 +0100
Message-ID: <CAHmME9qUBMh7DWwWboABv=oLXyfAq9-HWF93s4siPRfgzZpbBw@mail.gmail.com>
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

Thanks very much for the excellent debugging output. I'll try to
reproduce this as well on my systems.

The stack trace does indicate that the OOPS is happening in padata,
not in wireguard, so I wonder if this is some bug caused either by
grsecurity or by something else that was then fixed, but since your
kernel is a bit old (4.7.10) maybe the fix didn't make it. In either
case, I'll try to reproduce on that kernel and on newer kernels and
will get back to you.

I presume you have most PaX options turned on?

Thanks,
Jason
