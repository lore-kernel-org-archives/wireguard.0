Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb1931e7
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 01:43:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cdbccab
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 01:43:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6953a5dc
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 01:42:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c7546b0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 01:42:12 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id l13-v6so19075074otk.9
 for <wireguard@lists.zx2c4.com>; Mon, 21 May 2018 18:44:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKYr3zzm6E_KNXA3acW7QcJWHh1gw3+Laxh2fN+AS3E0LPn0gg@mail.gmail.com>
References: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
 <CAKYr3zzm6E_KNXA3acW7QcJWHh1gw3+Laxh2fN+AS3E0LPn0gg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 May 2018 03:44:26 +0200
Message-ID: <CAHmME9q7Bcigcn5-sEK3=pnuyfDbxxc=HKg4qBCNe_Mj+cLjfg@mail.gmail.com>
Subject: Re: WireGuard for FreeBSD
To: Outback Dingo <outbackdingo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Brady OBrien <brady.obrien128@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, freebsd-ports@freebsd.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, May 22, 2018 at 2:33 AM, Outback Dingo <outbackdingo@gmail.com> wrote:
> to be honest, while it sounds nice, i for one would prefer to see a
> kernel module ported to FreeBSD instead of userland
> second to that, building a freebsd port of it is not all that hard,
> however that being said, it also needs to be accepted
> upstream and committed by a ports maintainer, while i can help with
> creating it, i still feel a kernel module is a better fit

I too would prefer this, and maybe at some point down the line I'll
put some real time and effort into porting WireGuard from the Linux
kernel to kFreeBSD. But it's not the case that it's "not that hard";
doing so will be a pretty serious undertaking. That's going to take a
lot of time. Until that day arrives, what you speak of doesn't exist.
What we have instead today is tons of hard work that's gone into
bringing a userspace implementation.

So please, don't derail the current efforts in favor of an effort that
doesn't even exist at the moment.
