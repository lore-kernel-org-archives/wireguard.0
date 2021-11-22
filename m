Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9A5C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 20:41:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f07a8f02;
	Tue, 23 Nov 2021 20:41:31 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 02ac56ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Nov 2021 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637601612;
 bh=mN6DO1YZuLxdCxucQM1K3PZU5FE2Rf82Pe2oXjbclbI=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=XIaP+p64NNDw71GSTYmKgWCzIhKGWTFZ7KeN9lpbFdHHLFImTXGGgUki35a26ocVr
 fDGgrBsqwSFUhA9ckuPr6/u7m8bN2S2Gpyean5EO9NvdLgt4Oh11gX/Gs3rAT269aU
 0XNGfrd94LV8p1yK5DvhSLvunRg11pnwrgphWr7s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.3] ([93.198.55.76]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1mPXHl0X4f-00jdpl for
 <wireguard@lists.zx2c4.com>; Mon, 22 Nov 2021 18:20:12 +0100
Message-ID: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
Date: Mon, 22 Nov 2021 18:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: Robert Dahlem <Robert.Dahlem@gmx.net>
Subject: Dynamic routes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qsafl+YCsPSxRam2uigTE57Pj3P/Zw3NijaoFtE4aQDtFYfJmCu
 2dl1EvC5uBOO/EZTNaABj1YcBq8L6+0vYfz3k6y1XreuGegRt8hKzz4MTqH0o2rrDgwx3gz
 BVKym8tXyUj6gSZywRcJrTMU0JeNwOLWfYi9ABHzG47Rpb2mKhn7SjhDrQtgR6qtpZLBV3M
 YNYS/JLF2icdauK+/8dcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jp6tcyt79Ek=:gWzSbl60EHtO4SSXSPaQhs
 RrgggiqZSY/YrIKhor7TbXxIH1fXcY/Gjdn96HgdzMz/s4RC5KvRW1d65fJMsTaw7JSX/J4hM
 oDozjmLu+CRtgzDOeJnZv+US7kXAImrR+cWGXL9CitKBYhn55K147UnpzKrNJVXSDDugwxRKH
 r3OFINq1F3nKt2ST4pexKyw23EQSGKvKsOUp+VyP1tn2s58k0XDvB82jiKtBgAAsuFuOXZVlW
 e1eKVzeR7TcST+2MmXlAQpM1F/M0wsyx2sk2tWAkqBeTekct3+Q8EZwuB087rhVsIyfMtbSDH
 NdFxAThTbTna+M2eWyEmvtljwIv3h/3A00/ZB/BNEWHksbYVUdIc6q8ybg4dhv3ysvHcmHutk
 WP1n3Z2XJebA73jSiXToPExIVjrhj6M0Mlg8v2HQ4hTwHPc6IZ05v9/OEWfN3PPIB837KumWT
 Z3gelKkcYNzlAqVdk2Fm5suemXE9IQxrVH8jhgaT/r5GbBEFlczKsiONpAb/yXX0Jd5ZRPt+z
 mtjTOcMJ2DrccbcFo9OHfXZeuFfgX9mIZTE7mPC655n6cxtiOFuGr8VhVMlIkRxdon86yG5ns
 tPD9XBH83Khm5Y9UW16TyNOyYg6UoT/UMF18Rikvz/BL8jnsun6C3I1/FdW/hdJI2bw60js3B
 NF2wNiOTrQ0hXoLgDRtftihMTm5u3w6aGoj++kFPn/jgj19s+1/2553/l723tIfLqF0byPRD6
 cghXUm7GkTOrZ1NgxHRHI2KA7ZVHa37cFKENLNj82Ld8+ffk364Xjr/VK3tv7TgGqhuEek6wY
 o+Lj+SGevNtwEBlBeKAZOzBlsgmzm7Ki++oBddQsesRUT0qov4y5VKvEhSC1faFzOrMMshFhM
 TI5CTh4nc9bf1DMR2xORtbDV81Pom1XzC4NNv2Umek7SGwBBmiyXzQ3EgMfSOflAYomii3rmj
 mTmi1gUYHX5wVfWFeSbR+hjoML6rVFTwfb4XE6+Se5pZy31irxGyUns0lFFrh1Ntagm0gKu+k
 yGlsUHfD71Ah1hMr9USYkA7LKCsDZz35SuGl9Mt0lbCnZcmn35c4Egzxhw/14KlXZgxE5CkdG
 QmXw6oL3H//P9A=
X-Mailman-Approved-At: Tue, 23 Nov 2021 20:41:31 +0000
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

I'm searching for a way to dynamically add or delete routes when a
tunnel comes up or goes down. I do not mean "interface wg0 comes up",
but explicitly "tunnel comes up" in the sense that both peers see each
other, key exchange has been successful and packets would be transported
through the tunnel.

The idea behind this is to have redundant tunnels. Let's say a Wireguard
client has a preferred server and a secondary server. Packets should be
routed through the preferred router while that tunnel is established and
through the secondary server when the preferred server is not available
for some reason.

I could always install Quagga or Bird and use OSPF. But that might be a
bit of an overkill for a simple active/passive failover.

Is there any way to react on tunnel state events in Wireguard?

Regards,
Robert
