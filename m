Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09eb5488
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 17:53:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d39d722
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 17:53:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53387df2
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 18:12:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0136d272
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 18:12:09 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id v205so70042557itf.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Jul 2017 11:13:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170727201058.2b876d19@msi.defcon1>
References: <20170727172110.GB28775@lore.localdomain>
 <20170727201058.2b876d19@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Jul 2017 20:13:25 +0200
Message-ID: <CAHmME9pKAXc4K4pgzHMe9mC1Fb9p8hkrpdYY7KTtEN5--f9B9A@mail.gmail.com>
Subject: Re: errors building 0.0.20170706 and later with Linux 3.14.0
To: Bzzzz <lazyvirus@gmx.com>
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

On Thu, Jul 27, 2017 at 8:10 PM, Bzzzz <lazyvirus@gmx.com> wrote:
> On Thu, 27 Jul 2017 13:21:10 -0400
> Jaron Kent-Dobias <jaron-wg@kent-dobias.com> wrote:
>
>> for all tagged versions past 0.0.20170628. It runs linux 3.14.0, and
>
> You didn't read the doc and didn't check that /boot/config-3.14.0=E2=80=
=A6 even
> has the correct options _required_ for WG.

No, the issue Jaron is facing has nothing to do with config options.
(Please don't be rude.) It looks more likely that the 3.14 kernel
being used has things backported from later kernels, so I'll need to
work around this in compat.h.

Jason
