Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24aa8dea
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:56:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2094bc5
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:56:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd262ce8
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:56:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dfcb9da1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:56:16 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id w125so5379199oie.7
 for <wireguard@lists.zx2c4.com>; Thu, 30 Nov 2017 10:02:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171130152355.25387-7-gregkh@linuxfoundation.org>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
 <20171130152355.25387-7-gregkh@linuxfoundation.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Nov 2017 19:02:24 +0100
Message-ID: <CAHmME9qp623Fx4U+4-Q2DreXJn+aXz_ecfruxi16Szjpwgq9cg@mail.gmail.com>
Subject: Re: [PATCH 6/6] src/uapi/wireguard: add SPDX tag
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

On Thu, Nov 30, 2017 at 4:23 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Update the wireguard.h file with the currently convential GPL2+userspace
> exception tag.
>
> Note, this is a different license than what the text itself says in the
> file, if you wish to stick with the MIT license for this file, that's
> fine, but then it should be listed as:
>         ((GPL-2.0 WITH Linux-syscall-note) OR MIT)

I'd prefer doing only "GPL-2.0 WITH Linux-syscall-note", since it's
more uniform, but I don't know if it covers a particular use use case:

I expect for many projects to wholesale copy and paste this file into
their own projects, and those projects might not be GPL-friendly. Does
the Linux-syscall-note allow for that? Or should I stick with
GPL-2.0||MIT for the avoidance of doubt?

In terms of "intellectual property", the file itself is extremely
boring, just defining some enums.

Jason
