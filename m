Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e2bfe65
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:49:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12e9a5aa
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:49:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f11b70da
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:40:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52519dad
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:40:28 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id o9-v6so11877319otj.5
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 19:03:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2598be63-11f3-1e91-a52a-f82f47274eed@sholland.org>
References: <CAHjFYUJnEvhB27dKcUXLzj-KYK5U+gMLuQORNiiQwG2Zp8E9TQ@mail.gmail.com>
 <2598be63-11f3-1e91-a52a-f82f47274eed@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 04:03:31 +0200
Message-ID: <CAHmME9rdmJvTyr-mGRUaZK=NmRMqPt4-W6AjybD4UH9Q=wGGow@mail.gmail.com>
Subject: Re: Android app and command line
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Jacob Schooley <jacob.schooley+wgvpn@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Mar 16, 2018 at 3:38 AM, Samuel Holland <samuel@sholland.org> wrote:
> I've looked into this, and it is unfortunately quite difficult to do. The app
> can register to receive notification about network changes, but unfortunately
> there's no* way for the app to tell the Android connectivity service that the
> WireGuard tunnel exists, so Android can track its state. Even then, wg-quick on
> the command line wouldn't easily be able to tell the app about _new_ tunnels.
>
> *without using reflection to access internal framework classes.

Maybe reflection isn't so bad a solution when considering the
alternatives. But here are some other ideas:

We could actually just monitor the output of `ip monitor dev wg0` or
the like, and not get bogged down trying to wade through the java...

If you think it's possible for the android app to register some sort
of intent listening, we could make wg-quick.c broadcast it from the
command line via `am broadcast`. This might be easiest to pull off.
Upon receiving the broadcast, the app would then double check the
status of endpoints (`wg show interfaces`) and update the statuses
accordingly.

Interested in implementing this?
