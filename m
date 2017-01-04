Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a296e21
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:09:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56447eea
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:09:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 599adfd7
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:09:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0d529f4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:09:56 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v84so557479509oie.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2017 13:18:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9p5E57NiVtdYDacViuDJhtFOuG5pWq1hhHJQbd5aTT0LA@mail.gmail.com>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
 <20170104201416.25893-1-list@eworm.de>
 <87a8b6k07f.fsf@alice.fifthhorseman.net>
 <CAHmME9p5E57NiVtdYDacViuDJhtFOuG5pWq1hhHJQbd5aTT0LA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Jan 2017 22:18:55 +0100
Message-ID: <CAHmME9qRWpDk+dGJihmyfMv0svipTUBYmj68ngMgxnJO0cGitg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tools: remove DESTDIR for autodetection
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

For reference, the Gentoo 9999 ebuild does this:

https://gitweb.gentoo.org/repo/gentoo.git/tree/net-misc/wireguard/wireguard-9999.ebuild#n51

emake \
WITH_BASHCOMPLETION=yes \
WITH_SYSTEMDUNITS=yes \
WITH_WGQUICK=yes \
DESTDIR="${D}" \
BASHCOMPDIR="$(get_bashcompdir)" \
PREFIX="${EPREFIX}/usr" \
-C src/tools install

I imagine Debian and Arch will do something similar, perhaps leaving
out explicitly setting BASHCOMPDIR if you use standard patches. I
expect for OpenWRT to set all of these explicitly to "no". Etc.

Jason
