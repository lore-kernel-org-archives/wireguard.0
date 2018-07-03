Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df864ea2
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:14:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86f748ac
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:14:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8e79b37
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:13:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6466391e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:13:43 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id y207-v6so731057oie.13
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jul 2018 19:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
In-Reply-To: <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jul 2018 04:21:08 +0200
Message-ID: <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: eric@bluelinelabs.com
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

Hey Eric,

Sorry for not responding earlier when you sent this to me directly.
I'm glad you sent it here and Samuel caught it, so your nice idea
won't go to waste.

On Tue, Jul 3, 2018 at 2:22 AM Eric Kuck <eric@bluelinelabs.com> wrote:
> If I were to do the work I initially proposed (new fragment + GoBackend i=
mplementation), would this be enough to get merged?

No, but I can write the C part and just provide you with some sane
interface for passing off the relevant information to wg-quick. Send
me offlist an SSH key, and I'll give you commit access to branches
that begin with `ek/`.

> My proposal is to add another Fragment that=E2=80=99s just a list of all =
apps installed on the phone with check boxes next to them.

How would one get to the Fragment? From the overflow menu, or from the
settings? I suspect the settings would be a more natural place for it.
Or were you thinking that this would actually be part of each
individual tunnel profile, stored within the configuration for the
tunnel somehow?

Regards,
Jason
