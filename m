Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 1f3f72c1
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 14:44:52 +0000 (UTC)
Date: Thu, 30 Jun 2016 09:45:58 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160630144558.GA5133@wolff.to>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
Cc: zorun@bitsofnetworks.org, Christian Hesse <mail@eworm.de>, zx2c4@gentoo.org,
 wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jun 30, 2016 at 14:52:04 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Christophe: Fedora (which will then travel downstream to RHEL?) He
>doesn't have time for this now, but including him in the thread
>anyway, and hopefully he'll kindly forward this email onto someone
>else he knows at Redhat

Fedora people can publish EPEL packages, but I'm don't know Red Hat's 
stance on kernel module packages.

For Fedora, not having it in the upstream kernel will make it very difficult 
to get in Fedora proper, and doing COPRs may be a pain since kernel builds 
happen a lot for Fedora.

When it is actually in Fedora there won't be a package for the kernel module 
(as it will be part of the kernel-modules or kernel-modules-extra packages).

If it does get accepted for say 4.8, then getting a backported version into 
previously released Fedora's that may be running older kernels may be 
possible.

>=== 3. Versioning ===
>
>    0.0.20160701

Fedora splits the version into two pieces. The first part is the version 
and would be something like 0.0. As a prerelease the release should be 
0.x.dateandorcommit, where x is an integer that gets bumped every release 
and the rest can be a mix of date, tag or commit ID.
So the final version might look like 0.0-0.1.20160701 .
