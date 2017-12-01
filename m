Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78a0f2a5
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 09:37:27 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cafc39ad
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 09:37:27 +0000 (UTC)
Date: Fri, 1 Dec 2017 09:43:46 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 6/6] src/uapi/wireguard: add SPDX tag
Message-ID: <20171201094346.GC9353@kroah.com>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
 <20171130152355.25387-7-gregkh@linuxfoundation.org>
 <CAHmME9qp623Fx4U+4-Q2DreXJn+aXz_ecfruxi16Szjpwgq9cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9qp623Fx4U+4-Q2DreXJn+aXz_ecfruxi16Szjpwgq9cg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 30, 2017 at 07:02:24PM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 30, 2017 at 4:23 PM, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > Update the wireguard.h file with the currently convential GPL2+userspace
> > exception tag.
> >
> > Note, this is a different license than what the text itself says in the
> > file, if you wish to stick with the MIT license for this file, that's
> > fine, but then it should be listed as:
> >         ((GPL-2.0 WITH Linux-syscall-note) OR MIT)
> 
> I'd prefer doing only "GPL-2.0 WITH Linux-syscall-note", since it's
> more uniform, but I don't know if it covers a particular use use case:
> 
> I expect for many projects to wholesale copy and paste this file into
> their own projects, and those projects might not be GPL-friendly. Does
> the Linux-syscall-note allow for that? Or should I stick with
> GPL-2.0||MIT for the avoidance of doubt?

I think if you want others to be able to copy the file into different
projects without any doubt at all, stick to:
	((GPL-2.0 WITH Linux-syscall-note) OR MIT)
as that covers everything.

> In terms of "intellectual property", the file itself is extremely
> boring, just defining some enums.

I'm not going to get into the argument of what is, and is not, a
copyrightable work :)

But to be safe, put this on the top so that everyone knows your
intention, which is the most important thing of all, as intent matters a
lot to companies and to courts.

thanks,

greg k-h
