Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D91C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jun 2024 19:00:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d9f71ce;
	Sun, 16 Jun 2024 19:00:41 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a9d665d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Jun 2024 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
 s=s42582890; t=1718564438; x=1719169238; i=max.schulze@online.de;
 bh=0r1Cbi6Uc/CyCAzROVa03TnIA85T+2ua/5DVo80qHhA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=abQRmTBaVoW/Gz+83uVM6/FYSsa1vWyGT9UHufZHl1IjVgX3w5pTDE4DDBlaYrO3
 DzyhCPRWc9chnYUDJG4dQZ7DeFdAZXmIKL8D6WbMbmEoHojrU8bkIQTvAEq9j2hCm
 CopQSJ+Hg7EYRDZXCtQfE8j8Tk9jIxnXIcTVF+Pt6qxSgsggJUWgQOdqP4E9GH67e
 ZXbmsVKR3ob0O+oFWaI5pltDT2h+s6M9y0XbNT9FvIscYJjwdy4fmv3sOJcuIafXU
 brOKvJJPEr8lsuYwS2AdKLRPf+z2L1stTH9onBrD74OnOXUnFB5/Mlbc3461OiOdt
 Zr6yQgVIQd3SDm1Shw==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from [192.168.151.46] ([84.160.50.175]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mwwm5-1sc5gz0z7r-014Pvw; Sun, 16 Jun 2024 21:00:38 +0200
Message-ID: <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
Date: Sun, 16 Jun 2024 21:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Germano Massullo <germano.massullo@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
Content-Language: en-US
From: Max Schulze <max.schulze@online.de>
In-Reply-To: <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PSgEkJl58VijEquKCX3eALr/tRuIQ4eczqM3LSu3D/Ivz/MIsog
 6XKLYX4b099GBURq5tBTeYDBZn3mFIbDQnbkxAs1bvcie14oCFBGzNqRupM6kawRDnGwydk
 u2tfFb1Zl/VsTpY/timYGp9umxYH5ttlBQyFNd7+SxthUlco0/DJwKWs+nKOwg6a0M5L6Ci
 Ujlgr6U6+v0ZuBUtE8IsQ==
UI-OutboundReport: notjunk:1;M01:P0:E6k6XR937UM=;e+EFZ4vAvTNfxsVFybPT8jYykqz
 Fm3JjgoIWnnc8/bjrhH39lGRvS3ep6ofDLN/39aPHzTHn136dO4PYOI+6i3y5naBHYFxX2FOK
 6ge8XKJb+xHfTGn04KHXwxvgtrdek103INbRW4EE2S8Ik4XOZS00BI+zviDAhDi8T2R8xZa0j
 29NVMGoTr/QQWjzQbczT0XHG5pxqVhCg10XDm3Xe96FTwmbH4WdReNbNjpfgyvIT3eRULX05k
 UDavTz9Z4JQzxFynLu72U5W8Sth+A3SdUhEJLuD6EIbdVx4SypIkxzrB0/rO9e0yEbZ7K03dv
 fgiHCP42gBIdWSLIaDbpR8H0oSOGHib6LK/d54yxzuamWic3QraTQZHs5zZEtvoXeFNxv1f+l
 AWo1cvCs+2HRieSgkTd8YlT0gRaCUfdrFZp/BR/lEtWjMhl+CrzT/9vr0quh7PliGOw3O5N7B
 4Z5iBUAdpKUW0ZjagAXcjj9VVqAPuoIA6WiSpw75Wrgg6QtWR/d7PzwVEkrhDgMLBE0rHvCNT
 dqzWYxtknuBrIRXnBPfOCDOiZbkH2mqpKoDdLv5taWdFtFhDZh3UP3olPIqDQVGjCz2mOgHAi
 z2WzJMP8xuxUFt0RHe+TcsptzT3PS1jNSCJnyNL86xiImiSySDCURc5duguobhSvN5xFKZ/KK
 c/pX1CW3fUTMcYAcsixLHU1v847D33GjUC9hFgMw48SH9a3dCQSZouHJ4eXIdTC21yh7li3Mk
 ZC/haE7QY3k5rFds44ViFjwyYp40I8rlnOhNWXe9rEF1ORCFS3Qj/A=
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>



On 16.06.24 16:59, Germano Massullo wrote:
> Il 16/06/24 15:47, Max Schulze ha scritto:
>> why do you think this is the bottleneck and at what speed are you hitti=
ng a limit?
>
> I get ~550 Mbit/s throughput in LAN between a Ryzen 5 3600 and the Turri=
s Omnia which CPU goes to 100% load during iperf3 test


Ok then I think you really max out the cpu. I have not heard of any accele=
ration card. Overall I think it's not too bad.


Some notes:

Per [1], my stock Raspberry Pi 4 B (BCM2711, quad-core), has roughly 1.5x =
cpu-power than the dual-core Marvel Armada 385.

Are you running iperf3 with --bidir?

I get:
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID][Role] Interval           Transfer     Bitrate         Retr
> [  5][TX-C]   0.00-120.00 sec  10.4 GBytes   744 Mbits/sec  1839        =
     sender
> [  5][TX-C]   0.00-120.00 sec  10.4 GBytes   744 Mbits/sec              =
    receiver
> [  7][RX-C]   0.00-120.00 sec  9.08 GBytes   650 Mbits/sec  151         =
    sender
> [  7][RX-C]   0.00-120.00 sec  9.08 GBytes   650 Mbits/sec              =
    receiver

Keep in mind that iperf3 itself uses some cpu.

You could test serving a static file and transfer via http.

( ex: dd if=3D/dev/urandom of=3D/dev/shm/test.rand bs=3D1M count=3D300
and serve with [2], and download with "wget -O /dev/null [...]" )


I get 848 Mbit/s when downloading to the pi and 728 Mbit/s when downloadin=
g from it (everything via wireguard).






[1] https://github.com/ThomasKaiser/sbc-bench/blob/master/Results.md
[2] https://github.com/svenstaro/miniserve
