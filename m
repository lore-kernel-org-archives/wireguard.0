Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f65e81f
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 12:40:23 +0000 (UTC)
Received: from viisauksena.de (rauberhaus.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745bb20f
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 12:40:23 +0000 (UTC)
Received: from [192.168.0.185] (pD9E1505C.dip0.t-ipconnect.de [217.225.80.92])
 by rauberhaus.de (Postfix) with ESMTPSA id 0B5C42148C
 for <wireguard@lists.zx2c4.com>; Thu, 12 Apr 2018 14:54:24 +0200 (CEST)
Subject: Re: wg-ip, a tool to assign automatic ip addresses to wireguard
 interfaces
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
 <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
 <CAHLp1YkNypEBTK3MWN9hOgBt9p1jh1z76U0tdGTccbJ_PeA=Pw@mail.gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <2836e61a-cdd0-721c-cbfc-df5ef6c91bc6@viisauksena.de>
Date: Thu, 12 Apr 2018 14:54:23 +0200
MIME-Version: 1.0
In-Reply-To: <CAHLp1YkNypEBTK3MWN9hOgBt9p1jh1z76U0tdGTccbJ_PeA=Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

i once had written a script for some openWRT (lede) Routers for Freifunk,
first of all, take ipV6 inside your tunnel, and mix localnet V6
Addresses with the MAC - this way you get a very distinct pair of V6
Address and Key
This assumes that a Server has fixed ip and key.

keyline in Setup is this
uci set wireguard.wireguard.ownip=fdf1::$(cat
/sys/class/net/eth0/address|awk 'BEGIN{FS=":"}{print $1$2":"$3$4":"$5$6}')

found here, if you want to look around a bit
https://github.com/viisauksena/gluon-mesh-wireguard/blob/cb77788ee49fe5b81789d01eed49aa30e971dd8e/files/lib/gluon/upgrade/405-wireguard

maybe this brings some new hints-- the gluon wireguard project has
actually stopped.

greetz


--
make the world nicer, please use PGP encryption
