Return-Path: joe@solidadmin.com
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb54121f
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 19:33:58 +0000 (UTC)
Received: from d4-50-47-134.col.wideopenwest.com ([50.4.134.47]:21248
 helo=sts1.inf7.net)
 by conquer.yellowcord.com with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
 (Exim 4.85) (envelope-from <joe@solidadmin.com>) id 1ba6gG-00044e-UI
 for wireguard@lists.zx2c4.com; Wed, 17 Aug 2016 14:39:16 -0500
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <919f5c60-4f1e-0f12-012b-021bce9aca5d@solidadmin.com>
 <CAHmME9oA9CeFr30WJwkEgamrFJrWX-rT3-NSsDLwcyybM7JbMw@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <1a66128e-2cb6-8f93-3769-d8011bf6a464@solidadmin.com>
Date: Wed, 17 Aug 2016 14:39:16 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9oA9CeFr30WJwkEgamrFJrWX-rT3-NSsDLwcyybM7JbMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: Re: [WireGuard] Fedora WireGuard RPMs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 08/17/2016 09:38 AM, Jason A. Donenfeld wrote:
> Hey Joe,
>
> This is great news! Thanks for doing that. Are you a Fedora developer
> per chance?

I am not an official one currently, no. I don't have any packages in 
upstream Fedora yet. I am just a dude that likes to write RPMs and 
contributing to cool open source projects. :)

> A few notes for fixing this:
>
> 1) http://copr-dist-git.fedorainfracloud.org/cgit/jdoss/wireguard/wireguard-tools.git/tree/wireguard-tools.spec
>
> a)
>> BuildRequires:  libmnl-devel, kernel-devel, systemd
>> Requires:       wireguard-dkms, systemd
>
> Remove the systemd requirement.

Done.

> b)
>> install -p -D -m 0644 %{_builddir}/WireGuard-experimental-%{version}/contrib/examples/systemd/wgserver.service \
>>    %{buildroot}%{_unitdir}/wgserver.service
>> %attr(0644, root, root) %{_unitdir}/wgserver.service
>
> Remove these lines. Do not install this systemd unit. It's in the
> examples directory; thus it is an EXAMPLE. It is not meant to be
> installed. When we write a unit that's meant to be installed, `make
> install` will do it automatically.

Fair enough. Removed.

> Instead, copy all of contrib/examples to /usr/share/{pkg}/examples or
> wherever the default Fedora examples directory is.

Done.

> c)
>> BuildRequires:  libmnl-devel, kernel-devel, systemd
>
> Are you sure that the tools package requires kernel-devel? Did you
> double check this?

It doesn't need it. Fixed.

> d)
>> install -Z -s -m 0755 -v %{_builddir}/WireGuard-experimental-%{version}/src/tools/wg \
>>    %{buildroot}%{_bindir}/wg
>> install -p -D -m 0644 %{_builddir}/WireGuard-experimental-%{version}/contrib/examples/systemd/wgserver.service \
>>    %{buildroot}%{_unitdir}/wgserver.service
>> install -p -D -m 0644 %{_builddir}/WireGuard-experimental-%{version}/src/tools/wg.8 \
>>    %{buildroot}%{_mandir}/man8/wg.8
>> %defattr(-,root,root,-)
>> %attr(0755, root, root) %{_bindir}/wg
>> %attr(0644, root, root) %{_unitdir}/wgserver.service
>> %attr(0644, root, root) %{_mandir}/man8/wg.8*
>
> All of this is garbage. Instead, use `make install` and set the
> environment variables appropriately. By default they are:
> PREFIX ?= /usr
> DESTDIR ?=
> BINDIR ?= $(PREFIX)/bin
> LIBDIR ?= $(PREFIX)/lib
> MANDIR ?= $(PREFIX)/share/man
> RUNSTATEDIR ?= /var/run
>
> I imagine here you'll want to roll with something like:
>
> DESTDIR=%{buildroot} BINDIR=%{_bindir} MANDIR=%{_mandir}
> RUNSTATEDIR=/run make install

Fixed. I guess I was doing it the hard way eh? :)

> 2) http://copr-dist-git.fedorainfracloud.org/cgit/jdoss/wireguard/wireguard-dkms.git/tree/wireguard-dkms.conf
>
> I recommend you use Debian's as a starting point:
> https://anonscm.debian.org/git/collab-maint/wireguard.git/tree/debian/wireguard-dkms.dkms
>
> In particular DEST_MODULE_LOCATION="/kernel/net" and
> BUILD_EXCLUSIVE_KERNEL="^(4\.[^0]|[5-9])".

Done.

> 3) http://copr-dist-git.fedorainfracloud.org/cgit/jdoss/wireguard/wireguard-dkms.git/tree/wireguard-dkms.spec
>
> a)
>> BuildRequires:  libmnl-devel, kernel-devel, sed
>
> The kernel module does not require libmnl-devel.

Fixed.

> b)
>> cp -fr %{_builddir}/WireGuard-experimental-%{version}/* %{buildroot}%{_usrsrc}/%{dkms_name}-%{version}/
>
> You might consider instead only copying src/.

Good idea. Fixed.

> Please let me know when you've addressed 1a, 1b, 1c, 1d, 2, 3a, and
> 3b, and then I'll add your instructions to the wireguard.io website.

Some gotchas for Fedora might be issues using DKMS if they have secure 
boot enabled. You might want to mention that as the kmod generated by 
DKMS isn't signed, so loading it with secure boot will fail.

Also, SELinux is set enforcing by default on Fedora. I am not sure if 
that is going to cause any issues either.

Other than that, the RPMs should be good to go. Let me know if you want 
any other changes before adding the install instructions to the site.

> Thanks for your hard work on this. Much appreciated.

No problem! Glad to help. Thanks for your awesome work on WireGuard. :)

Joe




-- 
Joe Doss
joe@solidadmin.com
