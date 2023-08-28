Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A881DC83F11
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Aug 2023 22:24:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49dba2ba;
	Mon, 28 Aug 2023 22:22:20 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 144c0c0c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Aug 2023 22:22:18 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so56349111fa.2
 for <wireguard@lists.zx2c4.com>; Mon, 28 Aug 2023 15:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693261337; x=1693866137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XgOI9D93JJrylyVGa/Ax/h0PbQQ4jAkwIS5UlYZvjSk=;
 b=AJNu1pVVTPfdHJ88MVoIKG/LXTlw8nDTW2JZ9P0pQm0n2GaVyUsso6f+BEfFbJhTnZ
 H5QJQtxj+k9+YsV4MgGIVC+my2/yV5D5d1DsxhSrJIwsSoIvTqqhWiBsxWilJnRC/Hwk
 0jqM30eWjlkzI7yLIxNPwapX2OM8p6axpMy2/9yjzuuwlhhY5g1n0y+sFpbGD8mNuuwN
 uuaU8q3oYGLuv0HGuNkwwmsredePSd2nwY/tPfmmI6M4FeQyEb05gh+j3hiW5o0zkJTb
 D76pji/sy5s8DHhf2gofgn/e2OrlxK0tMDIxFchMiPNtI07U1ygmSuXKrr3CCljeJ+yQ
 taag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693261337; x=1693866137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XgOI9D93JJrylyVGa/Ax/h0PbQQ4jAkwIS5UlYZvjSk=;
 b=habEfIjjCkyRmbF6wGLTiHkwKSr5FcN43aj0SN3ar7NR0fivZ0hG1clZdYYRDeiy37
 Mgptj9suwaJ/FFgW2xe77TsanpOePIBWqg9XSPVaCWcdCRZYZW4umgzNaMKFM6GyBxVT
 u/Nbchujk6yf2uNiRgQ1+Agx3Zpib9ajsYX7Tcd2MbWFPlSw/Rm7O22COlyfNZXzW/Fr
 Xv4ywBL6r1VcxsonYyq/10QjMOfeFGce6bSRF03ZdP0cpGAvV0RS9YEgGtJRi3egfIoJ
 SvijxNMIHKbGwC95wN02ksPEx4yT27BsD4NeGK/10WAAdAUrgnDC0TpOWeOHk4tdkKUi
 Cq6Q==
X-Gm-Message-State: AOJu0Yz9muAR54/MvY+60QzX+VOad620rGl1rGCM9SvnhvHvLVyA/E98
 gD1Z6CkKt7Su9EYTLB2Si14bUzvtweX48G5EO5ReslJc+24tIw==
X-Google-Smtp-Source: AGHT+IHv61lJmN3QWm1XC2oeWg8ItvqSZPQJSQhokUzMND+U34pjm+6UjdGTeM7VHJOY5kY9oWWT/6XD/gX/iNKwvc4=
X-Received: by 2002:a2e:8e95:0:b0:2b6:da64:734f with SMTP id
 z21-20020a2e8e95000000b002b6da64734fmr20834584ljk.47.1693261337094; Mon, 28
 Aug 2023 15:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
 <20230823165840.7bf3b910@parrot>
 <20230823171451.ld2fwslkl6blv6y2@House.clients.dxld.at>
 <CAJq09z7Mm30aa5CTM0d+Vjb+KV9r+1uQbrGd6ZY-qB09Ng_0xw@mail.gmail.com>
 <CAOx9P4_HZeioFjGSb0hqFNEdk8dci+q6x=j7L9QGMoX-seUKdQ@mail.gmail.com>
In-Reply-To: <CAOx9P4_HZeioFjGSb0hqFNEdk8dci+q6x=j7L9QGMoX-seUKdQ@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 28 Aug 2023 19:22:05 -0300
Message-ID: <CAJq09z588fZZnQ8zy4TDGvGrmZBL0vZXFNVKG+T1JMDX0pmrcQ@mail.gmail.com>
Subject: Re: IPv6 and PPPoE with MSSFIX
To: Hugo Slabbert <hugo.slabbert@menlosecurity.com>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, 
 =?UTF-8?B?TWFyZWsgS8O8dGhl?= <m-k-mailling-list@mk16.de>, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hello,

I did some proof-of-concept tests and got nice results. Here is my
current script (https://github.com/luizluca/wireguard-ipv6-pmtu)

It runs as a shell script and updates allowed_ips routes (ipv4 and
ipv6) when there is a cached PMTU to that endpoint (or the local
interface is using a smaller MTU). It just works as expected, avoiding
the fragmentation on the fly for IPv6-connected peers. It must run
periodically as "ip monitor" does not emit events for cached routes.
The best result is when you run it on both sides as it can only fix
the traffic from that endpoint.

As we have already discussed, standard IPv4 has a smaller header and
the default wireguard MTU has some room to fit most tunneling
protocols).

I hit some interesting problems along the way:
1) "ip route get" might fail if all routes that would match also
include a "from". You need to find out the source address wireguard is
using before testing the route. I'm digging it from the conntrack
table but I wish there was a better way.
2) PMTU runs in cycles. It generates a temporary cached route with MTU
once it receives a "packet too big" answer. However, until the route
is gone (expiring, for example), there is no way to generate a traffic
that will retrigger that "packet too big" or refresh the route. Once
the route is gone, the script will remove the MTU limitation,
wireguard might eventually trigger a new "packet too big" and, on its
next run, the script can adjust the MTU. We would need to add some
state to the script to know that a cached route is gone and try to
retrigger the PMTU before removing the MTU limitations. We could also
do some brute force approach like pinging every peer using a large
packet (1500-40-8) before each cycle or simply keep the MTU limitation
forever as it would not hurt that much.

For those who want to play with it, have fun!

Regards,

Luiz
