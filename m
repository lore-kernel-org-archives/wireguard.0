Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cca513e
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 22:39:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bed4835
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 22:39:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8be2851e
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 22:59:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c55cf1cd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 22:59:01 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id h199so89753688ith.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Jul 2017 16:00:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170727200052.GA30298@lore.localdomain>
References: <20170727171923.GA28775@lore.localdomain>
 <CAHmME9oQe1iRQk8rdetXWioMKwUA27W1vNUdq7KTmgzjg5KE4g@mail.gmail.com>
 <20170727195734.GC28775@lore.localdomain>
 <20170727200052.GA30298@lore.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Jul 2017 01:00:18 +0200
Message-ID: <CAHmME9pJodzrHX855Vxe5Rfq-Zzmk5e9Zma=iOVq4rjZJF6UXQ@mail.gmail.com>
Subject: Re: errors building 0.0.20170706 and later with Linux 3.14.0
To: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
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

Thanks for the information. The latest git master of WireGuard should
now work on your kernel.

Jason
