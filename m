Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75c10b5e
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 20:42:02 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d75d24a3
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 20:42:02 +0000 (UTC)
Message-ID: <1495832060.1086.1.camel@eggiecode.org>
Subject: Re: Repo broken?
From: Egbert Verhage <egbert@eggiecode.org>
To: Steve Pagan <spagan@instartlogic.com>, wireguard@lists.zx2c4.com
Date: Fri, 26 May 2017 22:54:20 +0200
In-Reply-To: <CAK-i-m_Bv92mtdbPXZrqmC5pqiVkMrP=DsY8Hc69BZ_0McRQZA@mail.gmail.com>
References: <CAK-i-m_Bv92mtdbPXZrqmC5pqiVkMrP=DsY8Hc69BZ_0McRQZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Steve,

That is because in the beging of the ppa repo we only had support for
kernel >4.1.

On snapshot: 0.0.20170409 we got support for 3.16, 3.14, 3.12, 3.10.
And precise has kernel 3.2 (OLD!) and since April 28, 2017 precise is
eol.

Best way to run wireguard on ubuntu is run xenial or a higher release.

Greetz,
Egbert


On Fri, 2017-05-26 at 10:26 -0700, Steve Pagan wrote:
> I cannot download the required packages to my system. I get a 404
> error:
> 
> W: Failed to fetch http://ppa.launchpad.net/wireguard/wireguard/ubunt
> u/dists/precise/main/source/Sources  404  Not Found
> 
> W: Failed to fetch http://ppa.launchpad.net/wireguard/wireguard/ubunt
> u/dists/precise/main/binary-amd64/Packages  404  Not Found
> 
> W: Failed to fetch http://ppa.launchpad.net/wireguard/wireguard/ubunt
> u/dists/precise/main/binary-i386/Packages  404  Not Found
> 
>  
>  World's First Endpoint-Aware Application Delivery Solution
> Steve Pagan 
> Network Engineer - Operations
> 
> Phone: 650-919-8856 | Email: spagan@instartlogic.com 
> Instart Logic | 450 Lambert Ave, Palo Alto, CA 94306
> | instartlogic.com 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
