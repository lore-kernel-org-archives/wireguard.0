Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447B6C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 20:10:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a89703e;
	Sun, 19 Feb 2023 20:10:25 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8be547a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 20:10:22 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id E3B161FEAC;
 Sun, 19 Feb 2023 21:10:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676837402;
 bh=aMq06NMBQzXl5PAjees/9C76djR1BlqRDK2AgvuKDOo=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JLo+SOji2ZZgUfhy5WIBjy04GVszoLMlh0qbQ7fJ4I+yT+o70ts4mCUOJbsqS1Nq0
 91DIIbM/PSf7AqXiam5JKFcf1bckoJ/k4s4guDD/pOrf7QJ07EMX9x2A3kK9RNXRKW
 AHrPbPyyh1zpubG+ehMm75Gbx3Xf9QzKfrPlH/yCdadSFYKqi/MEk80kcxSGilMr1p
 vcrnuO/RYnwIhqyWFZNya8ecI2MqyF0+KZlOXHtMxeeeW0YbWcMrMVbUugcbJA3E5N
 PehLBsntasB9WNRiQAiD+AiwzC2BMrJjxVCS/zRG4jk4nE6mq8kPpz0dQfx9IEPjza
 LrBoYVxxUxVfg==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 0A3E214C0119; Sun, 19 Feb 2023 21:10:22 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
User-agent: mu4e 1.8.9; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Christoph Loesch <wireguard-mail@chil.at>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 21:02:38 +0100
In-reply-to: <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
Message-ID: <87wn4d76xd.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Hello Christoph,

Christoph Loesch <wireguard-mail@chil.at> writes:
> @Nico: did you try to delete the affected route and add it again with the correct source IP ?

No, I did not because the routes are really dynamic on the affected
systems and I would need to overwrite the BGP routes with a better
metric, which in turn will likely break the return path.

> as I mentioned it in https://lists.zx2c4.com/pipermail/wireguard/2021-November/007324.html
>
> ip route del <NET>
> ip route add <NET> dev <ALIAS_DEV> src <SRC_IP>
>
> This way I was able to (at least temporary) fix this issue on multi homed systems.

Much appreciate the hint. However changing routes manually on as many
routers/vpn endpoints as we have is not a practical solution. To fix the
current project's issue we have shifted the VPN endpoint to a single
homed device for the moment.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
