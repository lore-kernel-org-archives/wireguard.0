Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1da5578d
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 16:36:58 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54f24703
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 16:36:58 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: distro packaging, makefiles, deps, systemd, new tools
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9rsVAbJ=TzkyhFMz5TjP3rCc_CNW7t+s5jZQ9Go8EKEFw@mail.gmail.com>
Date: Wed, 11 Jan 2017 17:46:49 +0100
Message-Id: <7D7A4484-02CC-4574-8B6F-F8B37139D38C@danrl.com>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
 <9FF22623-C2E8-4342-BEFC-C8B2C44FEF25@danrl.com>
 <CAHmME9rsVAbJ=TzkyhFMz5TjP3rCc_CNW7t+s5jZQ9Go8EKEFw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> I assume youre not shipping the bash completion stuff either, right? =
Since openwrt doesn't use bash.

We are not shipping it.

FYI: The topic is discussed right now in this PR:
https://github.com/openwrt/packages/pull/3816=
