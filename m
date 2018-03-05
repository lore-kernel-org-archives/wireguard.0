Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28471d5e
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:24:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff3bcc22
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:24:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 951a7de7
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:15:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4ba126e0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:15:52 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id f186so11761668oig.4
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 03:33:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1520248764.27019.10.camel@infradead.org>
References: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
 <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
 <1520248764.27019.10.camel@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Mar 2018 12:33:56 +0100
Message-ID: <CAHmME9rsGHxLKeX-Jsbzd3ayx0x6VE3b8PwPKTcCSw9RZVgNOA@mail.gmail.com>
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: David Woodhouse <dwmw2@infradead.org>
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

On Mon, Mar 5, 2018 at 12:19 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> I wasn't sure whether to suggest this before, but adding Wireguard
> support to OpenConnect ought to be fairly easy. We already support
> three VPN protocols, so we have a *relatively* sane distinction between
> the protocol-specific parts, and all the OS-specific tun device
> handling and other bits that would just be gratuitous wheel-reinvention
> for you.
>
> It basically gives you support for Windows, Solaris, OSX, Android and
> various BSDs for nothing. With NetworkManager support.
>
> For a client that *isn't* purely wrapping the kernel implementation, it
> probably makes sense rather starting from scratch. If anyone's
> interested in working on it, I'd be happy to give some pointers.
>
> (I've also looked in the past at adding kernel support too, for DTLS
> acceleration; I may take a look at that again.)

That sounds pretty excellent. I'll add that the project TODO list and
maybe we'll get an interested contributor or a GSoC student for it.

By the way, how would you feel about doing this via the existing Go
and Rust implementations? If I can jerry rig it into the build system,
would you be interested?
