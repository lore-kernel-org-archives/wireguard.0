Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95199ef1
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:06:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0de3da89
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:06:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53cdc39b
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:06:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 184cd5f8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 23:06:57 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w10so98822757oif.0
 for <wireguard@lists.zx2c4.com>; Sat, 13 May 2017 16:17:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rDvMq1QF7qMOT5rehttTFLGmcE7fGs_VRqKOc9eSJTCw@mail.gmail.com>
References: <20170513070843.GB22218@tuxmachine.polynome.dn42>
 <CAHmME9rDvMq1QF7qMOT5rehttTFLGmcE7fGs_VRqKOc9eSJTCw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 01:17:53 +0200
Message-ID: <CAHmME9ordQEZYsA3-b+7Gp6YVVomVXQ9d9T_CYBOYh=MqKWpAQ@mail.gmail.com>
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

Okay I figured it out. Upstream
039f50629b7f860f36644ed1f34b27da9aa62f43 only came in 4.5, so explicit
calls to iptunnel_xmit_stats is required. I'll play with this and see
if I can fix it.

Jason
