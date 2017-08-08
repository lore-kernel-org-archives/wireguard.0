Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c4d2b72
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:24:30 +0000 (UTC)
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
 [209.85.128.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24cd4d27
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:24:30 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id k71so18193838wrc.2
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 16:46:23 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.52] (uk.webcrumb.net. [176.126.241.16])
 by smtp.googlemail.com with ESMTPSA id s4sm4185348wrc.13.2017.08.08.16.46.21
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Aug 2017 16:46:22 -0700 (PDT)
Subject: Re: Advising in packages to load new module or reboot
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20170808231612.GA24254@zx2c4.com>
 <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
 <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <58b21d76-af42-b166-06d3-31b8d801ff98@york.ac.uk>
Date: Wed, 9 Aug 2017 00:46:16 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WMVE1cUnha6BS35uk9l2kv7nND48DOV2M"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WMVE1cUnha6BS35uk9l2kv7nND48DOV2M
Content-Type: multipart/mixed; boundary="3HdgJ7BeQ8uCvXHIrvbjwhGFliIHaFSwP";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <58b21d76-af42-b166-06d3-31b8d801ff98@york.ac.uk>
Subject: Re: Advising in packages to load new module or reboot
References: <20170808231612.GA24254@zx2c4.com>
 <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
 <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>
In-Reply-To: <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>

--3HdgJ7BeQ8uCvXHIrvbjwhGFliIHaFSwP
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 09/08/17 00:30, Jason A. Donenfeld wrote:
> For (1) and (2), though, what do you think of the warning I've added
> to Gentoo? That's what I meant by asking for thoughts on "this
> pattern" -- the whole thing with comparing running kernel and
> compiled-for-kernel and comparing loaded-module-version and
> compiled-module-version.
>=20

Ah, righty. From my admittedly limited experience that seems fine - for
example, from the Debian/Ubuntu virtualbox-dkms package
(vboxdrv/Makefile, #192):

>  # kernel base directory
>  ifndef KERN_DIR
>   # build for the current kernel, version check
>   KERN_DIR :=3D /lib/modules/$(shell uname -r)/build
>   ifneq ($(shell if test -d $(KERN_DIR); then echo yes; fi),yes)
>    KERN_DIR :=3D /usr/src/linux
>    ifneq ($(shell if test -d $(KERN_DIR); then echo yes; fi),yes)
>     $(error Error: unable to find the sources of your current Linux ker=
nel. \
> 	           Specify KERN_DIR=3D<directory> and run Make again)
>    endif
>    $(warning Warning: using /usr/src/linux as the source directory of y=
our \
>                       Linux kernel. If this is not correct, specify \
> 		      KERN_DIR=3D<directory> and run Make again.)
>   endif
>  else
>   ifneq ($(shell if test -d $(KERN_DIR); then echo yes; fi),yes)
>    $(error Error: KERN_DIR does not point to a directory)
>   endif
>  endif


--3HdgJ7BeQ8uCvXHIrvbjwhGFliIHaFSwP--

--WMVE1cUnha6BS35uk9l2kv7nND48DOV2M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAlmKTUgACgkQ4DBDgow/
9LvRJRAAj7FCWdrTGfG097DCEwnw+A+9v2sOeCcBiEgm+bJK+gsBo4cVBHcMDfPK
CeR/lzsOPd9LDd/eI2izsiwZbDTGhpgjni9ZS7LTn8/ZWgBvEUQmcRJPYaJIxkwf
mh+HH7XL+hsXEuA6+7zTHXqI9vQesdrcgh5hidzCgjgjgKL5+y2o51YdJCeMBvHZ
2BQ8f1rD3o0D7hNxW5mIZgRaw1YEFsoYefQ/6YMXMTMeIGSnKqxPjErPplO6DbKJ
kJJEwMOR+Ceu/FV9tOE6YLFsPjrNLl63UfgJ+v2J86HNuOgpiAJE8ypego3CM5X/
PCzdLUXqeAR7WvP9goDGaRIYiwYjPxjg4PPf927VBsAWIkUdXs2Tp1c+PhlulfkP
hnosO5nWERsC77knhdDvSJSPysuA7/FVCA4I1RnExWctQ9GZXba8YGGw3PrhcUnq
irZC04UngMBkn6cf/heEFTMcl+1+9h1Oejbm/XCBOjIOi+BtAFLwBDx34pNjS1s1
w7iMvOzNRvZKkL35zzzUD5aUDpLkcPXflCYs13sKokzDEwIfqOtL4tf2ZE4cU49h
1kTEAECVrKRe3fpAxLtFENYr5mAjsADNO9ZbGquRVOxk42UU/0l6ii46ckbLyDbn
rbZ+DpmkTCoAZXZvV+BOLMG018AWRt0iEecou83/HI7eKH00mKA=
=b7O4
-----END PGP SIGNATURE-----

--WMVE1cUnha6BS35uk9l2kv7nND48DOV2M--
