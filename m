Return-Path: geokozey@mailfence.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1a21087
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:00:07 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2f3979b
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:00:07 +0000 (UTC)
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
 by wilbur.contactoffice.com (Postfix) with ESMTP id C3CEA78C
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 00:01:52 +0200 (CEST)
From: Geo Kozey <geokozey@mailfence.com>
Message-ID: <976454169.394660.1509055309999@ichabod.co-bxl>
In-Reply-To: <CAHmME9ouUyaR6UeWeL-5a1MLkm1fE6VDmC94=K1DszrcRoPwtw@mail.gmail.com>
References: <2027941193.391349.1509047899053@ichabod.co-bxl>
 <CAHmME9ouUyaR6UeWeL-5a1MLkm1fE6VDmC94=K1DszrcRoPwtw@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: wireguard@lists.zx2c4.com
Date: Fri, 27 Oct 2017 00:01:50 +0200 (CEST)
Reply-To: Geo Kozey <geokozey@mailfence.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> From: Jason A. Donenfeld <Jason@zx2c4.com>
> Sent: Thu Oct 26 23:11:02 CEST 2017
> To: Geo Kozey <geokozey@mailfence.com>
> Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
> 
> 
> On Thu, Oct 26, 2017 at 9:58 PM, Geo Kozey <geokozey@mailfence.com> wrote:
> > What about usecases where more nameservers are needed, i.e. local nameserver used for caching, adblocking or whatever?
> 
> Presumably those users wouldn't be using DNS= anyways, since they'd
> want a fixed resolv.conf with the address of their local nameserver.
> So, that's outside the scope of this discussion.
> ----------------------------------------
No, with fixed resolv.conf pointing to local namserver only there would be no DNS resolution as your cache has to come from somewhere. I'm talking specifically about local nameserver without external connectivity but I think users may want to use their own static nameservers with dynamic one which they get from wg for whatever reason. Having to chose one over another as only possibility isn't best solution IMO.

G.K. 
