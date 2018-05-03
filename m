Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9469eae4
 for <wireguard@lists.zx2c4.com>; Thu, 3 May 2018 23:01:32 +0000 (UTC)
Received: from viisauksena.de (rauberhaus.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6307bc
 for <wireguard@lists.zx2c4.com>; Thu, 3 May 2018 23:01:32 +0000 (UTC)
Received: from [192.168.0.211] (p5B00D239.dip0.t-ipconnect.de [91.0.210.57])
 by rauberhaus.de (Postfix) with ESMTPSA id 1C408216E3
 for <wireguard@lists.zx2c4.com>; Fri,  4 May 2018 01:03:26 +0200 (CEST)
Subject: Re: wg0 packets not being routed?
To: wireguard@lists.zx2c4.com
References: <8599540b-b761-57a1-a585-b4395f9bed96@ironicdesign.com>
From: jens <jens@viisauksena.de>
Message-ID: <6807bcad-5fb6-3ecd-6312-2cd85b2247cb@viisauksena.de>
Date: Fri, 4 May 2018 01:03:25 +0200
MIME-Version: 1.0
In-Reply-To: <8599540b-b761-57a1-a585-b4395f9bed96@ironicdesign.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 03.05.2018 23:53, Andy Dorman wrote:
> I am trying to set up VPN traffic between a local debian server cluster
> (allowed 192.168.99.x/24) and a Linode VM cluster (also debian, allowed
> 192.168.100.x/24).
> 

look at the outcome of *ip route* and try to understand where your
traffic for the 100.xy or the 99.xy go.
it looks like you made a mistake there.
your ping log suggests that.

in general you gave all the wg-clients some kind of network (the same
/24 or /xx ) and then use normal routing/ip commands/structure with your
wg0 interface.
