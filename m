Return-Path: bjin@ctrl-d.org
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
 [209.85.215.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aa8e48e
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 19:13:01 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id h129so33582803lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 12:13:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
References: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
 <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
From: Bin Jin <bjin@ctrl-d.org>
Date: Fri, 8 Jul 2016 21:13:02 +0200
Message-ID: <CAHQn_MC1S4X_TYaGi2XtwWXZuu3erEWK6fXvB-ja9GFnJfR5RQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Options to obfuscate WireGuard traffic?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> Actually there's already a PSK mode. I suppose it's possible to
> leverage this to add an obfuscation layer. This is likely the most
> robust way of doing things, in fact. I'll give this some more thought,
> but it's kind of unlikely that I'll incorporate this into the
> codebase.

I see. It's a bit pity to learn that, but I understand it's kind of
ugly and probably still not enough (due to fixed packet length for
first two types). Thanks for explaining every details.
