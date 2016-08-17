Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18bfc7fc
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 14:33:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebea2f23
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 14:33:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4b4051a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 14:33:05 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id q128so202713158wma.1
 for <wireguard@lists.zx2c4.com>; Wed, 17 Aug 2016 07:38:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <919f5c60-4f1e-0f12-012b-021bce9aca5d@solidadmin.com>
References: <919f5c60-4f1e-0f12-012b-021bce9aca5d@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Aug 2016 16:38:20 +0200
Message-ID: <CAHmME9oA9CeFr30WJwkEgamrFJrWX-rT3-NSsDLwcyybM7JbMw@mail.gmail.com>
To: Joe Doss <joe@solidadmin.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Fedora WireGuard RPMs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Joe,

This is great news! Thanks for doing that. Are you a Fedora developer
per chance?

A few notes for fixing this:

1) http://copr-dist-git.fedorainfracloud.org/cgit/jdoss/wireguard/wireguard-tools.git/tree/wireguard-tools.spec

a)
> BuildRequires:  libmnl-devel, kernel-devel, systemd
> Requires:       wireguard-dkms, systemd

Remove the systemd requirement.

b)
> install -p -D -m 0644 %{_builddir}/WireGuard-experimental-%{version}/contrib/examples/systemd/wgserver.service \
>    %{buildroot}%{_unitdir}/wgserver.service
> %attr(0644, root, root) %{_unitdir}/wgserver.service

Remove these lines. Do not install this systemd unit. It's in the
examples directory; thus it is an EXAMPLE. It is not meant to be
installed. When we write a unit that's meant to be installed, `make
install` will do it automatically.

Instead, copy all of contrib/examples to /usr/share/{pkg}/examples or
wherever the default Fedora examples directory is.

c)
> BuildRequires:  libmnl-devel, kernel-devel, systemd

Are you sure that the tools package requires kernel-devel? Did you
double check this?

d)
> install -Z -s -m 0755 -v %{_builddir}/WireGuard-experimental-%{version}/src/tools/wg \
>    %{buildroot}%{_bindir}/wg
> install -p -D -m 0644 %{_builddir}/WireGuard-experimental-%{version}/contrib/examples/systemd/wgserver.service \
>    %{buildroot}%{_unitdir}/wgserver.service
> install -p -D -m 0644 %{_builddir}/WireGuard-experimental-%{version}/src/tools/wg.8 \
>    %{buildroot}%{_mandir}/man8/wg.8
> %defattr(-,root,root,-)
> %attr(0755, root, root) %{_bindir}/wg
> %attr(0644, root, root) %{_unitdir}/wgserver.service
> %attr(0644, root, root) %{_mandir}/man8/wg.8*

All of this is garbage. Instead, use `make install` and set the
environment variables appropriately. By default they are:
PREFIX ?= /usr
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
LIBDIR ?= $(PREFIX)/lib
MANDIR ?= $(PREFIX)/share/man
RUNSTATEDIR ?= /var/run

I imagine here you'll want to roll with something like:

DESTDIR=%{buildroot} BINDIR=%{_bindir} MANDIR=%{_mandir}
RUNSTATEDIR=/run make install


2) http://copr-dist-git.fedorainfracloud.org/cgit/jdoss/wireguard/wireguard-dkms.git/tree/wireguard-dkms.conf

I recommend you use Debian's as a starting point:
https://anonscm.debian.org/git/collab-maint/wireguard.git/tree/debian/wireguard-dkms.dkms

In particular DEST_MODULE_LOCATION="/kernel/net" and
BUILD_EXCLUSIVE_KERNEL="^(4\.[^0]|[5-9])".

3) http://copr-dist-git.fedorainfracloud.org/cgit/jdoss/wireguard/wireguard-dkms.git/tree/wireguard-dkms.spec

a)
> BuildRequires:  libmnl-devel, kernel-devel, sed

The kernel module does not require libmnl-devel.

b)
> cp -fr %{_builddir}/WireGuard-experimental-%{version}/* %{buildroot}%{_usrsrc}/%{dkms_name}-%{version}/

You might consider instead only copying src/.


Please let me know when you've addressed 1a, 1b, 1c, 1d, 2, 3a, and
3b, and then I'll add your instructions to the wireguard.io website.

Thanks for your hard work on this. Much appreciated.

Jason
