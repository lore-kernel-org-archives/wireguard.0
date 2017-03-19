Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9cd8721
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2017 11:46:07 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64ebeaee
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2017 11:46:06 +0000 (UTC)
Received: from [10.60.27.174] (unknown [185.66.194.30])
 by v32412.1blu.de (Postfix) with ESMTPSA id E2F54201D8
 for <wireguard@lists.zx2c4.com>; Sun, 19 Mar 2017 12:50:08 +0100 (CET)
Subject: Re: [Question] Is it posible layer 2 interface on wireguard
To: wireguard@lists.zx2c4.com
References: <97c5005a-78f0-0064-0d14-9062827b908e@gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <961f639e-5f37-00cc-c94d-4ca1c7e6d90a@viisauksena.de>
Date: Sun, 19 Mar 2017 12:47:14 +0100
MIME-Version: 1.0
In-Reply-To: <97c5005a-78f0-0064-0d14-9062827b908e@gmail.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

you may want to look into one of these
https://forum.freifunk.net/t/lede-wireguard-gretap-ergebnisse-unter-livebedingungen/14057
https://forum.freifunk.net/t/wireguard-0-0-20161230-linuxkernel-3-18-gluon-v2016-2-2/14122

gretap is possible inside wireguard and so batman-adv on top (for this
example)

you need to establish connection, which means you may want to ping the
inner wireguard ip in regular time intervalls

greetz

j


On 19.03.2017 12:27, Fatih USTA wrote:
> Hi List,
>
> Is it posible layer 2 interface on wireguard
> for Bridge interface ( like GRETAP or L2TPv3 Ethernet pseudowires
> (vlan supported ) )
> and Active-Active Bond(802.3ad) Interface ( like EoIP )
>
> Bridge: https://wiki.mikrotik.com/wiki/Manual:Interface/EoIP
> Bond: https://wiki.mikrotik.com/wiki/Manual:Bonding_Examples
> Source: https://github.com/bbonev/eoip
>
>
> Thanks.
>
>

-- 
make the world nicer, please use PGP encryption
