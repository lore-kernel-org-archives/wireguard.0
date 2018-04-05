Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e63a7a25
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 16:02:39 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 486d8980
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 16:02:39 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: wireguard@lists.zx2c4.com
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <87k1tly9ln.fsf@fifthhorseman.net>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <20170627073521.22a725fc@penny>
 <alpine.LRH.2.20.1706270821440.17486@bcny.fcbq.bet>
 <20170627113906.391bb9a6.andrej@kacian.sk> <20170627110812.GD3026@zx2c4.com>
 <87k1tly9ln.fsf@fifthhorseman.net>
Date: Thu, 05 Apr 2018 12:15:44 -0400
Message-ID: <87bmexy6hb.fsf@fifthhorseman.net>
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

On Thu 2018-04-05 11:08:20 -0400, Daniel Kahn Gillmor wrote:
> On Tue 2017-06-27 13:08:14 +0200, Jason A. Donenfeld wrote:
>> compat.h is a dumpster fire already. Tons of people use the RHEL kernel.
>> I think supporting it won't make an already gross cess pool any more
>> disgusting. It's a file of hacks; I might as well add another.
>>
>> (I probably won't add hacks, though, for the heaps of random custom
>> Android vendor kernels.)
>
> sorry to dredge this thread back up from the archives...
>
> https://bugs.debian.org/894909 shows someone trying to build wireguard
> against the debian 8 ("jessie" aka "oldstable") 3.16 kernel saying that
> they needed a similar patch to make the kernel module build.
>
> I know that debian's kernel team does backport a lot of fixes to our
> supported older kernels, similar to older releases of RedHat.
>
> i'm asking over on #debian-kernel (on OFTC) to see whether there is some
> similar to RHEL_MAJOR or CONFIG_SUSE_KERNEL or UTS_UBUNTU_RELEASE_ABI
> that we can use for jessie.

Ben Hutchings of the debian kernel team followed up there suggesting
feature tests or autoconf-type checks:

11:02 < dkg> https://bugs.debian.org/894909 suggests that some of the
             backported fixes to 3.16 in jessie are getting in the way
             of compiling wireguard.  the referenced upstream thread
             shows that they worked around the problem for RHEL7 using
             some redhat-specific #defines
11:02 -zwiebelbot:#debian-kernel- Debian#894909: wireguard-dkms:
                                  dev_recursion_level definition problem
                                  - https://bugs.debian.org/894909
11:02 < dkg> is there a comparable fix for older debian kernels?
11:04 < dkg> they have tests for #if RHEL_MAJOR == 7
11:04 < dkg> and #ifdef UTS_UBUNTU_RELEASE_ABI
11:52 < bwh> dkg: I've been there, and the way to deal with this is autoconf-type checks
11:55 < bwh> Well, either '#ifdef feature' or an autoconf-type check

So i don't think there's a comparable #define we can use for the
maintained debian kernels :/

i don't know how dev_recursion_level works.  can we wrap the #define
dev_recursion_level() 0 inside an #ifndef dev_recursion_level safely?

           --dkg
