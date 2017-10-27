Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f586b1b5
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 15:01:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efd1301f
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 15:01:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 311e1327
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 15:01:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f5b417ad
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 15:01:05 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id n82so11311255oig.3
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 08:02:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 17:02:55 +0200
Message-ID: <CAHmME9r8g2ac8Y+wT=EFjbN7ihMQpxh4XLOAy42wmOxgPT3ewg@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Joe Doss <joe@solidadmin.com>
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

On Fri, Oct 27, 2017 at 4:51 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Secondly, I've received enormous
> quantities of hate email from Fedora users, which is what's prompted
> this whole thread in the first place.

Here's one from a few days ago if you're curious:

>
> wg-quick doesn't work in Fedora because resolvconf command not found. Your buggy bullshit sucks.
>
> - Rodney
>

I don't even... Are they serious? Who knows, but I've gotten a lot of
these, some via IRC, some sent to team@wireguard.com. Kind of
disheartening to receive, but at least their complaints, however rude,
are something addressable with technical fixes.
