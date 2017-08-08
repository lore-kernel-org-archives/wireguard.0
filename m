Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73fa89e7
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:15:51 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 773979cb
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:15:51 +0000 (UTC)
Date: Wed, 9 Aug 2017 01:37:39 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Advising in packages to load new module or reboot
Message-ID: <20170809013739.26c7f2d5@msi.defcon1>
In-Reply-To: <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>
References: <20170808231612.GA24254@zx2c4.com>
 <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
 <CAHmME9q50iu1h+Wxi1CGji0MbD2dYtiCyGhPT3cvihsC0MsJNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 9 Aug 2017 01:30:50 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> That might mean printing nice messages if the correct dependency isn't
> obvious.
> 
> For (1) and (2), though, what do you think of the warning I've added
> to Gentoo? That's what I meant by asking for thoughts on "this
> pattern" -- the whole thing with comparing running kernel and
> compiled-for-kernel and comparing loaded-module-version and
> compiled-module-version.

I found something that _may_ help you, it's an old bug report on DKMS.
As far as I understand it, it is DKMS' work to issue a warning:
https://github.com/dell/dkms/issues/14

Jean-Yves
