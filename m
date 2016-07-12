Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b410ef5
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 10:59:03 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <zx2c4@gentoo.org>, zorun@bitsofnetworks.org,
 Christian Hesse <mail@eworm.de>, Christophe Fergeau <cfergeau@gmail.com>,
 Martin Hauke <mardnh@gmx.de>
In-Reply-To: <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
Date: Tue, 12 Jul 2016 12:59:47 +0200
Message-ID: <871t2zt93w.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon 2016-07-11 19:51:12 +0200, Jason A. Donenfeld wrote:
> How often is too often for you guys for publishing snapshots? Once a
> week okay? Twice a week okay? Twice a month okay? It doesn't matter
> because package bumping is all automated anyway?

I also prefer to at least build and test manually before i upload.
weekly is probably fine.

If there's something critical, of course, please don't delay the release
of a fix due to my scheduling.  It's possible that i won't get a new
revision packaged the day of the release (or maybe even longer), but
that's no reason for you to not to publish an important fix as upstream.

i'll be more comfortable with a more automated package/release workflow
when i sort out better automated testing and continuous integration for
the package as a whole.

     --dkg
