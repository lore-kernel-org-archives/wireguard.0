Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0945e657
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 10:41:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da081e57
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 10:41:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22508829
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 10:53:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e2de79d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 10:53:06 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id l18so156018304oig.2
 for <wireguard@lists.zx2c4.com>; Mon, 22 May 2017 03:53:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170522043747.09f2ddf0.glitsj16@riseup.net>
References: <20170522043747.09f2ddf0.glitsj16@riseup.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 May 2017 12:53:40 +0200
Message-ID: <CAHmME9pVS5j3zPqRQX=vUUmyHaoeKud9ZcLx8jVhu1tAu0qPpw@mail.gmail.com>
Subject: Re: bypass wireguard VPN (wgphys sample script help needed)
To: Helle Vaanzinn <glitsj16@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Cc: wglist <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Helle,

There is no trivial "copy&paste" solution for wgphys that works on all
systems everywhere. If you don't possess the knowledge to understand
what every line is supposed to do and tweak it for your particular
system configuration, the wgphys solution isn't for you. If I can ever
think of a 100% portable way of implementing this, though, I'd
certainly release that. For now, it requires actually understanding
which daemons your network uses and shutting them down and starting
them back up as required.

However, if you'd like to keep using wg-quick, and add an "override"
switch for it, I'm sure you could fashion something decent out of
clever usage of fwmark, ip rule, and iptables.

Regards,
Jason
