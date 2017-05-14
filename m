Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6319c87e
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 12:23:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dad4aab
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 12:23:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41e15ebb
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 12:23:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b97171b0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 12:23:05 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id h4so105587415oib.3
 for <wireguard@lists.zx2c4.com>; Sun, 14 May 2017 05:34:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ordQEZYsA3-b+7Gp6YVVomVXQ9d9T_CYBOYh=MqKWpAQ@mail.gmail.com>
References: <20170513070843.GB22218@tuxmachine.polynome.dn42>
 <CAHmME9rDvMq1QF7qMOT5rehttTFLGmcE7fGs_VRqKOc9eSJTCw@mail.gmail.com>
 <CAHmME9ordQEZYsA3-b+7Gp6YVVomVXQ9d9T_CYBOYh=MqKWpAQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 14:34:04 +0200
Message-ID: <CAHmME9o3-L2wHHSe6mnEOWd9QyG0eLs1-aCp=jQkq4sYzBQXxQ@mail.gmail.com>
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

Hey again,

I've committed a fix [1] for this which will be out in the next
snapshot. I've also added a test [2] for this to the automated test
suite on https://build.wireguard.io/ so that if the bug ever
resurfaces, it will be caught. Before reading [1], be sure to wear
protective eyewear, as your pupils are likely to start bleeding at the
sight of horrendous compatibility ifdef hackery.

Jason

[1] https://git.zx2c4.com/WireGuard/commit/?id=4c294b7ec676105abc3abb3a3dd65a63a3466eb2
[2] https://git.zx2c4.com/WireGuard/commit/?id=5437b87afcfed371b31eff25f15663f3d43ca065
