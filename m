Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3042fb15
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:32:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22c1782d
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:32:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 613626ce
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:23:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16abf50c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:23:45 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id w38so6939065ota.8
 for <wireguard@lists.zx2c4.com>; Sun, 18 Feb 2018 12:40:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180213131758.GA5242@lud.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
 <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
 <20180212073501.GA5305@tuxmachine.localdomain>
 <20180212074255.GB5305@tuxmachine.localdomain>
 <CAHmME9pvBg3OHLwun3uqdoCqmQBxxmwh1y2jxWUcdOKyZynNsA@mail.gmail.com>
 <20180213131758.GA5242@lud.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 18 Feb 2018 21:39:59 +0100
Message-ID: <CAHmME9po373r09jNYXVhJrEO6=LLW51bRztQzwVCO+JX4-=iiA@mail.gmail.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
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

> Nice, thanks!  I'm looking forward to testing the next release then.

Let me know if the problem goes away with the snapshot I just released.

Jason
