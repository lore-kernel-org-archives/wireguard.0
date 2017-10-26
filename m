Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 080a5f97
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:09:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53fc5944
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:09:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 822b17f6
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:09:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d4560ed
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:09:17 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id g125so7910433oib.12
 for <wireguard@lists.zx2c4.com>; Thu, 26 Oct 2017 14:11:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2027941193.391349.1509047899053@ichabod.co-bxl>
References: <2027941193.391349.1509047899053@ichabod.co-bxl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 23:11:02 +0200
Message-ID: <CAHmME9ouUyaR6UeWeL-5a1MLkm1fE6VDmC94=K1DszrcRoPwtw@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Geo Kozey <geokozey@mailfence.com>
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

On Thu, Oct 26, 2017 at 9:58 PM, Geo Kozey <geokozey@mailfence.com> wrote:
> What about usecases where more nameservers are needed, i.e. local nameserver used for caching, adblocking or whatever?

Presumably those users wouldn't be using DNS= anyways, since they'd
want a fixed resolv.conf with the address of their local nameserver.
So, that's outside the scope of this discussion.
