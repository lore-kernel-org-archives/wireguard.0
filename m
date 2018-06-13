Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc42ad78
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 16:03:39 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd01cec0
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 16:03:39 +0000 (UTC)
Message-ID: <6c33f2b0c40477015d0fc3a66ee33c36a150f838.camel@mjr.org>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 13 Jun 2018 17:07:32 +0100
In-Reply-To: <20180613150813.GA7789@kroah.com>
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
 <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
 <CAHmME9okF00z8-9xPU=dm_vOrdf5gv4D+CpWtVXdu2oW+N-7zw@mail.gmail.com>
 <98f37803e752f4d4f19b9064240f0b876b2db588.camel@mjr.org>
 <20180613150813.GA7789@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 2018-06-13 at 17:08 +0200, Greg KH wrote:
> 
> Note, the -rt kernels _always_ run slower than a non-rt kernel.  Real
> time is not "faster", it is only "deterministic".  And it achieves
> this
> goal at the expense of performance, which is the only way it can be
> done.

Thanks for the reminder - I do forget that and get lazy and often use
the rt all the time.
 
> So I recommend just trying the "normal" kernel instead, odds are it
> will
> work just fine for you, unless you have some _very_ specific max-
> bound
> latency issues.

Mostly audio/jack ie duplex 32 channels at 48k with a B* X32 mixer. To
be fair I have more issues with the disc keeping up than the kernel...
But the truth is that use takes a very small part of my time and
normally a different machine so really I should use the rt kernel less!

> 
> thanks,
> 
> greg k-h
