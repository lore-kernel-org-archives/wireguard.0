Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12c44f98
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 08:17:23 +0000 (UTC)
Received: from mail-yb0-x234.google.com (mail-yb0-x234.google.com
 [IPv6:2607:f8b0:4002:c09::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1d3b87b
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 08:17:23 +0000 (UTC)
Received: by mail-yb0-x234.google.com with SMTP id i9-v6so4422259ybo.5
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jul 2018 01:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
 <CAECwjAi9rrcqb6+kJcWChVGxnk1Ro68nJS7wh2b7F791RWSHvg@mail.gmail.com>
 <CAHmME9ppK0TF5TQgY4kwJTpzWGAtNHBSwKbHPHJV2mPbj_7DHg@mail.gmail.com>
 <CAECwjAh2xvqRPEWbFqi2oh3+-WT1D2t7AJGH0+0FJu4pXt-RZg@mail.gmail.com>
 <20180730074206.GA24032@kroah.com>
In-Reply-To: <20180730074206.GA24032@kroah.com>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Mon, 30 Jul 2018 16:27:06 +0800
Message-ID: <CAECwjAhz9ffMgV_uZ7agFPZWHvZk5JLcgnPm7xe1qm6=XkjThQ@mail.gmail.com>
Subject: Re: compilation error on centos 7 kernels
To: gregkh@linuxfoundation.org
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

On Mon, 30 Jul 2018 at 15:42, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 30, 2018 at 11:34:31AM +0800, Yousong Zhou wrote:
> > On Mon, 30 Jul 2018 at 11:29, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Update to the latest available centos kernel in the latest available
> > > centos release, and then after install WireGuard. If you're facing
> > > problems then, email a compilation log.
> >
> > Well, better add a note in the installation page about the
> > update-to-date kernel version expectation.  The other thing is that
> > it's not always that feasible to switch kernel version in enterprise
> > managed environment
>
> But it is allowed to add random kernel modules to such an enviroment?
> You can't have it both ways, someone needs to work to fix such a
> horrible management policy that it sounds like you have.  Good luck!
>
> greg k-h

It's not okay to have random modules in any environment.  Sorry for
the noise if it's already widely known that wireguard kernel module
support for rhel/centos *expects* recent kernel revisions of these
distro.

                yousong
