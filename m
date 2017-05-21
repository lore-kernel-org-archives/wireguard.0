Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bac7430
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 May 2017 23:11:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03930f8f
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 May 2017 23:11:50 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx003
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0LgISa-1dibZt1sWa-00ndUt for
 <wireguard@lists.zx2c4.com>; Mon, 22 May 2017 01:23:45 +0200
Date: Mon, 22 May 2017 01:23:43 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: openresolv dependency
Message-ID: <20170522012343.4184cdaa@msi.defcon1>
In-Reply-To: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
References: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 22 May 2017 01:13:38 +0200
Bert Vermeulen <bert@biot.com> wrote:

>  That's the convoluted horror
> also known as resolvconf, and I really can't have it on my system.

+10

=E2=80=A6
> Can this dependency please be removed?

I solved that (temporarily, I hope) with 1 line into /etc/resolvconf:
resolvconf=3DNO

Jean-Yves
