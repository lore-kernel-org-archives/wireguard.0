Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34f69ef2
 for <wireguard@lists.zx2c4.com>; Tue, 9 May 2017 22:09:45 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0cb1322
 for <wireguard@lists.zx2c4.com>; Tue, 9 May 2017 22:09:45 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0MgKUo-1dLv9J0SvO-00NlMw for
 <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 00:20:11 +0200
Date: Wed, 10 May 2017 00:20:08 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wg-quick can't down my vpn I/F and DNS problem
Message-ID: <20170510002008.073fdffe@msi.defcon1>
In-Reply-To: <CAHmME9pSBfUtNBRYugC6o2hR8QhmQEzm4ZrTouzbo2vc9NuTfQ@mail.gmail.com>
References: <20170502172752.4e234cd8@msi.defcon1>
 <CAHmME9rrgXSW5pbg56JwBXwcfey0MS-fT7zF-+SmiBwCa5a7bg@mail.gmail.com>
 <20170502185455.4e88561e@msi.defcon1>
 <CAHmME9pSBfUtNBRYugC6o2hR8QhmQEzm4ZrTouzbo2vc9NuTfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, 2 May 2017 19:08:10 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> DNS is solved using the PostUp line. See the man page example -- `man
> wg-quick`.

DNS problem solved: I deactivated openresolv.

JY
