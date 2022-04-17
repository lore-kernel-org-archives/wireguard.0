Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Apr 2022 08:14:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8ebd2a0a;
	Sun, 17 Apr 2022 08:14:28 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c278ca8c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Apr 2022 08:14:27 +0000 (UTC)
Received: from [192.168.177.41] ([94.31.101.241]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5VXu-1nz5Uu2gYc-016vxV
 for <wireguard@lists.zx2c4.com>; Sun, 17 Apr 2022 10:14:26 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: wireguard@lists.zx2c4.com
Subject: ipv6 vs. ipv4
Date: Sun, 17 Apr 2022 08:14:26 +0000
Message-Id: <emdff71c03-470a-45f8-ade7-0343b0b698ab@envy>
User-Agent: eM_Client/8.2.1659.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WlojXFZ9zFJqghX6pU8lcRuWIrbWRQQ+DK9zKnNyxA2t6yYuMf5
 YFOWnSfVQW70uaUnPDkutfsxtRMSwTcKjWvMMnhSmYh5QAe+CvQejGMfhBo+PNp1OWGFYTd
 DLeMWh57xuomEenjyU/TsSvczOwGS2clvmRKH2B7tEQ3WZekqKPP/gvqc8Fx+AI4icbtGN9
 z2di9A89cdDHhK/IeVVNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rd00NsSS/nY=:4hq+MLgFmEHJ7X/ezvm3lN
 34TdE37WMLOP/fPHd1hDkSyNgVVrKdG9uaXKVc1rYDFlqprdrWU8+8K9zHynvsOd3zndjWLca
 O4eqAQ9uEscxAgaEgxpg/m62jbcsddOWgDg5O531cSx1slTVJtrTjROIuyEUKPoY/p3v7yPqJ
 BSevLbKoNlRLIa1tbLiBQg24WGypDfdZ3I28cwYmJF071DsHmLQy5HieMM8rZcV4/pFvt5JjO
 jo9/5w52L6zXwQ96JwPwMFZ56GfBrI+4StWDjWeZGMsVM5qq4ctlCZqeK/fs6JiMdoHA9DpU6
 N7vb7LbD8ZLmrOSJyNNC35QzbRnymnVvC4ODUSgjG44Q+Si/kCt8H+f7GWGxq4uFX2cMMLD9a
 02N3yhKnaesWoZq+bL8rhJ8sahKDZoFFLRkzJgE9UJrd/PokKtjiWqyH6NoIxZo71v9HWjth3
 MUkQYFoGcAZngLi0TbsOwhh0o0lMIZeR/89hRbWVUvR3CbiiE8uDo6YYf9oDCWMU+kQr7W8oS
 Fr+1mSh2Ojvnnxprvozp1b0j0hngdKZiTaTfa5vTSqbSfrz1jxdQt8AnyY98vlMrtnrEgIBAL
 siSzsXZQgN6JU+pPnD/1p5eTfQPZLoNBf4bFyWko78HH6AnaxZn/69GyKQoBiZUoGkg8PU6qx
 SXrcBlBss1pMvDBBxCXyoAEcRBMqgD1r4BxkwqOynVDNQaZTaEzSrGbWA6n3/+2tB2t2CsPvo
 lrg0h6BCEfL15HfDcE559b+6DktPtLST2czBbQ==
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I understood that wireguard prefers ipv6 over ipv4 by default.
Nevertheless, on both Windows and Android I do not get a connection=20
(only sent bytes no received bytes) when using my domain=20
(friedel.dynv6.net). If I use the IP=20
(2a00:6020:1bfb:c700:ba27:ebff:fe3e:6c55), I get a normal connection.
I can imagine that WG uses ipv4 (the A-record is set, I cannot change=20
that, but it points to an invalid ip)

How can I -when using the domain- enforce that ipv6 is really used?

Apart from that, my suspicion is that ipv4 is in fact used here... How=20
can I really find out, why I get no bytes on the received counter?

Best regards,
Hendrik

