Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 270e001d
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:42:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f269e82
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:42:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 412fbbb7
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:42:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffc0f89c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:42:52 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id h4so98398536oib.3
 for <wireguard@lists.zx2c4.com>; Sat, 13 May 2017 15:53:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513070843.GB22218@tuxmachine.polynome.dn42>
References: <20170513070843.GB22218@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 00:53:47 +0200
Message-ID: <CAHmME9rDvMq1QF7qMOT5rehttTFLGmcE7fGs_VRqKOc9eSJTCw@mail.gmail.com>
Subject: Re: TX counters not updated on wireguard interface
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

Hey Baptiste,

I'll try to reproduce this shortly. I did make a change to some compat
code [1] for kernels older than 3.12 to fix a similar bug. But Jesse
has a newer kernel than that, I think? I'll check into it and try to
fix. Thanks for reporting.

Jason

[1] https://git.zx2c4.com/WireGuard/patch/?id=1370d96432c2c7e86705ce99b1682a3b7c2ce1cd
