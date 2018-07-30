Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f768c5f9
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 07:32:15 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32bcf1c1
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 07:32:15 +0000 (UTC)
Date: Mon, 30 Jul 2018 09:42:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yousong Zhou <yszhou4tech@gmail.com>
Subject: Re: compilation error on centos 7 kernels
Message-ID: <20180730074206.GA24032@kroah.com>
References: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
 <CAECwjAi9rrcqb6+kJcWChVGxnk1Ro68nJS7wh2b7F791RWSHvg@mail.gmail.com>
 <CAHmME9ppK0TF5TQgY4kwJTpzWGAtNHBSwKbHPHJV2mPbj_7DHg@mail.gmail.com>
 <CAECwjAh2xvqRPEWbFqi2oh3+-WT1D2t7AJGH0+0FJu4pXt-RZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAECwjAh2xvqRPEWbFqi2oh3+-WT1D2t7AJGH0+0FJu4pXt-RZg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 30, 2018 at 11:34:31AM +0800, Yousong Zhou wrote:
> On Mon, 30 Jul 2018 at 11:29, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Update to the latest available centos kernel in the latest available
> > centos release, and then after install WireGuard. If you're facing
> > problems then, email a compilation log.
> 
> Well, better add a note in the installation page about the
> update-to-date kernel version expectation.  The other thing is that
> it's not always that feasible to switch kernel version in enterprise
> managed environment

But it is allowed to add random kernel modules to such an enviroment?
You can't have it both ways, someone needs to work to fix such a
horrible management policy that it sounds like you have.  Good luck!

greg k-h
