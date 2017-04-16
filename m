Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9eedb29
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 17:43:05 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 090e1026
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 17:43:05 +0000 (UTC)
Message-ID: <1492365022.1445.15.camel@eggiecode.org>
Subject: Re: wireguard-tools Ubuntu package missing the binaries; Fixed
From: Egbert Verhage <egbert@eggiecode.org>
To: Ryan Riley <rriley.cs@gmail.com>
Date: Sun, 16 Apr 2017 19:50:22 +0200
In-Reply-To: <b58aaa20-6b03-5501-3cad-f791cfd2319a@york.ac.uk>
References: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>
 <b58aaa20-6b03-5501-3cad-f791cfd2319a@york.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Ryan,

Fixed it. New build (0.0.20170409-wg2~xenial, 0.0.20170409-
wg2~yakkety,) is live on the PPA.

Can you test this for me?

Thanks Jonathon, for that solution.

Greetz,
Egbert


On Sun, 2017-04-16 at 12:24 +0100, Jonathon Fernyhough wrote:
> On 16/04/17 12:06, Ryan Riley wrote:
> > The i386 wireguard-tools package on the PPA for Ubuntu Xenial
> > doesn't
> > actually contain any of the binaries, just documentation.
> 
> It's not just i386 - each of the arm and ppc64 packages are also
> missing
> binaries.
> 
> Debian's packages (and my testing backports based on those) don't
> have
> that issue - might be time to check a diff or do a merge. :)
> 
> Looks like it's down to `make install`ing the tools during install-
> indep
> rather than install-arch.
> 
> 
> Working (Debian use a different flags setup, that's not the important
> bit):
> 
> > override_dh_auto_install-indep:
> > 	$(MAKE) -C src DESTDIR=../debian/wireguard-dkms
> > DKMSDIR=/usr/src/wireguard-$(DEB_VERSION)/ dkms-install
> > 
> > override_dh_auto_build-arch:
> > 	$(MAKE) -C src/tools $(WIREGUARD_ARGS)
> > 
> > override_dh_auto_install-arch:
> > 	$(MAKE) -C src/tools DESTDIR=../../debian/wireguard-tools
> > $(WIREGUARD_ARGS) install
> 
> 
> Non-working:
> 
> > override_dh_auto_install-indep:
> > 	$(MAKE) -C wireguard-src/src
> > DESTDIR=$(CURDIR)/debian/wireguard-dkms DKMSDIR=/usr/src/wireguard-
> > $(DEB_VERSION_UPSTREAM)/ dkms-install
> > 	$(MAKE) -C wireguard-src/src/tools
> > DESTDIR=$(CURDIR)/debian/wireguard-tools WITH_SYSTEMDUNITS=yes
> > WITH_WGQUICK=yes WITH_BASHCOMPLETION=yes install
> > 
> > override_dh_auto_build-arch:
> >  	$(MAKE) -C wireguard-src/src/tools
> 
> 
> 
> J
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
