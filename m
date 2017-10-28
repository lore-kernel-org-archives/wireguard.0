Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54ef50bb
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 02:37:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d3c5813
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 02:37:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 898ecb62
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 02:37:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3fadd82a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 02:37:06 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id v132so13589064oie.1
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 19:39:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 28 Oct 2017 04:39:00 +0200
Message-ID: <CAHmME9p26KuNR33Lzjp7V4tE1_b9EBFF7_AmnBsuedEq52r4og@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Sat, Oct 28, 2017 at 4:24 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> I don't want to manually construct dbus messages from bash.

https://github.com/jonathanio/update-systemd-resolved/blob/master/update-systemd-resolved

The author of that script is some kind of genius. But it also happens
to be longer than all of wg-quick itself. V6 is gnarly to parse,
evidently.
