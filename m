Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8e754eb
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 12:49:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ed65e86
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 12:49:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cd02ff6d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 12:49:18 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id f6so54742768lfg.0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 05:52:07 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2016 14:52:04 +0200
Message-ID: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
To: zorun@bitsofnetworks.org, Christian Hesse <mail@eworm.de>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 Christophe Fergeau <cfergeau@gmail.com>, zx2c4@gentoo.org
Content-Type: text/plain; charset=UTF-8
Cc: wireguard@lists.zx2c4.com
Subject: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

So it looks like we're the distro people downstream of WireGuard:

Zorun: OpenWRT (perhaps a little Arch too?)
Daniel: Debian (which will then travel downstream to Ubuntu?)
Christian: Arch
Christophe: Fedora (which will then travel downstream to RHEL?) He
doesn't have time for this now, but including him in the thread
anyway, and hopefully he'll kindly forward this email onto someone
else he knows at Redhat
Jason: Gentoo

We have a couple topics to discuss and decide on:


=== 1. Package Names ===

Right now Daniel is doing the most clean and sensible thing and
dividing the package into two: wireguard-tools and wireguard (or is it
wireguard-module?). On the other end, in Gentoo I'm just keeping it in
one package called "wireguard" (maybe with USE flags down the line).
Christian is doing something a bit confusing and calling it
"wireguard-dkms" (for the module) and "wireguard" (for the tools),
when I think I'd rather prefer the latter be wireguard-tools if it's
always split.

Also, keep in mind that down the road there will also be
"wireguard-go" and "wireguard-rust", which will be administered with
the same "wireguard-tools". See https://www.wireguard.io/xplatform/
for details on that. (And, eventually, "wireguard-tools" will go away
when the functionality is merged into iproute2.)

Probably for the purposes of consistency and ease of use, we should
standardize our package names. So what about restricting naming to
either of these two naming options:

Option a) monolithic:
    Package name: wireguard

Option b) split:
    Tools package name: wireguard-tools
    Module package name: wireguard _or_ wireguard-${SUFFIX},
       where SUFFIX is modules, or dkms, or whatever the convention in
your OS is


=== 2. Experimental Status ===

WireGuard isn't meant for prime time. It's still under development,
and there won't be CVEs or responsible announcements made for various
issues. The purpose of this phase now is to get it out to interested
testers and experimenters for working out various issues. Debian is
very well suited for this configuration, with its experimental tree,
which is where the package will live until we release the first "0.1"
or "1.0" version that we stand behind. Arch has a similar place. I
think OpenWRT has a good slot for this too? And Fedora Rawhide is
always an unstable mess, so I think we'll be fine there. Gentoo has ~
and package.mask.

It's generally important we stay communicative about packaging status,
so that as the WireGuard project progresses, we can bump the package
along through the various tiers of repositories.

The issue of packaging naturally leads me to this next important point...


=== 3. Versioning ===

As mentioned prior, we're not at 1.0 or even 0.1. Many packagers can
deal with building straight from the git master with a live checkout.
But other packagers can't, and this isn't very nice for testing users
anyway, since they don't get version bumps for updating. So, it seems
wise for us to formalize a snapshot versioning scheme. First, there
are two ways of doing this:

a) I can tag snapshot releases.
b) You can select snapshot commit IDs.

I think between these two options (a) is clearly superior, since then
I can be sure to tag commits that at least build. Then the usual
distro infra can monitor the cgit atom feed (or whatever the methods
are) for generating version bumped packages. I won't be "announcing"
snapshot bumps on the mailing list, since there's nothing to announce
at this point, but it should be reasonable to monitor the cgit page,
or if you want I can send individual emails out; let me know what you
think about this.

With the actual version numbers itself, I think at least it should be
based on the big endian date stamp:

    0.0.20160701

Zero dot zero. But it'd be nice to further specify that these are
pre-release or experimental:

    0.0.20160701_pre
    0.0.20160701_experimental
    0.0.20160701_killskittens

Any preference on pre vs experimental vs killskittens vs something
else? I'm open to anything here.

The _suffix notation works well with how Gentoo does package versions.
What about the rest of you? For example, I think this might pose
problems:

    0.0.20160701.pre
    0.0.20160701.experimental
    0.0.20160701.killskittens

Or, if anyone has another idea for injecting a label like this into
the snapshot revision, speak up.

Overall, at the moment I'm leaning toward  0.0.20160701_experimental.
But I'll wait for responses before deciding anything.


=== 4. Dependencies ===

The `wg` program in tools only requires libmnl. I could probably get
rid of that dependency if it becomes an issue. Zorun and I worked a
while ago on getting it to run with musl and places where libresolv
doesn't have base64 routines, so i think it should be sufficiently
portable now, but let me know if it's an issue.

The kernel module itself requires a few options, which are most likely
already selected in your distros. I just added the menuconfig
locations of these for people who like to build their own kernels on
https://www.wireguard.io/install/#kernel-requirements . The options
CONFIG_NET_UDP_TUNNEL, CONFIG_IPV6, and
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT are required right now. I'll make
CONFIG_IPV6 optional sometime soon (and will let you know when I do
that). The option CONFIG_PADATA is not required, but it is very much
necessary to achieve good multi-core performance with WireGuard. For
OpenWRT builds that are running on single-core machines, you could do
without it, but for desktop/server distros, I _highly_ recommend it's
enabled, in whatever infrastructure that does this.

Regarding the topic of building infrastructure, it seems like with the
exception of OpenWRT and Gentoo, everyone else is converging on DKMS?
Is this right? If so, it appears that Christian's dkms.conf file is a
good start for this, and I'll consider putting it directly in the repo
at some point. Is anybody here well versed with DKMS? Does it have a
way of expressing and warning about dependencies?


=== 5. Current Status ===

In public repositories there are currently these:
  https://aur.archlinux.org/cgit/aur.git/tree/?h=wireguard-git
  https://gitweb.gentoo.org/repo/gentoo.git/tree/net-misc/wireguard/

I've seen some other package files shared privately. I think generally
speaking we're off to a good start.



Have I left anything out? How does that all sound to you guys?

Awaiting your feedback,
Jason
