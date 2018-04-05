Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5c22664
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 14:55:16 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 283e28fe
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 14:55:16 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: wireguard@lists.zx2c4.com
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <20170627110812.GD3026@zx2c4.com>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <20170627073521.22a725fc@penny>
 <alpine.LRH.2.20.1706270821440.17486@bcny.fcbq.bet>
 <20170627113906.391bb9a6.andrej@kacian.sk> <20170627110812.GD3026@zx2c4.com>
Date: Thu, 05 Apr 2018 11:08:20 -0400
Message-ID: <87k1tly9ln.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: 894909@bugs.debian.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue 2017-06-27 13:08:14 +0200, Jason A. Donenfeld wrote:
> compat.h is a dumpster fire already. Tons of people use the RHEL kernel.
> I think supporting it won't make an already gross cess pool any more
> disgusting. It's a file of hacks; I might as well add another.
>
> (I probably won't add hacks, though, for the heaps of random custom
> Android vendor kernels.)

sorry to dredge this thread back up from the archives...

https://bugs.debian.org/894909 shows someone trying to build wireguard
against the debian 8 ("jessie" aka "oldstable") 3.16 kernel saying that
they needed a similar patch to make the kernel module build.

I know that debian's kernel team does backport a lot of fixes to our
supported older kernels, similar to older releases of RedHat.

i'm asking over on #debian-kernel (on OFTC) to see whether there is some
similar to RHEL_MAJOR or CONFIG_SUSE_KERNEL or UTS_UBUNTU_RELEASE_ABI
that we can use for jessie.

    --dkg
