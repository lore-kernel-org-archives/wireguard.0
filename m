Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b546f12
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 01:13:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fb204ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 01:13:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f026c728
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 01:12:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5428ac3f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 01:12:14 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id t27-v6so1952053oij.9
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 18:13:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pEPYymEf_BOOGBffkQgCC0O7W5Ofqu9BFJQXvw1PNmuQ@mail.gmail.com>
References: <20180515225433.GA26432@zx2c4.com>
 <CAK_h9uFnazi0x+Ky_bUn1ZZfaDHas-X-bdLR8x-G=oS-POL5Zg@mail.gmail.com>
 <CAHmME9pEPYymEf_BOOGBffkQgCC0O7W5Ofqu9BFJQXvw1PNmuQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 May 2018 03:13:44 +0200
Message-ID: <CAHmME9oQ_qaAZPbqFXCiU-Ew6rNUxQWgv7xZyhz7W8cyQ=9sYg@mail.gmail.com>
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
To: Tim Sedlmeyer <sedlmeyer@gmail.com>
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

Hi Tim,

On Wed, May 16, 2018 at 2:24 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>     # TODO: this should use scutil and be slightly more clever. But for now
>     # so horrible to deal with here, we'll simply wait for irate users to
> If you'd like to contribute a patch to do this properly, please don't hesitate.

That was actually surprisingly easy:

https://git.zx2c4.com/WireGuard/commit/?id=302195d3563491b5f7a0b6c35fdeb7a53891a1f0

Let me know if the updated script works well for you:

$ curl -o /usr/local/bin/wg-quick
https://git.zx2c4.com/WireGuard/plain/src/tools/wg-quick/darwin.bash

Jason
