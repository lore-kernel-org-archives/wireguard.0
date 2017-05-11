Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76d65a17
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 21:14:35 +0000 (UTC)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebba522a
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 21:14:34 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 142so51402079wma.1
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 14:25:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r1XFZsvMskbBD8N-_+9NU7GJn+weDLwCsNrpsGPcMqDA@mail.gmail.com>
References: <CAHmME9r1XFZsvMskbBD8N-_+9NU7GJn+weDLwCsNrpsGPcMqDA@mail.gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Thu, 11 May 2017 23:25:14 +0200
Message-ID: <CANTUoecFfOUqiyYiDdSY2TMeyMzGsobVYHrQ8Lk8d58xxMHt0g@mail.gmail.com>
Subject: Re: Preshared Key Rework Coming Soon
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Kevin Milner <kamilner@kamilner.ca>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Great to hear. Thank you all for your hard work.

Cheers,
Fredrik

On Thu, May 11, 2017 at 10:32 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hey lazylist,
>
> Since the last discussion of preshared key mode in WireGuard, we've
> made some substantial progress. Trevor and I have been working out the
> cryptodetails [1], and Kevin and I have been tweaking our formal
> verification model. Everything is coming together quite nicely on that
> front.
>
> For those who are just catching up on this discussion, the gist is
> that the PresharedKey attribute is moving from being part of the
> Interface to part of the Peer. This will enable PSKs to be a pair-wise
> value, rather than having an Interface use one PSK for all its peers,
> a significant security improvement.
>
> I've written up the changes in the whitepaper [2] and the protocol doc
> [3]. I've implemented it in the latest git master, though probably you
> should wait for the next snapshot to try it out. I'm now in the
> progress of writing [4] patches [5] for various [6] WireGuard
> integrations, so that when I release the next snapshot, things can
> transition over smoothly, in addition to various Noise libraries [7].
>
> If all goes well, the Noise changes will be out on Tuesday, and the
> snapshot should happen minutes after that.
>
> Let me know if there are any questions.
>
> Regards,
> Jason
>
> [1] https://moderncrypto.org/mail-archive/noise/2017/001006.html
> [2] https://www.wireguard.io/papers/wireguard.pdf
> [3] https://www.wireguard.io/protocol/
> [4] https://github.com/openwrt/packages/pull/4341/files#diff-4fe54b567672346a15da55f1c6af8c9a
> [5] https://github.com/openwrt/luci/pull/1160/files
> [6] https://github.com/NixOS/nixpkgs/pull/25646/files#diff-110379e7db2311e8bef5a02392ac1495
> [7] https://github.com/flynn/noise/pull/11/files
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
