Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1abc823
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:19:06 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eda87ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:19:06 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 64C5611659
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 09:25:07 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 9FA3E11657
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 09:25:06 -0500 (EST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: Dynamic Adresses
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <20171129134417.GH2523@debian>
Date: Wed, 29 Nov 2017 08:25:05 -0600
Message-Id: <E07E3E01-926C-4BB1-8C89-E262A6528FB4@lonnie.abelbeck.com>
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
 <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
 <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
 <20171129134417.GH2523@debian>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On Nov 29, 2017, at 7:44 AM, Georg Faerber <georg@riseup.net> wrote:

> On 17-11-29 14:40:25, Jason A. Donenfeld wrote:
>> On Wed, Nov 29, 2017 at 2:35 PM, Mytril <mytril42@posteo.de> wrote:
>>> Yes i have written a similar script for the german ubuntuusers.de =
wiki.
>>=20
>> Care to share?
>=20

In this season of sharing :-) last week I took Jason's reresolve-dns =
script as a reference and created a persistent background script =
"wireguard-monitor" that is started/stopped along side wireguard in our =
AstLinux project.

wireguard-monitor
=
https://github.com/astlinux-project/astlinux/blob/master/package/wireguard=
/wireguard-monitor

Currently wireguard-monitor only updates DNS endpoints when =
WIREGUARD_DNS_UPDATE=3D"yes" in the sourced /etc/rc.conf file.  =
wireguard-monitor can be stopped by deleting the PIDFILE.

One minor improvement over Jason's example is only DNS endpoints are =
updated, I test for manual IPv4/IPv6 addresses.  I also wrote it hoping =
someday [Peer-peername] will be a valid config syntax.

Note, there are several things specific to our project, such as we =
create /var/lock/wireguard.lock when wireguard is active, and we include =
/usr/lib/bash/sleep as a bash builtin, but there might be a few ideas to =
take away.

Lonnie
