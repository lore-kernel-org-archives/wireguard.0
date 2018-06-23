Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20887a37
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 13:44:59 +0000 (UTC)
Received: from mail-1857040135.protonmail.ch (mail-1857040135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05646c0a
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 13:44:59 +0000 (UTC)
Date: Sat, 23 Jun 2018 09:50:06 -0400
To: Bruno Wolff III <bruno@wolff.to>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: Wireguard doesn't work with Linux 4.18-rc1
Message-ID: <u_a0psW5Q9KLDFq9k46sJwmb9GOhQEYhJ_ZtHEapZTmqjdfVCYIJ7rLIUOMRXQr24R6nJt-XWTZ4oRTzxelZF0nrKieM3lTfQmP_CBi0OiI=@protonmail.ch>
In-Reply-To: <20180623133514.GA19042@wolff.to>
References: <J4C97NjxCe5Yi6ATwPhttes2-igbViLr-ejjOWK58wH8F-E0jdzmifyxLEVi5wmkNql7JVDqdpJ1WU0ufUzNwBZeLHmqncbQz7-SJRDGu8E=@protonmail.ch>
 <20180623133514.GA19042@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On June 23, 2018 3:35 PM, Bruno Wolff III <bruno@wolff.to> wrote:

> On Sat, Jun 23, 2018 at 08:23:08 -0400,
>=20
> Jordan Glover Golden_Miller83@protonmail.ch wrote:
>=20
> > Hi,
> >=20
> > I can't make wireguard work with linux 4.18-rc1 and mainline from
> >=20
> > 06.22.2018.
>=20
> It has been working for me. I use Fedora rawhide nodebug kernels and
>=20
> haven't noticed any problems with WireGuard. I build WireGuard from
>=20
> source (HEAD) when I switch kernels.
>=20
> So you are probably going to need to provide more details to narrow
>=20
> things down.


Thx for the reply. I tested it with my custom kernel and with Manjaro
kernel on Archlinux.

Can you check if it works for you with 'ipv6.disable=3D1' boot param?

https://mirror.netzspielplatz.de/manjaro/packages/unstable/core/x86_64/linu=
x418-4.18rc1.0617.gce397d2-1-x86_64.pkg.tar.xz
https://mirror.netzspielplatz.de/manjaro/packages/unstable/core/x86_64/linu=
x418-headers-4.18rc1.0617.gce397d2-1-x86_64.pkg.tar.xz
