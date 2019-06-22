Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23267C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:38:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3732173B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="BAP4zBj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3732173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9944e6e7;
	Wed, 17 Jul 2019 20:38:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98bcd26d
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2019 08:45:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a1c24a9
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2019 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1561193149;
 bh=ijQEkM1jDAdRvMcYVz19nFxd7p8EvuMF8w/2Ddi38N4=;
 h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
 In-Reply-To;
 b=BAP4zBj3/iyMcBP2KCfi/JoWtVI86ZSO+deHEleBSW7gRKblhJe4/respO8tqREtx
 /2PhBmmhuGsGwdCwJtnBSSGYK0BNbsQ4fOZHecGhEvLQurrMFd6CWSC0jiYsuUK3D6
 bpoTEepB1zl+IBNn8DjfCg9kr3xIOsUokwTYF2fE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.84.205] ([179.43.174.98]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M6AbC-1iXx7m0fXu-00yBQs for
 <wireguard@lists.zx2c4.com>; Sat, 22 Jun 2019 10:45:48 +0200
To: wireguard@lists.zx2c4.com
References: <CAPYP83TtUYWsEJ=A5j-NOc81ry6MT1AqCaaBDoHpiyPrSvoofw@mail.gmail.com>
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Autocrypt: addr=vtol@gmx.net; prefer-encrypt=mutual; keydata=
 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
Subject: Re: Fragmentation
Message-ID: <58812569-7505-c778-a7b2-396b190b0514@gmx.net>
Date: Sat, 22 Jun 2019 10:45:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAPYP83TtUYWsEJ=A5j-NOc81ry6MT1AqCaaBDoHpiyPrSvoofw@mail.gmail.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:V0CDOr13geWeDecSjyZeDgrSTRQ+xBJJmy9QUXyeEjJCN0JzDJr
 90kGlDgUFl3QKJJPaRUp0mYlHaIUUdgogokHPjckoxrD5w4vpz91MpTS7IVHPzaSfL6WL98
 dSw+sn/swj5jpFx6RX12YbA/BovYDGd99RjhY9EflVz+Xcnj6+x5gu0valMIGMmR4FhvesE
 3DNXCBDie5TSByCOzPwRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fPgqmuffpsw=:UFZSGBccUTrAK8ML2yR3di
 ixEEsKxsdZByoZTOJzleiR4L5qn9nd8SoXzfFMd34aEh2xE2WWalVchwwxlFtaTMSDDcIBI7r
 FWi1bvlNaI1JsyYujTlumgFOWu2IJcNpa528GoDkssC69Fs7pih8mASlrW9uCtV1qHjCSJZSc
 iUjY1LaPzMv98s6FQgSav3VQehg9MeIwcXj6/zA7XrinmRlvA5oLCCxrfgaGlU/LSdIhwiU6P
 ssPZb/KyB/pMgDPbEFliBiBlC/lNVWWsBWJn39NCMaVWNvJHwRhnzq9Rk8MA07/z8ijS24WX7
 zE6kXoH0/3LDo32yHiv4N3Yam92RM6u+D0BO6A0Ho9O1ijJQMVKw4g8dSwuvPJgoCjKSk+uyr
 qbOi6crDCNBmM/gqOCYnQW1532ZnHzaXUv8glTugR3SYnzMU1FSxPh1b3oxbUL86TvqAFkE3N
 H0Z2SU3Zpf+07zCA8q6NAvCILZ5H90vZ6s9XJE8NQacELrm1tAabogePfrgjjDSWiGeidMgog
 yft7TlscKAAguqpA8h08FcI5YoOs/BMYrzwCu/2r1HPki7YR9rNJoqX4RklQRovqrRBDGiVgf
 FqtM+OYCzNbKsTSU0C73EQWonB15SaESJ6w8HOcQP4+qW5ck6A/bcyuCGfYD7sef/4EIrKcUF
 AYuY7QIjKKb9Gg4Wc7WooSbpusAr+kmnRKGyzIVMFpE3CBdZDxM3DCjl+J9iniNd3NL2VNhDY
 9DTGQ8TbYBBKEH6mg+CUgft+w12gl3zvOOok+fjgnHlVB/C3GUy80Q+d3b/SVCY3rEkQCGGH6
 dQeNJLyGGa/Kj4+V54/Um8+4Uy1/de0qx9mhXTOMMetmr5xBuIgXeH/u5tOs0bwEVLewCEApQ
 wFpqWoqxWGGVUC6C0e1YRCH9xaxll6rxti0ONGpxpRGZMTcQRuCexIMzOhOTPabdrUMq+3AiB
 NEozZ/QXIB842gs9VL77hrbjvndNsznM=
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:38:25 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: vtol@gmx.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Any SQM measures deployed? That what it caused it on my nodes until
disabled.

On 18/06/2019 17:32, Nigel Magnay wrote:
> Hi!
>
> I have successfully set up a wireguard connection, to a server hosted
> inside Microsoft Azure. Thankyou for this software, it's so much
> easier to configure than the alternatives.
>
>
> I have a small problem though, which I think I understand (but seems
> strange), but I'm not sure of the correct solution.
>
> I have routed all internet traffic over this connection; it works, I
> can successfully ping sites, and view some. I'm using IP masquerading
> at both ends to connect entire networks (I thus use the client as a
> gateway).
>
> However - some hosts do not respond - or, rather, there's a packet
> fragmentation issue.
>
> I can see with tcpdump on the server entries like this:
>
> 17:55:04.461804 IP 85.118.26.200.https > vpn1.60630: Flags [.], seq
> 1:1441, ack 518, win 30, length 1440
> 17:55:04.461849 IP vpn1 > 85.118.26.200 <http://85.118.26.200>: ICMP
> vpn1 unreachable - need to frag (mtu 1420), length 556
>
> Which I take to mean "we got a response, it's length is too big to fit
> in the vpn payload, please shorten".
>
> What happens though is nothing - it just keeps receiving over-long
> responses, so it doesn't work - which is hardly wireguard's fault.
>
> Now, I guess either the end server is simply ignoring me, or the ICMP
> stuff is being blocked somewhere. I'm not knowledgeable enough to know
> if either of these are likely, as I'm a bit puzzle as to how anything
> could work properly if either of those were true.
>
> So - am I doing something wrong? What's the right knobs for me to be
> twiddling here?
>
> I have wireguard 0.0.20190601 at each end.
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
