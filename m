Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ade61015
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:21:36 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c26ef3a0
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:21:36 +0000 (UTC)
Received: from [192.168.0.32]
 (cpc103062-sgyl39-2-0-cust230.18-2.cable.virginm.net [82.33.50.231])
 by mail.thalheim.io (Postfix) with ESMTPSA id B54067AC1
 for <wireguard@lists.zx2c4.com>; Wed, 23 May 2018 22:22:50 +0000 (UTC)
Subject: Re: WireGuard for FreeBSD
To: wireguard@lists.zx2c4.com
References: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
 <CAKYr3zzm6E_KNXA3acW7QcJWHh1gw3+Laxh2fN+AS3E0LPn0gg@mail.gmail.com>
 <CAHmME9q7Bcigcn5-sEK3=pnuyfDbxxc=HKg4qBCNe_Mj+cLjfg@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <05f62a24-2683-3a96-9885-9f51fede4649@higgsboson.tk>
Date: Wed, 23 May 2018 23:22:50 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9q7Bcigcn5-sEK3=pnuyfDbxxc=HKg4qBCNe_Mj+cLjfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2018-05-22 02:44, Jason A. Donenfeld wrote:
> On Tue, May 22, 2018 at 2:33 AM, Outback Dingo <outbackdingo@gmail.com> wrote:
> I too would prefer this, and maybe at some point down the line I'll
> put some real time and effort into porting WireGuard from the Linux
> kernel to kFreeBSD. But it's not the case that it's "not that hard";
> doing so will be a pretty serious undertaking. That's going to take a
> lot of time. Until that day arrives, what you speak of doesn't exist.
> What we have instead today is tons of hard work that's gone into
> bringing a userspace implementation.
>
> So please, don't derail the current efforts in favor of an effort that
> doesn't even exist at the moment.

Submitting ports here worked for me in the past:

  https://bugs.freebsd.org/bugzilla/query.cgi

They are not picky usually. I am not using FreeBSD these days so.

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
